+++
title = "Naming Tsar"
date = "2021-05-20"
slug = "naming-tsar"
draft = false
+++

I could've sworn I did a post about this at some point in the past, but all I could find digging through the archives was a post on [Two Hard Things from a ](/igotw/2018-10-19-two-hard-things/) few years back (and it turns out that post was actually about the *other* Hard Thing).

So let's talk about Naming Things.

[Naming matters - it's important. ...but also, it doesn't, and it's not. (Fun semi-related side note here: Who remembers when the .prod gTLD was introduced](https://jira01.corp.linkedin.com:8443/browse/GCNA-14069) and broke anything that wasn't using an FQDN - which was, like, *everything* at the time? Ah, names. Good times.)

I don't have hard data, but I'd estimate roughly one gabillion hours of my life spent in, around, or adjacent to conversation about what things should be named, or what the "standard" for naming them should be.

It's exhausting.

Should there be an environment prefix like *prod-* so people know what environment the thing is in? Should the datacenter name be included in some way? All caps, or lower-case? Should we have an "ei" subdomain or should it be "stg" (for "staging")? What if we do that for a while and then start to call some of them 'int' - y'know, for giggles? Or should we encapsulate no useful information in the name at all? (This latter idea is one I've actually come to appreciate over time.)

If you've ever been in a host naming conversation Anywhere Ever the following scenario may resonate:

**Proposal:** If we have more than one of a Thing we'll just append monotonically-increasing integers to the end of the name of each incremental Thing.

**Everyone:** Coolcoolcool, makes sense. <gets up to leave>

**Someone:** Well, but should we prepend zeroes to the number? So, like, all the names are all the same length? Where do we stand on *that* critical issue, I ask you?

**Everyone:** <sits back down for the next rest of their lives>

Anyhow, an idea I've kicked around for solving this - at least locally - is to hire a "naming tsar". Fulltime salary, benefits, RSUs, the works...and exactly One Job: to have the final and binding 'D' on picking names for things. When you have to name something, you ask the tsar for a name. You can provide whatever relevant information you like, but it's not a "discussion" - you tell The Tsar what you need a name for, she picks it, you use it. End of story, no appeals.

It'll never-ever work, mostly because People are People. But it's interesting as a thought experiment, and I suspect it would actually save a lot of companies a lot of money.
