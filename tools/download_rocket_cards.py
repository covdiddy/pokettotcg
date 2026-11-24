#!/usr/bin/env python3
"""Download Team Rocket set card images from pkmncards.com and crop artworks."""

from __future__ import annotations

import argparse
import html.parser
import json
import os
import re
import sys
import time
import unicodedata
import urllib.error
import urllib.request
from pathlib import Path
from typing import Any

from PIL import Image

SET_URL = "https://pkmncards.com/set/team-rocket/"
DEFAULT_USER_AGENT = (
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
    "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
)

# Relative crop box (left, top, right, bottom) for the inner illustration
# on standard WotC 600x825 card scans, excluding yellow border, header, and text box.
ARTWORK_CROP_BOX = (0.105, 0.120, 0.895, 0.494)


class PkmnCardsSetParser(html.parser.HTMLParser):
    """Extract card title, number, and high-res image URL from pkmncards set HTML."""

    def __init__(self) -> None:
        super().__init__()
        self.cards: list[dict[str, Any]] = []
        self._current_title: str | None = None

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        attr_map = dict(attrs)
        if tag == "a" and "card-image-link" in (attr_map.get("class") or ""):
            self._current_title = attr_map.get("title") or ""
        elif tag == "img" and "card-image" in (attr_map.get("class") or ""):
            src = attr_map.get("src") or ""
            if not src or "wp-content/uploads/" not in src:
                return
            # Strip WordPress thumbnail suffix like -225x310 if present
            src = re.sub(r"-\d+x\d+(\.[a-zA-Z0-9]+)$", r"\1", src)
            title = self._current_title or attr_map.get("alt") or ""
            num_match = re.search(r"#(\d+)", title)
            if not num_match:
                num_match = re.search(r"-(\d+)\.[a-zA-Z0-9]+$", src)
            number = int(num_match.group(1)) if num_match else len(self.cards) + 1
            name = title.split("·")[0].strip() if "·" in title else title.strip()
            if not name:
                slug = Path(src).stem
                name = re.sub(r"-team-rocket-tr-\d+$", "", slug).replace("-", " ")
            self.cards.append({"number": number, "name": name, "imageUrl": src})


def sanitize_card_name(name: str) -> str:
    """Convert card name to lowercase ASCII underscore-separated slug."""
    normalized = unicodedata.normalize("NFKD", name)
    ascii_only = normalized.encode("ascii", "ignore").decode("ascii")
    cleaned = ascii_only.lower().strip()
    cleaned = cleaned.replace("'", "")
    cleaned = re.sub(r"[^a-z0-9]+", "_", cleaned)
    return cleaned.strip("_")


def build_unique_filename(
    number: int, name: str, used_names: set[str], set_suffix: str = ""
) -> str:
    """Build a unique NN_card_name[_set_suffix].jpg filename."""
    slug = sanitize_card_name(name)
    suffix_part = f"_{sanitize_card_name(set_suffix)}" if set_suffix else ""
    base = f"{number:02d}_{slug}{suffix_part}"
    candidate = f"{base}.jpg"
    suffix = 2
    while candidate in used_names:
        candidate = f"{base}_{suffix}.jpg"
        suffix += 1
    used_names.add(candidate)
    return candidate


def fetch_cards_from_web(url: str, user_agent: str) -> list[dict[str, Any]]:
    """Fetch and parse card metadata from the pkmncards.com set page."""
    req = urllib.request.Request(url, headers={"User-Agent": user_agent})
    with urllib.request.urlopen(req, timeout=20) as resp:
        body = resp.read().decode("utf-8", errors="replace")
    parser = PkmnCardsSetParser()
    parser.feed(body)
    if not parser.cards:
        raise ValueError("No card images found in HTML response")
    return parser.cards


def load_cards(
    set_url: str, manifest_path: Path, user_agent: str
) -> list[dict[str, Any]]:
    """Try scraping the set page first; fall back to local manifest if blocked."""
    try:
        cards = fetch_cards_from_web(set_url, user_agent)
        print(f"Scraped {len(cards)} cards from {set_url}")
        return cards
    except (urllib.error.URLError, urllib.error.HTTPError, ValueError) as exc:
        print(f"Direct scrape unavailable ({exc}); using manifest {manifest_path}")
        if not manifest_path.exists():
            raise RuntimeError(
                f"Cannot scrape {set_url} and manifest not found: {manifest_path}"
            ) from exc
        with manifest_path.open("r", encoding="utf-8") as f:
            cards = json.load(f)
        print(f"Loaded {len(cards)} cards from manifest")
        return cards


