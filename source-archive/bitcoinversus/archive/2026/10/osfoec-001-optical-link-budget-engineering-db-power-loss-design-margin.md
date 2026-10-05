---
title: "OSFOEC.001: Optical Link Budget Engineering — dB, Power Budget, Loss Budget, and Design Margin"
status: published
wordpress_post_id: 20520
published: "2026-10-04T01:59:11"
live_url: "https://bitcoinversus.tech/2026/10/04/osfoec-001-optical-link-budget-engineering-db-power-loss-design-margin/"
series: "Open Source Fiber Optics Engineer Certification"
pathway: fiber-optics/engineer
lesson_number: "001"
featured_media_id: 20515
youtube_1: "https://www.youtube.com/watch?v=PPwOHzLQU2k"
youtube_2: "https://www.youtube.com/watch?v=as6AXnGjdUE"
youtube_3: "https://www.youtube.com/watch?v=QEzHQoTM1KM"
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>A fiber link is not engineered by asking whether light reaches the far end. It is engineered by proving that the receiver gets enough optical power under worst-case conditions—without being overloaded—and that enough margin remains for aging, contamination, repair, measurement uncertainty, and real-world variation.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is <strong>OSFOEC.001</strong>, the first lesson in the Open Source Fiber Optics Engineer Certification track. It builds on <a href="https://bitcoinversus.tech/2026/10/04/osfotc-001-fiber-optic-safety-handling-inspection-cleaning-basics/"><strong>OSFOTC.001: Fiber Optic Safety, Handling, Inspection, and Cleaning Basics</strong></a> and moves from technician handling discipline into link-level engineering: dB, dBm, transmitter/receiver limits, cable-plant loss, design margin, overload checks, dispersion penalties, and acceptance criteria.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The link-budget model</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>transmitter output<br>↓ subtract fiber attenuation<br>↓ subtract mated-connection loss<br>↓ subtract splice loss<br>↓ subtract splitter / passive-device loss<br>↓ subtract engineering reserve and penalties<br>↓<br>receiver input power</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The basic received-power equation is:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>P<sub>RX</sub> (dBm) = P<sub>TX</sub> (dBm) − total optical loss (dB) + optical gain (dB)</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>If there are no optical amplifiers, the gain term is zero.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">1. dBm is absolute power; dB is a ratio</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>dBm</strong> expresses absolute optical power referenced to 1 milliwatt. <strong>dB</strong> expresses a relative gain or loss ratio.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>0 dBm = 1 mW.</li><li>+3 dBm is approximately 2 mW.</li><li>−3 dBm is approximately 0.5 mW.</li><li>A 3 dB loss cuts optical power roughly in half.</li><li>A 10 dB loss reduces power to one-tenth.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>This matters because engineers add and subtract optical losses in dB while transmitter and receiver specifications are usually expressed in dBm.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: The mysterious dB of fiber optics</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=PPwOHzLQU2k","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=PPwOHzLQU2k
</div><figcaption class="wp-element-caption"><em>Fiber Optic Association — Lecture 55: The Mysterious dB of Fiber Optics.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Power budget and loss budget are related—but not identical</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The Fiber Optic Association separates two terms that are often confused:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Power budget:</strong> the amount of optical loss the transmitter/receiver pair can tolerate while still meeting the required performance.</li><li><strong>Loss budget:</strong> the estimated loss of the passive cable plant based on fiber length, connections, splices, splitters, and other passive components.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>See FOA's <a href="https://www.foa.org/tech/lossbudg.htm"><strong>loss-budget engineering reference</strong></a> and its <a href="https://www.foa.org/tech/ref/appln/datalink.html"><strong>fiber-optic data-link reference</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The design condition is simple:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>allowable power budget must exceed expected cable-plant loss plus required margin and penalties.</strong></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">3. Calculate maximum allowable loss from the transceiver limits</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>For a simple digital link, the worst-case maximum allowable path loss begins with the minimum guaranteed transmitter output and the receiver sensitivity.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Maximum allowable loss = minimum transmitter output − receiver sensitivity</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Example:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>minimum transmitter output = −2 dBm<br>receiver sensitivity = −15 dBm</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>maximum allowable loss = −2 − (−15)<br><strong>= 13 dB</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>That 13 dB is not automatically available for cable alone. Engineering reserve, dispersion-related penalties, aging, implementation penalties, and specification requirements may consume part of it.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Estimate cable-plant loss component by component</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A practical passive-link estimate is:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Total loss = fiber loss + connection loss + splice loss + passive-device loss</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Fiber loss is:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>fiber attenuation coefficient (dB/km) × link length (km)</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Your earlier <a href="https://bitcoinversus.tech/2025/11/20/fiber-optic-training-attenuation/"><strong>attenuation</strong></a> lesson covers the physical meaning of optical power reduction, while <a href="https://bitcoinversus.tech/2025/11/21/fiber-optics-training-insertion-loss/"><strong>insertion loss</strong></a> covers measured loss introduced by a component or complete link.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Loss budgets</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=as6AXnGjdUE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=as6AXnGjdUE
</div><figcaption class="wp-element-caption"><em>Fiber Optic Association — Lecture 26: Loss Budgets.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Worked example: 10 km singlemode link</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Assume this simplified design example:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>minimum transmitter output: −2 dBm</li><li>receiver sensitivity: −15 dBm</li><li>fiber length: 10 km</li><li>design fiber attenuation: 0.35 dB/km</li><li>four mated connections: 0.5 dB each</li><li>two fusion splices: 0.1 dB each</li><li>engineering reserve: 3 dB</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Step 1 — transceiver power budget</strong><br>−2 − (−15) = <strong>13 dB</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Step 2 — fiber loss</strong><br>10 km × 0.35 dB/km = <strong>3.5 dB</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Step 3 — connection loss</strong><br>4 × 0.5 dB = <strong>2.0 dB</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Step 4 — splice loss</strong><br>2 × 0.1 dB = <strong>0.2 dB</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Step 5 — expected passive loss</strong><br>3.5 + 2.0 + 0.2 = <strong>5.7 dB</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Step 6 — raw optical margin</strong><br>13 − 5.7 = <strong>7.3 dB</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Step 7 — reserve 3 dB</strong><br>7.3 − 3 = <strong>4.3 dB remaining design margin</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The arithmetic is easy. The engineering work is choosing defensible worst-case values for wavelength, temperature, fiber type, connector population, splice plan, transceiver tolerances, expected restoration events, aging, and required reliability.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">6. Use guaranteed worst-case values—not convenient typical values</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Typical component performance is useful for understanding a design, but production acceptance should be tied to applicable standards, customer requirements, manufacturer data, and the actual transceiver specification.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>When selecting optics, engineers should examine:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>minimum and maximum transmitter output;</li><li>receiver sensitivity at the required BER;</li><li>maximum receiver input / overload limit;</li><li>wavelength range;</li><li>supported fiber type;</li><li>temperature grade;</li><li>maximum specified reach;</li><li>dispersion tolerance or penalty;</li><li>FEC assumptions;</li><li>connector or reflectance constraints where specified.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">7. Always perform the overload check too</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A link can fail because received power is <em>too low</em>, but some receivers can also be overloaded by too much optical power.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Suppose:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>maximum transmitter output = +1 dBm<br>maximum safe receiver input = −1 dBm</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The path needs at least:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>+1 − (−1) = <strong>2 dB of loss</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>If the real path loss were only 1 dB, the receiver could exceed its specified maximum input and an optical attenuator might be required. FOA's loss-budget guidance specifically notes that links can have both minimum- and maximum-loss requirements.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">8. Measure power with the correct wavelength and reference</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <a href="https://bitcoinversus.tech/2025/11/11/optical-power-meter/"><strong>optical power meter</strong></a> is the fundamental instrument for measuring transmitter output and received optical power. Measurement quality depends on the correct wavelength setting, compatible detector range, clean adapters, known-good reference cords, and a documented reference method.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Do not confuse a live received-power reading with a complete cable-plant insertion-loss test. They answer related but different questions.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">9. Measurement uncertainty belongs in the engineering decision</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Every optical measurement has uncertainty. Connector repeatability, source stability, detector calibration, reference-cord quality, mode distribution, wavelength, and test setup can all move the measured result.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>FOA's current <a href="https://www.foa.org/tech/ref/1pstandards/FOA%20Installation%20Standard%202025%20V1.pdf"><strong>2025 fiber-optic installation standard</strong></a> treats the loss budget as a design estimate that should also guide post-installation acceptance testing. Engineers should not create a pass/fail threshold so tight that normal measurement uncertainty causes good links to fail—or hides bad links behind unrealistic assumptions.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">10. Dispersion can limit reach even when optical power is adequate</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A pure attenuation calculation is not enough for high-speed or long-reach links. <strong>Dispersion</strong> spreads optical pulses in time and can close the receiver eye even when the received power is numerically above sensitivity.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Modal dispersion:</strong> a major bandwidth limit in multimode fiber.</li><li><strong>Chromatic dispersion:</strong> different wavelengths travel with different group velocities.</li><li><strong>Polarization-mode dispersion:</strong> polarized components of the signal can experience different delays in singlemode fiber.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Your existing <a href="https://bitcoinversus.tech/2026/01/24/fiber-optic-training-polarization-mode-dispersion-pmd/"><strong>polarization-mode dispersion (PMD)</strong></a> lesson and <a href="https://bitcoinversus.tech/2025/11/14/fiber-optic-training-fiber-optic-characterization/"><strong>fiber characterization</strong></a> lesson connect directly to this engineering limit.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>FOA's <a href="https://www.foa.org/tech/ref/appln/datalink.html"><strong>data-link reference</strong></a> notes that dispersion can reduce the usable power budget because pulse distortion imposes an additional performance penalty.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Attenuation in a fiber-optic link</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=QEzHQoTM1KM","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=QEzHQoTM1KM
</div><figcaption class="wp-element-caption"><em>Fiber Optic Association — Lecture 49: Attenuation in a Fiber Optic Link.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">11. FEC helps digital performance, but it is not “free optical power”</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Forward error correction can allow a digital system to meet its target BER at a lower pre-FEC signal quality than an uncoded system, but engineers should use the transceiver standard and datasheet limits exactly as specified. Do not arbitrarily add “FEC gain” to an optical budget unless the link specification explicitly defines how that margin is accounted for.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">12. Splitters, WDM filters, muxes, and passive optics consume budget</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Any passive optical element can add insertion loss:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>splitters and taps;</li><li>CWDM/DWDM mux/demux filters;</li><li>MPO/MTP connection pairs;</li><li>patch panels and cassettes;</li><li>optical circulators;</li><li>isolators;</li><li>monitor taps;</li><li>attenuators.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Your existing <a href="https://bitcoinversus.tech/2025/12/07/fiber-optic-training-splitters-vs-taps/"><strong>splitters vs. taps</strong></a> lesson is a useful precursor. Later OSFOEC lessons will extend this into CWDM/DWDM channel planning, coherent links, amplifier chains, OSNR, and nonlinear effects.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">13. Design margin has a job</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Margin is not an arbitrary comfort number. It exists to absorb uncertainty and degradation that were not explicitly modeled as deterministic losses.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>source aging;</li><li>connector contamination or remating variation;</li><li>future restoration splices;</li><li>temperature variation;</li><li>manufacturing tolerance;</li><li>measurement uncertainty;</li><li>minor route changes;</li><li>component replacement variance.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>FOA commonly uses several decibels of excess margin in example designs, but the correct reserve depends on the application and the governing equipment/standard requirements. Do not blindly apply one universal number.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">14. Engineer from both ends of the specification</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A robust optical design checks at least two extreme cases:</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>Minimum-power case:</strong> minimum TX output, maximum expected path loss, penalties, and required margin must still leave the receiver at or above sensitivity.</li><li><strong>Maximum-power case:</strong> maximum TX output and minimum possible path loss must not exceed receiver overload.</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p>For temperature-sensitive or wavelength-sensitive systems, repeat the calculation at the relevant environmental and spectral corners.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">15. Acceptance testing should map back to the design</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The design budget should become an acceptance criterion. If the engineered passive loss is 5.7 dB, the installation team should know what measured result is expected, what test method applies, what uncertainty is allowed, and when a high-loss link requires segment-by-segment troubleshooting.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This closes the loop:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>design → install → inspect/clean → measure → compare to budget → troubleshoot exceptions → document final as-built loss</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">16. Engineer's link-budget checklist</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Identify the exact transceiver standard and part specification.</li><li>Record minimum and maximum TX output.</li><li>Record receiver sensitivity and maximum receiver input.</li><li>Confirm wavelength and fiber type.</li><li>Measure or document route length.</li><li>Count every mated connection.</li><li>Count every planned splice.</li><li>Include splitters, muxes, taps, attenuators, or other passives.</li><li>Use defensible attenuation and component-loss values.</li><li>Calculate expected passive loss.</li><li>Subtract explicit implementation/dispersion penalties if required.</li><li>Add the required engineering reserve.</li><li>Check the minimum-power case.</li><li>Check the maximum-power / overload case.</li><li>Define the acceptance-test method and uncertainty.</li><li>Record the final as-built and measured values.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Practice exercise</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A transceiver pair has minimum TX output of −1 dBm and receiver sensitivity of −13 dBm. The planned link contains 8 km of fiber at 0.35 dB/km, six mated connections at 0.4 dB each, and four splices at 0.1 dB each.</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Calculate the transceiver power budget.</li><li>Calculate total fiber loss.</li><li>Calculate connection loss.</li><li>Calculate splice loss.</li><li>Calculate total expected passive loss.</li><li>Calculate raw optical margin.</li><li>If the project requires 3 dB reserve, how much margin remains?</li><li>What additional information is still needed to check receiver overload?</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answer check:</strong> power budget = 12 dB; fiber = 2.8 dB; connections = 2.4 dB; splices = 0.4 dB; expected passive loss = 5.6 dB; raw margin = 6.4 dB; remaining after 3 dB reserve = 3.4 dB. To check overload, you still need maximum TX output and maximum allowed receiver input.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What is the difference between dB and dBm?</strong><br>dB is a relative gain/loss ratio; dBm is absolute power referenced to 1 milliwatt.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. What is the transceiver power budget?</strong><br>The optical-loss range the transmitter/receiver pair can tolerate, derived from transmitter output and receiver input requirements.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. What is the cable-plant loss budget?</strong><br>The estimated passive loss of fiber, mated connections, splices, splitters, and other passive components.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. Why check receiver overload?</strong><br>Because a very short or low-loss link can deliver more optical power than the receiver is specified to accept.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. Can a link pass its attenuation budget and still fail at high speed?</strong><br>Yes. Dispersion and other signal-quality penalties can limit reach even when received optical power is adequate.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>6. Why use design margin?</strong><br>To absorb aging, contamination, future repair, tolerance, environmental variation, and measurement uncertainty not otherwise modeled.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Optical engineering is a bounded power problem.</strong> Start with guaranteed transmitter and receiver limits. Calculate passive loss. Account for penalties and margin. Check both low-power and overload corners. Then connect the design budget to the field acceptance test.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Engineering note: The numeric examples in this lesson are illustrative, not universal design limits. Real links must use the exact transceiver specification, fiber/cable data, passive-component specifications, applicable standards, environmental limits, required BER/FEC conditions, and project acceptance criteria.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->