#!/usr/bin/env python3
"""
Convert all 66 Team Rocket card artworks from raw_full_cards/ and raw_artworks/
into 64x48 4-color indexed PNGs in src/gfx/cards/ and compile them with rgbgfx
into .2bpp and .pal files.
"""

import os
import subprocess
from PIL import Image, ImageEnhance, ImageFilter, ImageOps

TARGET_SIZE = (64, 48)
RGBGFX = os.path.join(os.path.dirname(os.path.abspath(__file__)), "rgbds", "bin", "rgbgfx")
if not os.path.exists(RGBGFX):
    RGBGFX = "tools/rgbds/bin/rgbgfx"

# Exact crop boxes on full 600x825 card scans for Pokémon, Trainer, and Energy cards
CROP_BOX_POKEMON = (0.105, 0.120, 0.895, 0.494)
CROP_BOX_TRAINER = (0.095, 0.230, 0.905, 0.560)
CROP_BOX_ENERGY  = (0.080, 0.150, 0.920, 0.720)

# Mapping of all 66 cards in src/data/cards_rocket.asm:
# (asm_card_label, asm_gfx_label, base_filename, raw_source_file, card_kind)
ROCKET_CARDS = [
    ("EkansLv15Card",           "RocketEkansCardGfx",               "rocket_ekans",                 "56_ekans.jpg",                 "pokemon"),
    ("DarkArbokCard",           "DarkArbokCardGfx",                 "dark_arbok",                   "19_dark_arbok.jpg",            "pokemon"),
    ("GrimerLv10Card",          "RocketGrimerCardGfx",              "rocket_grimer",                "57_grimer.jpg",                "pokemon"),
    ("DarkMukCard",             "DarkMukCardGfx",                   "dark_muk",                     "41_dark_muk.jpg",              "pokemon"),
    ("KoffingLv12Card",         "RocketKoffingCardGfx",             "rocket_koffing",               "58_koffing.jpg",               "pokemon"),
    ("DarkWeezingCard",         "DarkWeezingCardGfx",               "dark_weezing",                 "31_dark_weezing.jpg",          "pokemon"),
    ("OddishLv21Card",          "RocketOddishCardGfx",              "rocket_oddish",                "63_oddish.jpg",                "pokemon"),
    ("DarkGloomCard",           "DarkGloomCardGfx",                 "dark_gloom",                   "36_dark_gloom.jpg",            "pokemon"),
    ("DarkVileplumeCard",       "DarkVileplumeCardGfx",             "dark_vileplume",               "30_dark_vileplume.jpg",        "pokemon"),
    ("ZubatLv9Card",            "RocketZubatCardGfx",               "rocket_zubat",                 "70_zubat.jpg",                 "pokemon"),
    ("DarkGolbatCard",          "DarkGolbatCardGfx",                "dark_golbat",                  "24_dark_golbat.jpg",           "pokemon"),
    ("CharmanderLv9Card",       "RocketCharmanderCardGfx",          "rocket_charmander",            "50_charmander.jpg",            "pokemon"),
    ("DarkCharmeleonCard",      "DarkCharmeleonCardGfx",            "dark_charmeleon",              "32_dark_charmeleon.jpg",       "pokemon"),
    ("DarkCharizardCard",       "DarkCharizardCardGfx",             "dark_charizard",               "21_dark_charizard.jpg",        "pokemon"),
    ("DarkFlareonCard",         "DarkFlareonCardGfx",               "dark_flareon",                 "35_dark_flareon.jpg",          "pokemon"),
    ("PonytaLv15Card",          "RocketPonytaCardGfx",              "rocket_ponyta",                "64_ponyta.jpg",                "pokemon"),
    ("DarkRapidashCard",        "DarkRapidashCardGfx",              "dark_rapidash",                "44_dark_rapidash.jpg",         "pokemon"),
    ("SquirtleLv16Card",        "RocketSquirtleCardGfx",            "rocket_squirtle",              "68_squirtle.jpg",              "pokemon"),
    ("DarkWartortleCard",       "DarkWartortleCardGfx",             "dark_wartortle",               "46_dark_wartortle.jpg",        "pokemon"),
    ("DarkBlastoiseCard",       "DarkBlastoiseCardGfx",             "dark_blastoise",               "20_dark_blastoise.jpg",        "pokemon"),
    ("PsyduckLv16Card",         "RocketPsyduckCardGfx",             "rocket_psyduck",               "65_psyduck.jpg",               "pokemon"),
    ("DarkGolduckCard",         "DarkGolduckCardGfx",               "dark_golduck",                 "37_dark_golduck.jpg",          "pokemon"),
    ("MagikarpLv10Card",        "RocketMagikarpCardGfx",            "rocket_magikarp",              "47_magikarp.jpg",              "pokemon"),
    ("DarkGyaradosCard",        "DarkGyaradosCardGfx",              "dark_gyarados",                "25_dark_gyarados.jpg",         "pokemon"),
    ("DarkVaporeonCard",        "DarkVaporeonCardGfx",              "dark_vaporeon",                "45_dark_vaporeon.jpg",         "pokemon"),
    ("DarkRaichuCard",          "DarkRaichuCardGfx",                "dark_raichu",                  "83_dark_raichu.jpg",           "pokemon"),
    ("VoltorbLv13Card",         "RocketVoltorbCardGfx",             "rocket_voltorb",               "69_voltorb.jpg",               "pokemon"),
    ("DarkElectrodeCard",       "DarkElectrodeCardGfx",             "dark_electrode",               "34_dark_electrode.jpg",        "pokemon"),
    ("DarkJolteonCard",         "DarkJolteonCardGfx",               "dark_jolteon",                 "38_dark_jolteon.jpg",          "pokemon"),
    ("MagnemiteLv12Card",       "RocketMagnemiteCardGfx",           "rocket_magnemite",             "60_magnemite.jpg",             "pokemon"),
    ("DarkMagnetonCard",        "DarkMagnetonCardGfx",              "dark_magneton",                "28_dark_magneton.jpg",         "pokemon"),
    ("DiglettLv15Card",         "RocketDiglettCardGfx",             "rocket_diglett",               "52_diglett.jpg",               "pokemon"),
    ("DarkDugtrioCard",         "DarkDugtrioCardGfx",               "dark_dugtrio",                 "23_dark_dugtrio.jpg",          "pokemon"),
    ("MankeyLv14Card",          "RocketMankeyCardGfx",              "rocket_mankey",                "61_mankey.jpg",                "pokemon"),
    ("DarkPrimeapeCard",        "DarkPrimeapeCardGfx",              "dark_primeape",                "43_dark_primeape.jpg",         "pokemon"),
    ("MachopLv24Card",          "RocketMachopCardGfx",              "rocket_machop",                "59_machop.jpg",                "pokemon"),
    ("DarkMachokeCard",         "DarkMachokeCardGfx",               "dark_machoke",                 "40_dark_machoke.jpg",          "pokemon"),
    ("DarkMachampCard",         "DarkMachampCardGfx",               "dark_machamp",                 "27_dark_machamp.jpg",          "pokemon"),
    ("AbraLv14Card",            "RocketAbraCardGfx",                "rocket_abra",                  "49_abra.jpg",                  "pokemon"),
    ("DarkKadabraCard",         "DarkKadabraCardGfx",               "dark_kadabra",                 "39_dark_kadabra.jpg",          "pokemon"),
    ("DarkAlakazamCard",        "DarkAlakazamCardGfx",              "dark_alakazam",                "18_dark_alakazam.jpg",         "pokemon"),
    ("SlowpokeLv16Card",        "RocketSlowpokeCardGfx",            "rocket_slowpoke",              "67_slowpoke.jpg",              "pokemon"),
    ("DarkSlowbroCard",         "DarkSlowbroCardGfx",               "dark_slowbro",                 "29_dark_slowbro.jpg",          "pokemon"),
    ("DrowzeeLv10Card",         "RocketDrowzeeCardGfx",             "rocket_drowzee",               "54_drowzee.jpg",               "pokemon"),
    ("DarkHypnoCard",           "DarkHypnoCardGfx",                 "dark_hypno",                   "26_dark_hypno.jpg",            "pokemon"),
    ("RattataLv12Card",         "RocketRattataCardGfx",             "rocket_rattata",               "66_rattata.jpg",               "pokemon"),
    ("DarkRaticateCard",        "DarkRaticateCardGfx",              "dark_raticate",                "51_dark_raticate.jpg",         "pokemon"),
    ("MeowthLv10Card",          "RocketMeowthCardGfx",              "rocket_meowth",                "62_meowth.jpg",                "pokemon"),
    ("DarkPersianCard",         "DarkPersianCardGfx",               "dark_persian",                 "42_dark_persian.jpg",          "pokemon"),
    ("EeveeLv9Card",            "RocketEeveeCardGfx",               "rocket_eevee",                 "55_eevee.jpg",                 "pokemon"),
    ("PorygonLv20Card",         "RocketPorygonCardGfx",             "rocket_porygon",               "48_porygon.jpg",               "pokemon"),
    ("DratiniLv12Card",         "RocketDratiniCardGfx",             "rocket_dratini",               "53_dratini.jpg",               "pokemon"),
    ("DarkDragonairCard",       "DarkDragonairCardGfx",             "dark_dragonair",               "33_dark_dragonair.jpg",        "pokemon"),
    ("DarkDragoniteCard",       "DarkDragoniteCardGfx",             "dark_dragonite",               "22_dark_dragonite.jpg",        "pokemon"),
    ("HereComesTeamRocketCard", "HereComesTeamRocketCardGfx",       "here_comes_team_rocket",       "71_here_comes_team_rocket.jpg","trainer"),
    ("RocketsSneakAttackCard",  "RocketsSneakAttackCardGfx",        "rockets_sneak_attack",         "72_rockets_sneak_attack.jpg",  "trainer"),
    ("TheBosssWayCard",         "TheBosssWayCardGfx",               "the_bosss_way",                "73_the_bosss_way.jpg",         "trainer"),
    ("ChallengeCard",           "ChallengeCardGfx",                 "challenge",                    "74_challenge.jpg",             "trainer"),
    ("DiggerCard",              "DiggerCardGfx",                    "digger",                       "75_digger.jpg",                "trainer"),
    ("ImposterOaksRevengeCard", "ImposterOaksRevengeCardGfx",       "imposter_oaks_revenge",        "76_imposter_oaks_revenge.jpg", "trainer"),
    ("NightlyGarbageRunCard",   "NightlyGarbageRunCardGfx",         "nightly_garbage_run",          "77_nightly_garbage_run.jpg",   "trainer"),
    ("GoopGasAttackCard",       "GoopGasAttackCardGfx",             "goop_gas_attack",              "78_goop_gas_attack.jpg",       "trainer"),
    ("SleepCard",               "SleepCardGfx",                     "sleep",                        "79_sleep.jpg",                 "trainer"),
    ("RainbowEnergyCard",       "RainbowEnergyCardGfx",             "rainbow_energy",               "80_rainbow_energy.jpg",        "energy"),
    ("FullHealEnergyCard",      "FullHealEnergyCardGfx",            "full_heal_energy",             "81_full_heal_energy.jpg",      "energy"),
    ("PotionEnergyCard",        "PotionEnergyCardGfx",              "potion_energy",                "82_potion_energy.jpg",         "energy"),
]


