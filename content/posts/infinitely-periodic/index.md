---
title: "Infinitely Periodic"
date: 2018-05-20T07:01:36-07:00
---

## Periodic sequences
Let's start be defining a periodic sequence (modular sequence might also be a good name).

A **periodic sequence** is any sequence that repeats, much like the fractional part of a rational number.

So **1, 2, 3, 1, 2, 3, 1, 2 ,3...** is periodic. This can be seen clearly if we separate the numbers into the smallest repeating blocks, like **123 123 123...**.

For an example of a non-periodic sequence, consider: **1, 2, 3, 4, 1, 2, 3, 1, 2, 3...**. If we break that down into it's repeating components we have: **1234 123 123...**. Part of the sequence repeats (123 123 123...), but the sequence as a whole doesn't repeat, because the 4 only occurs in the first run of numbers.

## Threshold periodic sequences
A threshold periodic sequence is any sequence that is periodic if you ignore elements greater than some upper bound.

Referring to the non-periodic sequence above, **1, 2, 3, 4, 1, 2, 3, 1, 2, 3...**, if we set an upper bound of 3 we get **1, 2, 3, 1, 2, 3, 1, 2, 3** which we know is repeating from above.

But of course, if we set the threshold higher, it becomes non-periodic again.

## Infinitely periodic sequences
If a sequence is threshold periodic for ANY upper bound, we say it is infinitely periodic. That is, for any upper bound you give me, the sequence is threshold periodic, no matter how big the upper bound is.

One example of an infinitly periodic sequence is the number of factors of 2 in each positive integer

It looks like: **0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0**

To make it a little clearer let's look at it as a graph:

It doesn't necessarily seem periodic, but let's see what happens if we start the upper bound at 0 and keep increasing it:

{{< post-image "graph1.png" small "Upperbound of 0">}}

{{< post-image "graph2.png" small "Upperbound of 1" >}}

{{< post-image "graph3.png" small "Upperbound of 2">}}

{{< post-image "graph3.png" small "Upperbound of 3">}}

As you can see, the graphs strongly suggest that this sequence is threshold periodic up to 4. Let's look at an upper bound af 8:

{{< post-image "graph8.png" small "Upperbound of 8">}}

It still looks like it repeats, but I'll leave the proof that it repeats for any upper bound as an exercise for the reader.

In any event, our sequence is infinitely modular.

