---
title: "OSETC.008: Voltage Drop and Loose Connections"
wordpress_post_id: 19545
source: BitcoinVersus.tech
published: 2026-09-30T09:33:23
modified: 2026-09-30T09:33:23
live_url: https://bitcoinversus.tech/2026/09/30/osetc-008-voltage-drop-loose-connections/
track: electrical/technician
lesson_number: 8
raw_source: 008-osetc-008-voltage-drop-loose-connections-19545.gutenberg.html
---

<!-- wp:paragraph --><p>OSETC means Open-Source Electrical Technician Certification. In <a href="https://bitcoinversus.tech/2026/09/29/osetc-007-series-parallel-circuits/">OSETC.007</a>, we learned about circuit paths. Now we will learn why a device can receive less voltage than its power supply provides.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">1. What voltage drop means</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Voltage drop is the voltage difference across part of a circuit while current flows. A lamp needs voltage across it to work. Wires and connections also have resistance, so some voltage appears across them. Too much drop in the wiring leaves less voltage for the lamp.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Think of a long water hose: pressure at the far end can be lower than at the supply. The analogy helps us picture the loss, but electrical calculations still use volts, amperes, and ohms.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">2. One easy example</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A 12.0 V supply powers a lamp. With the lamp operating, you measure 11.4 V across its terminals. The total difference is 12.0 − 11.4 = <strong>0.6 V</strong>. That difference includes the outgoing and return wiring, including connections, measured under the same operating conditions.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For a simple DC resistive path: <strong>voltage drop = current × path resistance</strong>. If the complete wiring path has 0.3 Ω resistance and carries 2 A, its drop is 2 × 0.3 = 0.6 V. <a href="https://www.victronenergy.com/media/pg/The_Wiring_Unlimited_book/en/theory.html">Victron’s wiring guide</a> explains how cable resistance and current affect delivered voltage.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Watch the explanation below, then return for a short measurement exercise. The video uses DC wiring examples; its application-specific limits are not universal limits for every circuit.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=hqGHoOXvrts","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=hqGHoOXvrts
</div><figcaption class="wp-element-caption"><em>EXPLORIST life explains voltage drop in DC wiring.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">3. Why a connection matters</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A loose, corroded, or damaged connection can add resistance. A circuit may pass a continuity test yet perform poorly when carrying its normal load. <a href="https://www.fluke.com/en/learn/blog/automotive/electrical-automotive-troubleshooting">Fluke’s troubleshooting guidance</a> explains why measuring voltage drop under load can reveal a restricted connection.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Practice on a training circuit</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use an instructor-approved, current-limited 12 V DC bench circuit. Keep this exercise away from mains wiring, industrial panels, and high-current batteries. Turn the training supply off before assembling or changing connections. Do not deliberately loosen an energized connection.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Use intact meter leads: black in COM, red in the voltage input. Select DC volts and an appropriate range. With the training load operating, measure across the supply terminals, then across the load terminals. Record both readings.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>To check a particular wire or connection, place one probe on each side of that section. The meter reads the voltage difference across that section. Keep probes from bridging adjacent terminals. Turn power off before adjustments; never use resistance or continuity mode on an energized circuit.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Compare results with the equipment specification and a known-good circuit. There is no single acceptable voltage-drop value for every system. Do not tighten terminals by guesswork: follow the manufacturer’s procedure and torque specification.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Quick check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Question 1:</strong> The supply measures 12.0 V and the load measures 11.7 V under the same load. What is the difference? <strong>Answer:</strong> 0.3 V.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Question 2:</strong> A wiring path carries 1 A and has 0.2 Ω resistance. What is its DC voltage drop? <strong>Answer:</strong> 0.2 V.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Question 3:</strong> Does a continuity beep prove a connection can carry its required load properly? <strong>Answer:</strong> No.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Technician takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Measure, compare, and locate the drop. A healthy supply reading alone does not prove the load is receiving the voltage it needs. Next, we will build on these measurements with practical circuit troubleshooting.</p><!-- /wp:paragraph -->