def luminance(rgb):
    r, g, b = rgb
    return 0.299 * r + 0.587 * g + 0.114 * b


def load_source_artwork(raw_filename, card_kind):
    """Load artwork from raw_full_cards/ (with proper crop for trainer/energy) or raw_artworks/."""
    full_path = os.path.join("raw_full_cards", raw_filename)
    art_path = os.path.join("raw_artworks", raw_filename)

    if card_kind in ("trainer", "energy") and os.path.exists(full_path):
        with Image.open(full_path) as img:
            rgb = img.convert("RGB")
            w, h = rgb.size
            box = CROP_BOX_TRAINER if card_kind == "trainer" else CROP_BOX_ENERGY
            crop_coords = (
                int(round(w * box[0])),
                int(round(h * box[1])),
                int(round(w * box[2])),
                int(round(h * box[3])),
            )
            return rgb.crop(crop_coords)

    if os.path.exists(art_path):
        return Image.open(art_path).convert("RGB")
    if os.path.exists(full_path):
        with Image.open(full_path) as img:
            rgb = img.convert("RGB")
            w, h = rgb.size
            box = CROP_BOX_POKEMON
            return rgb.crop((
                int(round(w * box[0])),
                int(round(h * box[1])),
                int(round(w * box[2])),
                int(round(h * box[3])),
            ))
    raise FileNotFoundError(f"Missing artwork for {raw_filename}")


