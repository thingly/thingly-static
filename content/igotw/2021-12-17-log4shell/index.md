+++
title = "log4shell"
date = "2021-12-17"
slug = "log4shell"
draft = false
+++

Welp...it's been some kinda week, hasn't it?

[Unless you've been living under a rock you've probably at least heard about the Log4Shell](https://en.wikipedia.org/wiki/Log4Shell) vulnerability by now...and as vulns go, this one's a doozy.

Prior to this week, this is the shortlist of the most critical vulnerabilities I might have expected out of a logging library:

logs nothing (null attack) logs too much (possible (D)DOS attack) logs ASCII-art pictures of dicks, exclusively (PUNKT attack) some combination of the above - like, ERRORs log nothing but INFOs log pictures of dicks, exclusively (perhaps we could call this one "Kutcher- DOS")

[As it turns out this one is an RCE](https://en.wikipedia.org/wiki/Arbitrary_code_execution) vulnerability.

I reckon I have Many Thoughts on this, but first and foremost might be: How on Earth does a logging library introduce an RCE exploit?

This is the world we live in...but man, how did we get here? As an Industry, I mean.

Wild.

Maybe in some near future I'll write some more thoughts on this, but right now m'noodle is baked.

![](images/img-001.png)

Happy Friday, Folks.
