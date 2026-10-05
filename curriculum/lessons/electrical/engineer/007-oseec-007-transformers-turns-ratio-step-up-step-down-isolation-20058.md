---
title: "OSEEC.007: Transformers: Turns Ratio, Step-Up/Step-Down, and Isolation"
wordpress_post_id: 20058
source: BitcoinVersus.tech
published: 2026-10-02T12:37:59
modified: 2026-10-02T12:37:59
live_url: https://bitcoinversus.tech/2026/10/02/oseec-007-transformers-turns-ratio-step-up-step-down-isolation/
track: electrical/engineer
lesson_number: 7
raw_source: 007-oseec-007-transformers-turns-ratio-step-up-step-down-isolation-20058.gutenberg.html
---


<!-- wp:paragraph {"fontSize":"large"} -->
<p class="has-large-font-size"><strong>A transformer transfers AC electrical energy between windings through a changing magnetic field, allowing engineers to step voltage up, step it down, or provide electrical isolation without a direct conductive connection between primary and secondary circuits.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/02/oseec-006-capacitance-inductance-reactance/">OSEEC.006: Capacitance, Inductance, and Reactance</a>. That lesson introduced inductors and magnetic-field energy storage. A transformer uses the same electromagnetic foundation with two or more magnetically coupled windings.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary, secondary, and core</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A basic transformer has three major elements:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Primary winding:</strong> the winding connected to the source.</li><li><strong>Secondary winding:</strong> the winding connected to the load.</li><li><strong>Magnetic core:</strong> the path that concentrates and links magnetic flux between the windings.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Alternating current in the primary creates a changing magnetic flux in the core. That changing flux links the secondary winding and induces a voltage across it. This is mutual induction.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 1: How transformers work</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=UchitHGF4n8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=UchitHGF4n8
</div><figcaption class="wp-element-caption"><em>The Engineering Mindset explains transformer construction, magnetic coupling, step-up and step-down operation, and practical transformer connections.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Turns ratio</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For an ideal transformer, voltage ratio follows turns ratio:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>V<sub>s</sub> / V<sub>p</sub> = N<sub>s</sub> / N<sub>p</sub></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>where:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>V<sub>p</sub></strong> = primary voltage</li><li><strong>V<sub>s</sub></strong> = secondary voltage</li><li><strong>N<sub>p</sub></strong> = primary turns</li><li><strong>N<sub>s</sub></strong> = secondary turns</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Suppose the primary has 1,000 turns and the secondary has 100 turns. If the primary receives 480 V RMS:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>V<sub>s</sub> = 480 × (100 / 1000) = 48 V RMS</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That is a 10:1 step-down ratio.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Step-up vs. step-down</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Step-down transformer:</strong> secondary voltage is lower than primary voltage; N<sub>s</sub> is lower than N<sub>p</sub>.</li><li><strong>Step-up transformer:</strong> secondary voltage is higher than primary voltage; N<sub>s</sub> is higher than N<sub>p</sub>.</li><li><strong>1:1 isolation transformer:</strong> primary and secondary voltages are approximately equal, but the windings remain electrically separated.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Transformers do not create power. In the ideal model, input power equals output power:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>V<sub>p</sub>I<sub>p</sub> ≈ V<sub>s</sub>I<sub>s</sub></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>So when voltage steps down, available current capacity steps up in inverse proportion, subject to the transformer’s rating and losses.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Current ratio</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For an ideal transformer:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>I<sub>s</sub> / I<sub>p</sub> = N<sub>p</sub> / N<sub>s</sub></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Notice that current ratio is the inverse of voltage ratio.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Using the 480 V to 48 V example, an ideal 4.8 kVA transformer delivering 48 V could supply:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>I<sub>s</sub> = 4800 VA / 48 V = 100 A</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>On the 480 V side, the corresponding ideal current is:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>I<sub>p</sub> = 4800 VA / 480 V = 10 A</strong></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 2: Turns ratio, step-up, step-down, and isolation</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=qD6Zefeyiec","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=qD6Zefeyiec
</div><figcaption class="wp-element-caption"><em>This transformer fundamentals lesson covers mutual induction, primary and secondary windings, turns ratio, step-up and step-down operation, isolation, ratings, and losses.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why transformers need changing flux</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A transformer depends on changing magnetic flux. Normal transformer operation therefore uses AC or another changing waveform. Applying steady DC to a conventional transformer primary does not create the intended continuous transformer action and can drive excessive current limited mainly by winding resistance and core behavior.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Engineering rule:</strong> do not treat a transformer primary as an ordinary DC load.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Isolation</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In many transformers, primary and secondary windings are not electrically connected. Energy crosses the magnetic field rather than a direct conductor. That separation is called galvanic isolation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A 1:1 isolation transformer may have approximately the same nominal voltage on each side while still separating the two circuits electrically. Isolation can be useful for noise control, measurement setups, service work, and specific safety architectures, but it does not make the secondary harmless. The secondary can still deliver dangerous voltage and current.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Transformer ratings</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Transformers are commonly rated in volt-amperes:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>VA</strong> — volt-amperes</li><li><strong>kVA</strong> — kilovolt-amperes</li><li><strong>MVA</strong> — megavolt-amperes</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>For a single-phase transformer, a basic apparent-power relationship is:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>S = V × I</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A 25 kVA, 240 V secondary has an ideal full-load current of approximately:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>I = 25,000 / 240 ≈ 104.2 A</strong></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Real transformers have losses</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An ideal transformer has no losses. A real transformer does. Important loss mechanisms include:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Copper loss:</strong> I²R heating in the windings.</li><li><strong>Core loss:</strong> hysteresis and eddy-current losses in the magnetic core.</li><li><strong>Leakage flux:</strong> not all magnetic flux links both windings perfectly.</li><li><strong>Voltage regulation:</strong> secondary voltage changes somewhat as load changes because the transformer is not ideal.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 3: Transformer theory and isolation applications</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=0igJ8qdekyU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=0igJ8qdekyU
</div><figcaption class="wp-element-caption"><em>Intermation reviews transformer operation, turns-ratio calculations, and isolation-transformer applications.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical nameplate reading</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before working around a transformer, identify the nameplate information. Depending on the unit, this can include:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li>primary voltage</li><li>secondary voltage</li><li>frequency</li><li>VA or kVA rating</li><li>phase</li><li>temperature rise</li><li>impedance percentage</li><li>winding connection or tap information</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Do not assume winding voltage or configuration from physical size or wire color alone.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical measurement logic</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>On equipment that has been properly de-energized, locked out, verified absent of voltage, and discharged where required, winding continuity and resistance measurements can help identify open windings or gross winding problems. Resistance values alone do not prove a transformer is healthy under energized AC conditions.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Voltage-ratio verification is fundamentally different because it involves an energized source. That work requires the correct test procedure, meter category, PPE, boundaries, and authorization. Do not improvise live transformer measurements from a training example.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Data-center example</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A facility may receive medium-voltage utility power and step it down through transformers before distribution to switchgear, PDUs, racks, cooling systems, or mining equipment. The transformer turns ratio determines nominal voltage transformation, but the engineering design must also account for kVA capacity, conductor current, protection, inrush, fault current, grounding, cooling, and voltage drop.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A transformer that is correctly sized for voltage but undersized for kVA can still overheat or experience unacceptable voltage regulation under load.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Worked problem</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A transformer has 600 turns on the primary and 150 turns on the secondary. The primary is supplied with 240 V RMS.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Step 1: Find the turns ratio.</strong><br>N<sub>s</sub> / N<sub>p</sub> = 150 / 600 = 0.25</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Step 2: Find secondary voltage.</strong><br>V<sub>s</sub> = 240 × 0.25 = <strong>60 V RMS</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Step 3: Classify the transformer.</strong><br>The secondary voltage is lower than the primary, so this is a <strong>step-down transformer</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>A transformer has 200 primary turns and 800 secondary turns. Is it step-up or step-down?</li><li>If the primary voltage is 120 V, calculate the ideal secondary voltage.</li><li>Explain why current ratio moves opposite the voltage ratio.</li><li>Explain the difference between voltage transformation and galvanic isolation.</li><li>Name two important real-world transformer losses.</li><li>Explain why a transformer can have the correct turns ratio yet still be the wrong transformer for a load.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge check</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Question:</strong> A transformer has twice as many secondary turns as primary turns. What happens to ideal secondary voltage?<br><strong>Answer:</strong> It doubles.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Question:</strong> If ideal voltage doubles, what happens to current for the same apparent power?<br><strong>Answer:</strong> It is reduced by approximately half.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Question:</strong> Does a 1:1 isolation transformer necessarily produce zero volts on the secondary?<br><strong>Answer:</strong> No. It can provide approximately the same voltage while electrically separating the windings.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Previous OSEEC lessons</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/2026/10/02/oseec-006-capacitance-inductance-reactance/">OSEEC.006: Capacitance, Inductance, and Reactance</a></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/2026/10/01/oseec-005-ac-fundamentals/">OSEEC.005: AC Fundamentals</a></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/2026/09/30/oseec-004-kirchhoffs-laws-kvl-kcl/">OSEEC.004: Kirchhoff’s Laws: KVL and KCL</a></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A transformer uses changing magnetic flux to transfer AC energy between windings. Turns ratio sets the ideal voltage ratio, current changes inversely, and galvanic isolation can separate circuits electrically. In real systems, ratings, losses, protection, grounding, cooling, and safe test procedures matter just as much as the basic ratio equation.</p>
<!-- /wp:paragraph -->
