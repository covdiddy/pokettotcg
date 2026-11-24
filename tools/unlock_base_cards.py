#!/usr/bin/env python3
"""Unlock all 228 original Pokémon TCG 1 cards in poketcg.sav:
- 6 basic Energy cards: x20 copies (seen/owned)
- All other 222 original cards (incl. DOUBLE_COLORLESS_ENERGY & Promos): x4 copies (seen/owned)
- 66 Team Rocket expansion cards: 0 copies (CARD_NOT_OWNED)
"""

from pathlib import Path
import re
import struct

ROOT = Path(__file__).resolve().parent.parent
SAV_PATH = ROOT / "poketcg.sav"
SYM_PATH = ROOT / "poketcg.sym"
CARD_CONSTANTS_PATH = ROOT / "src" / "constants" / "card_constants.asm"

SRAM_BANK_SIZE = 0x2000
SRAM_BASE_ADDR = 0xA000
CARD_COLLECTION_SIZE = 0x200
CARD_NOT_OWNED = 0x80
BASIC_ENERGY_COPIES = 20
BASE_OTHER_COPIES = 4
BASIC_ENERGY_NAMES = {
    "GRASS_ENERGY",
    "FIRE_ENERGY",
    "WATER_ENERGY",
    "LIGHTNING_ENERGY",
    "FIGHTING_ENERGY",
    "PSYCHIC_ENERGY",
}
FIRST_ROCKET_CARD_NAME = "EKANS_LV15"


def parse_sym(sym_path: Path) -> dict[str, tuple[int, int]]:
    """Parse RGBDS .sym file into {symbol_name: (bank, addr)}."""
    symbols: dict[str, tuple[int, int]] = {}
    pattern = re.compile(r"^([0-9a-fA-F]+):([0-9a-fA-F]+)\s+(\S+)$")
    for line in sym_path.read_text(encoding="utf-8").splitlines():
        m = pattern.match(line.strip())
        if m:
            bank = int(m.group(1), 16)
            addr = int(m.group(2), 16)
            symbols[m.group(3)] = (bank, addr)
    return symbols


def sram_offset(bank: int, addr: int) -> int:
    """Convert an SRAM (bank, addr) pair to a byte offset in the 32 KB .sav file."""
    if not (0xA000 <= addr < 0xC000):
        raise ValueError(f"Address {addr:#06x} is outside SRAM range $A000-$BFFF")
    return bank * SRAM_BANK_SIZE + (addr - SRAM_BASE_ADDR)


def parse_card_constants(path: Path) -> tuple[list[int], list[int], list[int]]:
    """Return (basic_energy_ids, other_base_ids, rocket_ids) from card_constants.asm."""
    const_val = 0
    basic_energy_ids: list[int] = []
    other_base_ids: list[int] = []
    rocket_ids: list[int] = []
    in_rocket = False

    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.split(";", 1)[0].strip()
        if not line:
            continue
        if line.startswith("const_def"):
            parts = line.split()
            const_val = int(parts[1], 0) if len(parts) > 1 else 0
        elif line.startswith("const "):
            name = line.split()[1]
            if name == FIRST_ROCKET_CARD_NAME:
                in_rocket = True
            if in_rocket:
                rocket_ids.append(const_val)
            elif name in BASIC_ENERGY_NAMES:
                basic_energy_ids.append(const_val)
            else:
                other_base_ids.append(const_val)
            const_val += 1

    return basic_energy_ids, other_base_ids, rocket_ids


def update_general_checksum(data: bytearray, base_offset: int, label: str) -> None:
    """Verify header magic and recalculate 16-bit checksum for sGeneralSaveData."""
    magic, byte_count, old_checksum = struct.unpack_from("<HHH", data, base_offset)
    if magic != 0x0008:
        raise ValueError(f"{label}: unexpected magic {magic:#06x} (expected 0x0008)")
    payload_start = base_offset + 8
    payload_end = payload_start + byte_count
    new_checksum = sum(data[payload_start:payload_end]) & 0xFFFF
    struct.pack_into("<H", data, base_offset + 4, new_checksum)
    print(
        f"  {label}: byte_count={byte_count} ({byte_count:#06x}), "
        f"checksum {old_checksum:#06x} -> {new_checksum:#06x}"
    )


