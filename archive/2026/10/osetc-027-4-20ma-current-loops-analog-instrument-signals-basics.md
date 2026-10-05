<!-- wp:paragraph {"fontSize":"large"} -->
<p class="has-large-font-size"><strong>A 4–20 mA current loop converts a continuously varying process measurement into a standardized electrical current that can travel from a field transmitter to a PLC, DCS, indicator, or other receiver.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>OSETC.027</strong> follows <a href="https://bitcoinversus.tech/2026/10/04/osetc-026-flow-switches-flow-proving-basics/"><strong>OSETC.026: Flow Switches and Flow-Proving Basics</strong></a>. The previous technician lessons concentrated on discrete process switches: <a href="https://bitcoinversus.tech/2026/10/03/osetc-024-pressure-switches-pressure-control-basics/"><strong>pressure</strong></a>, <a href="https://bitcoinversus.tech/2026/10/04/osetc-025-temperature-switches-thermostat-control-basics/"><strong>temperature</strong></a>, and flow. This lesson moves from simple ON/OFF process indication to proportional analog measurement.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Explain why 4 mA represents the lower end of the normal measurement range and 20 mA represents the upper end.</li><li>Identify the transmitter, DC supply, wiring, and receiving analog input in a basic current loop.</li><li>Convert between loop current, percent of span, and engineering units.</li><li>Distinguish common 2-wire and separately powered transmitter arrangements.</li><li>Evaluate loop resistance and available supply voltage before assuming a wiring fault.</li><li>Measure, source, and simulate current safely during supervised troubleshooting.</li><li>Separate sensor, transmitter, wiring, power-supply, analog-input, and scaling faults.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><strong>Prerequisite safety:</strong> current-loop troubleshooting does not replace electrical energy-control procedures. <a href="https://bitcoinversus.tech/2026/09/30/osetc-011-lockout-tagout-energy-isolation/"><strong>OSETC.011: Lockout/Tagout and Energy Isolation</strong></a> establishes the isolation boundary for technician work.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why 4–20 mA is used</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A current loop represents a measured process variable by controlling the current in a series circuit. At the normal lower range value, the transmitter outputs 4 mA. At the normal upper range value, it outputs 20 mA. Intermediate process values produce intermediate currents.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The 4 mA lower endpoint is commonly called a <strong>live zero</strong>. A valid process reading of 0% therefore does not require the signal current to fall to zero. An open circuit or lost loop power can produce approximately 0 mA, giving the control system a way to distinguish a failed loop from a legitimate zero-scale process condition. Exact diagnostic thresholds above and below the normal 4–20 mA range depend on the transmitter, input module, and site standard.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><a href="https://www.fluke.com/en-us/learn/blog/calibration/what-is-a-4-20-ma-current-loop"><strong>Fluke’s 4–20 mA current-loop reference</strong></a> describes the format as a widely used industrial method for transmitting measurement signals over long distances. Current signaling is valuable because every component in a correctly wired series loop carries the same loop current even though conductor and receiver resistance consume part of the available supply voltage.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Basic loop anatomy</h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Element</th><th>Function</th></tr></thead><tbody><tr><td>Field sensor and transmitter</td><td>Measures pressure, temperature, level, flow, position, or another variable and regulates loop current to represent that value.</td></tr><tr><td>DC loop supply</td><td>Provides the electrical energy required by the transmitter and the series loop.</td></tr><tr><td>Field wiring</td><td>Carries loop current between field device and control system while adding conductor resistance.</td></tr><tr><td>Analog input or receiver</td><td>Measures loop current and converts it into a digital value or engineering-unit value for the controller.</td></tr><tr><td>Optional barriers, isolators, indicators, or test points</td><td>Add functionality but also consume part of the loop voltage budget.</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:code -->
<pre class="wp-block-code"><code>+24 VDC  →  transmitter  →  PLC analog input  →  0 VDC
                 4–20 mA series loop</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The drawing is conceptual. Actual polarity, terminal numbering, power-source location, intrinsic-safety barriers, shields, grounding, and analog-input configuration must follow the selected equipment documentation.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video: PLC analog signals and analog I/O</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=32wE5ypUuec","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=32wE5ypUuec
