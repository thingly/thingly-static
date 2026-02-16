+++
title = "On Glue"
date = "2023-09-01"
slug = "on-glue"
draft = false
+++

[A couple of years ago I read an O'Reilly Radar (no, not that one) article entitled "](https://en.wikipedia.org/wiki/Gary_Burghoff)[Thinking About Glue](https://www.oreilly.com/radar/thinking-about-glue/)" (no, not _that kind_). It made me think of something I heard once along the lines of "All the code that needs to be written has already been written", with the implication being that all the "interesting" bits have already been solved and now it's simply a matter of composing/wiring them together. This has merit as an interesting idea/thought experiment, but as with all sweeping generalizations is almost certainly provably false.

What struck me most in this write-up was the idea that glue code grows in the square of the things needing to be glued. For me, this was in the category of revelatory statements that - once known - seem completely obvious. "Huh. I think I would've come to that same conclusion if I would've thought about it for more than a minute" sort o' fing.

Taking a toy example: suppose you have 3 data formats (A, B, C) and you need to be able to convert from any one of them to any other. This set looks like: AB, AC, BA, BC, CA, CB . In mathematical terms, this is a pretty straightforward permutation without replacement *n choose 2*, which simplifies to *n(n-* *1)*, which is in *O(n )**2*. Not exactly a formal proof, and for discrete problems in the Real World this modeling may break down...but it certainly "feels" about right.

I also like the author's conclusion that "Glue isn’t some kind of computational waste; it’s what holds our systems together. Glue development is software development." [Jonathan Coulton might hold a different opinion, but I happen to agree with this sentiment.](https://www.youtube.com/watch?v=AEBld6I_AKs)
