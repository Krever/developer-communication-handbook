// Audiobook / ebook cover — 1200x1800px (compile at --ppi 72: 1pt -> 1px).
// Run from repo root:
// quarto typst compile assets/cover.typ assets/cover.png --ppi 72 --font-path assets/fonts
// Uses the brand fonts from assets/fonts (Fraunces, Newsreader, IBM Plex Sans).
#set page(width: 1200pt, height: 1800pt, margin: 0pt, fill: rgb("#fbf9f4"))

#let rust = rgb("#a8502e")
#let slate = rgb("#3f5e8c")
#let ink = rgb("#23262b")
#let muted = rgb("#555b64")

// Faint chat-transcript: alternating left (slate) and right (rust) bubbles —
// the book's two moves, understand (listen) and adjust (speak). Kept to the
// empty band between the subtitle and the author so it never crosses text.
#let widths = (380pt, 300pt, 460pt, 260pt, 400pt, 330pt, 280pt, 440pt)
#for (i, w) in widths.enumerate() {
  let y = 990pt + i * 60pt
  if calc.even(i) {
    place(top + left, dx: 132pt, dy: y,
      rect(width: w, height: 30pt, radius: 15pt, fill: slate.transparentize(91%)))
  } else {
    place(top + left, dx: 1068pt - w, dy: y,
      rect(width: w, height: 30pt, radius: 15pt, fill: rust.transparentize(91%)))
  }
}

// Double frame.
#place(top + left, dx: 56pt, dy: 56pt,
  rect(width: 1088pt, height: 1688pt, stroke: 2pt + rust))
#place(top + left, dx: 72pt, dy: 72pt,
  rect(width: 1056pt, height: 1656pt, stroke: 0.75pt + rust.transparentize(45%)))

// Series line.
#place(top + left, dx: 132pt, dy: 190pt,
  text(font: "IBM Plex Sans", size: 30pt, weight: 600, tracking: 6pt, fill: muted)[THE])

// Title.
#place(top + left, dx: 126pt, dy: 250pt,
  block(width: 980pt)[
    #set par(leading: 20pt)
    #text(font: "Fraunces", size: 116pt, weight: 600, fill: ink)[Developer\ Communication\ Handbook]
  ])

// Accent rule.
#place(top + left, dx: 134pt, dy: 760pt,
  line(length: 260pt, stroke: 4pt + rust))

// Subtitle.
#place(top + left, dx: 132pt, dy: 812pt,
  block(width: 860pt)[
    #set par(leading: 14pt)
    #text(font: "Newsreader", size: 44pt, style: "italic", fill: muted)[From code review comments to handing in your notice]
  ])

// Author.
#place(bottom + left, dx: 132pt, dy: -268pt,
  text(font: "IBM Plex Sans", size: 40pt, tracking: 2pt, weight: 600, fill: ink)[Voytek Pitula])
