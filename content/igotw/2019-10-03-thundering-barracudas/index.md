+++
title = "Thundering Barracudas"
date = "2019-10-03"
slug = "thundering-barracudas"
draft = false
+++

The people who write computer programs are typically not good at making those programs write sensible logs. I say this with great fondness for that set of folks, and in fact as someone who makes a living writing and understanding code I am among them. I could probably do an entire weekly blog about logs, but for now I’m just going to give some of the “flavor”.

I can remember a time in a previous life when I was oncall for a Thing and I would get phone calls in the middle of the night when that Thing broke.

Sometimes those phone calls would be from Dave.

I did not like getting phone calls from Dave.

Y’see, the Thing was a Java Thing, so when Dave called the information he had at hand was in the form of Java stack traces. If you’re reading this you are likely to have some familiarity with Java stack traces, but if you’re not: they are decidedly verbose. They are dozens - sometimes even hundreds - of lines long. To give a (brief) example, they look something like this:

Exception in thread "main" java.lang.NullPointerException at

com.example.myproject.Book.getTitle(Book.java:16) at

com.example.myproject.Author.getBookTitles(Author.java:25) at

com.example.myproject.Bootstrap.main(Bootstrap.java:14)

When I would answer the phone, Dave would commence to reading these stack traces in a very Dave monotone:

“Exception in thread quote main unquote java dot lang dot null pointer exception at com dot example dot…”

Lordy. Stack traces can be super-helpful - they’re designed to provide an abundance of information to someone who groks the code - but they’re definitely not meant to be spoken aloud (never-ever).

On the other end of the spectrum are brief log lines. The next couple of lines actually sparked the idea for this post:

2019-09-27 07:43:01 -0700 - lock engine: pthread robust mutexes

2019-09-27 07:43:01 -0700 - thunder lock: disabled (you can enable it with --thunder-lock)

First and foremost: Robust Mutex could be a band name and Thunder Lock could be their hit single. Or vice versa. Look, I know what a pthread is, and I know what a mutex is. I could probably hazard a guess at what it means to make a mutex “robust”, but...that second line. I’m gonna go out on a limb here and guesstimate that there are a half-dozen people in the world who know what a “thunder lock” is...and those half-dozen people probably don’t need to be reminded in the logs how to enable it.

However, as Metal at those log lines are, I think this lil fella takes the cake this week:

2019-09-30T15:50:41.558864Z 0 [Note] InnoDB: Highest supported file format is Barracuda.

Holy crap. I stumbled across this in a mysqld log file and frankly it made my head spin trying to think through precisely what a file format scale that went “from 1 to Barracuda” might look like. I mean, Barracuda is the “highest” (obvy), but...wow.

I’m fairly certain that if I posted the above somewhere on the Internet with sufficient eyeballs there would be at least one person who would respond with a bit of vitriol - that I don’t know what I’m talking about, that I should RTFM, that I should do some research before speaking up. And they would be “Internet Correct”; I’m absolutely ignorant here, and with a bit of effort I’m sure I could figure out what comes before Barracuda in the hierarchy of file formats. In fact, I still might do that for the sake of pure curiosity. ...but maybe there’s a lesson here in considering the kinds of things that get spritzed out into log files. Maybe we consider that there will be some poor bastard trying to make sense of them a year from now...or five...or ten. These logs provide technical information about technical shit and are therefore “technically dense” by necessity... but perhaps we can make an effort to make them approachable to Mere Mortals?
