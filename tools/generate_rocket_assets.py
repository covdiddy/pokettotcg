#!/usr/bin/env python3
"""
Generate Team Rocket Grunt 48x48 portrait (.png, .2bpp, .pal)
and Team Rocket 5th Booster Pack graphics (.png, .2bpp, .pal).
"""

import os
import struct
import subprocess
from PIL import Image

RGBGFX = os.path.join(os.path.dirname(os.path.abspath(__file__)), "rgbds", "bin", "rgbgfx")
if not os.path.exists(RGBGFX):
    RGBGFX = "tools/rgbds/bin/rgbgfx"

# 48x48 Team Rocket Grunt Portrait grid
# Legend:
#   ' ' -> 255 (Index 0: White / Skin tone)
#   '.' -> 170 (Index 1: Team Rocket Red - 'R' emblem on cap & uniform, collar/accents)
#   '+' -> 85  (Index 2: Dark Gray - background, cap visor shading, uniform shading)
#   '#' -> 0   (Index 3: Black - cap crown, outlines, eyes, dark uniform)
PORTRAIT_GRID = [
    "++++++++++++++++++++++++++++++++++++++++++++++++",
    "++++++++++++++++++++++    ++++++++++++++++++++++",
    "++++++++++++++++++++  ####  ++++++++++++++++++++",
    "++++++++++++++++++  ########  ++++++++++++++++++",
    "++++++++++++++++  ############  ++++++++++++++++",
    "++++++++++++++  ################  ++++++++++++++",
    "+++++++++++++ ###+############+### +++++++++++++",
    "++++++++++++ ###+####......####+### ++++++++++++",
    "+++++++++++ ###+#####..###..####+### +++++++++++",
    "+++++++++++ ##+######..###..#####+## +++++++++++",
    "+++++++++++ ##+######......######+## +++++++++++",
    "+++++++++++ ##+######..##..######+## +++++++++++",
    "++++++++++ ###+######..###..#####+### ++++++++++",
    "++++++++++ ###+#####...###...####+### ++++++++++",
    "++++++++++ ###+##################+### ++++++++++",
    "++++++++++ ###++################++### ++++++++++",
    "++++++++++ ####++++++++++++++++++#### ++++++++++",
    "++++++++++ ###++++++++++++++++++++### ++++++++++",
    "++++++++++ ##++##################++## ++++++++++",
    "++++++++++ #  ####################  # ++++++++++",
    "++++++++++ ##      ##########      ## ++++++++++",
    "++++++++++ ########   ####   ######## ++++++++++",
    "++++++++++ ######+     ##     +###### ++++++++++",
    "+++++++++ #++#+###+    ##    +###+#++# +++++++++",
    "++++++++ #+#+# #  ##        ##  # #+#+# ++++++++",
    "++++++++ #  ## #   +#      #+   # ##  # ++++++++",
    "++++++++ #  +# #   # #    # #   # #+  # ++++++++",
    "++++++++ #  +# #   # #    # #   # #+  # ++++++++",
    "++++++++ #+  # ######      ###### #  +# ++++++++",
    "+++++++++ #+ #         ##         # +# +++++++++",
    "++++++++++ ###        +##+        ### ++++++++++",
    "+++++++++++  #                    #  +++++++++++",
    "++++++++++++ #+     ########     +# ++++++++++++",
    "+++++++++++++ #     +#+    +#    # +++++++++++++",
    "++++++++++++++ ##    ######    ## ++++++++++++++",
    "+++++++++++++++  ##          ##  +++++++++++++++",
    "+++++++++++++++++  ##########  +++++++++++++++++",
    "+++++++++++++++++ ##+######+## +++++++++++++++++",
    "++++++++++++++++ #.##++##++##.# ++++++++++++++++",
    "++++++++++++++   #..########..#   ++++++++++++++",
    "++++++++++++  ####+..######..+####  ++++++++++++",
    "++++++++++  ##+###+##########+###+##  ++++++++++",
    "+++++++++ ##+######....###...######+## +++++++++",
    "++++++++ #++#######..##..##..#######++# ++++++++",
    "+++++++ #++########.....###..########++# +++++++",
    "+++++++ #++########..##..##..########++# +++++++",
    "++++++ #++#########..###..###########++# +++++++",
    "++++++ #++#########...##...##########++# +++++++",
]


