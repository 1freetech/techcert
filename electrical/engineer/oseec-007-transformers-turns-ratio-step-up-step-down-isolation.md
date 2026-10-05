---
title: "OSEEC.007: Transformers: Turns Ratio, Step-Up/Step-Down, and Isolation"
status: published
wordpress_post_id: 20058
published: "2026-10-02T12:37:59"
live_url: "https://bitcoinversus.tech/2026/10/02/oseec-007-transformers-turns-ratio-step-up-step-down-isolation/"
series: "Open-Source Electrical Engineer Certification"
pathway: electrical-engineer
lesson_number: "007"
featured_media_id: 20057
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oseec-007-transformers-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=UchitHGF4n8"
youtube_2: "https://www.youtube.com/watch?v=qD6Zefeyiec"
youtube_3: "https://www.youtube.com/watch?v=0igJ8qdekyU"
---

# OSEEC.007: Transformers: Turns Ratio, Step-Up/Step-Down, and Isolation

Original published WordPress article content, preserved below in full:



<p class="has-large-font-size wp-block-paragraph"><strong>A transformer transfers AC electrical energy between windings through a changing magnetic field, allowing engineers to step voltage up, step it down, or provide electrical isolation without a direct conductive connection between primary and secondary circuits.</strong></p>



<p class="wp-block-paragraph">This lesson follows <a href="https://bitcoinversus.tech/2026/10/02/oseec-006-capacitance-inductance-reactance/">OSEEC.006: Capacitance, Inductance, and Reactance</a>. That lesson introduced inductors and magnetic-field energy storage. A transformer uses the same electromagnetic foundation with two or more magnetically coupled windings.</p>



<h2 class="wp-block-heading">Primary, secondary, and core</h2>



<p class="wp-block-paragraph">A basic transformer has three major elements:</p>



<ul class="wp-block-list"><li><strong>Primary winding:</strong> the winding connected to the source.</li><li><strong>Secondary winding:</strong> the winding connected to the load.</li><li><strong>Magnetic core:</strong> the path that concentrates and links magnetic flux between the windings.</li></ul>



<p class="wp-block-paragraph">Alternating current in the primary creates a changing magnetic flux in the core. That changing flux links the secondary winding and induces a voltage across it. This is mutual induction.</p>



<h2 class="wp-block-heading">Video 1: How transformers work</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/UchitHGF4n8?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>The Engineering Mindset explains transformer construction, magnetic coupling, step-up and step-down operation, and practical transformer connections.</em></figcaption></figure>



<h2 class="wp-block-heading">Turns ratio</h2>



<p class="wp-block-paragraph">For an ideal transformer, voltage ratio follows turns ratio:</p>



<p class="wp-block-paragraph"><strong>V<sub>s</sub> / V<sub>p</sub> = N<sub>s</sub> / N<sub>p</sub></strong></p>



<p class="wp-block-paragraph">where:</p>



<ul class="wp-block-list"><li><strong>V<sub>p</sub></strong> = primary voltage</li><li><strong>V<sub>s</sub></strong> = secondary voltage</li><li><strong>N<sub>p</sub></strong> = primary turns</li><li><strong>N<sub>s</sub></strong> = secondary turns</li></ul>



<p class="wp-block-paragraph">Suppose the primary has 1,000 turns and the secondary has 100 turns. If the primary receives 480 V RMS:</p>



<p class="wp-block-paragraph"><strong>V<sub>s</sub> = 480 × (100 / 1000) = 48 V RMS</strong></p>



<p class="wp-block-paragraph">That is a 10:1 step-down ratio.</p>



<h2 class="wp-block-heading">Step-up vs. step-down</h2>



<ul class="wp-block-list"><li><strong>Step-down transformer:</strong> secondary voltage is lower than primary voltage; N<sub>s</sub> is lower than N<sub>p</sub>.</li><li><strong>Step-up transformer:</strong> secondary voltage is higher than primary voltage; N<sub>s</sub> is higher than N<sub>p</sub>.</li><li><strong>1:1 isolation transformer:</strong> primary and secondary voltages are approximately equal, but the windings remain electrically separated.</li></ul>



<p class="wp-block-paragraph">Transformers do not create power. In the ideal model, input power equals output power:</p>



<p class="wp-block-paragraph"><strong>V<sub>p</sub>I<sub>p</sub> ≈ V<sub>s</sub>I<sub>s</sub></strong></p>



