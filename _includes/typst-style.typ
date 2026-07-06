// Understand/Adjust table identity for the PDF, mirroring theme.scss:
// slate for the Understand column, rust for Adjust, faint column washes,
// hairline row separators, sans-serif column headers.
#let slate = rgb("#3f5e8c")
#let rust = rgb("#a8502e")

#set table(
  inset: (x: 10pt, y: 8pt),
  fill: (x, y) => if y == 0 { none } else if x == 0 { rgb("#3f5e8c0c") } else { rgb("#a8502e0c") },
  stroke: (x, y) => if y == 0 {
    (bottom: 1pt + (if x == 0 { slate } else { rust }).transparentize(55%))
  } else {
    (bottom: 0.4pt + rgb("#23262b1a"))
  },
)
#show table.cell.where(y: 0): set text(font: "IBM Plex Sans", size: 8pt, weight: 600, tracking: 1.1pt)
#show table.cell.where(y: 0, x: 0): set text(fill: slate)
#show table.cell.where(y: 0, x: 1): set text(fill: rust)
#show table.cell.where(y: 0): it => upper(it)
