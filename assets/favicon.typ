// Favicon — rust square with a paper-coloured serif "C" (matches the book's
// palette and heading font). Sibling to the Fintech Engineering Handbook mark,
// so the two read as a set while each keeps its own brand colour.
// Run from repo root:
// quarto typst compile assets/favicon.typ assets/favicon.png --ppi 72 --font-path assets/fonts   -> 512x512 px
#set page(width: 512pt, height: 512pt, margin: 0pt, fill: rgb("#a8502e"))
#place(center + horizon, dy: 12pt,
  text(font: "Fraunces", size: 360pt, fill: rgb("#fbf9f4"))[C])
