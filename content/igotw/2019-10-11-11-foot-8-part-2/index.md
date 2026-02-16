+++
title = "11 Foot 8 (Part 2)"
date = "2019-10-11"
slug = "11-foot-8-part-2"
draft = false
+++

A while back I posted some thoughts based on the [11foot8 FAQ](http://11foot8.com/faq/)_. Today I thought I might swing back around to that. For those who didn’t read the original _ _post_, [11foot8.com](http://11foot8.com) is a website that posts footage of trucks wrecking into a low bridge in Durham, NC. Since I wrote that (April 2019) there have been 4 more posts on the site, for a total of 7 crashes tagged in 2019. This is actually trending low as compared to the previous few years - 2016 (15), 2017 (14), 2018 (12) - but I reckon we’ve got a couple of months left so we’ll see whether there’s a busy “holiday season”.

The majority of the remaining questions in the FAQ that I didn’t cover last time fall into 2 broad categories. The first category is around the signage/warning signals.

**Is the signage adequate?**

*The signage is good, and the vast majority of truck drivers notice the problem and avoid the bridge. Large signs alert driver to the low clearance* *several blocks before the bridge. Half a block before the trestle, a sensor detects overheight vehicles and triggers an LED blackout warning sign* *that was installed in May 2016. That same sensor also triggers a red-light phase at the traffic light directly in front of the trestle (installed in* *March 2016), so the driver has 50 seconds to read the warning sign next to the red traffic light and consider their next move.*

This is the rough equivalent of “do we have alerts in place”? Something that I really like about this is that it calls out how most truck drivers avoid the bridge. A crash once a month still seems “high”, but I’d love to see some statistics giving the ratios of wrecks to non-wrecks. There was a talk at SREcon19 Americas this year about [“How did things go right?”](https://www.usenix.org/conference/srecon19americas/presentation/kitchens), and this concept makes me think of that. Maybe I’ll expand on that a bit in a future post.

**Is the clearance signage accurate?**

*The clearance signage displays  a maximum safe clearance – and yes, in that sense it is accurate. The actual clearance of the crash beam right* *in front of the trestle is* [*11 feet 10.8 inches, which gives it a 2.8 inch safety margin. The* ](http://elevenfooteight.com/2012/11/the-actual-clearance-of-the-11foot8-bridge/)[*MUTCD*](http://mutcd.fhwa.dot.gov/HTM/2003r1/part2/part2c.htm#section2C22) *allows for a maximum of 3 inches difference* *between the signage and the actual clearance.*

Legit question...and it sounds like it is. In fact, the signage is advertising a height that is lower than the actual height of the bridge (within acceptable margins). This is something akin to asking whether the alerts have a high signal-to-noise ratio (not an exact parallel, but it’s close), or perhaps whether the alerts are measuring the right thing to begin with.

**Should there be more signage?**

It’s hard to see how more “low-clearance” signs will significantly improve the situation.

“Should we have more alerts?” Hmmm. Maybe, sometimes. But that’s definitely not always the right answer. In fact sometimes blindly adding more alerts can be [actively harmful](https://en.wikipedia.org/wiki/Alarm_fatigue).

**Metric, please!**

[*Would this situation be better if the signage were metric? Well … take a look at his website: 2m40.com (Warning: French. Metric)*](http://www.2m40.com/)

*For the convenience of our metric-only audience, here are the measurements we’re talking about in Meters:*

*11foot8 (11 feet 8 inches) = 3.556 meters* *11 feet 10.8 inches = 3.627 meters* *Safety margin: 7.1 cm (at the crest of the road)*

I have to admit that this one made me chuckle a bit. Maybe if the bridge were in Europe, sure. ...but it’s in Nawth Cackalacky, ‘Murrica. Most of the drivers likely know their respective truck’s dimensions in feet-and-inches (if they know them at all), and it’s not obvious to me that having to do an English-to- Metric conversion in their head at decision time   likely to improve anything. (Hell, they may not even know what a is[liter o’ cola](https://tenor.com/view/rod-farva-liter-cola-supertroopers-gif-11641320) is.)

I’d describe the second broad category of questions in the FAQ as “Why don’t they just…”?

**Could they install a low-clearance bar?**

*A low clearance bar is a bar suspended by chains ahead of the bridge. Overheight vehicles hit that bar first and the noise alerts the driver to to* *the problem. I understand that this approach has been successful in other places, but it’s not practical here. There are many overheight trucks* *that have to be able to drive right up to the bridge and turn onto Peabody St. in order to deliver supplies to several restaurants. Making Peabody* *St inaccessible from Gregson St would make the restaurant owners and the delivery drivers very unhappy.*

[This one is kind of at the intersection of the two categories. Why don’t they just have an alert for their alert as a backup to the alerts?](https://knowyourmeme.com/memes/xzibit-yo-dawg)

**Can’t the road be lowered?**

*That would be prohibitively expensive because a sewer main runs just a few feet below the road bed. That sewer main also dates back about a* *hundred years and, again, at the time there were no real standards for minimum clearance for railroad underpasses.*

Similarly:

**Can’t the bridge be raised?**

*Here, too, the question is who would want to pay the millions of dollars to raise the tracks a couple of feet? To accomplish this, the grade of the* *tracks would have to changed on both sides of the trestle, probably for several miles. That would require rebuilding all trestles in Durham. And* *NS would have to shut down this busy track for months. I don’t think they are interested in that idea.*

Ah, now we’re into some real meat here. Tech debt is typically characterized in terms of “cutting corners”, but sometimes it’s due to a collection of otherwise-sound decisions that either didn’t play nicely together or simply “didn’t age well”. Without vigilance these decisions can ossify over time and as a result can end up becoming prohibitively expensive to solve for. ([See also…)](/igotw/2019-07-26-c-for-k/)

...and finally:

**Are the drivers stupid?**

*No idea. They certainly seem distracted and the rental truck drivers are also probably inexperienced.*

Classic. One of the key benefits of [Blameless Culture](https://landing.google.com/sre/sre-book/chapters/postmortem-culture/#targetText=Blameless%20postmortems%20are%20a%20tenet%20of%20SRE%20culture.&targetText=If%20a%20culture%20of%20finger,where%20mistakes%20can%20be%20fatal.) is establishing an environment where people can Take Intelligent Risks without fear of finger-pointing (or worse, getting fired) when they inevitably make a mistake, but it’s not just about creating “a nice place to work”. Fundamentally, blame simply isn’t productive. It’s not actionable. “Why don’t they just…” what, exactly? Go back in time and make sure Jimmy Trucker isn’t a moron? Legislature that establishes driver infallibility as a prerequisite for licensure going forward? Nothing is going to prevent People from being People. Blameless Culture is a nod to that, and provides a more constructive approach to the problem space than shame.

***Bonus Material:*** *As with anything on the Internet that includes a Comments section, the comments on the FAQ are chock-full of “Why don’t they just…”,* *“These guys are idiots…”, and “*Clearly *<insert emphatic opinion here>…”, if you’re interested. Enjoy! :-D*