def download_file(url: str, dest: Path, user_agent: str, retries: int = 3) -> None:
    """Download a binary file with retries."""
    last_err: Exception | None = None
    for attempt in range(1, retries + 1):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": user_agent})
            with urllib.request.urlopen(req, timeout=20) as resp:
                data = resp.read()
            if not data:
                raise ValueError(f"Empty response from {url}")
            dest.write_bytes(data)
            return
        except Exception as exc:  # noqa: BLE001
            last_err = exc
            if attempt < retries:
                time.sleep(0.5 * attempt)
    raise RuntimeError(f"Failed to download {url}: {last_err}")


def crop_artwork(src_path: Path, dst_path: Path) -> tuple[int, int]:
    """Crop the inner artwork box from a full card image and save as JPEG."""
    with Image.open(src_path) as img:
        rgb = img.convert("RGB")
        w, h = rgb.size
        left = int(round(w * ARTWORK_CROP_BOX[0]))
        top = int(round(h * ARTWORK_CROP_BOX[1]))
        right = int(round(w * ARTWORK_CROP_BOX[2]))
        bottom = int(round(h * ARTWORK_CROP_BOX[3]))
        cropped = rgb.crop((left, top, right, bottom))
        cropped.save(dst_path, format="JPEG", quality=95)
        return cropped.size


def verify_image(path: Path) -> bool:
    """Verify image exists, is non-empty, and can be decoded by Pillow."""
    if not path.exists() or path.stat().st_size == 0:
        return False
    try:
        with Image.open(path) as img:
            img.verify()
        return True
    except Exception:  # noqa: BLE001
        return False


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Download Team Rocket cards and crop artworks."
    )
    parser.add_argument(
        "--full-dir",
        type=Path,
        default=Path("raw_full_cards"),
        help="Output directory for full card images",
    )
    parser.add_argument(
        "--art-dir",
        type=Path,
        default=Path("raw_artworks"),
        help="Output directory for cropped artwork images",
    )
    parser.add_argument(
        "--manifest",
        type=Path,
        default=Path(__file__).resolve().parent / "team_rocket_cards.json",
        help="Fallback JSON manifest of cards",
    )
    parser.add_argument(
        "--url",
        default=SET_URL,
        help="pkmncards.com set URL to scrape",
    )
    parser.add_argument(
        "--set-suffix",
        default="",
        help="Optional set suffix appended to filenames (e.g. neo_genesis)",
    )
    parser.add_argument(
        "--skip-existing",
        action="store_true",
        help="Skip downloading files that already exist and pass verification",
    )
    args = parser.parse_args()

    args.full_dir.mkdir(parents=True, exist_ok=True)
    args.art_dir.mkdir(parents=True, exist_ok=True)

    cards = load_cards(args.url, args.manifest, DEFAULT_USER_AGENT)
    cards.sort(key=lambda c: int(c["number"]))

    used_names: set[str] = set()
    full_ok = 0
    art_ok = 0
    errors: list[str] = []

    for card in cards:
        num = int(card["number"])
        name = str(card["name"])
        url = str(card["imageUrl"])
        filename = build_unique_filename(num, name, used_names, args.set_suffix)

        full_path = args.full_dir / filename
        art_path = args.art_dir / filename

        try:
            if not (args.skip_existing and verify_image(full_path)):
                download_file(url, full_path, DEFAULT_USER_AGENT)
            if not verify_image(full_path):
                raise ValueError(f"Corrupt or empty full image: {full_path}")
            full_ok += 1

            crop_size = crop_artwork(full_path, art_path)
            if not verify_image(art_path):
                raise ValueError(f"Corrupt or empty cropped image: {art_path}")
            art_ok += 1
            print(f"[{num:02d}/{len(cards)}] {filename} -> crop {crop_size[0]}x{crop_size[1]}")
        except Exception as exc:  # noqa: BLE001
            msg = f"ERROR #{num:02d} ({name}): {exc}"
            print(msg, file=sys.stderr)
            errors.append(msg)

    print(
        f"\nSummary: {full_ok}/{len(cards)} full cards OK, "
        f"{art_ok}/{len(cards)} artworks OK, {len(errors)} errors."
    )
    return 1 if errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
