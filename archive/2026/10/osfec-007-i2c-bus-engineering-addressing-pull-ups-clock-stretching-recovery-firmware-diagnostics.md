---
post_id: 22950
title: "OSFEC.007: I²C Bus Engineering — Addressing, Pull-Ups, Clock Stretching, Recovery, and Firmware Diagnostics"
live_url: "https://bitcoinversus.tech/2026/10/10/osfec-007-i2c-bus-engineering-addressing-pull-ups-clock-stretching-recovery-firmware-diagnostics/"
featured_media_id: 22945
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osfec-007-i2c-bus-engineering-cover.jpg"
status: publish
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>I²C is a two-wire serial bus used to connect microcontrollers to sensors, EEPROMs, displays, power-management devices, and many other peripherals.</strong> Its two signals are serial data, <strong>SDA</strong>, and serial clock, <strong>SCL</strong>. The protocol is simple enough to learn quickly, but reliable products require more than calling a library function. Firmware engineers must understand addressing, open-drain electrical behavior, pull-up resistance, ACK/NACK handling, clock stretching, timeouts, bus recovery, and what real waveforms look like on an oscilloscope or logic analyzer.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/08/osfec-006-direct-memory-access-dma-moving-data-without-stalling-the-cpu/">OSFEC.006: Direct Memory Access</a> and complements the diagnostic habits used in <a href="https://bitcoinversus.tech/2026/10/10/osftc-007-spi-nor-flash-diagnostics-identification-backups-protection-verification/">OSFTC.007: SPI NOR Flash Diagnostics</a>. It also builds on the older BitcoinVersus.Tech primer <a href="https://bitcoinversus.tech/2025/03/12/serial-communication-and-its-role-in-data-transmission/">Serial Communication and Its Role in Data Transmission</a>. The goal is to move from “the sensor library works” to “I can explain and diagnose the bus electrically and in firmware.”</p>
<!-- /wp:paragraph -->

