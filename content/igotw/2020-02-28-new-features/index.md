+++
title = "New Features!"
date = "2020-02-28"
slug = "new-features"
draft = false
+++

ICYMI Monitoring Infra sent a newsletter earlier this week. I’d recommend taking a peek at it if you haven’t already - don’t worry, I’ll wait - but I thought I’d mention a couple of the new features they announced here.

Consider the following inGraph:

[blocked URL](https://lh3.googleusercontent.com/t1NPfREviQFAudXuxmhgjCXMCpEj8iviHsCZPDmX1p1RQGHjjKzcvnLQXXgOJgcqqRDkJ0dNLxgU-i_Hav9J-ZQBPkXkarvJ3ALkM495LZ2HF-8ueQV7URh4kKKkkCIvgBK4zsDw)

Okay, so kafka partitions sizes marching onward up-and-to-the-right, pretty straightforward stuff. ...but what if you wanted to know the rate of growth? I suppose you could pick a couple of values at time t0 and t1 and then do a little arithmetic, but what if you wanted to see it? Well, that’s what derivatives are for. Enter: the DERIV operator:

[blocked URL](https://lh3.googleusercontent.com/VIXKT3P0LSqFTDfxDGQPTTgK36o8fkcpSA4n1CRts9FngbCeN8lqthNzt4aZpHri1o7wSWACOlWRGUknpw4RIFP0eH9dMGfrODOtSanKjYypZjGfPpxDX1lM3KyCfd8sclEB2dvc)

Nifty! If you want to play with these a bit take a peek at [this snapshot, and while you’re at it I want you to try something. As you’re mousing over one graph ](https://ingraphs.prod.linkedin.com/snapshot/derivative-example_20200228_153025/) or the other, try holding down the shift key and see what happens. It’s subtle (and you’ll only see what I’m talking about if the page has more than one

![](images/img-001.png)

inGraph on it) but I think you’ll be pleasantly surprised. I know I was.
