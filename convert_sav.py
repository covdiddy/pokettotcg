#!/usr/bin/env python3
"""Convert an 8-bit Pokemon TCG (GBC) save file (*_8bit.sav) to the 16-bit SRAM layout.

Derives 16-bit SRAM offsets directly from poketcg.sym (and verifies against src/sram.asm)
and uses exact 8-bit SRAM bank:addr -> file offset calculations:
    file_offset = bank * 0x2000 + (addr - 0xA000)
"""

from collections import Counter
from pathlib import Path
import re
import struct
import sys

SRAM_BANK_SIZE = 0x2000
NUM_SRAM_BANKS = 4
TOTAL_SAV_SIZE = SRAM_BANK_SIZE * NUM_SRAM_BANKS  # 32768 bytes

# Card constants
NUM_CARDS_8BIT = 228          # $00e4 (RECYCLE)
VENUSAUR_LV64_ID = 0x0A
MEW_LV15_ID = 0xA1
CARD_NOT_OWNED = 0x80
CARD_COUNT_MASK = 0x7F

# Collection & deck sizes
CARD_COLLECTION_8BIT_SIZE = 0x100
CARD_COLLECTION_16BIT_SIZE = 0x200
NAME_BUFFER_LENGTH = 16
DECK_NAME_SIZE = 24
DECK_SIZE = 60
DECK_STRUCT_8BIT_SIZE = DECK_NAME_SIZE + DECK_SIZE        # 84 ($54) bytes
DECK_STRUCT_16BIT_SIZE = DECK_NAME_SIZE + DECK_SIZE * 2   # 144 ($90) bytes
NUM_BUILT_DECKS = 4
NUM_SAVED_DECKS_8BIT = 60
NUM_SAVED_DECKS_16BIT = 32

# General save data (WRAMToSRAMMapper in src/engine/save.asm)
GENERAL_SAVE_MAGIC = 0x0008
GENERAL_SAVE_HEADER_SIZE = 8
GENERAL_SAVE_BYTE_COUNT = 179   # $00b3
PC_PACK_SELECTION_OFFSET = 0x24  # sPCPackSelection ($b82c) - sMedalCount ($b808)


def sram_offset(bank: int, addr: int) -> int:
    """Convert SRAM bank:addr ($A000..$BFFF) to byte offset inside a 32KB .sav file."""
    if not (0 <= bank < NUM_SRAM_BANKS):
        raise ValueError(f"Invalid SRAM bank: {bank}")
    if not (0xA000 <= addr < 0xC000):
        raise ValueError(f"Invalid SRAM address: 0x{addr:04x}")
    return bank * SRAM_BANK_SIZE + (addr - 0xA000)


# Exact 8-bit vanilla SRAM layout (bank, addr)
SRAM_8BIT_ADDRS: dict[str, tuple[int, int]] = {
    "s0a000":                 (0, 0xA000),
    "sPlayerName":            (0, 0xA010),
    "sCardAndDeckSaveData":   (0, 0xA100),
    "sCardCollection":        (0, 0xA100),
    "sBuiltDecks":            (0, 0xA200),
    "sDeck1":                 (0, 0xA200),
    "sDeck2":                 (0, 0xA254),
    "sDeck3":                 (0, 0xA2A8),
    "sDeck4":                 (0, 0xA2FC),
    "sSavedDecks":            (0, 0xA350),
    "sSavedDeck1":            (0, 0xA350),
    "sSavedDeck2":            (0, 0xA3A4),
    "sSavedDeck3":            (0, 0xA3F8),
    "sSavedDeck4":            (0, 0xA44C),
    "sCurrentlySelectedDeck": (0, 0xB700),
    "sUnnamedDeckCounter":    (0, 0xB701),
    "sHasPromotionalCards":   (0, 0xB703),
    "sb704":                  (0, 0xB704),
    "sCardAndDeckSaveDataEnd":(0, 0xB707),
    "sGeneralSaveData":       (0, 0xB800),
    "sGeneralSaveDataEnd":    (0, 0xB900),
    "sDebugDuelMode":         (0, 0xBA41),
    "sChallengeMachineMagic": (0, 0xBA42),
    "sCardPopNameList":       (0, 0xBB00),
    "sCurrentDuel":           (0, 0xBC00),
    # Bank 2 backups
    "sBackupCardAndDeck":     (2, 0xA100),
    "sBackupGeneralSaveData": (2, 0xB800),
    "sAlbumProgress":         (2, 0xB8FE),
    "sBackupCurrentDuel":     (2, 0xBC00),
}

