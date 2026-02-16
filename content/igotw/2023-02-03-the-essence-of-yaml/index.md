+++
title = "The Essence of YAML"
date = "2023-02-03"
slug = "the-essence-of-yaml"
draft = false
+++

[A coupla-few weeks ago ](https://ruudvanasseldonk.com/2023/01/11/the-yaml-document-from-hell)[*The yaml document from hell*](https://ruudvanasseldonk.com/2023/01/11/the-yaml-document-from-hell) popped up [on lobste.rs (and subsequently surfaced in ](https://lobste.rs/s/nsymer/yaml_document_from_hell)[#sre](https://linkedin-randd.slack.com/archives/C0881KF9P/p1673545008907179)), outlining some of the footguns of YAML. At first read I suppose one might say "Man, YAML is really terrible, no one should ever use this" - or, at the very least, "[Wat." (The bit about ](https://www.destroyallsoftware.com/talks/wat)[sexages](https://ruudvanasseldonk.com/2023/01/11/the-yaml-document-from-hell#sexagesimal-numbers) [imal is where my head started to hurt.) ...but for me, it reminded me of nothing so much as one of my favorite quotes; from the 2003 paper ](https://ruudvanasseldonk.com/2023/01/11/the-yaml-document-from-hell#sexagesimal-numbers)[*The Essence of* ](https://courses.cs.washington.edu/courses/cse544/04sp/papers/xml-essence.pdf) [*XML*](https://courses.cs.washington.edu/courses/cse544/04sp/papers/xml-essence.pdf): "...the essence of XML is this: the problem it solves is not hard, and it does not solve the problem well."

So folks have been griping about config file formats for *at least* 20 years (and I'd wager if I dug a bit I could find even earlier prior art).

*About. Config. File. Formats.*

A younger version of me would've been tempted to "Why don't they just..." on this one. "Why doesn't everyone just use JSON/TOML/[insert format here]?" Or "If everyone just quoted all their strings then none of this would even be a problem." (*Narrator: "Except for all the other things that would still be a* *problem*.") Or perhaps I'd get it in my head to blow a weekend coming up with [The One Config Format to Rule Them All, and In the Darkness Bind Them.](https://xkcd.com/927/)

An older, wiser (which is to say: more tired) me is more inclined to say "Who gives a fuck?" Not in a nihilistic way, more in the "get a grip" sense. Pick one, understand the ways in which it sucks (they all will in one way or another), and move on with life.

*Semi-related side note:* [*I feel like spf13/viper's approach to config file format*](https://github.com/spf13/viper#reading-config-files) *is sort of a nod to this, and one that I can appreciate; to wit: Pick whichever of* *these N formats you like, it's all the same shit.*
