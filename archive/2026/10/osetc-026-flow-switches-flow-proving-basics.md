---
title: "OSETC.026: Flow Switches and Flow-Proving Basics"
status: published
wordpress_post_id: 20761
published: "2026-10-04T20:55:15"
live_url: "https://bitcoinversus.tech/2026/10/04/osetc-026-flow-switches-flow-proving-basics/"
series: "Open Source Electrical Technician Certification"
subject: electrical_technician
lesson_number: "026"
tier: 1
difficulty: foundational
certification: OSETC
module: "Process switches and operating permissives"
prerequisites: ["OSETC.025", "OSETC.024", "OSETC.018", "OSETC.011"]
objectives: ["Distinguish flow from pressure and level", "Identify sensing principles", "Interpret switching thresholds and contact states", "Isolate process and signal-path faults", "Document commissioning acceptance"]
featured_media_id: 20760
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-026-flow-switches-cover.jpg"
seo_title: "OSETC.026: Flow Switches and Flow-Proving Basics"
seo_description: "Study flow switches, contact logic, switching differential and cooling-system flow proving with three videos, practical exercises and a knowledge check."
youtube_1: "https://www.youtube.com/watch?v=rQWVhJhf0a8"
youtube_2: "https://www.youtube.com/watch?v=Li-OREapbaA"
youtube_3: "https://www.youtube.com/watch?v=S9Wj-NgezrI"
sources: ["https://www.dwyeromega.com/en-us/trim-to-size-paddle-type-flow-switch/p/FSW-25-Series", "https://www.ato.com/flow-switch", "https://www.flowline.com/_data_sheet_and_manuals/older/FT10_m.pdf", "https://designcenter.danfoss.com/products/climate-solutions-for-cooling/switches/flow-switches/fqs/p/061H4005", "https://thomasproductsusa.com/products/1801-series-pump-control", "https://www.osha.gov/laws-regs/regulations/standardnumber/1910/1910.333"]
archive_note: "The Gutenberg body below is the exact saved WordPress content, without an added terminal newline."
---