<p class="wp-block-paragraph">So when voltage steps down, available current capacity steps up in inverse proportion, subject to the transformer’s rating and losses.</p>



<h2 class="wp-block-heading">Current ratio</h2>



<p class="wp-block-paragraph">For an ideal transformer:</p>



<p class="wp-block-paragraph"><strong>I<sub>s</sub> / I<sub>p</sub> = N<sub>p</sub> / N<sub>s</sub></strong></p>



<p class="wp-block-paragraph">Notice that current ratio is the inverse of voltage ratio.</p>



<p class="wp-block-paragraph">Using the 480 V to 48 V example, an ideal 4.8 kVA transformer delivering 48 V could supply:</p>



<p class="wp-block-paragraph"><strong>I<sub>s</sub> = 4800 VA / 48 V = 100 A</strong></p>



<p class="wp-block-paragraph">On the 480 V side, the corresponding ideal current is:</p>



<p class="wp-block-paragraph"><strong>I<sub>p</sub> = 4800 VA / 480 V = 10 A</strong></p>



<h2 class="wp-block-heading">Video 2: Turns ratio, step-up, step-down, and isolation</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/qD6Zefeyiec?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This transformer fundamentals lesson covers mutual induction, primary and secondary windings, turns ratio, step-up and step-down operation, isolation, ratings, and losses.</em></figcaption></figure>



<h2 class="wp-block-heading">Why transformers need changing flux</h2>



<p class="wp-block-paragraph">A transformer depends on changing magnetic flux. Normal transformer operation therefore uses AC or another changing waveform. Applying steady DC to a conventional transformer primary does not create the intended continuous transformer action and can drive excessive current limited mainly by winding resistance and core behavior.</p>



<p class="wp-block-paragraph"><strong>Engineering rule:</strong> do not treat a transformer primary as an ordinary DC load.</p>



<h2 class="wp-block-heading">Isolation</h2>



<p class="wp-block-paragraph">In many transformers, primary and secondary windings are not electrically connected. Energy crosses the magnetic field rather than a direct conductor. That separation is called galvanic isolation.</p>



<p class="wp-block-paragraph">A 1:1 isolation transformer may have approximately the same nominal voltage on each side while still separating the two circuits electrically. Isolation can be useful for noise control, measurement setups, service work, and specific safety architectures, but it does not make the secondary harmless. The secondary can still deliver dangerous voltage and current.</p>



<h2 class="wp-block-heading">Transformer ratings</h2>



<p class="wp-block-paragraph">Transformers are commonly rated in volt-amperes:</p>



<ul class="wp-block-list"><li><strong>VA</strong> — volt-amperes</li><li><strong>kVA</strong> — kilovolt-amperes</li><li><strong>MVA</strong> — megavolt-amperes</li></ul>



<p class="wp-block-paragraph">For a single-phase transformer, a basic apparent-power relationship is:</p>



<p class="wp-block-paragraph"><strong>S = V × I</strong></p>



<p class="wp-block-paragraph">A 25 kVA, 240 V secondary has an ideal full-load current of approximately:</p>



<p class="wp-block-paragraph"><strong>I = 25,000 / 240 ≈ 104.2 A</strong></p>



<h2 class="wp-block-heading">Real transformers have losses</h2>



<p class="wp-block-paragraph">An ideal transformer has no losses. A real transformer does. Important loss mechanisms include:</p>



<ul class="wp-block-list"><li><strong>Copper loss:</strong> I²R heating in the windings.</li><li><strong>Core loss:</strong> hysteresis and eddy-current losses in the magnetic core.</li><li><strong>Leakage flux:</strong> not all magnetic flux links both windings perfectly.</li><li><strong>Voltage regulation:</strong> secondary voltage changes somewhat as load changes because the transformer is not ideal.</li></ul>



<h2 class="wp-block-heading">Video 3: Transformer theory and isolation applications</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/0igJ8qdekyU?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Intermation reviews transformer operation, turns-ratio calculations, and isolation-transformer applications.</em></figcaption></figure>



<h2 class="wp-block-heading">Practical nameplate reading</h2>



<p class="wp-block-paragraph">Before working around a transformer, identify the nameplate information. Depending on the unit, this can include:</p>



