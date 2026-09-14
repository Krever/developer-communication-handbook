#!/usr/bin/env python3
"""Curl the quotes inside ```{=html} fences.

Quarto's smart-quote conversion doesn't reach inside a raw-HTML fence, so a
straight ' or " typed in a table cell renders straight while the markdown around
it renders curly. This rewrites them, touching only text that the reader sees:
HTML tags (and therefore attribute values) and <code> spans are left alone.

Usage:  tools/smarten-html-quotes.py [--check] [files...]   (default: index.qmd)
"""
import re
import sys

FENCE = re.compile(r"^```\{=html\}\s*$")
CLOSE = re.compile(r"^```\s*$")
# tags, <code> spans and HTML entities are opaque; everything else is prose
OPAQUE = re.compile(r"<code>.*?</code>|<[^>]*>|&[a-zA-Z#0-9]+;", re.S)


def curl(text: str) -> str:
    # possessives and contractions: letter ' letter, or letter ' at a word end
    text = re.sub(r"(?<=[A-Za-z])'(?=[A-Za-z])", "’", text)
    text = re.sub(r"(?<=[A-Za-z])'(?![A-Za-z])", "’", text)
    # paired double quotes, left to right
    out, open_q = [], True
    for ch in text:
        if ch == '"':
            out.append("“" if open_q else "”")
            open_q = not open_q
        else:
            out.append(ch)
    return "".join(out)


def convert_block(block: str) -> str:
    parts, last = [], 0
    for m in OPAQUE.finditer(block):
        parts.append(curl(block[last:m.start()]))
        parts.append(m.group(0))
        last = m.end()
    parts.append(curl(block[last:]))
    return "".join(parts)


def process(src: str) -> str:
    lines, out, buf, inside = src.split("\n"), [], [], False
    for line in lines:
        if not inside and FENCE.match(line):
            inside, buf = True, []
            out.append(line)
        elif inside and CLOSE.match(line):
            out.append(convert_block("\n".join(buf)))
            out.append(line)
            inside = False
        elif inside:
            buf.append(line)
        else:
            out.append(line)
    if inside:  # unterminated fence: leave it untouched
        out.extend(buf)
    return "\n".join(out)


def main() -> int:
    args = [a for a in sys.argv[1:] if a != "--check"]
    check = "--check" in sys.argv
    failed = False
    for path in args or ["index.qmd"]:
        with open(path, encoding="utf-8") as fh:
            src = fh.read()
        new = process(src)
        if new == src:
            continue
        if check:
            print(f"{path}: straight quotes inside {{=html}} fences")
            failed = True
        else:
            with open(path, "w", encoding="utf-8") as fh:
                fh.write(new)
            print(f"{path}: quotes curled")
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
