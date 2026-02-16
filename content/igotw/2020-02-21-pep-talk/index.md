+++
title = "Pep Talk"
date = "2020-02-21"
slug = "pep-talk"
draft = false
+++

[A while back I noticed flake8 spitting out warnings about W504](https://www.flake8rules.com/rules/W504.html) while building a multiproduct:

*Line breaks should occur before the binary operator to keep all operators aligned.*

I found the offending lines, PEP-ified them accordingly - one small contribution to hygiene, a minor reduction in [kipple](/igotw/2020-01-17-on-kipple/) - and I kicked off another build.

**BUILD FAILED**

Oops. I must’ve messed something up - a stray character, or maybe I didn’t quite get the whitespace right. Taking a look at the build output indicated that I was now running afoul of [W503:](https://www.flake8rules.com/rules/W503.html)

*Line breaks should occur after the binary operator to keep all variable names aligned.*

Wait...but...isn’t that...isn’t that *precisely the opposite* of the thing I just “fixed”? [I did a little research and as it turns out: yep, it sure is](https://github.com/python/peps/commit/c59c4376ad233a62ca4b3a6060c81368bd21e85b).

[So, what now? Call up Knuth and give him a piece of my mind? Close up my MBP, drop it in the trash on the way out the door, and go find a gig as far ](https://en.wikipedia.org/wiki/Donald_Knuth) away from tech as possible?

I took a walk. I took some deep breaths. I reflected on the [unfathomable vastness of the Universe](https://www.goodreads.com/quotes/9435846-in-front-of-the-unfathomable-vastness-of-the-universe-we).

When I got back to my keyboard, I reverted the change, added W504 to the flake8 ignore list, and moved on with my life. I reckon sometimes that’s all we can do.