<!-- wp:html -->
<figure>[youtube https://www.youtube.com/watch?v=j9yx8LOslng]<figcaption><em>Texas Instruments introduces I²C electrical behavior, addressing, START/STOP conditions, and acknowledgements.</em></figcaption></figure>
<!-- /wp:html -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Why SDA and SCL use open-drain signaling and require pull-up resistors.</li><li>How 7-bit addressing, read/write direction, ACK, and NACK fit into a transaction.</li><li>How bus capacitance and rise-time limits constrain pull-up resistor values.</li><li>What clock stretching, arbitration, and repeated START mean to firmware.</li><li>How to recognize common faults such as a wrong address, missing pull-ups, a stuck-low line, or excessive rise time.</li><li>How to build timeouts and bus-recovery behavior into firmware rather than assuming the bus always succeeds.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">1. Why Two Wires Can Support Many Devices</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An I²C controller starts communication and generates the clock. Target devices listen for their address and respond when selected. Most everyday devices use a 7-bit address. One bus can therefore connect many peripherals as long as their addresses do not conflict and the electrical loading remains within specification.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A typical transaction begins with a <strong>START</strong> condition, followed by the target address and a direction bit. The receiver answers with <strong>ACK</strong> if it accepts the byte or <strong>NACK</strong> if it does not. Data bytes follow, each with its own ACK/NACK phase. The controller eventually sends <strong>STOP</strong>, unless it needs a repeated START to change direction without releasing the bus.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Address scanners are useful during bring-up because they ask each legal address whether a device acknowledges. They are not proof that a driver is correct. A scanner can find a device while your production transaction still fails because the register address, byte order, timing, voltage, or transaction sequence is wrong.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">2. Open-Drain Signaling Changes How You Think About Logic HIGH</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>I²C devices normally pull SDA and SCL <strong>LOW</strong> but do not actively drive them HIGH. When every device releases a line, an external pull-up resistor brings it back toward the supply voltage. This wired behavior allows multiple devices to share the bus without two outputs directly fighting each other.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The practical consequence is that a logic HIGH is not instantaneous. The pull-up resistor and total bus capacitance create an RC rise. Long traces, cables, connectors, level translators, more devices, and oscilloscope probes can all add capacitance. A bus that looks perfect at 100 kHz may fail when increased to 400 kHz because the signal no longer rises quickly enough.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">3. Engineering the Pull-Up Resistors</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Pull-up design is a range, not a magic value. The resistor must be <strong>large enough</strong> that a device can pull the line LOW without exceeding its sink-current limit, but <strong>small enough</strong> that the line rises within the timing requirement for the selected I²C mode.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A useful lower-bound equation is <strong>R<sub>P(min)</sub> = (V<sub>CC</sub> − V<sub>OL(max)</sub>) / I<sub>OL</sub></strong>. A useful upper-bound approximation from the I²C rise-time relationship is <strong>R<sub>P(max)</sub> = t<sub>r</sub> / (0.8473 × C<sub>b</sub>)</strong>. For an example 3.3 V bus with V<sub>OL(max)</sub> = 0.4 V and I<sub>OL</sub> = 3 mA, the minimum is about 967 Ω. If Fast-mode allows a 300 ns rise time and the bus capacitance is 100 pF, the maximum is about 3.54 kΩ. A standard value such as 2.2 kΩ falls inside that example range.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Those numbers are an example, not a universal recommendation. Real engineering uses the exact device limits, bus capacitance, operating mode, temperature range, voltage, and power budget. If the design barely meets the equation on paper, inspect the actual waveform rather than trusting the nominal resistor alone.</p>
<!-- /wp:paragraph -->

<!-- wp:html -->
<figure>[youtube https://www.youtube.com/watch?v=sGZe0aJsqBQ]<figcaption><em>Texas Instruments explains how to calculate I²C pull-up resistor limits from voltage, sink current, bus capacitance, and rise time.</em></figcaption></figure>
<!-- /wp:html -->

<!-- wp:paragraph -->
<p><em>Related social discussion:</em> <a href="https://www.linkedin.com/posts/vaibhav-khokhar1_embeddedsystems-i2c-debugging-activity-7430099029981638656-tEF1" rel="nofollow">I²C pull-up selection and field reliability on LinkedIn</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">4. Clock Stretching, Arbitration, and Repeated START</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A target may hold SCL LOW to delay the controller while it prepares data. This is <strong>clock stretching</strong>. A robust driver must know whether the MCU peripheral supports it, what timeout policy applies, and what should happen if the line never releases.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>I²C can also support multiple controllers. Arbitration works because a controller watches the actual bus while transmitting. If it releases SDA expecting HIGH but observes LOW, another controller has asserted LOW and won that bit. Even single-controller products benefit from understanding arbitration because the same open-drain electrical behavior explains why the bus can detect contention without destructive output fighting.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A <strong>repeated START</strong> lets a controller begin another transfer without issuing STOP. Register reads frequently use this pattern: write a register index, issue repeated START, switch to read, and then receive the requested bytes. Treating every read as a separate STOP/START sequence can break devices whose datasheets require a combined transaction.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22946,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osfec-007-i2c-bus-engineering-body.jpg" alt="Engineer diagnosing embedded hardware at an electronics bench with instruments and a microcontroller board" class="wp-image-22946" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech lesson artwork for OSFEC.007. Real I²C debugging combines firmware inspection with physical measurements.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">5. A Firmware Driver Needs Explicit Failure States</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Production firmware should distinguish at least these outcomes: success, address NACK, data NACK, timeout, arbitration loss, bus error, and bus-busy or stuck-line conditions. Collapsing all failures into a generic “I²C error” makes field diagnosis much harder because software loses the evidence needed to tell an absent device from a damaged bus.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a simple probe routine, the logic is conceptually: attempt the address, wait only for a bounded interval, record ACK or the specific error, and continue. For a production sensor driver, add bounded retries, timestamps, error counters, and a recovery policy. Do not build an infinite retry loop around a shared hardware bus.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A good driver also separates <strong>transport</strong> from <strong>device protocol</strong>. The I²C layer should know how to transmit and receive bytes reliably. A higher device layer should know that register 0x0F is an identity register, or that two bytes represent temperature. This separation makes it easier to test bus behavior independently from sensor interpretation.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">6. Bus Lockup and Recovery</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A common field failure occurs when SDA remains LOW after a reset, brownout, interrupted transaction, or target malfunction. Reinitializing the MCU peripheral alone may not help because the external device is still waiting for clock edges or a reset condition.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The NXP I²C specification defines bus-clear behavior. If SDA is stuck LOW, a controller can provide clock pulses so a target has a chance to finish its internal state and release SDA. If SCL itself is held LOW, the preferred recovery may require a device reset or power cycle. Firmware engineers should implement this only within the electrical and timing constraints of their hardware; some MCUs require temporarily switching I²C pins to GPIO for recovery.</p>
<!-- /wp:paragraph -->

<!-- wp:html -->
<figure>[embed]https://www.reddit.com/r/embedded/comments/rbtdta/i2c_bus_locked_up/[/embed]<figcaption><em>Embedded engineers discuss real I²C lockups, bus-clear behavior, and recovery strategies after SDA or SCL becomes stuck.</em></figcaption></figure>
<!-- /wp:html -->

<!-- wp:heading -->
<h2 class="wp-block-heading">7. Debug the Waveform, Not Just the API Return Code</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A logic analyzer answers digital questions: Was START present? Which address was transmitted? Did the target ACK? Was there a repeated START? Which byte NACKed? An oscilloscope answers electrical questions: Did the HIGH level reach a valid voltage? How long was the rise time? Is there ringing, noise, or a slow edge? Does SCL remain LOW during clock stretching?</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Use both views when possible. A logic decoder can display clean-looking bytes even when the analog margin is poor. Conversely, a beautiful square-looking waveform does not prove the software is talking to the correct address or register.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">8. Common Failure Patterns</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>No ACK at any address:</strong> verify power, ground, SDA/SCL pin mapping, pull-ups, voltage levels, and whether the target is held in reset.</li><li><strong>Device appears at the wrong address:</strong> check address-select pins and whether the datasheet quotes a 7-bit address or an 8-bit address byte.</li><li><strong>Works at 100 kHz but fails at 400 kHz:</strong> inspect rise time, total capacitance, pull-up value, and level translators.</li><li><strong>Random NACKs in the field:</strong> check supply integrity, EMI, connector quality, temperature, pull-up margin, and timeout handling.</li><li><strong>SDA stuck LOW after reset:</strong> investigate interrupted transfers, target state, bus-clear recovery, hardware reset, and power sequencing.</li><li><strong>Only one of two identical sensors works:</strong> check address conflicts; fixed-address devices may require configurable address pins, a multiplexer, or separate buses.</li><li><strong>Reads return shifted or nonsensical data:</strong> verify repeated START requirements, register width, byte order, signedness, and whether the correct register pointer was written first.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical Exercise</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Choose one I²C sensor datasheet and record its supply voltage, 7-bit address, maximum bus speed, register-address width, and repeated-START requirements.</li><li>Draw a controller, two targets, SDA, SCL, and two pull-up resistors. Explain why no device should normally drive either line HIGH.</li><li>For a hypothetical 3.3 V bus, calculate a pull-up range using the device sink-current limit and the bus rise-time/capacitance limit.</li><li>Write pseudocode for a bounded I²C address scanner that records ACK, NACK, and timeout separately.</li><li>Describe what you would expect to see on a logic analyzer when a target NACKs its address.</li><li>Write a recovery decision tree for SDA stuck LOW, SCL stuck LOW, and repeated transient NACKs.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Why are pull-ups required?</strong> Because I²C devices normally pull the shared lines LOW and release them for HIGH; the resistor creates the HIGH state.</li><li><strong>Why can a resistor be too large?</strong> The RC rise becomes too slow to meet the bus timing requirement.</li><li><strong>Why can a resistor be too small?</strong> Devices may have to sink excessive current to create a valid LOW.</li><li><strong>What does an ACK prove?</strong> A receiver accepted the preceding byte at the bus level; it does not prove the higher-level data is semantically correct.</li><li><strong>What is clock stretching?</strong> A target holds SCL LOW to delay the controller.</li><li><strong>Why is repeated START useful?</strong> It lets the controller continue a combined transaction, often switching from writing a register index to reading data without releasing the bus.</li><li><strong>What is the first tool for a mystery NACK?</strong> Start with the datasheet and a logic analyzer; use an oscilloscope when electrical margin is in question.</li><li><strong>What should firmware avoid?</strong> Infinite retries, unbounded waits, and error handling that discards the specific cause.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://cache.nxp.com/docs/en/user-guide/UM10204.pdf">NXP — UM10204 I²C-bus specification and user manual</a></li><li><a href="https://www.ti.com/lit/pdf/slva689">Texas Instruments — I²C Bus Pullup Resistor Calculation</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>I²C becomes much easier to engineer once you stop treating it as only a software library. SDA and SCL are shared electrical signals with real RC behavior. Addresses, ACK/NACK, repeated START, clock stretching, timeouts, pull-up sizing, and recovery all interact. A firmware engineer who can read the transaction and the waveform can solve problems that remain invisible when debugging only from application code.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor's Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This lesson uses original artwork created specifically for OSFEC.007. The featured image is not reused in the body. The equations and numerical example are educational; production designs should use the exact limits from the applicable I²C mode, MCU datasheet, peripheral datasheets, and measured bus capacitance.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->