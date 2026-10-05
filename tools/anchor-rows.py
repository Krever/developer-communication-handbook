#!/usr/bin/env python3
"""Give every Understand/Adjust row a permanent id, so readers can link to one.

Ids are written into index.qmd and never recomputed: once a row has one it keeps
it through rewording, reordering, even a section rename. That is the whole point
— a link someone shared has to keep working. A new row gets one more than the
highest number its section has ever used, so numbers are never reused and, after
the first run, a row's number reflects when it was added rather than where it
sits. The section prefix is cosmetic: it mimics the heading slug so a shared URL
reads sensibly, but nothing keeps the two in sync.

Never hand-edit or renumber an existing id — published links depend on it.

Usage:  tools/anchor-rows.py [--check] [files...]   (default: index.qmd)
"""
import re
import sys

HEADING = re.compile(r"^#{2,4}\s+(.*)$")
# Highest number already handed out per prefix, so a rerun never collides.
EXISTING = re.compile(r'^\s*<tr id="([a-z0-9-]+)-r(\d+)">\s*$', re.M)


def slug(text: str) -> str:
    return re.sub(r"\s+", "-", re.sub(r"[^a-z0-9\s-]", "", text.lower())).strip("-")


def process(src: str) -> tuple[str, int]:
    used: dict[str, int] = {}
    for prefix, num in EXISTING.findall(src):
        used[prefix] = max(used.get(prefix, 0), int(num))

    out, section, inside, added = [], None, False, 0
    for line in src.split("\n"):
        heading = HEADING.match(line)
        stripped = line.strip()
        if heading:
            section = slug(heading.group(1))
        elif not inside and stripped == "```{=html}":
            inside = True
        elif inside and stripped == "```":
            inside = False
        elif inside and stripped == "<tr>":
            # <tr> alone on a line is a body row; the header row carries <th>
            if section is None:
                raise SystemExit("row found before any heading; cannot name it")
            used[section] = n = used.get(section, 0) + 1
            out.append(line.replace("<tr>", f'<tr id="{section}-r{n}">'))
            added += 1
            continue
        out.append(line)
    return "\n".join(out), added


def main() -> int:
    check = "--check" in sys.argv
    paths = [a for a in sys.argv[1:] if a != "--check"] or ["index.qmd"]
    failed = False
    for path in paths:
        with open(path, encoding="utf-8") as fh:
            src = fh.read()
        new, added = process(src)
        if not added:
            continue
        if check:
            print(f"{path}: {added} row(s) without an id")
            failed = True
        else:
            with open(path, "w", encoding="utf-8") as fh:
                fh.write(new)
            print(f"{path}: {added} row id(s) added")
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
