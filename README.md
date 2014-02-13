BraSizeAdjuster
===============

At True and Co, we have to adjust the bra size of a lot of our customers. There are quite a few rules that apply when
doing so, but here is a basic list of these rules.

* If the band size goes up, then the cup size goes down.
* If the band size goes down, then the cup size goes up.
* If the cup size needs to go up or down, it does not affect the band size.

For the purpose of this exercise, we will limit the cup/band sizes to the following:

Cup Sizes:
A, B, C, D, DD, DDD, E, F

Band Sizes:
32-40

There is one edge case here. A "DDD" cup is technically the same as an "E". We prefer the "E" size. So be sure to cover
this case in your code.

I've given you the first failing test case. The rest are currently pending. After you get the first test case, move on
to the next until all tests are passing.

=======================
Clarification from Levi
=======================

Great question. So, we often will have manufacturers give us sizes as "DDD", so when we adjust bra sizes, we need to
treat the "DDD" as an "E". The specs are in there to check that if the bra size adjuster gets a "DDD" it treats it as
a "E".

================
Jimmy's Strategy
================

I added additional tests to make sure 'DDD' cup size maps to 'E', since preference of 'E' over 'DDD' had been expressed
by the initial requirements.

