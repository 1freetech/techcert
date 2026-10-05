---
title: "OSETC.020: Limit Switches and Proximity Sensors Basics"
status: published
wordpress_post_id: 20081
published: "2026-10-02T16:46:49"
live_url: "https://bitcoinversus.tech/2026/10/02/osetc-020-limit-switches-proximity-sensors-basics/"
series: "Open-Source Electrical Technician Certification"
pathway: electrical-technician
lesson_number: "020"
featured_media_id: 20079
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-020-limit-switches-proximity-sensors-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=iMPFoYJ5b_Q"
youtube_2: "https://www.youtube.com/watch?v=6565yt3FMKU"
youtube_3: "https://www.youtube.com/watch?v=x2Ywl456YR4"
---

# OSETC.020: Limit Switches and Proximity Sensors Basics

Original published WordPress article content, preserved below in full:



<p class="has-large-font-size wp-block-paragraph"><strong>Limit switches and proximity sensors tell a control system whether a machine part, door, actuator, product, or other target has reached a particular position.</strong></p>



<p class="wp-block-paragraph">This lesson follows <a href="https://bitcoinversus.tech/2026/10/02/osetc-019-time-delay-relays-basics/">OSETC.019: Time-Delay Relays Basics</a>. Timers add sequence based on time; sensors add sequence based on what is physically happening in the machine.</p>


<h2 class="wp-block-heading">Limit switches: mechanical position detection</h2>
<p class="wp-block-paragraph">A <strong>limit switch</strong> is a mechanically actuated switch. A moving machine part physically pushes a lever, roller, plunger, or other actuator and changes the state of one or more electrical contacts.</p>
<p class="wp-block-paragraph">Common uses include end-of-travel detection, door position, conveyor mechanisms, valve position, and actuator confirmation.</p>

<h2 class="wp-block-heading">Normally open and normally closed contacts</h2>
<p class="wp-block-paragraph">Like relays, limit switches may provide normally open (NO), normally closed (NC), or changeover contacts. “Normal” refers to the device&#8217;s specified unactuated state, not whether the machine is currently running.</p>
<ul class="wp-block-list"><li><strong>NO:</strong> open in the normal state; closes when actuated.</li><li><strong>NC:</strong> closed in the normal state; opens when actuated.</li><li><strong>Changeover:</strong> one common terminal transfers between NC and NO contacts.</li></ul>

<h2 class="wp-block-heading">Video 1: Industrial limit switch operation</h2>

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/iMPFoYJ5b_Q?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Omron Automation Americas introduces its industrial limit-switch portfolio and shows how limit switches are applied in machine automation.</em></figcaption></figure>


<h2 class="wp-block-heading">Proximity sensors: detect without mechanical contact</h2>
<p class="wp-block-paragraph">A <strong>proximity sensor</strong> detects a target without requiring a mechanical lever to be pressed. Different sensing technologies respond to different materials and conditions.</p>

<h3 class="wp-block-heading">Inductive proximity sensors</h3>
<p class="wp-block-paragraph">Inductive sensors are commonly used to detect metal. They create an electromagnetic field near the sensing face; nearby conductive metal changes that field and causes the sensor output to switch.</p>
<p class="wp-block-paragraph"><strong>Technician example:</strong> confirm that a steel actuator arm reached its commanded position.</p>

<h3 class="wp-block-heading">Capacitive proximity sensors</h3>
<p class="wp-block-paragraph">Capacitive sensors detect changes in capacitance and can respond to many nonmetallic materials as well as metals. Applications can include level detection through a nonmetallic container wall, depending on the sensor and material.</p>

<h3 class="wp-block-heading">Photoelectric sensors</h3>
<p class="wp-block-paragraph">Photoelectric sensors use light. Depending on the design, a target may interrupt a beam, reflect light back to a receiver, or change the amount of received light. They are common on conveyors and packaging lines.</p>

<h2 class="wp-block-heading">Video 2: Inductive, capacitive, and photoelectric sensors</h2>

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/6565yt3FMKU?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Tim Wilborne compares inductive proximity, capacitive, photoelectric, and other common industrial sensor technologies.</em></figcaption></figure>


<h2 class="wp-block-heading">Three-wire DC sensor basics</h2>
<p class="wp-block-paragraph">Many industrial DC proximity sensors use three conductors: supply positive, supply common, and an output. Exact wire colors, voltage ranges, PNP/NPN behavior, and load requirements depend on the manufacturer.</p>
<p class="wp-block-paragraph"><strong>Do not wire a sensor by color from memory.</strong> Use the exact data sheet and approved drawing.</p>

<h2 class="wp-block-heading">PNP and NPN outputs</h2>
<p class="wp-block-paragraph">In common DC control systems, a PNP sensor typically sources current to the input when active, while an NPN sensor typically sinks current when active. Whether a particular PLC input module is compatible depends on the module&#8217;s input circuit and common arrangement.</p>
<p class="wp-block-paragraph">The technician&#8217;s job is to match the sensor type, supply voltage, input module, and drawing—not to assume every three-wire sensor is interchangeable.</p>