def main() -> None:
    if not SAV_PATH.exists():
        raise FileNotFoundError(f"Save file not found: {SAV_PATH}")

    symbols = parse_sym(SYM_PATH)
    basic_energy_ids, other_base_ids, rocket_ids = parse_card_constants(CARD_CONSTANTS_PATH)
    total_base = len(basic_energy_ids) + len(other_base_ids)

    if len(basic_energy_ids) != 6 or total_base != 228 or len(rocket_ids) != 66:
        raise ValueError(
            f"Unexpected card counts: basic_energy={len(basic_energy_ids)}, "
            f"other_base={len(other_base_ids)}, rocket={len(rocket_ids)}"
        )

    total_cards = total_base + len(rocket_ids)
    data = bytearray(SAV_PATH.read_bytes())
    if len(data) != 4 * SRAM_BANK_SIZE:
        raise ValueError(f"Expected 32768-byte .sav, got {len(data)} bytes")

    if data[0:3] != b"\x04\x21\x05":
        raise ValueError(f"Invalid SRAM validation header at s0a000: {data[0:3].hex()}")

    col_bank, col_addr = symbols["sCardCollection"]
    promo_bank, promo_addr = symbols["sHasPromotionalCards"]
    gen0_bank, gen0_addr = symbols["sGeneralSaveData"]
    gen2_bank, gen2_addr = symbols["sBackupGeneralSaveData"]
    album_bank, album_addr = symbols["sAlbumProgress"]

    # Update both SRAM0 (active) and SRAM2 (backup) card collections
    for bank in (col_bank, 2):
        col_off = sram_offset(bank, col_addr)
        data[col_off] = CARD_NOT_OWNED
        for cid in basic_energy_ids:
            data[col_off + cid] = BASIC_ENERGY_COPIES
        for cid in other_base_ids:
            data[col_off + cid] = BASE_OTHER_COPIES
        for cid in rocket_ids:
            data[col_off + cid] = CARD_NOT_OWNED
        for cid in range(total_cards + 1, CARD_COLLECTION_SIZE):
            data[col_off + cid] = CARD_NOT_OWNED

        promo_off = sram_offset(bank, promo_addr)
        data[promo_off] = 1

    # Update sAlbumProgress in SRAM0 and SRAM2 (collected=228, to_collect=294)
    for bank in (0, album_bank):
        album_off = sram_offset(bank, album_addr)
        struct.pack_into("<HH", data, album_off, total_base, total_cards)

    print("Recalculating SRAM checksums:")
    update_general_checksum(data, sram_offset(gen0_bank, gen0_addr), "SRAM0 sGeneralSaveData")
    update_general_checksum(data, sram_offset(gen2_bank, gen2_addr), "SRAM2 sBackupGeneralSaveData")

    SAV_PATH.write_bytes(data)

    # Verify written file
    written = SAV_PATH.read_bytes()
    for bank_name, bank in (("SRAM0", 0), ("SRAM2", 2)):
        col_off = sram_offset(bank, col_addr)
        energy_ok = all(written[col_off + cid] == BASIC_ENERGY_COPIES for cid in basic_energy_ids)
        other_ok = all(written[col_off + cid] == BASE_OTHER_COPIES for cid in other_base_ids)
        rocket_ok = all(written[col_off + cid] == CARD_NOT_OWNED for cid in rocket_ids)
        if not (energy_ok and other_ok and rocket_ok):
            raise RuntimeError(f"Verification failed for {bank_name}")

    print(
        f"Updated {SAV_PATH.name}: {len(basic_energy_ids)} basic energies set to x{BASIC_ENERGY_COPIES}, "
        f"{len(other_base_ids)} other base cards set to x{BASE_OTHER_COPIES}, "
        f"{len(rocket_ids)} Team Rocket cards set to 0 copies (CARD_NOT_OWNED)."
    )


if __name__ == "__main__":
    main()
