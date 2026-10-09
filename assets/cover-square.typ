// Square audiobook cover — 3000x3000px (compile at --ppi 144: 1.25pt -> 2px).
// Audiobook stores want a square image of at least 2400x2400; 3000 leaves room.
// Same design language as cover.typ, re-laid out for 1:1.
// Run from repo root:
// quarto typst compile assets/cover-square.typ assets/cover-square.png --ppi 144 --font-path assets/fonts
#set page(width: 1500pt, height: 1500pt, margin: 0pt, fill: rgb("#fbf9f4"))

#let rust = rgb("#a8502e")
#let slate = rgb("#3f5e8c")
#let ink = rgb("#23262b")
#let muted = rgb("#555b64")

// Faint chat-transcript, as on the portrait cover: alternating left (slate,
// understand) and right (rust, adjust) bubbles, kept in the empty band between
// the subtitle and the author so it never crosses text.
#let widths = (425pt, 337.5pt, 512.5pt, 300pt)
#for (i, w) in widths.enumerate() {
  let y = 940pt + i * 65pt
  if calc.even(i) {
    place(top + left, dx: 165pt, dy: y,
      rect(width: w, height: 32.5pt, radius: 16.25pt, fill: slate.transparentize(91%)))
  } else {
    place(top + left, dx: 1335pt - w, dy: y,
      rect(width: w, height: 32.5pt, radius: 16.25pt, fill: rust.transparentize(91%)))
  }
}

// Double frame.
#place(top + left, dx: 70pt, dy: 70pt,
  rect(width: 1360pt, height: 1360pt, stroke: 2.5pt + rust))
#place(top + left, dx: 90pt, dy: 90pt,
  rect(width: 1320pt, height: 1320pt, stroke: 0.9375pt + rust.transparentize(45%)))

// Series line.
#place(top + left, dx: 165pt, dy: 185pt,
  text(font: "IBM Plex Sans", size: 35pt, weight: 600, tracking: 7.5pt, fill: muted)[THE])

// Title.
#place(top + left, dx: 157.5pt, dy: 250pt,
  block(width: 1225pt)[
    #set par(leading: 20pt)
    #text(font: "Fraunces", size: 130pt, weight: 600, fill: ink)[Developer\ Communication\ Handbook]
  ])

// Accent rule.
#place(top + left, dx: 167.5pt, dy: 685pt,
  line(length: 300pt, stroke: 5pt + rust))

// Subtitle.
#place(top + left, dx: 165pt, dy: 745pt,
  block(width: 1075pt)[
    #set par(leading: 15pt)
    #text(font: "Newsreader", size: 47.5pt, style: "italic", fill: muted)[From code review comments to handing in your notice]
  ])

// Author.
#place(bottom + left, dx: 165pt, dy: -177.5pt,
  text(font: "IBM Plex Sans", size: 45pt, tracking: 2.5pt, weight: 600, fill: ink)[Voytek Pitula])
