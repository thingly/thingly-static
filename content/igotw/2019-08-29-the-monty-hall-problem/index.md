+++
title = "The Monty Hall Problem"
date = "2019-08-29"
slug = "the-monty-hall-problem"
draft = false
+++

[About once every year or two I serendipitously stumble across the Monty Hall Problem, stated thus:](https://www.montyhallproblem.com/)

A game show host presents you with three doors. Behind one of those doors is a brand new car. Behind the other two doors are goats. The host asks you to select a door. After you’ve made your selection, the host opens one of the other two doors to reveal a goat. The host then asks you whether you want to keep the door you originally chose or whether you would like to switch to the other unopened door.

The solution is counter-intuitive, and every time I stumble across this problem I have to re-convince myself of its correctness.

***Spoiler Alert:*** *You should always switch doors!*

But...there are only 2 doors...so...it’s 50-50, right?

Not quite. In fact, statistically-speaking you are twice as likely to get a car by switching doors () rather than sticking with your original selection ().

One of the ways that I typically try and restore my understanding is to write a little program that simulates placing a car at random and then increments a counter based on the decision to either switch or stay, say, a million times. This can be done in a handful of lines of code and helps build confidence, but it’ s "just" empirical evidence...

So then of course I end up on [Wikipedia. In addition to having some interesting tidbits about the history of the problem, there are logic tables and some ](https://en.wikipedia.org/wiki/Monty_Hall_problem) alternative ways of thinking that are really helpful. One novel (to me) way of thinking about it that really helped me this time around is the following: [Imagine that instead of three doors it’s a million. After selecting your door the host opens 999,998 of the remaining doors (that’s a lotta goats). You’ve got ](https://www.youtube.com/watch?v=A732Cuuo2tI&feature=youtu.be&t=6) [to ask yourself one question](https://www.youtube.com/watch?v=A732Cuuo2tI&feature=youtu.be&t=6): What are the odds that you, gentle reader, selected the door with the car behind it on the first try? Bingo - exactly one in a million. ...and what are the odds that you’ve picked a goat? Yep. 999,999 in a million. Now if I were a gamblin’ man (and I am) I reckon I’d take the odds on

![](images/img-001.png)

switching.