def convert_artwork_to_gbc_card(orig_rgb, output_png, edge_strength=18, saturation=1.55):
    # 1. Extract edges from high-res image before downscaling
    gray = ImageOps.grayscale(orig_rgb)
    gray_smooth = gray.filter(ImageFilter.GaussianBlur(radius=0.8))
    edges = gray_smooth.filter(ImageFilter.FIND_EDGES)
    edges = edges.resize(TARGET_SIZE, Image.Resampling.BILINEAR)
    edge_mask = edges.point(lambda p: 255 if p > edge_strength else 0)

    # 2. Prepare color base
    color_base = orig_rgb.filter(ImageFilter.MedianFilter(size=3))
    color_base = color_base.resize(TARGET_SIZE, Image.Resampling.BILINEAR)
    color_base = ImageEnhance.Color(color_base).enhance(saturation)
    color_base = ImageEnhance.Contrast(color_base).enhance(1.2)

    # 3. Quantize to 3 colors (+ 4th pure black for outlines and borders)
    q3 = color_base.quantize(colors=3, method=Image.Quantize.MEDIANCUT, dither=Image.Dither.NONE)
    pal3_raw = q3.getpalette()[:9]
    colors3 = [tuple(pal3_raw[i:i+3]) for i in range(0, 9, 3)]

    # Ensure 3 distinct RGB555 colors ordered brightest to darkest
    # Snap to 5-bit multiples (0..255 in steps of 8) so rgbgfx sees strictly ordered luminances
    snapped = []
    for r, g, b in colors3:
        sr = max(16, min(248, (r // 8) * 8))
        sg = max(16, min(248, (g // 8) * 8))
        sb = max(16, min(248, (b // 8) * 8))
        snapped.append((sr, sg, sb))

    # Deduplicate if two quantized colors collapsed to the same RGB
    unique_colors = []
    for c in sorted(snapped, key=luminance, reverse=True):
        if c not in unique_colors:
            unique_colors.append(c)
    while len(unique_colors) < 3:
        # Fill any missing shade with a mid-tone
        fallback = (200, 200, 184) if len(unique_colors) == 1 else (104, 104, 120)
        if fallback not in unique_colors:
            unique_colors.append(fallback)
        else:
            unique_colors.append((152, 120, 96))
    unique_colors.sort(key=luminance, reverse=True)

    final_colors = unique_colors[:3] + [(0, 0, 0)]

    # Map original q3 indices to sorted indices 0..2
    old_pal3 = [tuple(pal3_raw[i:i+3]) for i in range(0, 9, 3)]
    # Sort old indices by luminance descending
    sorted_old_indices = sorted(range(len(old_pal3)), key=lambda idx: luminance(old_pal3[idx]), reverse=True)
    old_to_new = {}
    for rank, old_idx in enumerate(sorted_old_indices):
        old_to_new[old_idx] = min(rank, 2)

    base_pixels = [old_to_new.get(px, 0) for px in q3.getdata()]
    mask_pixels = list(edge_mask.getdata())

    w, h = TARGET_SIZE
    final_pixels = []
    for i in range(len(base_pixels)):
        x = i % w
        y = i // w
        # 1px black border around the 64x48 card artwork, matching all vanilla poketcg cards
        if x == 0 or x == w - 1 or y == 0 or y == h - 1:
            final_pixels.append(3)
        elif mask_pixels[i] == 255:
            final_pixels.append(3)
        else:
            final_pixels.append(base_pixels[i])

    # Ensure all 4 palette indices (0, 1, 2, 3) appear at least once so rgbgfx --auto-palette always emits 4 colors (8 bytes)
    used_indices = set(final_pixels)
    for idx in range(4):
        if idx not in used_indices:
            final_pixels[w + 1 + idx] = idx

    flat_palette = []
    for c in final_colors:
        flat_palette.extend(c)
    flat_palette.extend([0] * (768 - len(flat_palette)))

    out_img = Image.new("P", TARGET_SIZE)
    out_img.putpalette(flat_palette)
    out_img.putdata(final_pixels)

    os.makedirs(os.path.dirname(output_png) or ".", exist_ok=True)
    out_img.save(output_png, format="PNG")
    return final_colors


def main():
    assert len(ROCKET_CARDS) == 66, f"Expected 66 cards, got {len(ROCKET_CARDS)}"
    out_dir = "src/gfx/cards"
    for i, (card_label, gfx_label, base_name, raw_file, kind) in enumerate(ROCKET_CARDS, 1):
        png_path = os.path.join(out_dir, f"{base_name}.png")
        bpp_path = os.path.join(out_dir, f"{base_name}.2bpp")
        pal_path = os.path.join(out_dir, f"{base_name}.pal")

        src_img = load_source_artwork(raw_file, kind)
        colors = convert_artwork_to_gbc_card(src_img, png_path)

        subprocess.run(
            [
                RGBGFX,
                "--colors", "dmg",
                "--columns",
                "--colors", "embedded",
                "--auto-palette",
                "-o", bpp_path,
                "-p", pal_path,
                png_path,
            ],
            check=True,
        )
        bpp_size = os.path.getsize(bpp_path)
        pal_size = os.path.getsize(pal_path)
        assert bpp_size == 768, f"{bpp_path} size is {bpp_size}, expected 768"
        assert pal_size == 8, f"{pal_path} size is {pal_size}, expected 8"
        print(f"[{i:02d}/66] {base_name:24s} -> {bpp_size}B .2bpp, {pal_size}B .pal | {colors[:3]}")


if __name__ == "__main__":
    main()