<!-- wp:paragraph {"fontSize":"large"} -->
<p class="has-large-font-size"><strong>A flow switch converts a fluid-flow condition into a discrete electrical signal. Flow proving establishes whether the required circulation condition exists before equipment is permitted to operate.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The Electrical Technician sequence continues from <a href="https://bitcoinversus.tech/2026/10/04/osetc-025-temperature-switches-thermostat-control-basics/">OSETC.025: Temperature Switches and Thermostat Control Basics</a>. Temperature, pressure, and flow are different process variables. A pump command, motor-running indication, or pressurized pipe alone does not establish adequate circulation through the protected equipment.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Distinguish a flow switch from a pressure switch, level switch, and flow meter.</li><li>Identify paddle, magnetic-shuttle, and thermal sensing principles.</li><li>Interpret a documented contact state and increasing-flow or decreasing-flow threshold.</li><li>Separate actual low flow from switch, wiring, and controller-input faults.</li><li>Apply a supervised training exercise and document the expected loss-of-flow response.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><strong>Prerequisites:</strong> <a href="https://bitcoinversus.tech/2026/10/03/osetc-024-pressure-switches-pressure-control-basics/">OSETC.024: Pressure Switches and Pressure Control Basics</a> establishes pressure sensing; <a href="https://bitcoinversus.tech/2026/10/01/osetc-018-interlocks-permissives-basics/">OSETC.018: Interlocks and Permissives Basics</a> establishes operating permissions; <a href="https://bitcoinversus.tech/2026/09/30/osetc-011-lockout-tagout-energy-isolation/">OSETC.011: Lockout/Tagout and Energy Isolation</a> establishes the isolation boundary.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Flow, pressure, level, and measured quantity</h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Device</th><th>Variable or output</th><th>Interpretation</th></tr></thead><tbody><tr><td>Flow switch</td><td>Discrete state associated with a flow threshold</td><td>A specified flow condition has been detected at the installed sensing location.</td></tr><tr><td>Pressure switch</td><td>Discrete state associated with a pressure threshold</td><td>Pressure reached a switching point; circulation must be evaluated separately.</td></tr><tr><td>Level switch</td><td>Liquid level at a defined location</td><td>Liquid presence or level does not establish movement through a cooling circuit.</td></tr><tr><td>Flow meter or transmitter</td><td>Measured flow value or proportional signal</td><td>A numerical measurement can support monitoring and controller thresholds. Some instruments also provide switching outputs.</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>A closed valve can leave a section of pipe pressurized while preventing useful downstream circulation. Likewise, a commanded pump can have an electrical or mechanical fault. Flow proving therefore evaluates a process condition separately from the command that is intended to produce it.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Three common sensing principles</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Paddle flow switch.</strong> Fluid movement deflects a paddle and operates a switching mechanism. Paddle selection, pipe diameter, mounting orientation, and free movement affect operation. The <a href="https://www.dwyeromega.com/en-us/trim-to-size-paddle-type-flow-switch/p/FSW-25-Series">DwyerOmega FSW-25 documentation</a> illustrates a paddle that must be configured for the pipe size. Its installation requirements are model-specific; a trim length from one product must not be transferred to another.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Magnetic-shuttle flow switch.</strong> Fluid movement shifts an internal magnetic element against a restoring force, changing a magnetic switch state. <a href="https://www.ato.com/flow-switch">ATO describes this operating principle</a> for its magnetic water-flow switches. “Magnetic” in this context describes switch actuation; it does not automatically identify an electromagnetic flow meter.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Thermal flow switch.</strong> Moving liquid changes heat transfer at sensing tips. Electronics interpret that change and switch an output. The <a href="https://www.flowline.com/_data_sheet_and_manuals/older/FT10_m.pdf">Flowline FT10 manual</a> requires correct tip orientation and liquid contact, and describes a startup indication that must be accounted for in control design. Sensor power-up is therefore part of commissioning, rather than proof of stable process flow.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 1: Magnetic flow-switch operation</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=rQWVhJhf0a8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=rQWVhJhf0a8
</div><figcaption class="wp-element-caption"><em>ATO Automation — An Application Demo: The Function of Magnetic Water Flow Switch. A manufacturer demonstration of a magnetic flow switch in a control application.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p>The demonstration supports identification of the sensing device and switching output. Its particular wiring arrangement and load must be assessed against the selected equipment documentation before any practical application.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Contact state must be defined by the complete circuit</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>NO, NC, and COM describe contact arrangements, but the relevant reference state must come from the switching diagram. An electronic device may also have an output affected by supply power, configuration, or startup behavior. The controller’s displayed “flow proven” state is a separate interpretation of that electrical signal.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The <a href="https://designcenter.danfoss.com/products/climate-solutions-for-cooling/switches/flow-switches/fqs/p/061H4005">Danfoss FQS 061H4005 product specifications</a> identify an SPDT contact arrangement and list separate increasing-flow and decreasing-flow switching ranges for different pipe sizes. This demonstrates why a single unexplained setpoint is insufficient for commissioning.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Illustrative training circuit:</strong> a dedicated contact closes when sufficient flow is established, and a controller interprets the closed loop as “flow proven.” This is an educational example, not a universal wiring specification.</p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Condition</th><th>Expected input in the example</th><th>Required interpretation</th></tr></thead><tbody><tr><td>No qualifying flow</td><td>Open; flow not proven</td><td>Protected load remains inhibited.</td></tr><tr><td>Flow above the increasing-flow switching point</td><td>Closed; flow proven</td><td>Flow permission exists; other permissions remain necessary.</td></tr><tr><td>Flow below the decreasing-flow reset point</td><td>Open; flow not proven</td><td>Apply the documented loss-of-flow response.</td></tr><tr><td>Broken loop conductor</td><td>Open; flow not proven</td><td>Investigate wiring as well as the process condition.</td></tr><tr><td>Shorted conductors or stuck-closed contact</td><td>May appear closed despite insufficient flow</td><td>The simple input can give false proof; independent diagnostics may be needed.</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>An open-to-inhibit loop can reveal an open conductor, but it cannot detect every failure. Contact welding, a short across the input, or incorrect software interpretation can defeat that behavior. Protective requirements must be established for the complete system; a standard flow switch alone does not establish a safety-rated function.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Thresholds, differential, and time</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An increasing-flow operating point and a decreasing-flow reset point may differ. Their separation is the switching differential. Response time and any controller delay are separate quantities: differential concerns the process value; delay concerns elapsed time.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Original classroom example:</strong> a training switch closes at 12 L/min as flow rises and opens at 10 L/min as flow falls. The differential is 2 L/min. At 11 L/min, contact state depends on the previous operating state. The example values are hypothetical and are not a manufacturer setting recommendation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A startup sequence may allow a pump to establish circulation before evaluating proof. That allowance must expire without enabling the protected load when proof is absent. A timer alone cannot establish flow. The approved sequence must also define the running response to lost proof and whether restart requires acknowledgement.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 2: Installation considerations</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Li-OREapbaA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Li-OREapbaA
</div><figcaption class="wp-element-caption"><em>Thomas Products — Flow Switch Installation: Model 1800/1801. A model-specific manufacturer installation tutorial.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><a href="https://thomasproductsusa.com/products/1801-series-pump-control">Thomas Products provides separate installation and maintenance resources</a> for these models. The tutorial illustrates the importance of following the exact product procedure; it is not a universal method for installing a paddle or thermal switch.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Selection and installation review</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Record the exact model, fluid, permitted temperature and pressure, wetted-material compatibility, and required switching range.</li><li>Check pipe size, flow direction, mounting orientation, insertion depth, and any required straight pipe lengths against the selected manual.</li><li>Confirm contact or transistor-output type, supply requirements, load rating, and compatibility with the controller input. A switching output must not be assumed capable of carrying a motor load.</li><li>Identify the protected equipment and the sensing location. Flow in a main header does not automatically establish adequate flow through every parallel branch.</li><li>Document the required startup, running, alarm, shutdown, and restart behavior.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Troubleshooting a flow-not-proven alarm</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Diagnosis should follow the process and signal path systematically. A flow alarm is evidence that a required condition has not been established by the controls; it is not, by itself, a diagnosis of a failed switch.</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Review the operating state.</strong> Determine whether circulation is commanded and whether the controller is still in a documented startup interval.</li><li><strong>Establish the actual process condition.</strong> Use approved measurements and operating records to assess flow. Inspect permitted external indicators, valve positions, and reported pump faults.</li><li><strong>Review installation and settings.</strong> Compare sensor location, model, threshold, orientation, and fluid conditions with the design record.</li><li><strong>Separate the electrical stages.</strong> Under an approved test procedure, compare switch output, wiring continuity, and controller input interpretation. Resistance or continuity testing requires an isolated, de-energized circuit.</li><li><strong>Test restoration and loss of proof.</strong> During authorized commissioning, verify both transitions and the final equipment response. Record measured switching points and any delay.</li></ol>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>The work boundary follows the equipment energy-control procedure. <a href="https://www.osha.gov/laws-regs/regulations/standardnumber/1910/1910.333">OSHA 1910.333</a> addresses de-energization, lockout/tagout, and verification of the de-energized condition. A flow-proving interlock is not an energy-isolating device. Pipework can also retain pressure and hot liquid after electrical shutdown; mechanical isolation and pressure relief must follow the applicable procedure.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 3: Manufacturer maintenance demonstration</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=S9Wj-NgezrI","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=S9Wj-NgezrI
</div><figcaption class="wp-element-caption"><em>Thomas Products — Flow Switch Maintenance: Model 1800/1801. A model-specific tutorial on maintenance and cleaning.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p>Cleaning and inspection must follow the selected manufacturer’s procedure after the required electrical and fluid isolation. A maintenance demonstration does not authorize disassembly of a pressurized operating circuit.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Cooling-system application</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Original instructional scenario:</strong> a liquid-cooled computing branch has a circulation pump, a flow-proving input, and an enable signal for the heat-producing load. If the pump is commanded but flow remains unproven, the load remains inhibited and an alarm identifies the missing condition. If proof disappears during operation, the controller applies the documented protective response.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If another parallel branch continues operating, a header indication may still look normal. The commissioning record must identify what the installed sensor actually proves. This distinction is relevant to chilled-water systems, coolant distribution units, and hydro-cooled mining equipment.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Exercises</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>State-table exercise:</strong> using the hypothetical 12 L/min close and 10 L/min open thresholds, determine the contact state while flow rises through 9, 11, and 13 L/min, then falls through 11 and 9 L/min. Begin with the contact open.</li><li><strong>Fault-isolation exercise:</strong> a controller reports flow not proven although an approved independent measurement confirms adequate flow. List at least three signal-path faults and the evidence needed to distinguish them.</li><li><strong>Supervised training exercise:</strong> use a purpose-built, protected low-voltage water-flow trainer with a rated switch and documented isolation procedure. Record the exact model, expected contact logic, increasing-flow point, decreasing-flow point, and output response time. Wiring changes occur only with the trainer isolated; demonstrations use protected connections.</li><li><strong>Acceptance-record exercise:</strong> write separate acceptance statements for startup without flow, normal flow, loss of flow, and a simulated open input conductor. State which failures the simple loop cannot detect.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Does a pump-running signal establish adequate circulation through every cooled branch?</li><li>How does a flow switch differ from a flow transmitter?</li><li>What is the difference between switching differential and response delay?</li><li>Why can a normally open flow-proving contact produce a false healthy indication?</li><li>Can an interlock replace lockout/tagout?</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Answer guide</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>State-table exercise:</strong> rising at 9 L/min: open; rising at 11: open; rising at 13: closed; falling at 11: closed; falling at 9: open. The state at 11 L/min retains the preceding state because neither switching threshold has been crossed.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Fault isolation:</strong> possible faults include an incorrect contact pair, a damaged conductor, an unpowered electronic switch, and an incorrectly configured controller input. Compare the documented switch state with the observed output and then the received input under the authorized test procedure. Adequate flow at a different location is not equivalent evidence.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Knowledge check:</strong> (1) No; command or motor status does not independently establish branch circulation. (2) A switch provides a threshold state; a transmitter provides a measured or proportional value. (3) Differential is a separation in process value; delay is a separation in time. (4) A shorted input path or stuck-closed contact may imitate normal proof. (5) No; isolation requires the applicable energy-control procedure.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Technical conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Flow proving links a physical circulation condition to an operating permission. Reliable diagnosis requires a defined sensing location, documented switching behavior, verified signal interpretation, and demonstrated equipment response to both established and lost flow.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><em>Advertisement</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><strong><em>Editor’s Note:</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>This educational publication supports technical study. Equipment manuals, approved drawings, and site procedures govern field implementation. Independent daily research on BitcoinVersus.Tech is supported by voluntary donations at Bitcoin address: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p>
<!-- /wp:paragraph -->