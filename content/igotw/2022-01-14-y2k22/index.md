+++
title = "Y2K22"
date = "2022-01-14"
slug = "y2k22"
draft = false
+++

It strikes me that we are likely hiring folks who are too young to remember the [Y2K Bug](https://en.wikipedia.org/wiki/Year_2000_problem) - who were still wee babbies in nappies when it was all over the news. For their benefit, I'd like to present a [similar bug](https://docs.microsoft.com/en-us/answers/questions/680467/exchange-scan-engine-failed-to-load-can39t-convert.html) (albeit with a much smaller scope and scale). The tl;dr: software attempting to convert a date formatted as YYMMDDHHMM into a 32-bit signed integer. (2201010000 > 2147483647)

For additional reading on integer overflows, take a peek at _inGraph of the Week - The Number(s) of the Beast._

[*Credit to Rachel "bythebay" Kroll for pointing this one out*](http://rachelbythebay.com/w/2022/01/01/baddate/)*. If you're not following her, you should be.*
