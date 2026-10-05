---
title: "OSEEC.004: Kirchhoff’s Laws: KVL and KCL"
status: published
wordpress_post_id: 18143
published: "2026-09-30T22:33:39"
live_url: "https://bitcoinversus.tech/2026/09/30/oseec-004-kirchhoffs-laws-kvl-kcl/"
series: "Open-Source Electrical Engineer Certification"
certification: OSEEC
lesson_number: 4
tier: 2
featured_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/09/oseec-004-cover-v2.jpg"
youtube: "https://www.youtube.com/watch?v=6F_rmZ1nXFQ"
---

# OSEEC.004: Kirchhoff’s Laws: KVL and KCL

**In simple terms:** Kirchhoff’s laws are two balancing checks. At a junction, current entering must equal current leaving: if 4 A arrives and one branch takes 1 A, the other takes 3 A. Around a simple closed DC loop, the voltage rises and drops must balance: a 12 V source and drops of 5 V and 7 V give +12 − 5 − 7 = 0. Remember: **KCL checks a junction; KVL checks a loop.**

**Definitions:** A **junction**, or node, is where circuit paths connect. A **branch** is one path between nodes. A **loop** is a path that returns to its starting point. **KCL** means Kirchhoff’s Current Law: current in equals current out. **KVL** means Kirchhoff’s Voltage Law: signed voltage changes around a loop add to zero. A **voltage rise** increases potential; a **voltage drop** decreases it along your chosen direction.

A control-circuit drawing shows several branches, but the numbers do not seem to agree. Before deciding which component is faulty, an engineer checks whether the proposed circuit behavior balances. Kirchhoff’s laws give you two checks: current at a junction and voltage around a loop.

OSEEC is the Open-Source Electrical Engineer Certification series. Lesson 004 builds on [Article 3: Series and Parallel Circuits](https://bitcoinversus.tech/2026/09/26/open-source-electrical-engineering-training-program-article-3-series-and-parallel-circuits/). Work through the examples on paper or in a circuit simulator.

## KCL: balance current at a junction

**Kirchhoff’s Current Law** says total current entering a junction equals total current leaving it. A junction is where circuit paths connect.

Imagine a steady DC supply feeding three parallel loads. Their branch currents are 0.5 A, 1.5 A, and 2.0 A. The source current is:

`I_source = 0.5 + 1.5 + 2.0 = 4.0 A`

Now suppose a simulated operating state shows the first two currents unchanged and the third branch at 0 A. The source current becomes 2.0 A. The arithmetic tells you which branch changed; it does not yet tell you why. A commanded-off load and an interrupted path are different explanations to investigate.

## KVL: balance voltage around a loop

**Kirchhoff’s Voltage Law** says signed voltage changes around a closed loop sum to zero. Choose a direction around the loop and keep the signs consistent.

Watch the voltage-law tutorial before working through the loop example below.

https://www.youtube.com/watch?v=6F_rmZ1nXFQ

*The Organic Chemistry Tutor — a worked introduction to Kirchhoff’s Voltage Law.*

For an ideal 24 V DC source and three series resistors with voltage drops of 6 V, 10 V, and 8 V, traverse the source from negative to positive, then the resistors in the current direction:

`+24 − 6 − 10 − 8 = 0 V`

The source is a rise; the resistor terms are drops. Returning to the starting point leaves no net potential change.

## Engineering habit: account for the whole path

Suppose your model of a 24 V loop accounts for only 5 V and 11 V across two loads. The remaining 8 V must be accounted for elsewhere in that loop, or your values and assumptions need review. Write down the full path instead of adding a guessed component failure.

When assigning an unknown current, choose an arrow direction. A negative solution means the actual current runs opposite to that arrow.

## Practice on paper

A junction receives 8 A. Two outgoing branches carry 3 A and 2 A. Find the third: **8 − 3 − 2 = 3 A**.

An ideal 12 V source feeds two series resistors. One drops 5 V. Find the other: **12 − 5 = 7 V**. Write the signed loop equation: **+12 − 5 − 7 = 0 V**.

For each problem, label the junction or trace the entire loop before calculating. Keep volts and amperes in separate equations.

## Key takeaway

KCL checks current at a junction. KVL checks voltage around a loop. Use both to turn a circuit drawing into equations you can verify.

Reference: [OpenStax University Physics: Kirchhoff’s Rules](https://openstax.org/books/university-physics-volume-2/pages/10-3-kirchhoffs-rules).