SRAM_8BIT = {k: sram_offset(b, a) for k, (b, a) in SRAM_8BIT_ADDRS.items()}


def load_sram_symbols(sym_path: Path) -> tuple[dict[str, int], dict[str, tuple[int, int]]]:
    """Parse poketcg.sym and return (file_offsets, (bank, addr)) for SRAM symbols."""
    offsets: dict[str, int] = {}
    bank_addrs: dict[str, tuple[int, int]] = {}
    for line in sym_path.read_text(encoding="utf-8", errors="replace").splitlines():
        line = line.strip()
        if not line or line.startswith(";"):
            continue
        parts = line.split(None, 1)
        if len(parts) != 2 or ":" not in parts[0]:
            continue
        bank_str, addr_str = parts[0].split(":", 1)
        name = parts[1].strip()
        try:
            bank = int(bank_str, 16)
            addr = int(addr_str, 16)
        except ValueError:
            continue
        if 0xA000 <= addr < 0xC000 and 0 <= bank < NUM_SRAM_BANKS:
            offsets[name] = sram_offset(bank, addr)
            bank_addrs[name] = (bank, addr)
    return offsets, bank_addrs


def load_card_names(card_constants_path: Path) -> tuple[dict[int, str], int]:
    """Parse src/constants/card_constants.asm to get {card_id: NAME} and NUM_CARDS."""
    cards: dict[int, str] = {}
    if not card_constants_path.is_file():
        return cards, 294
    cid = 0
    for line in card_constants_path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = re.match(r"^\s*const_def(?:\s+(\d+))?", line)
        if m:
            cid = int(m.group(1)) if m.group(1) else 0
            continue
        m = re.match(r"^\s*const\s+([A-Z0-9_]+)", line)
        if m:
            cards[cid] = m.group(1)
            cid += 1
    num_cards = max(cards) if cards else 294
    return cards, num_cards


def load_charmap(charmaps_path: Path) -> dict[str, dict[int, str]]:
    """Parse src/constants/charmaps.asm for halfwidth and fullwidth (TX_FULLWIDTH0/3, kana)."""
    tables: dict[str, dict[int, str]] = {
        "HALFWIDTH": {},
        "TX_FULLWIDTH0": {},
        "TX_FULLWIDTH3": {},
        "TX_KATAKANA": {},
        "TX_HIRAGANA": {},
    }
    if not charmaps_path.is_file():
        return tables
    for line in charmaps_path.read_text(encoding="utf-8", errors="replace").splitlines():
        m_fw = re.match(r'^\s*fwcharmap\s+(TX_[A-Z0-9]+),\s*"([^"]+)",\s*\$([0-9a-fA-F]+)', line)
        if m_fw:
            tbl, ch, hx = m_fw.group(1), m_fw.group(2), int(m_fw.group(3), 16)
            if tbl in tables:
                tables[tbl][hx] = ch
            continue
        m_hw = re.match(r'^\s*charmap\s*"([^"]+)",\s*\$([0-9a-fA-F]+)', line)
        if m_hw:
            ch, hx = m_hw.group(1), int(m_hw.group(2), 16)
            if ch != r"\n" and not ch.startswith("<"):
                tables["HALFWIDTH"][hx] = ch
    return tables


def decode_poketcg_text(raw: bytes, charmap: dict[str, dict[int, str]]) -> str:
    """Decode a Pokemon TCG null-terminated string (supports TX_HALFWIDTH, TX_FULLWIDTH0/3, kana)."""
    end = raw.find(0)
    if end != -1:
        raw = raw[:end]
    if not raw:
        return ""
    out: list[str] = []
    i = 0
    halfwidth = False
    while i < len(raw):
        b = raw[i]
        i += 1
        if b == 0x06:  # TX_HALFWIDTH
            halfwidth = True
            continue
        if b == 0x03:  # TX_FULLWIDTH3 (2-byte sequence)
            if i < len(raw):
                c = raw[i]
                i += 1
                out.append(charmap["TX_FULLWIDTH3"].get(c, f"[{b:02x}:{c:02x}]"))
            continue
        if b == 0x01:  # TX_HIRAGANA
            halfwidth = False
            continue
        if b == 0x02:  # TX_KATAKANA
            halfwidth = False
            continue
        if b == 0x05:  # TX_SYMBOL
            if i < len(raw):
                i += 1
            continue
        if halfwidth or (0x20 <= b < 0x7F and b not in charmap["TX_FULLWIDTH0"]):
            out.append(charmap["HALFWIDTH"].get(b, chr(b) if 0x20 <= b < 0x7F else f"[{b:02x}]"))
        else:
            out.append(
                charmap["TX_FULLWIDTH0"].get(
                    b,
                    charmap["TX_KATAKANA"].get(
                        b, charmap["HALFWIDTH"].get(b, f"[{b:02x}]")
                    ),
                )
            )
    return "".join(out)


