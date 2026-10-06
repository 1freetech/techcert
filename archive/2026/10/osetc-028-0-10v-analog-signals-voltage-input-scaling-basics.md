---
title: "OSETC.028: 0–10 V Analog Signals and Voltage Input Scaling Basics"
status: published
wordpress_post_id: 21257
published: "2026-10-06T08:08:44"
modified: "2026-10-06T08:08:44"
live_url: "https://bitcoinversus.tech/2026/10/06/osetc-028-0-10v-analog-signals-voltage-input-scaling-basics/"
featured_media_id: 21256
track: "Open Source Electrical Technician Certification"
lesson: "OSETC.028"
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>A 0–10 V analog signal represents a continuously changing process value by varying DC voltage between a lower and upper endpoint.</strong> OSETC.028 follows <a href="https://bitcoinversus.tech/2026/10/05/osetc-027-4-20ma-current-loops-analog-instrument-signals-basics/"><strong>OSETC.027: 4–20 mA Current Loops and Analog Instrument Signals Basics</strong></a> and adds the other common analog signal family technicians meet in PLCs, drives, sensors, dampers, valves, and building controls.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=N8kM1d24lxw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=N8kM1d24lxw
</div><figcaption class="wp-element-caption"><em>AutomationDirect — Discrete vs. Analog Sensors. Explains how continuous analog signals such as 0–10 V and 4–20 mA represent changing process values.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning Objectives</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Explain how 0–10 V represents 0–100% of a process span.</li><li>Identify signal, common, power, and analog-input terminals.</li><li>Convert voltage into percent of span and engineering units.</li><li>Distinguish 0–10 V from ±10 V, 1–5 V, and 4–20 mA systems.</li><li>Recognize loading, grounding, shielding, common-reference, and noise problems.</li><li>Configure and verify a PLC voltage-input channel.</li><li>Troubleshoot a 0–10 V signal without guessing.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">How 0–10 V Represents a Process Variable</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>In the simplest linear arrangement, 0 V represents the lower range value and 10 V represents the upper range value. Five volts therefore represents 50% of span. A pressure sensor ranged 0–100 psi would ideally produce 0 V at 0 psi, 5 V at 50 psi, and 10 V at 100 psi.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=32wE5ypUuec","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=32wE5ypUuec
</div><figcaption class="wp-element-caption"><em>RealPars — Analog Inputs and Outputs in PLC Systems. Covers voltage and current analog signals, PLC analog modules, sensors, transmitters, and analog outputs.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Scaling Voltage Into Engineering Units</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>For a standard 0–10 V signal, percent of span is <strong>(V ÷ 10) × 100</strong>. For a transmitter with lower range value LRV and upper range value URV, the process value is <strong>PV = LRV + (V ÷ 10) × (URV − LRV)</strong>. The reverse conversion is <strong>V = 10 × (PV − LRV) ÷ (URV − LRV)</strong>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Example: a 0–250 psi transmitter produces 6 V. Six volts is 60% of span, so the expected process value is 150 psi. If a PLC raw count is correct but the HMI shows another value, the technician should investigate software scaling before replacing the sensor.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=WmZPORBgKI0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=WmZPORBgKI0
</div><figcaption class="wp-element-caption"><em>AutomationDirect — Sensing Distance With a Productivity PLC. Demonstrates both 4–20 mA and 0–10 V sensors, analog-channel configuration, raw counts, and engineering-unit scaling.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Basic 0–10 V Wiring</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A typical voltage-output sensor has operating-power terminals plus a signal-output terminal and signal common. The PLC analog input measures the voltage difference between its input terminal and the correct reference/common. Terminal names vary, so the exact sensor and module manuals control the wiring.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Unlike a 4–20 mA series loop, a voltage signal is normally measured in parallel by a high-impedance receiver. That is why the technician should never assume current-loop wiring rules apply to a 0–10 V circuit. Use the <a href="https://bitcoinversus.tech/2026/09/27/electrical-engineering-tech-doc-1-digital-multimeter-basics/"><strong>Digital Multimeter Basics</strong></a> lesson before taking field voltage measurements.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=JwSeulaHV6U","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=JwSeulaHV6U
</div><figcaption class="wp-element-caption"><em>ACC Automation — Wiring and Testing a 0–10 V Analog Input. Shows module power, signal wiring, raw values, and PLC use of a voltage input.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Input Impedance and Signal Loading</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A voltage-output device is designed to drive a limited load. The PLC or receiver should normally present a high input impedance so it does not pull the signal voltage down. Adding multiple receivers in parallel lowers the combined impedance and can create measurement error if the transmitter is not rated for that load.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>If one source must feed several devices, verify the transmitter’s load specification or use an approved signal isolator or splitter. Never assume several analog inputs can be added indefinitely just because each individual input reads 0–10 V.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=xySFpxkbCZo","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=xySFpxkbCZo
</div><figcaption class="wp-element-caption"><em>AutomationDirect — Analog Module Setup. Uses a variable DC source to simulate a 0–10 V device and verify analog-input counts in real time.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Noise, Grounding, and Common Reference</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Voltage signals are generally more sensitive than current loops to conductor resistance, ground-potential differences, and induced electrical noise. Long parallel runs beside motor leads, contactor wiring, variable-frequency-drive output cables, or other high-current conductors can disturb a low-level analog signal.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Use the cable type, shield termination, grounding method, separation distance, and isolation practices specified by the equipment manufacturer and site standard. A shield is not a substitute for a correct signal reference, and connecting commons incorrectly can create circulating current or offset errors.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=OGnCc5uvwio","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=OGnCc5uvwio
</div><figcaption class="wp-element-caption"><em>This hands-on 0–10 V PLC test shows how a variable voltage source can be used to observe analog-input response during troubleshooting.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">0–10 V Versus 4–20 mA</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>0–10 V:</strong> simple, common, easy to simulate with a voltage source, but more sensitive to voltage drop, reference errors, and noise.</li><li><strong>4–20 mA:</strong> current-based, better suited to long industrial cable runs, and provides a live-zero fault distinction near 0 mA.</li><li><strong>1–5 V:</strong> another common voltage range, often related to converting 4–20 mA through a 250-ohm resistor.</li><li><strong>±10 V:</strong> bipolar range used when direction or positive/negative command is required.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The signal type must match the module configuration. A 0–10 V source connected to a channel configured for current will not produce a trustworthy reading and may violate the hardware specification.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=1GSP_5DMJxc","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=1GSP_5DMJxc
</div><figcaption class="wp-element-caption"><em>Electrotec — 4–20 mA to 0–10 V PLC Input Conversion. Demonstrates the relationship between the two common analog signal standards.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">A Technician Troubleshooting Sequence</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Confirm the process complaint, channel, expected range, and recent changes.</li><li>Review the field-device and analog-input wiring diagrams.</li><li>Verify the module is configured for the correct voltage range.</li><li>Measure the signal at the transmitter output using an approved method.</li><li>Measure the same signal at the PLC input and compare the two readings.</li><li>If voltage is correct but the PLC raw value is wrong, investigate channel configuration, common/reference wiring, and the input module.</li><li>If the raw value is correct but engineering units are wrong, investigate scaling and HMI mapping.</li><li>If the reading is unstable, investigate shielding, cable routing, grounding, loose terminals, source stability, and nearby noise sources.</li><li>Restore all temporary test connections and verify normal operation.</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p>Before opening panels or disturbing energized circuits, follow the isolation boundary established in <a href="https://bitcoinversus.tech/2026/09/30/osetc-011-lockout-tagout-energy-isolation/"><strong>OSETC.011: Lockout/Tagout and Energy Isolation</strong></a>. A low-voltage analog signal can still be located inside equipment containing hazardous energy.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical Exercise</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Use a supervised low-voltage trainer, adjustable 0–10 V source, and PLC analog input.</li><li>Apply 0 V, 2.5 V, 5 V, 7.5 V, and 10 V.</li><li>Record raw PLC counts and percent of span at each point.</li><li>Scale the input to a hypothetical 0–200 °C temperature range.</li><li>Calculate the expected temperature at 6.5 V.</li><li>Compare a multimeter reading at the source with the reading at the PLC terminals.</li><li>Introduce only instructor-approved wiring changes and observe the effect of a missing common or incorrect channel range.</li><li>Restore the original wiring and verify all five test points again.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge Check + Answers</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>What percentage of a 0–10 V span is 5 V?</strong> 50%.</li><li><strong>A 0–100 psi sensor outputs 7 V. What pressure should be displayed?</strong> 70 psi.</li><li><strong>Why should a voltage-input receiver have high input impedance?</strong> To minimize loading of the signal source.</li><li><strong>What is a common cause of a correct field voltage but incorrect HMI value?</strong> Wrong PLC scaling or software mapping.</li><li><strong>Why can long 0–10 V runs be more troublesome than 4–20 mA runs?</strong> Voltage drop, common-reference differences, and induced noise can directly alter the measured voltage.</li><li><strong>Can a 0–10 V source be connected to any analog channel?</strong> No. The channel must support and be configured for the correct voltage range.</li><li><strong>Where should a voltmeter be connected to measure a 0–10 V signal?</strong> Across the signal and the correct reference/common, following the equipment documentation and site procedure.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Useful Prior Lessons</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/05/osetc-027-4-20ma-current-loops-analog-instrument-signals-basics/"><strong>OSETC.027: 4–20 mA Current Loops and Analog Instrument Signals Basics</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/02/osetc-020-limit-switches-proximity-sensors-basics/"><strong>OSETC.020: Limit Switches and Proximity Sensors Basics</strong></a></li><li><a href="https://bitcoinversus.tech/2026/09/27/electrical-engineering-tech-doc-1-digital-multimeter-basics/"><strong>Electrical Engineering Tech Doc #1 – Digital Multimeter Basics</strong></a></li><li><a href="https://bitcoinversus.tech/2026/09/30/osetc-011-lockout-tagout-energy-isolation/"><strong>OSETC.011: Lockout/Tagout and Energy Isolation</strong></a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Technical References</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><a href="https://www.realpars.com/blog/plc-analog-io">RealPars — Analog Inputs and Outputs in PLC Systems</a></li><li><a href="https://www.automationdirect.com/videos/video?videoToPlay=N8kM1d24lxw">AutomationDirect — Discrete vs. Analog Sensors</a></li><li><a href="https://www.fluke.com/en/learn/blog/calibration/signal-conditioning-ensures-measurement-accuracy">Fluke — Signal Conditioning and Measurement Accuracy</a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>A 0–10 V signal is simple only when the source, reference, wiring, input range, loading, and scaling all agree.</strong> The strongest troubleshooting method is to measure voltage at each stage, compare it with the expected process percentage, and separate the field signal from PLC scaling before replacing hardware.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong> This lesson is educational material for supervised technical training. Follow applicable electrical-safety rules, site procedures, and manufacturer documentation.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on technical and financial subjects for informational purposes.</p><!-- /wp:paragraph -->