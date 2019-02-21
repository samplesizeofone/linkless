---
title: "Collatz Primes"
date: 2018-05-03T15:58:59-07:00
draft: false
---
## My conjecture

**The Collatz primes are infinitely periodic.**

A weaker conjecture is that the Collatz primes are periodic for an infinite number of xs, but not necessarily all xs.

## Periodic sequences

A sequence is periodic if we can find a starting point in the sequence so that all further elements form the sequence itself. For instance,

<pre class="math">1, 2, 3, 4, 1, 2, 3, 1, 2, 3...</pre>

is not periodic because the 4 never repeats. But

<pre class="math">1, 2, 3, 4, 1, 2, 3, 4...</pre>

is periodic because starting the second instance of 1, the following elements form the original sequence. That is

<pre class="math"> 1, 2, 3, 4, 1, 2, 3, 4, [1, 2, 3, 4, 1, 2, 3, 4]</pre>

goes to

<pre class="math">[1, 2, 3, 4, 1, 2, 3, 4]</pre>

## Infinitely periodic sequences

An infinitely periodic sequence is a sequence where, for any number x if you take the elements of the sequence less than x, the sequence is periodic.

For instance,

<pre class="math">1, 2, 3, 1, 2, 3, 1, 2, 3...</pre>

would be infinitely periodic since for those elements less than 2 we have 1, 1, 1... which repeats indefinitely. Like wise for elements less than 3:

<pre class="math">1, 2, 1, 2, 1, 2...</pre>

And elements less than 4:

<pre class="math">1, 2, 3, 1, 2, 3, 1, 2, 3...</pre>

Clearly, for larger values of x, we still have the original sequence.

The sequence

<pre class="math">1, 2, 3, 4, 1, 2, 3, 1, 2, 3</pre>

is periodic for x if x is 2, 3, or 4.

At x = 4, we have

<pre class="math">1, 2, 3, 1, 2, 3, 1, 2, 3...</pre>

because the 4 get's filtered out (4 isn't less than x).

But for x = 5, we have

<pre class="math">1, 2, 3, 4, 1, 2, 3, 1, 2, 3...</pre> which isn't periodic. So the sequence as a whole isn't infinitely periodic.

## Collatz chain
A Collatz chain for a number is the list of numbers you cycle through when testing the conjecture. So for instance, the Collatz chain for 10 is:

<pre class="math">10, 5, 16, 8, 4, 2, 1</pre>

per the Collatz conjectures transform of dividing even numbers by 2 otherwise taking 3x + 1.

## Collatz decision chain
Now let's add a new twist. We can convert the Collatz chain into a binary sequence by taking each element + 1 mod 2 (ignoring the last element in the chain, 1). That is, if an element is even it becomes 1 and if it's odd it becomes 0. So:

<pre class="math">10, 5, 16, 8, 4, 2, 1</pre>

becomes

<pre class="math"> 1, 0,  1, 1, 1, 1</pre>

## Collatz number

If we reverse the decision chain, we end up with:
<pre class="math">10, 5, 16, 8, 4, 2</pre>

becomes

<pre class="math"> 1, 0,  1, 1, 1, 1</pre>

reversed becomes

<pre class="math"> 1, 1,  1, 1, 0, 1</pre>

Interpreting this as binary digits, we get

<pre class="math"> 1, 1, 1, 1, 0, 1</pre>

becomes

<pre class="math">61</pre>

So now, for any given starting point, we can repeat the above process to get the Collatz number for any x.

Note that the sequence always ends in ..., 2, so the last number in a decision chain is always 1. This is convenient because we don't have to worry about dropping leading zeros when converting to a single number (61 above).

## Collatz difference numbers

For expository purposes, the first 10 Collatz numbers are

<pre class="math">0, 1, 122, 3, 30, 245, 63338, 7, 506710, 61</pre>

Let's take the gaps between consecutive elements to make a new sequence... the sequence of difference numbers:

<pre class="math">0   1     122      3    30     245       63338...</pre>
<pre class="math">  1   121     -119   27    215     63093      ...</pre>

So 1 - 0 = 1, 122 - 1 = 121, 3 - 122 = -119 etc.

## Collatz primes

Finally, let's consider all the elements of the Collatz difference numbers greater than 3 that are prime.

The first 11 elemenst are

<pre class="math">15773, 3943, 13, 31543, 53, 13, 23, 103, 13, 53, 4150522877</pre>

(Remember, we're filtering out non-primes and numbers less than or equal to 3.)

## Weak evidence

I've written some code using GMP to test my conjecture. So far, it passes for a moderate number of cases. For instance, 4,096 and 134,217,728 out to 10,000,000 elements with the modular part repeating at least 1,000 times.

Of course, this code can't prove or disprove the conjecture, so it's on to a formal mathematical analysis if I can pull it off.
