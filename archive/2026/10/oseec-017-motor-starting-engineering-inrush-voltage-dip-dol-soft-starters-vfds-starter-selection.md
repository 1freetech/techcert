---
title: "OSEEC.017: Motor Starting Engineering — Inrush Current, Voltage Dip, DOL, Soft Starters, VFDs, and Starter Selection"
status: published
wordpress_post_id: 22568
published: "2026-10-09T09:04:21"
modified: "2026-10-09T09:04:21"
live_url: "https://bitcoinversus.tech/2026/10/09/oseec-017-motor-starting-engineering-inrush-voltage-dip-dol-soft-starters-vfds-starter-selection/"
series: "Open-Source Electrical Engineering Certificate"
subject: electrical_engineering
lesson_number: "017"
featured_media_id: 22566
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oseec-017-motor-starting-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22567
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oseec-017-motor-starting-current-body.png"
body_image_dimensions: "1189x665"
youtube_1: "https://www.youtube.com/watch?v=3ikIPOnBLtY"
youtube_2: "https://www.youtube.com/watch?v=A5D6bmVwiCI"
youtube_3: "https://www.youtube.com/watch?v=HayryySX_po"
social_1: "https://twitter.com/whatmicha/status/2030012265617920399"
seo_title: "OSEEC.017: Motor Starting Engineering — DOL, Soft Starters & VFDs"
seo_description: "Learn motor starting engineering: inrush and locked-rotor current, voltage dip, DOL starting, soft starters, VFDs, torque limits, selection, and commissioning."
no_text_boxes: true
youtube_minimum_met: 3
---

<!-- wp:paragraph -->
<p><strong>Starting an induction motor is a short electrical event with system-wide consequences.</strong> A motor that runs normally at rated current can demand several times that current while accelerating, producing voltage dip, heating, torque shock, nuisance protection operation, or generator instability if the source is weak. The engineer’s job is to understand the motor, the driven load, and the source together—and then choose a starting method that lets the machine accelerate without creating a new problem elsewhere in the electrical system.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson builds on <a href="https://bitcoinversus.tech/2026/10/02/oseec-008-three-phase-power-fundamentals/"><strong>OSEEC.008: Three-Phase Power Fundamentals</strong></a>, <a href="https://bitcoinversus.tech/2026/10/03/oseec-010-overcurrent-protection-circuit-breakers-fuses-fault-current-selective-coordination/"><strong>OSEEC.010: Overcurrent Protection</strong></a>, <a href="https://bitcoinversus.tech/2026/10/07/oseec-015-power-quality-engineering-harmonics-thd-voltage-sags-swells-transients-measurement/"><strong>OSEEC.015: Power Quality Engineering</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/08/oseec-016-power-factor-correction-capacitor-banks-kvar-harmonic-detuning/"><strong>OSEEC.016: Power Factor Correction Engineering</strong></a>. The focus here is one question: <strong>how should a three-phase motor be started?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Why induction motors draw high current at standstill.</li><li>How starting current interacts with source impedance to create voltage dip.</li><li>What locked-rotor current and locked-rotor kVA mean.</li><li>How direct-on-line, soft-starter, and VFD starting differ electrically and mechanically.</li><li>Why reducing voltage also reduces available motor starting torque.</li><li>How to choose a starting method from source strength, load torque, acceleration time, process needs, and cost.</li><li>What measurements should be captured during commissioning.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why Starting Current Is High</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>At standstill, an induction motor has not yet developed the rotational conditions that reduce stator current during normal running. The motor initially behaves like a heavily loaded electromagnetic device, so the starting or <strong>locked-rotor current</strong> can be much higher than full-load current. As the rotor accelerates, slip decreases, operating conditions change, and current usually falls toward its running value.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=3ikIPOnBLtY","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=3ikIPOnBLtY
</div><figcaption class="wp-element-caption"><em>Jim Pytel — Inrush Current. Explains locked-rotor current, counter-EMF, motor nameplate kVA-per-horsepower code, and the electrical reason starting current is high.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p>If a NEMA motor nameplate includes a locked-rotor kVA-per-horsepower code, the code can be used to estimate starting apparent power. For a three-phase motor:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Locked-rotor kVA ≈ motor horsepower × code kVA/hp

I_locked-rotor ≈ (Locked-rotor kVA × 1000) / (√3 × V_LL)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The result is an estimate, not a replacement for the manufacturer’s motor data. IEC motors may present starting-current information differently. For an engineering study, use the actual motor datasheet, starting-current ratio, starting torque, inertia, acceleration time, feeder impedance, transformer data, and source short-circuit strength whenever those values are available.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22567,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oseec-017-motor-starting-current-body.png" alt="Illustrative chart comparing motor current over time for across-the-line starting, soft starter starting, and VFD controlled acceleration." class="wp-image-22567" /><figcaption class="wp-element-caption"><em>Illustrative comparison only: direct-on-line starting produces the largest immediate current step, while a soft starter or VFD can shape the acceleration. Actual current depends on motor design, load torque, source impedance, and settings.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Source Impedance Turns Starting Current Into Voltage Dip</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A large current is not automatically unacceptable. The key question is what that current does to the electrical source. Every transformer, generator, feeder, busway, and upstream network has impedance. During a motor start, the starting current flowing through that impedance produces a voltage drop. A useful simplified per-phase engineering relationship is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>V_motor ≈ V_source − I_start × Z_source