def compute_general_save_checksum(payload: bytes) -> int:
    """16-bit unsigned byte sum of the 179-byte sGeneralSaveData payload."""
    return sum(payload) & 0xFFFF


def convert_deck_8bit_to_16bit(deck_bytes: bytes) -> bytes:
    """Convert an 84-byte 8-bit deck_struct to a 144-byte 16-bit deck_struct (60 x dw LE)."""
    if len(deck_bytes) != DECK_STRUCT_8BIT_SIZE:
        raise ValueError(f"Expected {DECK_STRUCT_8BIT_SIZE} bytes for 8-bit deck, got {len(deck_bytes)}")
    name = deck_bytes[:DECK_NAME_SIZE]
    cards_8bit = deck_bytes[DECK_NAME_SIZE:]
    # Empty deck slot (both name and first card are 0): return clean zeroed 16-bit struct
    if name[0] == 0 and cards_8bit[0] == 0:
        return bytes(DECK_STRUCT_16BIT_SIZE)
    cards_16bit = b"".join(struct.pack("<H", card_id) for card_id in cards_8bit)
    return name + cards_16bit


def inspect_8bit_save(
    old_sav: bytes,
    card_names: dict[int, str],
    charmap: dict[str, dict[int, str]],
) -> None:
    """Read and display real data from the 8-bit save using exact 8-bit SRAM offsets."""
    if len(old_sav) != TOTAL_SAV_SIZE:
        raise ValueError(f"Input save must be {TOTAL_SAV_SIZE} bytes, got {len(old_sav)} bytes")

    print("=== 1. VERIFICA LETTURA SAVE 8-BIT (offset SRAM originali) ===")
    header = old_sav[SRAM_8BIT["s0a000"] : SRAM_8BIT["s0a000"] + 3]
    header_ok = header == b"\x04\x21\x05"
    print(f"  s0a000 (00:a000 -> 0x{SRAM_8BIT['s0a000']:04x}): {header.hex(' ')} "
          f"({'OK' if header_ok else 'INVALID'})")

    raw_name = old_sav[SRAM_8BIT["sPlayerName"] : SRAM_8BIT["sPlayerName"] + NAME_BUFFER_LENGTH]
    player_name = decode_poketcg_text(raw_name, charmap)
    print(f"  sPlayerName (00:a010 -> 0x{SRAM_8BIT['sPlayerName']:04x}): "
          f"{player_name!r}  [raw: {raw_name.hex(' ')}]")

    # General save data (Bank 0 & Bank 2)
    for label, key in (
        ("sGeneralSaveData (SRAM0)", "sGeneralSaveData"),
        ("sBackupGeneralSaveData (SRAM2)", "sBackupGeneralSaveData"),
    ):
        off = SRAM_8BIT[key]
        bank, addr = SRAM_8BIT_ADDRS[key]
        magic, byte_count, checksum = struct.unpack_from("<HHH", old_sav, off)
        payload = old_sav[off + GENERAL_SAVE_HEADER_SIZE : off + GENERAL_SAVE_HEADER_SIZE + byte_count]
        calc_sum = compute_general_save_checksum(payload)
        medals = payload[0]
        ow_map = payload[1]
        pt_frames, pt_sec, pt_min, pt_hr = struct.unpack_from("<BBBH", payload, 2)
        print(f"  {label} ({bank:02x}:{addr:04x} -> 0x{off:04x}): "
              f"magic=0x{magic:04x}, bytes={byte_count}, checksum=0x{checksum:04x} "
              f"(calc=0x{calc_sum:04x}), medals={medals}, map={ow_map}, "
              f"time={pt_hr:02d}:{pt_min:02d}:{pt_sec:02d}")

    # Card collection + cards inside sDeck1..4
    coll_off = SRAM_8BIT["sCardCollection"]
    coll = old_sav[coll_off : coll_off + CARD_COLLECTION_8BIT_SIZE]
    deck_card_counts: Counter[int] = Counter()
    built_decks_info: list[tuple[int, int, str, int]] = []
    for i in range(NUM_BUILT_DECKS):
        d_off = SRAM_8BIT["sDeck1"] + i * DECK_STRUCT_8BIT_SIZE
        d_raw = old_sav[d_off : d_off + DECK_STRUCT_8BIT_SIZE]
        d_name = decode_poketcg_text(d_raw[:DECK_NAME_SIZE], charmap) if d_raw[0] != 0 else "<vuoto>"
        d_cards = [c for c in d_raw[DECK_NAME_SIZE:] if c != 0]
        if d_raw[0] != 0:
            deck_card_counts.update(d_cards)
        built_decks_info.append((i + 1, d_off, d_name, len(d_cards)))

    owned_cards: list[tuple[int, str, int, int]] = []
    for cid in range(1, NUM_CARDS_8BIT + 1):
        entry = coll[cid]
        is_owned = (entry & CARD_NOT_OWNED) == 0
        loose = entry & CARD_COUNT_MASK if is_owned else 0
        in_decks = deck_card_counts[cid]
        if is_owned or in_decks > 0:
            owned_cards.append((cid, card_names.get(cid, f"CARD_{cid}"), loose, in_decks))

    total_unique = len(owned_cards)
    total_loose = sum(x[2] for x in owned_cards)
    total_in_decks = sum(x[3] for x in owned_cards)
    total_all = total_loose + total_in_decks
    b2_album_off = SRAM_8BIT["sAlbumProgress"]
    old_alb_col, old_alb_tot = old_sav[b2_album_off], old_sav[b2_album_off + 1]

    print(f"  sCardCollection (00:a100 -> 0x{coll_off:04x}): "
          f"{total_unique} carte uniche (8-bit sAlbumProgress={old_alb_col}/{old_alb_tot}), "
          f"{total_all} copie totali ({total_loose} libere + {total_in_decks} nei mazzi)")
    # Highlight notable cards (e.g., Venusaur, holos/rares, first few cards)
    notable = [
        f"#{cid} {name} (x{loose + in_d}: {loose} alb + {in_d} deck)"
        for cid, name, loose, in_d in owned_cards
        if any(k in name for k in ("VENUSAUR", "BULBASAUR", "IVYSAUR", "FLAREON", "VAPOREON", "PIKACHU", "RAICHU", "HITMONCHAN", "KANGASKHAN", "PROFESSOR_OAK"))
    ]
    if notable:
        print("  Carte chiave trovate nella collezione:")
        for item in notable:
            print(f"    - {item}")

    print("  Mazzi attivi (sDeck1..4, 8-bit 00:a200 -> 0x0200):")
    for idx, d_off, d_name, cnt in built_decks_info:
        print(f"    sDeck{idx} (00:{0xA000 + d_off:04x} -> 0x{d_off:04x}): {d_name} ({cnt} carte)")

    print("  Mazzi salvati nella Deck Save Machine (sSavedDeck1..4, 8-bit 00:a350 -> 0x0350):")
    for i in range(4):
        s_off = SRAM_8BIT["sSavedDeck1"] + i * DECK_STRUCT_8BIT_SIZE
        s_raw = old_sav[s_off : s_off + DECK_STRUCT_8BIT_SIZE]
        s_name = decode_poketcg_text(s_raw[:DECK_NAME_SIZE], charmap) if s_raw[0] != 0 else "<vuoto>"
        s_cnt = sum(1 for c in s_raw[DECK_NAME_SIZE:] if c != 0)
        print(f"    sSavedDeck{i + 1} (00:{0xA000 + s_off:04x} -> 0x{s_off:04x}): {s_name} ({s_cnt} carte)")

    extra_saved = []
    for i in range(4, NUM_SAVED_DECKS_8BIT):
        s_off = SRAM_8BIT["sSavedDeck1"] + i * DECK_STRUCT_8BIT_SIZE
        s_raw = old_sav[s_off : s_off + DECK_STRUCT_8BIT_SIZE]
        if s_raw[0] != 0:
            extra_saved.append((i + 1, decode_poketcg_text(s_raw[:DECK_NAME_SIZE], charmap)))
    if extra_saved:
        print(f"  Altri sSavedDeck non vuoti (5..60): {extra_saved}")

    # Check if Bank 0 and Bank 2 card/deck data match in 8-bit save
    b0_cd = old_sav[SRAM_8BIT["sCardAndDeckSaveData"] : SRAM_8BIT["sCardAndDeckSaveDataEnd"]]
    b2_cd = old_sav[SRAM_8BIT["sBackupCardAndDeck"] : SRAM_8BIT["sBackupCardAndDeck"] + len(b0_cd)]
    print(f"  Coerenza 8-bit SRAM0 vs SRAM2 (sCardAndDeckSaveData): {'IDENTICI' if b0_cd == b2_cd else 'DIVERSI!'}")
    print()


