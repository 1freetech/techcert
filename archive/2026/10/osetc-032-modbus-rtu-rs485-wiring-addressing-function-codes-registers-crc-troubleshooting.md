---
title: "OSETC.032: Modbus RTU Over RS-485 — Two-Wire Bus, Addressing, Function Codes, Registers, CRC, and Troubleshooting"
status: published
wordpress_post_id: 22575
published: "2026-10-09T09:25:30"
modified: "2026-10-09T09:25:30"
live_url: "https://bitcoinversus.tech/2026/10/09/osetc-032-modbus-rtu-rs485-wiring-addressing-function-codes-registers-crc-troubleshooting/"
series: "Open Source Electrical Technician Certification"
subject: electrical_technician
lesson_number: "032"
featured_media_id: 22571
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-032-modbus-rtu-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22573
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-032-modbus-rtu-rs485-body.png"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=KBaLeWZdQ54"
youtube_2: "https://www.youtube.com/watch?v=aAr6G2J-dO4"
youtube_3: "https://www.youtube.com/watch?v=7pdVKdAg2J0"
social_1: "https://twitter.com/dienphucthinh/status/1965349328702374024"
seo_title: "OSETC.032: Modbus RTU Over RS-485 — Wiring, Registers & Troubleshooting"
seo_description: "Learn Modbus RTU over RS-485: bus wiring, termination, serial settings, addressing, function codes, registers, CRC, offsets, and practical troubleshooting."
no_text_boxes: true
youtube_minimum_met: 3
---