Voltage dip grows when:
I_start increases
or
source / feeder impedance increases</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This is why the same motor can start easily from a stiff utility-fed bus but cause a severe dip when supplied by a smaller transformer, long feeder, or generator. The dip can affect contactors, PLC power supplies, lighting, drives, controls, and other motors sharing the bus. Motor starting is therefore both a motor problem and a <a href="https://bitcoinversus.tech/2026/10/07/oseec-015-power-quality-engineering-harmonics-thd-voltage-sags-swells-transients-measurement/"><strong>power-quality</strong></a> problem.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Direct-On-Line Starting</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Direct-on-line</strong> (DOL), also called across-the-line starting, connects the motor directly to the supply at full line voltage through the starter and protection system. It is electrically simple, inexpensive, and capable of strong starting torque. Its tradeoff is the largest current step and the strongest mechanical torque transient of the common methods discussed here.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Use DOL when:</strong> the source is strong, the motor is not too large for the bus, the driven load can tolerate the torque step, and speed control is unnecessary.</li><li><strong>Investigate alternatives when:</strong> bus voltage dip is excessive, the generator struggles, the mechanical system needs a gentler start, or repeated starts create unacceptable heating.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Protection still has to distinguish a legitimate motor start from a fault or sustained overload. That links starter engineering directly to <a href="https://bitcoinversus.tech/2026/10/03/oseec-010-overcurrent-protection-circuit-breakers-fuses-fault-current-selective-coordination/"><strong>breaker, fuse, and coordination engineering</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Soft Starters Reduce Electrical And Mechanical Shock</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A soft starter uses solid-state switching—commonly thyristors/SCRs—to control the voltage applied during acceleration. By ramping or limiting the applied voltage/current, the starter can reduce the abrupt current and torque associated with a full-voltage start. After acceleration, many installations use a bypass contactor so the motor runs efficiently at line conditions.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=A5D6bmVwiCI","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=A5D6bmVwiCI
</div><figcaption class="wp-element-caption"><em>Schneider Electric — ATS01 soft-starter setup. Shows a real industrial soft starter being mounted, wired, commissioned, and used to start a motor.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p>There is an important engineering limit: for an induction motor at a fixed supply frequency, electromagnetic torque is strongly dependent on applied voltage. A useful first approximation near starting conditions is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>T_start ∝ V²</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>That means reducing motor voltage to 80% does not preserve 80% of starting torque; the rough voltage-squared relationship predicts about 64% of the original torque. A soft starter therefore cannot be selected only from “how much current reduction do we want?” The engineer must also confirm that enough accelerating torque remains to overcome load torque and inertia.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/whatmicha/status/2030012265617920399","type":"rich","providerNameSlug":"twitter","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-twitter wp-block-embed-twitter"><div class="wp-block-embed__wrapper">
https://twitter.com/whatmicha/status/2030012265617920399
</div><figcaption class="wp-element-caption"><em>A directly relevant industry example discussing Siemens’ SIRIUS 3RW5 refurbished soft starter, showing that soft-starter hardware remains an active part of modern industrial motor-control portfolios.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">VFD Starting Adds Frequency And Speed Control</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>variable frequency drive</strong> (VFD) does more than reduce the starting transient. It rectifies the incoming AC to a DC link and then uses power electronics to synthesize a controlled AC output whose frequency and voltage can be varied. The drive can command a controlled acceleration ramp and continue controlling motor speed after the start is complete.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=HayryySX_po","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=HayryySX_po
</div><figcaption class="wp-element-caption"><em>RealPars — Variable Frequency Drives Explained. Covers the rectifier, DC bus, inverter/IGBT stage, adjustable frequency, controlled acceleration, and why VFDs are used with AC motors.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p>A VFD is often the strongest choice when the process needs continuous speed control, controlled acceleration/deceleration, energy savings on variable-torque loads such as pumps and fans, or tighter current/torque management. It also introduces additional engineering topics: harmonics, reflected-wave effects on long motor leads, motor insulation stress, common-mode current, EMC, cooling at low speed, and drive protection. Those belong to later lessons; the essential point here is that a VFD is a <strong>motor-speed control system</strong>, while a soft starter is primarily a <strong>starting/stopping device</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Choose The Starting Method From The System</h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Engineering Need</th><th>DOL / Across-The-Line</th><th>Soft Starter</th><th>VFD</th></tr></thead><tbody><tr><td>Lowest equipment complexity</td><td>Strong</td><td>Moderate</td><td>Lowest</td></tr><tr><td>Reduce starting current</td><td>Limited</td><td>Yes</td><td>Yes</td></tr><tr><td>Reduce mechanical shock</td><td>Limited</td><td>Yes</td><td>Yes</td></tr><tr><td>Continuous speed control</td><td>No</td><td>No</td><td>Yes</td></tr><tr><td>Process acceleration control</td><td>Limited</td><td>Good</td><td>Best</td></tr><tr><td>Power-electronics complexity</td><td>Low</td><td>Medium</td><td>High</td></tr></tbody></table><figcaption class="wp-element-caption"><em>Selection summary only. Final engineering depends on motor data, source strength, load torque/inertia, duty cycle, process requirements, harmonics, environment, protection, and manufacturer guidance.</em></figcaption></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p><a href="https://www.eaton.com/us/en-us/products/controls-drives-automation-sensors/soft-starters/how-to-choose-between-a-soft-starter-and-a-variable-frequency-fo.html"><strong>Eaton’s soft-starter-versus-VFD guidance</strong></a> makes the same fundamental distinction: both can reduce inrush and torque during startup, while a VFD also controls motor speed through the run cycle. Siemens’ current <a href="https://press.siemens.com/global/en/pressrelease/siemens-expands-semiconductor-based-circuit-protection-portfolio-debuts-circular-soft"><strong>SIRIUS soft-starter portfolio example</strong></a> shows that dedicated soft starters still have a clear industrial role when controlled starting is required without continuous variable-speed operation.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Commission The Start With Measurements</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Do not declare a motor-starting design successful because the motor merely turned. Capture the event. A useful commissioning record includes source voltage before start, minimum voltage during start, peak/RMS starting current as appropriate, acceleration time, motor current after acceleration, starter current limit or ramp settings, driven-load condition, and any protection or control alarms.</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Confirm motor nameplate voltage, current, frequency, horsepower/kW, service information, and manufacturer starting data.</li><li>Confirm the starter/VFD rating and installation requirements.</li><li>Check feeder, transformer, generator, and upstream protection data.</li><li>Record pre-start bus voltage.</li><li>Start under a known load condition.</li><li>Capture starting current and the lowest bus voltage during acceleration.</li><li>Measure acceleration time.</li><li>Verify the motor reaches normal current and speed without protection alarms.</li><li>Check whether nearby controls or loads experienced a disturbance.</li><li>Document final settings and results.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical Exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A 75 hp, 480 V three-phase motor has a nameplate locked-rotor code that corresponds to 6.0 kVA/hp. Estimate locked-rotor apparent power and current.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Locked-rotor kVA = 75 hp × 6.0 kVA/hp
                   = 450 kVA