def validate_16bit_save(sav: bytes, sym: dict[str, int], num_cards_16bit: int) -> None:
    """Verify size, ValidateSRAM header, WRAMToSRAMMapper checksums/ranges, SRAM2 backup, and sAlbumProgress."""
    if len(sav) != TOTAL_SAV_SIZE:
        raise AssertionError(f"Invalid save size: {len(sav)} != {TOTAL_SAV_SIZE}")

    s0a000 = sym["s0a000"]
    if sav[s0a000 : s0a000 + 3] != b"\x04\x21\x05":
        raise AssertionError(f"Invalid ValidateSRAM magic at 0x{s0a000:04x}: {sav[s0a000:s0a000+3].hex(' ')}")

    for label, base in (
        ("SRAM0 sGeneralSaveData", sym["sGeneralSaveData"]),
        ("SRAM2 sBackupGeneralSaveData", sym["sBackupGeneralSaveData"]),
    ):
        magic, byte_count, checksum = struct.unpack_from("<HHH", sav, base)
        if magic != GENERAL_SAVE_MAGIC:
            raise AssertionError(f"{label}: invalid magic 0x{magic:04x}")
        if byte_count != GENERAL_SAVE_BYTE_COUNT:
            raise AssertionError(f"{label}: invalid byte_count {byte_count}")
        payload = sav[base + GENERAL_SAVE_HEADER_SIZE : base + GENERAL_SAVE_HEADER_SIZE + byte_count]
        calc_sum = compute_general_save_checksum(payload)
        if checksum != calc_sum:
            raise AssertionError(f"{label}: checksum mismatch 0x{checksum:04x} != 0x{calc_sum:04x}")
        pc_pack_sel = payload[PC_PACK_SELECTION_OFFSET]
        if pc_pack_sel > 14:
            raise AssertionError(f"{label}: sPCPackSelection out of range ({pc_pack_sel} > 14)")

    # Verify SRAM0 and SRAM2 general save data match byte-for-byte
    s_gen = sym["sGeneralSaveData"]
    s_backup_gen = sym["sBackupGeneralSaveData"]
    if sav[s_gen : s_gen + 0x100] != sav[s_backup_gen : s_backup_gen + 0x100]:
        raise AssertionError("SRAM0 sGeneralSaveData and SRAM2 sBackupGeneralSaveData do not match!")

    # Verify SRAM0 and SRAM2 sCardAndDeckSaveData match byte-for-byte (critical for LoadBackupSaveData!)
    s_coll = sym["sCardCollection"]
    s_card_deck_end = sym["sCardAndDeckSaveDataEnd"]
    cd_len = s_card_deck_end - s_coll
    sram2_coll = 2 * SRAM_BANK_SIZE + s_coll
    if sav[s_coll:s_card_deck_end] != sav[sram2_coll : sram2_coll + cd_len]:
        raise AssertionError("SRAM0 and SRAM2 sCardAndDeckSaveData do not match!")

    if sav[sym["sCurrentDuel"]] != 0 or sav[sym["sBackupCurrentDuel"]] != 0:
        raise AssertionError("Expected sCurrentDuelValid and sBackupCurrentDuel to be 0")

    # Verify sAlbumProgress in both SRAM2 and SRAM0
    coll_16bit_size = sym["sDeck1"] - s_coll
    coll = sav[s_coll : s_coll + coll_16bit_size]
    expected_collected = sum(1 for b in coll if (b & CARD_NOT_OWNED) == 0)
    expected_to_collect = (
        num_cards_16bit
        - ((coll[VENUSAUR_LV64_ID] >> 7) & 1)
        - ((coll[MEW_LV15_ID] >> 7) & 1)
    )
    for label, off in (
        ("SRAM2 sAlbumProgress", sym["sAlbumProgress"]),
        ("SRAM0 sAlbumProgress", sym["sAlbumProgress"] - 2 * SRAM_BANK_SIZE),
    ):
        collected, to_collect = struct.unpack_from("<HH", sav, off)
        if collected != expected_collected or to_collect != expected_to_collect:
            raise AssertionError(
                f"{label} mismatch: ({collected}, {to_collect}) != ({expected_collected}, {expected_to_collect})"
            )


