+++
title = "Poka-yoke"
date = "2021-11-19"
slug = "poka-yoke"
draft = false
+++

[TWIL: poka-yoke](https://en.wikipedia.org/wiki/Poka-yoke) - a Japanese term for "mistake-proofing". I've been thinking about it quite a bit. One example is a car that won't let you shift out of Park [(or perhaps won't even let you even start it) without the brake pedal being depressed. Seth Godin calls out microwaves, which won't turn on unless the ](https://seths.blog/2021/11/in-search-of-poka-yokes/) door is closed. Similarly, the lever on my toaster won't engage unless it's plugged in; this one is less about safety, and more about not giving you the false sense that your bread is going to be toasted unless the toaster is actually capable of toasting the toast. (Side note: I'm actually *really* curious how this mechanism works, and only the [Flobots have kept me from finding out. From ](https://www.flobots.com/)[Handlebars](https://www.youtube.com/watch?v=HLUX0y4EptA): "I can take apart a remote control, and I can *almost* put it back together.")

I've *also* been thinking about how it's pronounced "PO-kuh yo-KAY" but I kinda prefer something more like "polka-yolk". I suppose that's just the American in me.

But mostly, I've been thinking about how this concept applies to the kinds of systems we build and the guard rails we put in place.

Linting and unit tests and PCX and canaries and EKG analysis. "*Are you sure?*" prompts and ACLOVERRIDEs and [--i-am-a-dummy flags. Pushing to the ](https://dev.mysql.com/doc/refman/8.0/en/mysql-command-options.html#option_mysql_safe-updates) left a bit more, yellow- and red-squigglies in the IDE.

...and yet...shit still breaks. The site still goes down. There isn't an IDE "red squiggly" hook for "this change is likely to quadruple your fanout and bring your downstreams to their knees." As Godin notes: "...there’s nothing at all keeping you from putting a big bowl of silverware and a can of spray paint in the microwave..."

We've collectively applied quite a bit of *yoke* to our *poka*, so to speak...*is it enough*?

Probably not.

Will it ever be?