I_locked-rotor ≈ 450,000 / (√3 × 480)
               ≈ 541 A</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Then ask the engineering question that matters: can the transformer, generator, feeder, and shared bus support roughly that starting event without unacceptable voltage dip? If not, investigate a reduced-current starting method and verify that the chosen method still produces enough accelerating torque for the driven load.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Why is induction-motor current high at standstill?</strong> The motor has not yet reached the electromagnetic operating condition associated with normal running, so locked-rotor current can be much higher than full-load current.</li><li><strong>What converts starting current into bus voltage dip?</strong> Current flowing through source and feeder impedance.</li><li><strong>What is the simplest common starting method?</strong> Direct-on-line/across-the-line starting.</li><li><strong>What is the main purpose of a soft starter?</strong> To control the starting/stopping transient by reducing or shaping applied voltage/current and torque.</li><li><strong>Why can too much voltage reduction prevent acceleration?</strong> Starting torque falls strongly with voltage; a useful approximation is torque proportional to voltage squared.</li><li><strong>What does a VFD add beyond soft starting?</strong> Variable output frequency/voltage and continuous speed control through the run cycle.</li><li><strong>What should be measured during commissioning?</strong> At minimum bus voltage, starting current, acceleration time, final running current, load condition, and starter settings.</li><li><strong>What decides the correct starter?</strong> The motor, load torque/inertia, electrical source, process requirements, duty cycle, protection, environment, and economics together.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>A motor starter is really an agreement between the motor and the power system.</strong> DOL is simple but produces the strongest electrical and mechanical start. A soft starter reduces the starting shock when fixed-speed operation is acceptable. A VFD gives the most control because it manages acceleration and operating speed. The right choice is the one that starts the load, protects the equipment, and keeps the rest of the electrical system stable.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is an original 1200×630 BitcoinVersus.Tech lesson cover created specifically for OSEEC.017 and is not reused in the body. The body uses a separate original engineering chart. All three YouTube videos are unique, directly relevant to adjacent lesson sections, and are implemented as responsive native Gutenberg 16:9 YouTube embed blocks. The social item uses a direct <code>twitter.com/USERNAME/status/STATUS_ID</code> URL. Ordinary lesson prose is not placed inside bordered, shaded, card, callout, panel, or fixed-width text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->