<ul class="wp-block-list"><li>primary voltage</li><li>secondary voltage</li><li>frequency</li><li>VA or kVA rating</li><li>phase</li><li>temperature rise</li><li>impedance percentage</li><li>winding connection or tap information</li></ul>



<p class="wp-block-paragraph">Do not assume winding voltage or configuration from physical size or wire color alone.</p>



<h2 class="wp-block-heading">Practical measurement logic</h2>



<p class="wp-block-paragraph">On equipment that has been properly de-energized, locked out, verified absent of voltage, and discharged where required, winding continuity and resistance measurements can help identify open windings or gross winding problems. Resistance values alone do not prove a transformer is healthy under energized AC conditions.</p>



<p class="wp-block-paragraph">Voltage-ratio verification is fundamentally different because it involves an energized source. That work requires the correct test procedure, meter category, PPE, boundaries, and authorization. Do not improvise live transformer measurements from a training example.</p>



<h2 class="wp-block-heading">Data-center example</h2>



<p class="wp-block-paragraph">A facility may receive medium-voltage utility power and step it down through transformers before distribution to switchgear, PDUs, racks, cooling systems, or mining equipment. The transformer turns ratio determines nominal voltage transformation, but the engineering design must also account for kVA capacity, conductor current, protection, inrush, fault current, grounding, cooling, and voltage drop.</p>



<p class="wp-block-paragraph">A transformer that is correctly sized for voltage but undersized for kVA can still overheat or experience unacceptable voltage regulation under load.</p>



<h2 class="wp-block-heading">Worked problem</h2>



<p class="wp-block-paragraph">A transformer has 600 turns on the primary and 150 turns on the secondary. The primary is supplied with 240 V RMS.</p>



<p class="wp-block-paragraph"><strong>Step 1: Find the turns ratio.</strong><br>N<sub>s</sub> / N<sub>p</sub> = 150 / 600 = 0.25</p>



<p class="wp-block-paragraph"><strong>Step 2: Find secondary voltage.</strong><br>V<sub>s</sub> = 240 × 0.25 = <strong>60 V RMS</strong></p>



<p class="wp-block-paragraph"><strong>Step 3: Classify the transformer.</strong><br>The secondary voltage is lower than the primary, so this is a <strong>step-down transformer</strong>.</p>



<h2 class="wp-block-heading">Practice</h2>



<ol class="wp-block-list"><li>A transformer has 200 primary turns and 800 secondary turns. Is it step-up or step-down?</li><li>If the primary voltage is 120 V, calculate the ideal secondary voltage.</li><li>Explain why current ratio moves opposite the voltage ratio.</li><li>Explain the difference between voltage transformation and galvanic isolation.</li><li>Name two important real-world transformer losses.</li><li>Explain why a transformer can have the correct turns ratio yet still be the wrong transformer for a load.</li></ol>



<h2 class="wp-block-heading">Knowledge check</h2>



<p class="wp-block-paragraph"><strong>Question:</strong> A transformer has twice as many secondary turns as primary turns. What happens to ideal secondary voltage?<br><strong>Answer:</strong> It doubles.</p>



<p class="wp-block-paragraph"><strong>Question:</strong> If ideal voltage doubles, what happens to current for the same apparent power?<br><strong>Answer:</strong> It is reduced by approximately half.</p>



<p class="wp-block-paragraph"><strong>Question:</strong> Does a 1:1 isolation transformer necessarily produce zero volts on the secondary?<br><strong>Answer:</strong> No. It can provide approximately the same voltage while electrically separating the windings.</p>



<h2 class="wp-block-heading">Previous OSEEC lessons</h2>



<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/oseec-006-capacitance-inductance-reactance/">OSEEC.006: Capacitance, Inductance, and Reactance</a></p>



<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/01/oseec-005-ac-fundamentals/">OSEEC.005: AC Fundamentals</a></p>



<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/09/30/oseec-004-kirchhoffs-laws-kvl-kcl/">OSEEC.004: Kirchhoff’s Laws: KVL and KCL</a></p>



<h2 class="wp-block-heading">Key takeaway</h2>



<p class="wp-block-paragraph">A transformer uses changing magnetic flux to transfer AC energy between windings. Turns ratio sets the ideal voltage ratio, current changes inversely, and galvanic isolation can separate circuits electrically. In real systems, ratings, losses, protection, grounding, cooling, and safe test procedures matter just as much as the basic ratio equation.</p>