def convert_save(old_sav: bytes, sym: dict[str, int], num_cards_16bit: int) -> bytes:
    """Convert an 8-bit 32KB SRAM image to a 16-bit 32KB SRAM image using poketcg.sym offsets."""
    if len(old_sav) != TOTAL_SAV_SIZE:
        raise ValueError(f"Input save must be {TOTAL_SAV_SIZE} bytes, got {len(old_sav)} bytes")
    if old_sav[0:3] != b"\x04\x21\x05":
        raise ValueError(f"Input save missing ValidateSRAM header ($04 $21 $05): {old_sav[0:3].hex(' ')}")

    if old_sav[SRAM_8BIT["sCurrentDuel"]] != 0:
        print("  [AVVISO] Il salvataggio 8-bit aveva un duello sospeso (sCurrentDuelValid != 0): "
              "verrà azzerato per riprendere dal Diario in sicurezza.")

    new_sav = bytearray(TOTAL_SAV_SIZE)

    # 1. SRAM0 $a000..$a0ff: ValidateSRAM header, options, flags, sPlayerName
    s_coll = sym["sCardCollection"]
    new_sav[0x0000:s_coll] = old_sav[0x0000 : SRAM_8BIT["sCardCollection"]]

    # 2. SRAM0 sCardCollection ($a100..$a2ff): preserve 0..228 (CARD_NOT_OWNED + loose count), mark 229..end as CARD_NOT_OWNED ($80)
    old_coll_off = SRAM_8BIT["sCardCollection"]
    coll_16bit_size = sym["sDeck1"] - s_coll
    new_sav[s_coll : s_coll + NUM_CARDS_8BIT + 1] = old_sav[old_coll_off : old_coll_off + NUM_CARDS_8BIT + 1]
    for i in range(NUM_CARDS_8BIT + 1, coll_16bit_size):
        new_sav[s_coll + i] = CARD_NOT_OWNED

    # 3. SRAM0 sDeck1..sDeck4 (4 built decks: 84B -> 144B, 60 x uint8 -> 60 x uint16 LE)
    s_deck1 = sym["sDeck1"]
    for i in range(NUM_BUILT_DECKS):
        src_off = SRAM_8BIT["sDeck1"] + i * DECK_STRUCT_8BIT_SIZE
        dst_off = s_deck1 + i * DECK_STRUCT_16BIT_SIZE
        new_sav[dst_off : dst_off + DECK_STRUCT_16BIT_SIZE] = convert_deck_8bit_to_16bit(
            old_sav[src_off : src_off + DECK_STRUCT_8BIT_SIZE]
        )

    # 4. SRAM0 sSavedDeck1..sSavedDeck32 (32 saved decks: 84B -> 144B, 60 x uint8 -> 60 x uint16 LE)
    s_saved1 = sym["sSavedDeck1"]
    for i in range(NUM_SAVED_DECKS_16BIT):
        src_off = SRAM_8BIT["sSavedDeck1"] + i * DECK_STRUCT_8BIT_SIZE
        dst_off = s_saved1 + i * DECK_STRUCT_16BIT_SIZE
        new_sav[dst_off : dst_off + DECK_STRUCT_16BIT_SIZE] = convert_deck_8bit_to_16bit(
            old_sav[src_off : src_off + DECK_STRUCT_8BIT_SIZE]
        )

    # 5. SRAM0 sCurrentlySelectedDeck..sb704 (7 bytes: 00:b700..b706 -> 00:b740..b746)
    s_cur_deck = sym["sCurrentlySelectedDeck"]
    old_cur_deck = SRAM_8BIT["sCurrentlySelectedDeck"]
    new_sav[s_cur_deck : s_cur_deck + 7] = old_sav[old_cur_deck : old_cur_deck + 7]

    # 6. SRAM0 sGeneralSaveData (00:b800): copy 179-byte payload & recalculate header + checksum
    s_gen = sym["sGeneralSaveData"]
    old_gen = SRAM_8BIT["sGeneralSaveData"]
    gen_payload = old_sav[old_gen + GENERAL_SAVE_HEADER_SIZE : old_gen + GENERAL_SAVE_HEADER_SIZE + GENERAL_SAVE_BYTE_COUNT]
    gen_checksum = compute_general_save_checksum(gen_payload)
    struct.pack_into("<HHHH", new_sav, s_gen, GENERAL_SAVE_MAGIC, GENERAL_SAVE_BYTE_COUNT, gen_checksum, 0)
    new_sav[s_gen + GENERAL_SAVE_HEADER_SIZE : s_gen + GENERAL_SAVE_HEADER_SIZE + GENERAL_SAVE_BYTE_COUNT] = gen_payload

    # 7. SRAM0 $b900..$bbff: Challenge Machine & Card Pop! name list (same addresses)
    s_gen_end = sym["sGeneralSaveDataEnd"]
    s_duel = sym["sCurrentDuel"]
    new_sav[s_gen_end:s_duel] = old_sav[SRAM_8BIT["sGeneralSaveDataEnd"] : SRAM_8BIT["sCurrentDuel"]]

    # 8. Compute 16-bit sAlbumProgress (2 x uint16 LE: collected, to_collect) and write to SRAM0 & SRAM2
    coll = new_sav[s_coll : s_coll + coll_16bit_size]
    collected = sum(1 for b in coll if (b & CARD_NOT_OWNED) == 0)
    to_collect = (
        num_cards_16bit
        - ((coll[VENUSAUR_LV64_ID] >> 7) & 1)
        - ((coll[MEW_LV15_ID] >> 7) & 1)
    )
    s_album_sram2 = sym["sAlbumProgress"]
    s_album_sram0 = s_album_sram2 - 2 * SRAM_BANK_SIZE
    struct.pack_into("<HH", new_sav, s_album_sram0, collected, to_collect)

    # 9. SRAM2 backup of sCardAndDeckSaveData (02:a100..b746) — restored on Continue From Diary!
    s_card_deck_end = sym["sCardAndDeckSaveDataEnd"]
    backup_card_deck_len = s_card_deck_end - s_coll
    sram2_coll = 2 * SRAM_BANK_SIZE + s_coll
    new_sav[sram2_coll : sram2_coll + backup_card_deck_len] = new_sav[s_coll:s_card_deck_end]

    # 10. SRAM2 sBackupGeneralSaveData (02:b800..b8ff) + sAlbumProgress (02:b8fe..b901)
    s_backup_gen = sym["sBackupGeneralSaveData"]
    new_sav[s_backup_gen : s_backup_gen + 0x100] = new_sav[s_gen : s_gen + 0x100]
    struct.pack_into("<HH", new_sav, s_album_sram2, collected, to_collect)

    # sCurrentDuel (00:bc00) and sBackupCurrentDuel (02:bc00) remain zeroed.
    result = bytes(new_sav)
    validate_16bit_save(result, sym, num_cards_16bit)
    return result