<h2 class="wp-block-heading">Video 3: How common industrial sensors detect targets</h2>

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/x2Ywl456YR4?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>InnovativeAutomation demonstrates the operating principles of inductive, capacitive, and photoelectric sensors in automation.</em></figcaption></figure>


<h2 class="wp-block-heading">Sensing distance and target material</h2>
<p class="wp-block-paragraph">Every proximity sensor has an operating range. Detection distance can depend on target material, target size, alignment, mounting, environment, and sensor design.</p>
<p class="wp-block-paragraph">A sensor that works reliably on a large steel target may not have the same range on a smaller or different metal target. Use the manufacturer&#8217;s rated sensing distance and correction information.</p>

<h2 class="wp-block-heading">Shielded vs. unshielded inductive sensors</h2>
<p class="wp-block-paragraph">Some inductive sensors are designed for flush mounting in metal; others require clearance around the sensing face. Incorrect mounting can reduce sensing distance or create false operation. Follow the manufacturer&#8217;s mounting specification.</p>

<h2 class="wp-block-heading">Sensor status LEDs</h2>
<p class="wp-block-paragraph">Many proximity sensors include an indicator LED showing output state. That LED is useful, but it does not prove the PLC sees the signal. A broken conductor, wrong input common, failed terminal, or incorrect wiring can produce a sensor LED without a valid controller input.</p>

<h2 class="wp-block-heading">Technician troubleshooting sequence</h2>
<ol class="wp-block-list"><li>Read the approved schematic and identify the expected sensor state.</li><li>Identify the device type: mechanical limit switch, inductive, capacitive, photoelectric, or another technology.</li><li>Check the target and mechanical alignment.</li><li>Check the sensor&#8217;s status indicator if present.</li><li>Confirm the correct supply and wiring configuration using authorized procedures.</li><li>Trace the signal to the controller input or relay circuit.</li><li>Compare the observed state with the expected sequence.</li></ol>

<h2 class="wp-block-heading">Data-center and mining example</h2>
<p class="wp-block-paragraph">A cooling or material-handling system might use a limit switch to confirm that a damper has reached its end position, an inductive sensor to confirm a metal actuator is extended, or a photoelectric sensor to detect an object passing a conveyor point.</p>
<p class="wp-block-paragraph">If the PLC command says “open” but the expected position sensor never changes state, the problem could be mechanical motion, sensor alignment, sensor power, wiring, controller input, or the actuator itself. The missing feedback is a clue—not proof that the sensor is defective.</p>

<h2 class="wp-block-heading">Limit switch vs. proximity sensor</h2>
<ul class="wp-block-list"><li><strong>Limit switch:</strong> physical contact with an actuator changes electrical contacts.</li><li><strong>Proximity sensor:</strong> detects a target electronically without mechanical contact.</li><li><strong>Limit switch advantage:</strong> simple, robust, easy to understand.</li><li><strong>Proximity-sensor advantage:</strong> no mechanical contact and potentially high cycle life.</li></ul>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Assuming an NC contact is faulty because it reads closed when not actuated.</li><li>Using a sensor designed for metal to detect a target it cannot reliably sense.</li><li>Ignoring minimum target size or sensing-distance limits.</li><li>Wiring a PNP sensor into an incompatible input arrangement.</li><li>Using wire color alone instead of the product diagram.</li><li>Assuming a lit sensor LED proves the controller input is active.</li><li>Replacing the sensor before checking alignment and the physical target.</li></ul>

<h2 class="wp-block-heading">Safe practice</h2>
<p class="wp-block-paragraph">Use drawings, de-energized training boards, simulators, or authorized observation for practice. Machine motion can create crushing, pinching, and stored-energy hazards even when control voltage is low. Follow required lockout/tagout and qualified-person procedures before reaching into equipment or changing wiring.</p>

<h2 class="wp-block-heading">Practice and answers</h2>
<p class="wp-block-paragraph"><strong>1. Which sensor is usually best for detecting a nearby steel target without contact?</strong><br>Answer: an inductive proximity sensor.</p>
<p class="wp-block-paragraph"><strong>2. Which device requires physical actuation?</strong><br>Answer: a mechanical limit switch.</p>
<p class="wp-block-paragraph"><strong>3. A sensor LED turns on but the PLC input stays off. Is the sensor automatically bad?</strong><br>Answer: no. Check wiring, common, terminals, the input module, and the approved circuit.</p>
<p class="wp-block-paragraph"><strong>4. Why should you check target material?</strong><br>Answer: sensing technology and rated distance depend on what the sensor is intended to detect.</p>

<h2 class="wp-block-heading">Previous OSETC lessons</h2>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/osetc-019-time-delay-relays-basics/">OSETC.019: Time-Delay Relays Basics</a></p>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/01/osetc-018-interlocks-permissives-basics/">OSETC.018: Interlocks and Permissives Basics</a></p>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/01/osetc-017-control-circuit-symbols-ladder-diagrams-basics/">OSETC.017: Control Circuit Symbols and Ladder Diagrams Basics</a></p>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph">Limit switches and proximity sensors convert real machine position into electrical control information. A good technician identifies the sensing technology, expected state, target, wiring, and controller input before replacing hardware.</p>

