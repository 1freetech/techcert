---
title: "Energy: What Is Power Factor? Why kW, kVA, and kVAR Are Different"
wordpress_post_id: 21382
source: BitcoinVersus.tech
published: 2026-10-06T18:49:02
modified: 2026-10-06T18:49:02
live_url: https://bitcoinversus.tech/2026/10/06/energy-what-is-power-factor-kw-kva-kvar/
track: electrical/training
lesson_number: null
raw_source: energy-what-is-power-factor-kw-kva-kvar-21382.gutenberg.html
---

<!-- wp:paragraph -->
<p><strong>Power factor is one of those electrical terms that sounds complicated until you separate three ideas: real power, reactive power, and apparent power. Once those are clear, the difference between kW, kVA, and kVAR becomes much easier to understand.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The short version is this: <strong>kW is the power doing useful work, kVAR is power moving back and forth to support electric and magnetic fields, and kVA is the total electrical capacity the system has to carry.</strong> Power factor tells you how much of that apparent power is becoming useful real power.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Power Factor Is A Ratio</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Power factor is commonly written as:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Power Factor = Real Power ÷ Apparent Power
PF = kW ÷ kVA</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If a facility is using 100 kW of real power while drawing 125 kVA of apparent power, its power factor is 0.80. If the same 100 kW load only requires about 105.3 kVA, the power factor is about 0.95. <a href="https://www.fluke.com/en-us/learn/blog/power-quality/power-factor-formula">Fluke defines power factor</a> as the ratio of working power in kW to apparent power in kVA.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">kW Is The Power Doing Useful Work</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Real power is measured in watts or kilowatts. This is the portion of electrical power that actually becomes useful output such as heat, light, mechanical motion, or computation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A heater turns real power into heat. A motor converts part of it into mechanical work. A server converts electrical power into computation and heat. When people casually say a site is using 10 MW, they are usually talking about real power.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">kVAR Is Reactive Power</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Reactive power is measured in kilovolt-amperes reactive, or kVAR. It does not represent useful output in the same way kW does, but it is still necessary for many AC loads.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Motors, transformers, inductors, and similar equipment need magnetic fields to operate. Energy moves into those fields and then returns toward the source as the AC waveform changes direction. That back-and-forth exchange creates reactive power.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">kVA Is The Total Electrical Load The Equipment Must Carry</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Apparent power is measured in kVA. It represents the combined effect of real and reactive power from the perspective of cables, transformers, generators, UPS systems, and switchgear.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That is why a transformer may be rated in kVA instead of kW. The transformer has to carry current whether that current is supporting useful real power or reactive power. Equipment sizing therefore has to account for apparent power, not only the useful portion.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=NIrKOVZrqnU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=NIrKOVZrqnU
</div><figcaption class="wp-element-caption"><em>The Engineering Mindset explains real power, reactive power, apparent power, power factor, and common correction methods.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Power Triangle Connects All Three</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Real power, reactive power, and apparent power can be represented as a right triangle. Real power is one side, reactive power is the other side, and apparent power is the hypotenuse.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>kVA² = kW² + kVAR²</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The closer kVAR gets to zero for a given real load, the closer kVA gets to kW and the closer power factor gets to 1.0. A power factor of 1.0 is often called unity power factor.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Low Power Factor Means More Current For The Same Useful Power</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This is the practical reason power factor matters. In a three-phase system, real power can be approximated by:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>P = √3 × V × I × PF</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For the same voltage and the same real power, a lower power factor requires more current. A 100 kW three-phase load at 480 V and 0.80 power factor draws about 150 A. Improve the power factor to 0.95 and the same 100 kW load needs only about 127 A.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Higher current means more conductor loading, more voltage drop, and greater resistive losses. That is why power factor becomes a facility-level issue instead of merely an accounting term.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Inductive Loads Usually Create Lagging Power Factor</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Many industrial loads are inductive. Motors and transformers create magnetic fields, so current can lag behind voltage. This is called lagging power factor.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Capacitive loads behave in the opposite direction: current can lead voltage. Understanding that relationship is easier after learning the basic three-phase system covered in our <a href="https://bitcoinversus.tech/2026/10/02/oseec-008-three-phase-power-fundamentals/">Three-Phase Power Fundamentals guide</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Power Factor Correction Usually Uses Capacitors</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>One common way to improve lagging power factor is to add capacitors. A capacitor bank supplies leading reactive power that offsets part of the lagging reactive demand created by inductive equipment.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><a href="https://www.se.com/us/en/faqs/FAQ000259683/">Schneider Electric explains</a> that power factor correction can reduce excess current, system losses, and equipment loading. It is important, however, not to confuse power factor correction with magically eliminating the useful energy consumed by the load. The motor, transformer, or machine still needs real power to do its work.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Power Factor Correction Does Not Mean Free Energy</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Improving power factor does not mean a 100 kW motor suddenly performs the same work while consuming 70 kW. What changes is the amount of current and apparent power required to deliver the same real power.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That distinction is important when evaluating claims about electrical efficiency. Lower current can reduce distribution losses and free capacity in cables, transformers, generators, and switchgear, but the useful load still consumes the real power required by the process.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why Utilities Care About Power Factor</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A utility must build enough generation and distribution capacity to carry the current demanded by customers. A low-power-factor customer can require larger electrical infrastructure for the same amount of useful kW.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That is why some commercial and industrial tariffs include reactive-power charges, kVA demand charges, or penalties below a specified power-factor threshold. The exact billing method depends on the utility and rate schedule.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why Data Centers And Mining Sites Should Care</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Large compute facilities operate close to electrical capacity limits, so small changes in current matter. Transformers, switchgear, busway, PDUs, UPS systems, and feeders all have finite ampacity and thermal limits. Our <a href="https://bitcoinversus.tech/2026/10/06/data-centers-what-is-busway-overhead-power-racks/">busway explainer</a> shows how downstream equipment physically distributes that power to racks.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The same principle applies upstream. A facility can have enough MW of real-power capacity on paper yet run into limits because transformers, switchgear, or conductors are constrained by current or kVA. Our <a href="https://bitcoinversus.tech/2026/10/03/oseec-009-electrical-power-distribution-switchgear-switchboards-panelboards-pdus/">guide to switchgear, switchboards, panelboards, and PDUs</a> explains where those limits appear in the distribution chain.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Easy Way To Remember It</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>kW is the useful work. kVAR supports the fields. kVA is what the electrical system has to carry. Power factor tells you how effectively apparent power is being converted into real power.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If kW and kVA are almost equal, power factor is high. If kVA is much larger than kW, power factor is low. That one relationship explains why engineers monitor power factor whenever motors, transformers, large AC loads, or high-capacity electrical infrastructure are involved.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">BitcoinVersus.Tech</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Advertisement</h3>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Editor’s Note</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><em>We volunteer daily to help keep the information on this platform verifiably accurate. If you would like to support our independent research, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.tech is not a financial advisor. Content is provided for informational purposes.</p>
<!-- /wp:paragraph -->