</div><figcaption class="wp-element-caption"><em>RealPars — Analog Inputs and Outputs in PLC Systems. Covers analog field signals, PLC analog input modules, direct sensor connections, and analog output applications.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Current, percent of span, and engineering units</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The usable measurement span is 16 mA because:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>20 mA − 4 mA = 16 mA</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Percent of span can be calculated from measured loop current:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Percent = ((I_mA − 4) / 16) × 100</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For a transmitter whose lower range value is <code>LRV</code> and upper range value is <code>URV</code>:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>PV = LRV + ((I_mA − 4) / 16) × (URV − LRV)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The reverse conversion is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>I_mA = 4 + 16 × ((PV − LRV) / (URV − LRV))</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Worked scaling example</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Assume a pressure transmitter is ranged from 0 to 100 psi and outputs 4–20 mA.</p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Loop current</th><th>Percent of span</th><th>Pressure</th></tr></thead><tbody><tr><td>4 mA</td><td>0%</td><td>0 psi</td></tr><tr><td>8 mA</td><td>25%</td><td>25 psi</td></tr><tr><td>12 mA</td><td>50%</td><td>50 psi</td></tr><tr><td>16 mA</td><td>75%</td><td>75 psi</td></tr><tr><td>20 mA</td><td>100%</td><td>100 psi</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>For a 12 mA signal:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Percent = ((12 − 4) / 16) × 100
Percent = 50%

