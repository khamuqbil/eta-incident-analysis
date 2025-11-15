#import "@preview/cmarker:0.1.6": cmarker

#set page(size: "A4", margin: 2cm)

= ETA Analysis Report

#cmarker.render(
  read("eta_source_of_truth_verification.md"),
  smart-punctuation: true,
  math: none,
  h1-level: 1,
)