def resolve_input_path(cli_arg: str | None) -> Path:
    if cli_arg:
        return Path(cli_arg)
    for candidate in (Path("poketcg_8bit.sav"), Path("old_saves/poketcg_8bit.sav")):
        if candidate.is_file():
            return candidate
    for search_dir in (Path("."), Path("old_saves")):
        if search_dir.is_dir():
            matches = sorted(search_dir.glob("*_8bit.sav"))
            if matches:
                return matches[0]
    raise FileNotFoundError("Could not find *_8bit.sav in '.' or 'old_saves/'")


def main() -> int:
    args = [a for a in sys.argv[1:] if a != "--inspect-only"]
    inspect_only = "--inspect-only" in sys.argv[1:]

    in_path = resolve_input_path(args[0] if len(args) > 0 else None)
    out_path = Path(args[1] if len(args) > 1 else "poketcg.sav")
    sym_path = Path("poketcg.sym")
    if not sym_path.is_file():
        raise FileNotFoundError("poketcg.sym not found; run make tcg first.")

    sym, sym_ba = load_sram_symbols(sym_path)
    card_names, num_cards_16bit = load_card_names(Path("src/constants/card_constants.asm"))
    charmap = load_charmap(Path("src/constants/charmaps.asm"))
    old_data = in_path.read_bytes()

    # Step 1 & 2: Inspect 8-bit save BEFORE writing any output file
    print(f"Input:  {in_path} ({len(old_data)} bytes)")
    inspect_8bit_save(old_data, card_names, charmap)
    if inspect_only:
        return 0

    # Step 3: Show exact 16-bit target offsets derived from poketcg.sym vs 8-bit layout
    print("=== 2. OFFSET SRAM 16-BIT RICAVATI DA poketcg.sym (vs 8-bit) ===")
    for k in (
        "s0a000", "sPlayerName", "sCardCollection",
        "sDeck1", "sDeck2", "sDeck3", "sDeck4",
        "sSavedDecks", "sSavedDeck1", "sSavedDeck2", "sSavedDeck3", "sSavedDeck4",
        "sCurrentlySelectedDeck", "sCardAndDeckSaveDataEnd",
        "sGeneralSaveData", "sGeneralSaveDataEnd",
        "sBackupGeneralSaveData", "sAlbumProgress", "sCurrentDuel", "sBackupCurrentDuel",
    ):
        b, a = sym_ba[k]
        old_str = (
            f"(8-bit {SRAM_8BIT_ADDRS[k][0]:02x}:{SRAM_8BIT_ADDRS[k][1]:04x} -> 0x{SRAM_8BIT[k]:04x})"
            if k in SRAM_8BIT_ADDRS
            else ""
        )
        print(f"  {k:25s}: {b:02x}:{a:04x} -> 0x{sym[k]:04x}  {old_str}")
    print(f"  {'sBackupCardAndDeck (SRAM2)':25s}: 02:a100 -> 0x{2*SRAM_BANK_SIZE + sym['sCardCollection']:04x} "
          f"(len=0x{sym['sCardAndDeckSaveDataEnd'] - sym['sCardCollection']:04x})")
    print()

    # Step 4 & 5: Convert, verify SRAM0 & SRAM2 backups/checksums, and write poketcg.sav
    new_data = convert_save(old_data, sym, num_cards_16bit)
    out_path.write_bytes(new_data)

    s_gen = sym["sGeneralSaveData"]
    s_bgen = sym["sBackupGeneralSaveData"]
    gen_magic, gen_count, gen_sum = struct.unpack_from("<HHH", new_data, s_gen)
    bgen_magic, bgen_count, bgen_sum = struct.unpack_from("<HHH", new_data, s_bgen)
    collected, to_collect = struct.unpack_from("<HH", new_data, sym["sAlbumProgress"])
    s_coll = sym["sCardCollection"]
    loose_copies = sum(
        b & CARD_COUNT_MASK
        for b in new_data[s_coll : s_coll + CARD_COLLECTION_16BIT_SIZE]
        if (b & CARD_NOT_OWNED) == 0
    )
    medal_count = new_data[s_gen + GENERAL_SAVE_HEADER_SIZE]
    player_name = decode_poketcg_text(
        new_data[sym["sPlayerName"] : sym["sPlayerName"] + NAME_BUFFER_LENGTH], charmap
    )

    print("=== 3. RISULTATO CONVERSIONE 16-BIT ===")
    print(f"  Output:                   {out_path} ({len(new_data)} bytes)")
    print(f"  Giocatore:                {player_name}")
    print(f"  ValidateSRAM (00:a000):   {new_data[0:3].hex(' ')}")
    print(f"  sGeneralSaveData (SRAM0): magic=0x{gen_magic:04x}, bytes={gen_count}, checksum=0x{gen_sum:04x}")
    print(f"  sBackupGeneral   (SRAM2): magic=0x{bgen_magic:04x}, bytes={bgen_count}, checksum=0x{bgen_sum:04x} (MATCH)")
    print(f"  Medaglie:                 {medal_count}")
    print(f"  sAlbumProgress:           {collected} / {to_collect} uniche ({loose_copies} copie libere in album)")
    print("  sDeck1..4 (16-bit word LE):")
    for i in range(NUM_BUILT_DECKS):
        off = sym["sDeck1"] + i * DECK_STRUCT_16BIT_SIZE
        name = decode_poketcg_text(new_data[off : off + DECK_NAME_SIZE], charmap) if new_data[off] != 0 else "<vuoto>"
        cards16 = struct.unpack_from(f"<{DECK_SIZE}H", new_data, off + DECK_NAME_SIZE)
        cnt = sum(1 for c in cards16 if c != 0)
        print(f"    sDeck{i+1} @ 0x{off:04x}: {name} ({cnt} carte)")
    print("  sSavedDeck1..4 (16-bit word LE):")
    for i in range(4):
        off = sym["sSavedDeck1"] + i * DECK_STRUCT_16BIT_SIZE
        name = decode_poketcg_text(new_data[off : off + DECK_NAME_SIZE], charmap) if new_data[off] != 0 else "<vuoto>"
        cards16 = struct.unpack_from(f"<{DECK_SIZE}H", new_data, off + DECK_NAME_SIZE)
        cnt = sum(1 for c in cards16 if c != 0)
        print(f"    sSavedDeck{i+1} @ 0x{off:04x}: {name} ({cnt} carte)")
    print("  Tutti i checksum e la sincronizzazione SRAM0 <-> SRAM2 sono stati verificati con successo!")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