def save_rgb555_pal(path, colors_5bit):
    """Save 4 RGB555 colors (tuples of 0..31) to an 8-byte .pal file."""
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    with open(path, "wb") as f:
        for r, g, b in colors_5bit:
            val = (b << 10) | (g << 5) | r
            f.write(struct.pack("<H", val))


def generate_portrait():
    assert len(PORTRAIT_GRID) == 48, f"Expected 48 rows, got {len(PORTRAIT_GRID)}"
    char_to_val = {" ": 255, ".": 170, "+": 85, "#": 0}
    pixels = []
    for r, row in enumerate(PORTRAIT_GRID):
        assert len(row) == 48, f"Row {r} length {len(row)} != 48"
        for ch in row:
            pixels.append(char_to_val[ch])

    img = Image.new("L", (48, 48))
    img.putdata(pixels)

    # Save to both src/gfx/duelists/ and src/gfx/portraits/
    paths_png = [
        "src/gfx/duelists/rocket_grunt.png",
        "src/gfx/portraits/rocket_grunt.png",
    ]
    paths_2bpp = [
        "src/gfx/duelists/rocket_grunt.2bpp",
        "src/gfx/portraits/rocket_grunt.2bpp",
    ]
    paths_pal = [
        "src/gfx/duelists/rocket_grunt.pal",
        "src/gfx/portraits/rocket_grunt.pal",
    ]

    # 4 colors: White/Skin (28, 24, 20), Team Rocket Red (28, 4, 4), Dark Gray (10, 10, 12), Black (2, 0, 0)
    pal_colors = [
        (28, 24, 20),
        (28, 4, 4),
        (10, 10, 12),
        (2, 0, 0),
    ]

    for p_png, p_2bpp, p_pal in zip(paths_png, paths_2bpp, paths_pal):
        os.makedirs(os.path.dirname(p_png), exist_ok=True)
        img.save(p_png, format="PNG")
        subprocess.run([RGBGFX, "--colors", "dmg", "-o", p_2bpp, p_png], check=True)
        save_rgb555_pal(p_pal, pal_colors)
        print(f"Generated portrait: {p_png}, {p_2bpp} ({os.path.getsize(p_2bpp)}B), {p_pal}")


# 5×7 pixel font for booster banner and artwork
FONT_6X10_ROCKET = {
    "R": [
        "######..",
        "##...##.",
        "##...##.",
        "##...##.",
        "######..",
        "##..##..",
        "##...##.",
        "##...##.",
        "##...##.",
        "##...##.",
    ],
    "O": [
        ".#####..",
        "##...##.",
        "##...##.",
        "##...##.",
        "##...##.",
        "##...##.",
        "##...##.",
        "##...##.",
        "##...##.",
        ".#####..",
    ],
    "C": [
        ".#####..",
        "##...##.",
        "##...##.",
        "##......",
        "##......",
        "##......",
        "##......",
        "##...##.",
        "##...##.",
        ".#####..",
    ],
    "K": [
        "##...##.",
        "##..##..",
        "##.##...",
        "####....",
        "###.....",
        "####....",
        "##.##...",
        "##..##..",
        "##...##.",
        "##...##.",
    ],
    "E": [
        "#######.",
        "##......",
        "##......",
        "##......",
        "#####...",
        "##......",
        "##......",
        "##......",
        "##......",
        "#######.",
    ],
    "T": [
        "######..",
        "..##....",
        "..##....",
        "..##....",
        "..##....",
        "..##....",
        "..##....",
        "..##....",
        "..##....",
        "..##....",
    ],
}