PV = 0 + 0.50 × (100 − 0)
PV = 50 psi</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This arithmetic is fundamental during commissioning. A transmitter can be producing the correct current while the HMI displays the wrong engineering value because the PLC channel or software scaling is configured for the wrong range.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video: decoding the 4–20 mA signal</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=TA64_6EMCyc","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=TA64_6EMCyc
</div><figcaption class="wp-element-caption"><em>Instrumentation Tools — Decoding 4-20 mA Loop. Demonstrates current-loop scaling and calculation with an instrumentation example.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Two-wire and separately powered transmitters</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A common <strong>2-wire loop-powered transmitter</strong> uses the same two conductors for operating power and measurement current. The transmitter regulates the current flowing through itself and the receiver. This arrangement reduces field wiring, but the transmitter must operate within the voltage available after wiring and receiver drops are accounted for.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A <strong>separately powered transmitter</strong> receives operating power independently and drives or controls its signal output through separate terminals. Some devices are described as 3-wire or 4-wire depending on the power and signal arrangement. The label alone is not enough to determine terminal polarity or whether the output is sourcing, sinking, active, or passive; the wiring diagram for the exact model controls the installation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><a href="https://www.realpars.com/blog/transmitter"><strong>RealPars’ transmitter reference</strong></a> distinguishes common 2-wire and 4-wire arrangements and places the transmitter between the process sensor and the control system.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Loop voltage and burden resistance</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A current loop can regulate the intended current only while sufficient voltage remains available across the transmitter. Every series resistance consumes voltage according to Ohm’s law.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Vdrop = I × R</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>An engineering check can be written as:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Vsupply ≥ Vtransmitter_required + Icheck × Rseries_total</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>Rseries_total</code> includes cable resistance, input resistance, barriers, indicators, and any other series burden. <code>Icheck</code> must follow the maximum current required by the device or site design, not an assumed 20 mA if the transmitter can intentionally drive above the nominal range for diagnostics.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>National Instruments’ <a href="https://www.ni.com/en/shop/data-acquisition/fundamentals--system-design--and-setup-for-the-4-to-20-ma-curren.html"><strong>current-loop design reference</strong></a> emphasizes system resistance, power supply, and current measurement as part of loop design rather than treating the transmitter as an isolated component.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">PLC analog input configuration</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A PLC analog input channel must be configured for the correct electrical signal type and range. A voltage input configured where a current signal is expected, an incorrect terminal position, a missing shunt arrangement on hardware that requires one, or incorrect engineering-unit scaling can all produce misleading values.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Confirm the module part number and channel number.</li><li>Confirm whether the selected terminal is intended for current or voltage input.</li><li>Confirm channel range and polarity.</li><li>Confirm raw-data and engineering-unit scaling.</li><li>Confirm any open-wire, underrange, overrange, or channel-status diagnostics.</li><li>Compare the displayed value with an independently measured or simulated signal.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>RealPars’ <a href="https://www.realpars.com/blog/plc-analog-io"><strong>PLC analog I/O reference</strong></a> identifies 4–20 mA as a common standardized analog signal and shows how one analog input module can receive measurements representing pressure, flow, level, or other process variables.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Measuring loop current safely</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An ammeter is inserted <strong>in series</strong> with the loop. Placing a meter configured for current directly across a power supply can create a very low-resistance path, blow the meter fuse, damage equipment, or create a hazardous condition. The approved test point, terminal-block method, and work boundary must therefore be identified before opening the loop.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Opening a running process loop can also force the controller input to an abnormal value and may cause alarms, trips, valve movement, or automatic control action. Live-loop testing requires the applicable operating permit, process coordination, equipment manual, and electrical safety procedure.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video: source, simulate, and troubleshoot a current loop</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=dzQYv2m6ApA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=dzQYv2m6ApA
</div><figcaption class="wp-element-caption"><em>RealPars — What is an Instrument Calibrator? Explains signal-reference calibrators, source mode, simulate mode, and troubleshooting of a 2-wire current loop.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Source, simulate, and measure are different test modes</h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Mode</th><th>Purpose</th><th>Typical technician use</th></tr></thead><tbody><tr><td>Measure</td><td>Reads the current already flowing in the loop.</td><td>Verify what the transmitter is actually sending.</td></tr><tr><td>Source</td><td>The calibrator actively generates a selected current.</td><td>Test a receiving device or analog input independently of the transmitter.</td></tr><tr><td>Simulate</td><td>The calibrator behaves like a loop-powered transmitter and relies on loop power.</td><td>Replace a 2-wire transmitter temporarily to test the rest of the powered loop.</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>Mode names and terminal assignments vary by calibrator. The selected mode must be verified before leads are connected. A device configured to source current is not electrically equivalent to a passive simulator.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A disciplined troubleshooting sequence</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Confirm the process complaint.</strong> Record the HMI value, alarm state, affected channel, and expected process condition.</li><li><strong>Review the loop drawing.</strong> Identify the transmitter, supply, barriers, terminals, PLC module, channel, and configured engineering range.</li><li><strong>Check transmitter status and supply conditions.</strong> Use approved voltage measurements and device diagnostics before disturbing the loop.</li><li><strong>Measure loop current at an approved point.</strong> Compare measured current with the process value expected from the transmitter range.</li><li><strong>Compare field current with PLC raw input.</strong> If the current is correct but the raw input is wrong, investigate the analog-input channel, wiring, or module.</li><li><strong>Compare raw input with scaled engineering units.</strong> If raw current is correct but the HMI value is wrong, investigate scaling, range, or software mapping.</li><li><strong>Use a calibrator when authorized.</strong> Source or simulate known values such as 4, 8, 12, 16, and 20 mA and verify the full signal path.</li><li><strong>Restore the loop and document results.</strong> Confirm normal process indication, alarms, interlocks, and controller behavior after testing.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common fault patterns</h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Observation</th><th>Possible causes to investigate</th></tr></thead><tbody><tr><td>Approximately 0 mA</td><td>Open conductor, lost supply, blown fuse, incorrect terminal, disconnected transmitter, or failed field device.</td></tr><tr><td>Current fixed near 4 mA while process should be above minimum</td><td>Actual process at lower range, sensor fault, transmitter configuration issue, frozen measurement, or process impulse-path problem.</td></tr><tr><td>Measured current is correct but PLC value is wrong</td><td>Wrong analog-input type, channel wiring, module configuration, raw-data interpretation, or scaling.</td></tr><tr><td>Signal becomes inaccurate only near upper range</td><td>Insufficient loop voltage, excessive series resistance, transmitter limitation, or input burden problem.</td></tr><tr><td>Reading is unstable</td><td>Process instability, loose termination, shield/grounding issue, electrical interference, failing transmitter, or inadequate power quality.</td></tr><tr><td>All loops sharing a supply fail together</td><td>Common power-supply, fuse, distribution, grounding, or upstream control-power problem.</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>The table is a diagnostic starting point, not a substitute for the equipment manual or site procedure. Similar symptoms can have different causes, and current-loop faults should be isolated by measurement rather than by replacing components at random.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Commissioning acceptance checks</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Verify tag, transmitter model, process range, and engineering units against the approved drawing and instrument data sheet.</li><li>Verify supply polarity, loop terminals, shielding, grounding, barriers, and analog-input channel assignment.</li><li>Verify the loop has adequate voltage margin at the required current and installed burden.</li><li>Apply known current values across the range and record PLC or DCS readings.</li><li>Confirm 4 mA equals the configured lower range value and 20 mA equals the upper range value.</li><li>Check at least one intermediate value, preferably several points including 12 mA.</li><li>Verify underrange, overrange, open-loop, and channel diagnostic behavior according to the approved design.</li><li>Confirm alarms, interlocks, trends, and HMI units where they depend on the analog value.</li><li>Restore all temporary test leads, terminal links, bypasses, and software forces before returning the loop to service.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use a de-energized training panel or supervised low-voltage instrumentation trainer containing a 24 VDC supply, a simulated 4–20 mA transmitter or calibrator, and an analog input or meter.</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Identify the positive and negative loop terminals from the training diagram.</li><li>Configure the source or simulator according to its manual.</li><li>Apply 4 mA, 8 mA, 12 mA, 16 mA, and 20 mA.</li><li>Record the displayed percent of span for every point.</li><li>Configure a hypothetical range of 0–250 psi and calculate the expected engineering value at each current.</li><li>Add a known series resistance supplied by the instructor and calculate its voltage drop at 20 mA.</li><li>Reduce the available supply voltage only within the trainer’s approved limits and observe when the loop can no longer maintain the commanded current.</li><li>Restore the original wiring and verify the full range again.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge check</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1. Why does the normal range begin at 4 mA instead of 0 mA?</strong></p>
<!-- /wp:paragraph -->
<!-- wp:paragraph -->
<p><strong>2. What current represents 50% of a normal 4–20 mA span?</strong></p>
<!-- /wp:paragraph -->
<!-- wp:paragraph -->
<p><strong>3. A 0–200 °C transmitter is producing 8 mA. What temperature does that represent?</strong></p>
<!-- /wp:paragraph -->
<!-- wp:paragraph -->
<p><strong>4. Why can excessive loop resistance cause a high-end measurement problem?</strong></p>
<!-- /wp:paragraph -->
<!-- wp:paragraph -->
<p><strong>5. Where is an ammeter placed when directly measuring loop current?</strong></p>
<!-- /wp:paragraph -->
<!-- wp:paragraph -->
<p><strong>6. What is the difference between source and simulate modes on a process calibrator?</strong></p>
<!-- /wp:paragraph -->
<!-- wp:paragraph -->
<p><strong>7. If 12 mA is measured correctly in the field but the HMI displays 20% instead of 50%, what part of the signal chain should be investigated next?</strong></p>
<!-- /wp:paragraph -->
<!-- wp:paragraph -->
<p><strong>8. Does an approximately 0 mA reading automatically prove the transmitter itself has failed?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Answer key</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1.</strong> The 4 mA live zero allows a legitimate 0% process value to remain distinguishable from an open or unpowered loop near 0 mA.<br><strong>2.</strong> 12 mA.<br><strong>3.</strong> 50 °C. Eight milliamps is 25% of the 16 mA span, and 25% of 200 °C is 50 °C.<br><strong>4.</strong> Series resistance consumes supply voltage. At higher current the voltage drop increases, and the transmitter may run out of compliance voltage before reaching the commanded current.<br><strong>5.</strong> In series with the loop at an approved test point or opened connection.<br><strong>6.</strong> Source mode actively generates current; simulate mode behaves like a loop-powered transmitter and uses the loop’s power source.<br><strong>7.</strong> Investigate the analog-input configuration, raw-data interpretation, engineering scaling, and HMI mapping.<br><strong>8.</strong> No. Lost supply, open wiring, a blown fuse, a disconnected device, or other loop faults can also produce approximately 0 mA.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>A 4–20 mA loop is a complete measurement circuit, not merely a transmitter output.</strong> Correct troubleshooting requires verifying the process range, loop power, series burden, measured current, analog-input configuration, and software scaling as separate stages. A technician who can move methodically from field measurement to controller value can isolate faults without guessing.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Technical references</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.fluke.com/en-us/learn/blog/calibration/what-is-a-4-20-ma-current-loop">Fluke — What Is a 4–20 mA Current Loop?</a></li><li><a href="https://www.realpars.com/blog/plc-analog-io">RealPars — Analog Inputs and Outputs in PLC Systems</a></li><li><a href="https://www.realpars.com/blog/instrument-calibrator">RealPars — What Is an Instrument Calibrator?</a></li><li><a href="https://www.ni.com/en/shop/data-acquisition/fundamentals--system-design--and-setup-for-the-4-to-20-ma-curren.html">National Instruments — 4–20 mA Current Loop Fundamentals, System Design, and Setup</a></li></ul>
<!-- /wp:list -->