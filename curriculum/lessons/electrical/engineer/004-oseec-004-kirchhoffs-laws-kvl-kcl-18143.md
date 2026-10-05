---
title: "OSEEC.004: Kirchhoff’s Laws: KVL and KCL"
wordpress_post_id: 18143
source: BitcoinVersus.tech
published: 2026-09-30T22:33:39
modified: 2026-09-30T23:28:10
live_url: https://bitcoinversus.tech/2026/09/30/oseec-004-kirchhoffs-laws-kvl-kcl/
track: electrical/engineer
lesson_number: 4
raw_source: 004-oseec-004-kirchhoffs-laws-kvl-kcl-18143.gutenberg.html
---

<!-- wp:group -->
<div class="wp-block-group"><!-- wp:paragraph -->
<p><strong>In simple terms:</strong> Kirchhoff’s laws are two balancing checks. At a junction, current entering must equal current leaving: if 4 A arrives and one branch takes 1 A, the other takes 3 A. Around a simple closed DC loop, the voltage rises and drops must balance: a 12 V source and drops of 5 V and 7 V give +12 − 5 − 7 = 0. Remember: <strong>KCL checks a junction; KVL checks a loop.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Definitions:</strong> A <strong>junction</strong>, or node, is where circuit paths connect. A <strong>branch</strong> is one path between nodes. A <strong>loop</strong> is a path that returns to its starting point. <strong>KCL</strong> means Kirchhoff’s Current Law: current in equals current out. <strong>KVL</strong> means Kirchhoff’s Voltage Law: signed voltage changes around a loop add to zero. A <strong>voltage rise</strong> increases potential; a <strong>voltage drop</strong> decreases it along your chosen direction.</p>
<!-- /wp:paragraph --></div>
<!-- /wp:group --><!-- wp:paragraph -->
<p>A control-circuit drawing shows several branches, but the numbers do not seem to agree. Before deciding which component is faulty, an engineer checks whether the proposed circuit behavior balances. Kirchhoff’s laws give you two checks: current at a junction and voltage around a loop.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>OSEEC is the Open-Source Electrical Engineer Certification series. Lesson 004 builds on <a href="https://bitcoinversus.tech/2026/09/26/open-source-electrical-engineering-training-program-article-3-series-and-parallel-circuits/">Article 3: Series and Parallel Circuits</a>. Work through the examples on paper or in a circuit simulator.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">KCL: balance current at a junction</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Kirchhoff’s Current Law</strong> says total current entering a junction equals total current leaving it. A junction is where circuit paths connect.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Imagine a steady DC supply feeding three parallel loads. Their branch currents are 0.5 A, 1.5 A, and 2.0 A. The source current is:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>I_source = 0.5 + 1.5 + 2.0 = 4.0 A</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Now suppose a simulated operating state shows the first two currents unchanged and the third branch at 0 A. The source current becomes 2.0 A. The arithmetic tells you which branch changed; it does not yet tell you why. A commanded-off load and an interrupted path are different explanations to investigate.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">KVL: balance voltage around a loop</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Kirchhoff’s Voltage Law</strong> says signed voltage changes around a closed loop sum to zero. Choose a direction around the loop and keep the signs consistent.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Watch the voltage-law tutorial before working through the loop example below.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=6F_rmZ1nXFQ","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=6F_rmZ1nXFQ
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>The Organic Chemistry Tutor — a worked introduction to Kirchhoff’s Voltage Law.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For an ideal 24 V DC source and three series resistors with voltage drops of 6 V, 10 V, and 8 V, traverse the source from negative to positive, then the resistors in the current direction:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>+24 − 6 − 10 − 8 = 0 V</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The source is a rise; the resistor terms are drops. Returning to the starting point leaves no net potential change.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Engineering habit: account for the whole path</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Suppose your model of a 24 V loop accounts for only 5 V and 11 V across two loads. The remaining 8 V must be accounted for elsewhere in that loop, or your values and assumptions need review. Write down the full path instead of adding a guessed component failure.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>When assigning an unknown current, choose an arrow direction. A negative solution means the actual current runs opposite to that arrow.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice on paper</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A junction receives 8 A. Two outgoing branches carry 3 A and 2 A. Find the third: <strong>8 − 3 − 2 = 3 A</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>An ideal 12 V source feeds two series resistors. One drops 5 V. Find the other: <strong>12 − 5 = 7 V</strong>. Write the signed loop equation: <strong>+12 − 5 − 7 = 0 V</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For each problem, label the junction or trace the entire loop before calculating. Keep volts and amperes in separate equations.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>KCL checks current at a junction. KVL checks voltage around a loop. Use both to turn a circuit drawing into equations you can verify.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Reference: <a href="https://openstax.org/books/university-physics-volume-2/pages/10-3-kirchhoffs-rules">OpenStax University Physics: Kirchhoff’s Rules</a>.</p>
<!-- /wp:paragraph -->