def draw_rocket_booster_illustration(canvas_64x96):
    """
    Modify the middle illustration area (y=30..79, x=2..61) and bottom banner (y=81..94, x=2..61)
    of a 64x96 booster image (where values are 0=black, 85=dark gray, 170=light/red, 255=white).
    """
    px = canvas_64x96.load()

    # 1. Middle illustration area: y=30..79, x=2..61 (60x50 pixels)
    # Dark menacing background with radial/diagonal grid & stars, and a giant bold 3D Team Rocket 'R' emblem in the center!
    for y in range(30, 80):
        for x in range(2, 62):
            # Dark background: mostly black (0) and dark gray (85) checkerboard/diagonal tech pattern
            if y == 31:
                px[x, y] = 0 if (x % 2 == 0) else 85
            elif (x + y) % 4 == 0:
                px[x, y] = 85
            else:
                px[x, y] = 0

    # Draw a dark circular/octagonal medallion silhouette behind the 'R' (center x=32, y=55, radius ~21)
    cx, cy = 32, 55
    for y in range(32, 79):
        for x in range(6, 58):
            dx = x - cx
            dy = y - cy
            dist2 = dx * dx + (dy * 1.1) ** 2
            if 360 <= dist2 <= 440:
                px[x, y] = 255 if (x + y) % 2 == 0 else 170
            elif dist2 < 360:
                # Inside medallion: deep dark shading
                px[x, y] = 0 if ((x ^ y) & 1) else 85

    # Draw giant Team Rocket 'R' in center (x=18..47, y=35..75)
    # Using 170 (Index 1: Red in CGB!), 255 (Index 0: White highlight/outline), and 0 (Black 3D drop shadow)
    def in_giant_R(x, y):
        # Vertical stem: x in [19..27], y in [36..73]
        if 19 <= x <= 27 and 36 <= y <= 73:
            return True
        # Top serif: x in [16..20], y in [36..40]
        if 16 <= x <= 20 and 36 <= y <= 40:
            return True
        # Bottom left serif: x in [16..29], y in [69..73]
        if 16 <= x <= 29 and 69 <= y <= 73:
            return True
        # Top bar of bowl: x in [27..41], y in [36..42]
        if 27 <= x <= 41 and 36 <= y <= 42:
            return True
        # Middle bar of bowl: x in [27..41], y in [51..57]
        if 27 <= x <= 41 and 51 <= y <= 57:
            return True
        # Right curve of bowl: x in [38..46], y in [38..55]
        if 38 <= x <= 46 and 38 <= y <= 55:
            # round outer corners
            if (x >= 45 and y in (38, 39, 54, 55)) or (x == 46 and y in (40, 53)):
                return False
            # inner hole of bowl is x in [28..37], y in [43..50]
            return True
        # Diagonal leg: from (32, 57) down-right to (46, 73)
        if 57 <= y <= 73:
            t = (y - 57) / 16.0
            leg_left = 30 + int(t * 8)
            leg_right = 38 + int(t * 8)
            if leg_left <= x <= leg_right:
                return True
        # Bottom right serif on leg:
        if 44 <= x <= 48 and 69 <= y <= 73:
            return True
        return False

    # First draw 3D black shadow offset by (+2, +2) and white outer rim offset by (-1, -1)
    for y in range(34, 77):
        for x in range(14, 51):
            if in_giant_R(x, y):
                # Fill body with Red (170)
                px[x, y] = 170
            elif in_giant_R(x + 1, y) or in_giant_R(x - 1, y) or in_giant_R(x, y + 1) or in_giant_R(x, y - 1):
                # White outline around R
                px[x, y] = 255
            elif in_giant_R(x - 2, y - 2) or in_giant_R(x - 2, y - 1):
                px[x, y] = 0

    # Add inner highlight on top/left edges of the R
    for y in range(36, 74):
        for x in range(16, 48):
            if in_giant_R(x, y):
                if not in_giant_R(x, y - 1) or not in_giant_R(x - 1, y):
                    if (x + y) % 2 == 0:
                        px[x, y] = 255

    # 2. Bottom banner area: y=81..94, x=2..61
    # Outer white border is at y=80,81 and y=94,95. Inside box is y=82..93, x=3..60.
    for y in range(81, 94):
        for x in range(2, 62):
            if y == 81 or x in (2, 61):
                px[x, y] = 255
            else:
                # Dark background inside the ROCKET banner box
                px[x, y] = 85 if (x + y) % 2 == 0 else 0

    # Draw "ROCKET" centered in y=83..92 (height 10), x=8..55 (6 chars * 8px = 48px)
    word = "ROCKET"
    start_x = 9
    start_y = 83
    for idx, ch in enumerate(word):
        glyph = FONT_6X10_ROCKET[ch]
        gx = start_x + idx * 8
        for gy_off, row_str in enumerate(glyph):
            for gx_off, c in enumerate(row_str):
                if c == "#":
                    x = gx + gx_off
                    y = start_y + gy_off
                    # Shadow
                    if x + 1 < 61 and y + 1 < 94:
                        px[x + 1, y + 1] = 0
        for gy_off, row_str in enumerate(glyph):
            for gx_off, c in enumerate(row_str):
                if c == "#":
                    x = gx + gx_off
                    y = start_y + gy_off
                    px[x, y] = 255