<!-- wp:paragraph -->
<p><strong>Modbus RTU is one of the most common ways industrial devices exchange small amounts of control and measurement data over serial wiring.</strong> A PLC, drive, meter, remote I/O module, or instrument can share one RS-485 bus as long as the devices agree on the electrical wiring, serial settings, device addresses, and Modbus message format.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/08/osetc-031-hart-communication-digital-data-4-20ma-fsk-field-communicators/"><strong>OSETC.031: HART Communication</strong></a>, <a href="https://bitcoinversus.tech/2026/10/07/osetc-030-process-transmitter-calibration-zero-span-lrv-urv-4-20ma-as-found-as-left/"><strong>OSETC.030: Process Transmitter Calibration</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/05/osetc-027-4-20ma-current-loops-analog-instrument-signals-basics/"><strong>OSETC.027: 4–20 mA Current Loops</strong></a>. HART adds digital information to an analog current loop; Modbus RTU instead moves structured digital messages over a serial data link.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What Modbus RTU is and what RS-485 contributes.</li><li>How a two-wire multidrop RS-485 bus is normally arranged.</li><li>Why baud rate, parity, data bits, and stop bits must match.</li><li>How device addresses, function codes, coils, and registers work.</li><li>What a Modbus RTU frame contains and why CRC matters.</li><li>How to recognize common wiring, configuration, addressing, and timing faults.</li><li>How to perform a basic technician-level Modbus RTU checkout.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Start With The Two Layers</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>It helps to separate <strong>RS-485</strong> from <strong>Modbus RTU</strong>. RS-485 describes the electrical serial interface: differential signaling over a balanced pair, multidrop wiring, and physical-layer behavior. Modbus RTU defines the messages carried over that link: device address, function code, data, timing, and CRC error checking. A device can use RS-485 without Modbus, and Modbus can also run over transports other than RS-485.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=KBaLeWZdQ54","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=KBaLeWZdQ54
</div><figcaption class="wp-element-caption"><em>PLC Programming Tutorials Tips and Tricks — a practical Modbus RTU overview covering RS-485, master/slave polling, frame structure, holding-register reads, and common troubleshooting mistakes.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22573,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-032-modbus-rtu-rs485-body.png" alt="Original diagram of a two-wire Modbus RTU RS-485 bus with a PLC master, VFD, meter, remote I/O, A and B differential lines, and 120-ohm termination at both physical ends." class="wp-image-22573" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech diagram: a basic two-wire RS-485 multidrop bus with unique device addresses and termination at the two physical ends.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Wire RS-485 As A Bus</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A typical two-wire RS-485 installation uses one differential pair running from device to device. The physical ends of the bus are terminated to match the cable impedance; 120 Ω is common in industrial RS-485 practice. Long star branches and excessive stubs can create reflections and unreliable communication, especially as cable length and baud rate increase.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Terminal labels are a field trap. Vendors may use A/B, D+/D−, +/−, or other conventions, and the A/B naming convention is not perfectly consistent across every product family. If communication fails after a new device is added, verify the manufacturer’s terminal definitions rather than assuming the letters mean the same thing on both devices.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=aAr6G2J-dO4","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=aAr6G2J-dO4
</div><figcaption class="wp-element-caption"><em>Paolo Aliverti — Modbus RTU on RS-485, including frame structure, master/slave topology, RS-485 bus management, and common function codes.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:embed {"url":"https://twitter.com/dienphucthinh/status/1965349328702374024","type":"rich","providerNameSlug":"twitter","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-twitter wp-block-embed-twitter"><div class="wp-block-embed__wrapper">
https://twitter.com/dienphucthinh/status/1965349328702374024
</div><figcaption class="wp-element-caption"><em>A directly relevant RS-485 field post highlighting twisted-pair cable, shielding, long-distance industrial use, Modbus/SCADA applications, and end-of-line termination.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Match The Serial Settings</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Every device on a Modbus RTU segment must use compatible serial framing. The important settings are <strong>baud rate</strong>, <strong>parity</strong>, <strong>data bits</strong>, and <strong>stop bits</strong>. A common field configuration is written in a compact form such as <code>19200 8E1</code>: 19,200 bit/s, 8 data bits, even parity, and 1 stop bit.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Example serial configuration
Baud rate: 19200
Data bits: 8
Parity: Even
Stop bits: 1
Mode: Modbus RTU</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If one device is set to 9600 baud and the rest are at 19200, the wiring can be perfect and communication will still fail. The same is true for parity mismatch. Always record the working serial settings before changing them.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Give Every Server A Unique Address</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>On a traditional Modbus serial line, one client/master initiates requests and addressed server/slave devices respond. The Modbus serial-line guide allows normal slave addresses from <strong>1 through 247</strong>; address 0 is reserved for broadcast behavior. Two devices with the same address can produce collisions, confusing responses, or apparent intermittent faults.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A basic commissioning sheet should record the physical device, its RS-485 address, baud/parity settings, and the register map being used.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Device        Address    Serial settings
VFD-1         1          19200 8E1
Power meter   2          19200 8E1
Remote I/O    3          19200 8E1</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Understand Function Codes And Data Types</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Modbus messages use <strong>function codes</strong> to say what operation is requested. The official Modbus application protocol defines common functions such as 01 Read Coils, 02 Read Discrete Inputs, 03 Read Holding Registers, 04 Read Input Registers, 05 Write Single Coil, 06 Write Single Register, 15 Write Multiple Coils, and 16 Write Multiple Registers.</p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Function</th><th>Typical Meaning</th><th>Data Type</th></tr></thead><tbody><tr><td>01</td><td>Read coils</td><td>1-bit outputs/status</td></tr><tr><td>02</td><td>Read discrete inputs</td><td>1-bit inputs</td></tr><tr><td>03</td><td>Read holding registers</td><td>16-bit registers</td></tr><tr><td>04</td><td>Read input registers</td><td>16-bit registers</td></tr><tr><td>05</td><td>Write single coil</td><td>1 bit</td></tr><tr><td>06</td><td>Write single register</td><td>16 bits</td></tr><tr><td>15</td><td>Write multiple coils</td><td>Multiple bits</td></tr><tr><td>16</td><td>Write multiple registers</td><td>Multiple 16-bit registers</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>Do not guess a register map. A drive may place output frequency in one holding register while a power meter uses completely different addresses and scaling. Use the exact manufacturer register table for the device and firmware version being commissioned.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=7pdVKdAg2J0","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=7pdVKdAg2J0
</div><figcaption class="wp-element-caption"><em>Andrés Felipe Hurtado Banguero — a practical walkthrough of Modbus function codes including 01/02/03/04/05/06/15/16 and live RTU read/write examples.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read A Basic RTU Frame</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A Modbus RTU request contains the target device address, a function code, function-specific data, and a two-byte <strong>CRC</strong> error-check value. For example, a request to read holding registers might conceptually contain:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>[Address] [Function] [Start Address] [Quantity] [CRC]
   01        03          0000          0002     ....</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The receiver recalculates the CRC from the received bytes. If the calculated value does not match the transmitted CRC, the frame is considered corrupted. CRC failures often point technicians toward electrical noise, wiring faults, incorrect serial interpretation, or damaged frames—not toward an incorrect engineering value in a register.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Remember The Addressing Offset Trap</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Modbus documentation can show human-readable register numbers such as <code>40001</code>, while the protocol request itself may use a zero-based address such as <code>0</code>. The official protocol specification defines PDU addresses starting at zero for many functions. Software packages and vendor manuals do not all display addresses the same way, so an apparent “off-by-one” problem is extremely common.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If the device responds but the value is wrong or the software reports an illegal data address, check whether the tool expects zero-based offsets, five-digit reference numbers, or the raw address from the vendor register map.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Troubleshoot In A Fixed Order</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Power:</strong> verify every field device is powered and healthy.</li><li><strong>Physical pair:</strong> confirm the RS-485 conductors and reference/shield arrangement match the device manuals.</li><li><strong>Topology:</strong> verify bus wiring, termination at the two physical ends, and reasonable stub lengths.</li><li><strong>Serial settings:</strong> confirm baud rate, parity, data bits, and stop bits.</li><li><strong>Address:</strong> confirm the target device address is unique and matches the poll.</li><li><strong>Function:</strong> confirm the device supports the requested function code.</li><li><strong>Register:</strong> confirm the register address, offset convention, data type, byte/word order, and scaling.</li><li><strong>Traffic:</strong> look for requests leaving the master and responses returning from the correct slave.</li><li><strong>CRC/errors:</strong> investigate noise, polarity, grounding, shielding, cable, and timing when corrupted frames appear.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Use A Known-Good Poll First</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before attempting writes, prove that you can read one known register from one device. A good first test is a read-only value that is easy to verify locally, such as measured line voltage, device status, frequency, temperature, or firmware identification. Once one known read succeeds, expand the poll gradually.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A technician should avoid random writes to live drives, breakers, outputs, or process equipment. Writing the wrong coil or register can start, stop, reset, or reconfigure real equipment. Use the vendor map, follow the site’s change-control and safety procedures, and test write operations only when the consequence is understood.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical Exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A power meter is configured for address 2, 19200 baud, 8 data bits, even parity, and 1 stop bit. The vendor manual says measured voltage is available using Function 03 at raw register offset 100 and returns one 16-bit value scaled by 0.1 V.</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Set the polling tool to <code>19200 8E1</code>.</li><li>Select Modbus RTU and slave/server address <code>2</code>.</li><li>Select Function 03 Read Holding Registers.</li><li>Enter starting offset <code>100</code> and quantity <code>1</code>.</li><li>If the raw response is <code>4032</code>, apply the scale factor: <code>4032 × 0.1 = 403.2 V</code>.</li><li>If no response arrives, return to wiring, serial settings, address, and bus termination before changing register scaling.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Is RS-485 the same thing as Modbus RTU?</strong> No. RS-485 is the physical serial interface; Modbus RTU is a protocol carried over it.</li><li><strong>What settings must match across the link?</strong> Baud rate, data bits, parity, stop bits, and RTU mode.</li><li><strong>Why must device addresses be unique?</strong> The master/client needs one unambiguous responder for each addressed request.</li><li><strong>What does Function 03 do?</strong> Read holding registers.</li><li><strong>What is the purpose of CRC?</strong> Detect corruption in the received RTU frame.</li><li><strong>Where is termination normally installed?</strong> At the two physical ends of the RS-485 bus.</li><li><strong>What is a common register-addressing mistake?</strong> Confusing displayed register numbers with zero-based protocol offsets.</li><li><strong>What is the safest first communication test?</strong> Read one known, read-only register whose value can be independently verified.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.modbus.org/modbus-specifications"><strong>Modbus Organization — Specifications and Implementation Guides</strong></a></li><li><a href="https://www.modbus.org/docs/Modbus_Application_Protocol_V1_1b3.pdf"><strong>Modbus Application Protocol Specification V1.1b3</strong></a></li><li><a href="https://www.modbus.org/docs/Modbus_over_serial_line_V1_02.pdf"><strong>Modbus Serial Line Protocol and Implementation Guide V1.02</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Modbus RTU troubleshooting becomes easier when you separate the layers.</strong> First prove the RS-485 bus is wired correctly. Then prove the serial settings match. Then prove the address and function code are correct. Finally verify the register map, offset convention, data format, and scaling. Moving through those layers in order is much faster than changing random settings.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is an original 1200×630 BitcoinVersus.Tech lesson cover created specifically for OSETC.032 and is not reused in the body. The body uses a separate original 1200×675 RS-485 bus diagram. The lesson contains three unique, directly relevant YouTube videos implemented as responsive native Gutenberg 16:9 embed blocks, plus a direct responsive <code>twitter.com/USERNAME/status/STATUS_ID</code> social embed. Ordinary lesson prose is not placed inside bordered, shaded, card, callout, panel, or fixed-width text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->