def generate_booster_pack():
    # Load laboratory1.png (128x48) and laboratory2.png (128x48) as structural templates
    # so the top Pokémon TCG logo and CGB tile layout match the engine's exact expectations.
    lab1 = Image.open("src/gfx/booster_packs/laboratory1.png").convert("L")
    lab2 = Image.open("src/gfx/booster_packs/laboratory2.png").convert("L")

    # Reconstruct 64x96 full booster from lab1 (left 64x48 = top half, right 64x48 = bottom half)
    full_64x96 = Image.new("L", (64, 96))
    full_64x96.paste(lab1.crop((0, 0, 64, 48)), (0, 0))
    full_64x96.paste(lab1.crop((64, 0, 128, 48)), (0, 48))

    # Draw custom Team Rocket artwork & ROCKET banner onto full_64x96
    draw_rocket_booster_illustration(full_64x96)

    # 1. Also save standalone 48x64 (.png, .2bpp, .pal) as requested in prompt item 2
    booster_48x64 = full_64x96.resize((48, 64), Image.Resampling.NEAREST)
    booster_48x64_path = "src/gfx/booster_packs/rocket.png"
    booster_48x64_2bpp = "src/gfx/booster_packs/rocket.2bpp"
    booster_48x64_pal = "src/gfx/booster_packs/rocket.pal"
    booster_48x64.save(booster_48x64_path, format="PNG")
    subprocess.run([RGBGFX, "--colors", "dmg", "-o", booster_48x64_2bpp, booster_48x64_path], check=True)
    save_rgb555_pal(booster_48x64_pal, [(28, 28, 28), (31, 4, 4), (10, 10, 14), (2, 0, 2)])
    print(f"Generated standalone 48x64 booster: {booster_48x64_2bpp} ({os.path.getsize(booster_48x64_2bpp)}B)")

    # 2. Build rocket1.png (128x48, 96 tiles) for non-CGB / standard tilemap
    rocket1 = Image.new("L", (128, 48))
    rocket1.paste(full_64x96.crop((0, 0, 64, 48)), (0, 0))
    rocket1.paste(full_64x96.crop((0, 48, 64, 96)), (64, 0))
    rocket1_png = "src/gfx/booster_packs/rocket1.png"
    rocket1_2bpp = "src/gfx/booster_packs/rocket1.2bpp"
    rocket1_pal = "src/gfx/booster_packs/rocket1.pal"
    rocket1.save(rocket1_png, format="PNG")
    subprocess.run([RGBGFX, "--colors", "dmg", "-o", rocket1_2bpp, rocket1_png], check=True)
    save_rgb555_pal(rocket1_pal, [(28, 28, 28), (31, 4, 4), (10, 10, 14), (2, 0, 2)])

    # 3. Build rocket2.png (128x48, trimmed -x 10 -> 86 tiles) for CGB tilemap (matching laboratory.bin tile arrangement)
    # In laboratory2.png:
    # - Left half (0..63, 0..47) has rows 2..5 (y=16..47) from full_64x96 top half,
    #   EXCEPT tiles (0,2..7), (1,2..7) which are deduplicated and hold the bottom row (row 11, y=88..95) of the banner!
    # Let's check exact tile mapping from laboratory.bin (CGB):
    # Row 0: 80 81 81 81 81 81 81 87
    # Row 1: 90 91 91 91 91 91 91 97
    # Row 2: a0 a1 a2 a3 a4 a5 a6 a7
    # Row 3: b0 b1 b2 b3 b4 b5 b6 b7
    # Row 4: c0 c1 c2 c3 c4 c5 c6 c7
    # Row 5: d0 d1 d2 d3 d4 d5 82 83
    # Row 6: 88 89 8a 8b 8c 8d 8e 8f
    # Row 7: 98 99 9a 9b 9c 9d 9e 9f
    # Row 8: a8 a9 aa ab ac ad ae af
    # Row 9: b8 b9 ba bb bc bd be bf
    # Row 10: c8 c9 ca cb cc cd ce cf
    # Row 11: 84 85 86 92 93 94 95 96
    rocket2 = lab2.copy()
    # Helper to paste an 8x8 tile from full_64x96 (grid col 0..7, row 0..11) into rocket2 at tile index (0x80..0xd5)
    def set_rocket2_tile(tile_id, src_col, src_row):
        idx = tile_id - 0x80
        dst_col = idx % 16
        dst_row = idx // 16
        tile_img = full_64x96.crop((src_col * 8, src_row * 8, (src_col + 1) * 8, (src_row + 1) * 8))
        rocket2.paste(tile_img, (dst_col * 8, dst_row * 8))

    cgb_row_tiles = [
        [0x80, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x87],
        [0x90, 0x91, 0x91, 0x91, 0x91, 0x91, 0x91, 0x97],
        [0xA0, 0xA1, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7],
        [0xB0, 0xB1, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6, 0xB7],
        [0xC0, 0xC1, 0xC2, 0xC3, 0xC4, 0xC5, 0xC6, 0xC7],
        [0xD0, 0xD1, 0xD2, 0xD3, 0xD4, 0xD5, 0x82, 0x83],
        [0x88, 0x89, 0x8A, 0x8B, 0x8C, 0x8D, 0x8E, 0x8F],
        [0x98, 0x99, 0x9A, 0x9B, 0x9C, 0x9D, 0x9E, 0x9F],
        [0xA8, 0xA9, 0xAA, 0xAB, 0xAC, 0xAD, 0xAE, 0xAF],
        [0xB8, 0xB9, 0xBA, 0xBB, 0xBC, 0xBD, 0xBE, 0xBF],
        [0xC8, 0xC9, 0xCA, 0xCB, 0xCC, 0xCD, 0xCE, 0xCF],
        [0x84, 0x85, 0x86, 0x92, 0x93, 0x94, 0x95, 0x96],
    ]
    # Copy rows 3..11 from full_64x96 into their CGB tile slots (leaving rows 0..2 "TRADING CARD GAME" untouched from lab2)
    for r in range(3, 12):
        for c in range(8):
            set_rocket2_tile(cgb_row_tiles[r][c], c, r)

    rocket2_png = "src/gfx/booster_packs/rocket2.png"
    rocket2_2bpp = "src/gfx/booster_packs/rocket2.2bpp"
    rocket2_pal = "src/gfx/booster_packs/rocket2.pal"
    rocket2.save(rocket2_png, format="PNG")
    subprocess.run([RGBGFX, "--colors", "dmg", "-x", "10", "-o", rocket2_2bpp, rocket2_png], check=True)
    save_rgb555_pal(rocket2_pal, [(28, 28, 28), (31, 4, 4), (10, 10, 14), (2, 0, 2)])
    print(f"Generated CGB booster tilesets: {rocket1_2bpp} ({os.path.getsize(rocket1_2bpp)}B), {rocket2_2bpp} ({os.path.getsize(rocket2_2bpp)}B)")


if __name__ == "__main__":
    generate_portrait()
    generate_booster_pack()
