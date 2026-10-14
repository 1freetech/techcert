---
post_id: 24591
series: "Open Source Fiber Optics Engineer Certification"
lesson_number: 10
title: "OSFOEC.010: Optical Performance Monitoring and Telemetry"
live_url: "https://bitcoinversus.tech/2026/10/13/osfoec-010-optical-performance-monitoring-telemetry/"
slug: "osfoec-010-optical-performance-monitoring-telemetry"
featured_media_id: 24588
status: publish
---

<!-- wp:paragraph -->
<p><strong>Optical performance monitoring turns a live fiber link into a measurable engineering system.</strong> Instead of waiting for traffic to fail, engineers track power, OSNR, pre-FEC BER, post-FEC BER, Q-factor, chromatic dispersion, polarization effects, coherent-DSP estimates, and long-term trends to understand how much operating margin remains.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/12/osfoec-009-optical-network-protection-restoration/"><strong>OSFOEC.009: Optical Network Protection and Restoration</strong></a>. Protection can move traffic around a failure; performance monitoring helps determine whether the working path, protection path, and restored path are actually healthy enough to carry service with acceptable margin.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=t1nsij8k3l8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=t1nsij8k3l8
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Ciena provides a concise introduction to coherent optical technology and the receiver architecture that makes many modern performance measurements possible.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An optical network does not suddenly change from “good” to “bad.” Its quality normally moves along a spectrum. A connector gets dirtier, amplifier noise increases, a channel loses power, dispersion changes, or the error rate rises. Performance monitoring is the practice of measuring those changes early enough to diagnose them before they become outages.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Distinguish optical power, OSNR, Q-factor, pre-FEC BER, and post-FEC BER.</li><li>Explain why coherent DSP can act as a performance monitor.</li><li>Interpret CD, DGD/PMD, frequency-offset, and receiver-quality telemetry.</li><li>Separate instantaneous alarms from long-term margin trends.</li><li>Use correlated measurements to isolate likely fault domains.</li><li>Design threshold and telemetry strategies without creating alarm noise.</li><li>Build a commissioning baseline for future comparison.</li><li>Explain why multi-vendor optical telemetry requires metric consistency and context.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Monitoring Starts With Optical Power</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Transmit and receive optical power are basic health indicators. A falling receive-power trend can point toward added connector loss, fiber attenuation, bending, splice degradation, amplifier gain change, ROADM filtering, or a transmitter problem. Power alone cannot describe signal quality, but it establishes whether enough optical energy is arriving at the receiver.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Engineers should record both absolute value and trend. A channel sitting at −8 dBm may be healthy if that is normal for the design, while a channel that moved from −3 dBm to −8 dBm in two days may deserve immediate investigation even though it remains inside a broad vendor limit.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">OSNR Measures Signal Against Optical Noise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Optical signal-to-noise ratio</strong> compares signal power with optical noise power in a defined reference bandwidth. In amplified DWDM systems, amplifier spontaneous-emission noise accumulates across spans. A receiver can therefore have adequate total optical power while the useful signal is buried in enough noise to reduce margin.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=jXY_HOathz8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=jXY_HOathz8
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>EXFO explains why OSNR is a key DWDM performance measurement and why optical power by itself is not enough.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Modern coherent systems complicate traditional out-of-band OSNR measurements because wide modulated signals, dense channel spacing, ROADMs, filtering, and polarization-multiplexed formats can make simple interpolation inaccurate. EXFO therefore distinguishes traditional spectral measurements from in-band and Pol-Mux OSNR techniques intended for coherent systems.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Pre-FEC BER Is an Operating-Margin Sensor</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Pre-FEC BER</strong> is the raw bit-error rate measured before forward error correction repairs the data. It is often one of the most useful real-time indicators of coherent-link health because it reflects the combined result of noise, distortion, nonlinear penalties, filtering, phase errors, and receiver impairment.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Post-FEC BER</strong> is measured after correction. A link can show essentially zero post-FEC errors while pre-FEC BER is steadily worsening. That does not mean the link is equally healthy; it means the FEC still has enough coding gain to hide the impairment. Engineers therefore watch the distance between current pre-FEC performance and the decoder’s failure threshold as a form of margin.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=a_nUJbeVFDQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=a_nUJbeVFDQ
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Ciena explains how modern soft-decision FEC and coherent DSP extend usable reach and why pre-FEC behavior is central to optical performance margin.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Q-Factor Converts Error Performance Into a Useful Quality Metric</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Optical systems often report a Q-factor or Q-related margin derived from receiver statistics or BER. The exact definition depends on platform and modulation format, so an engineer should not compare raw Q values across unrelated vendors without understanding how each system computes them.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The useful engineering practice is to establish a known-good baseline and track deviation. A stable channel with 3 dB of measured margin and a channel whose margin fell from 7 dB to 3 dB may report the same current state, but the second channel carries much stronger evidence of an emerging fault.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Coherent DSP Is Also a Sensor</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A coherent receiver must estimate and correct physical impairments in order to recover data. Those adaptive algorithms naturally expose useful telemetry. Depending on platform, a transceiver may report chromatic dispersion, differential group delay, second-order PMD, carrier-frequency offset, received power, estimated SNR, polarization behavior, FEC counters, equalizer state, and other DSP-derived measurements.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=QY0IRIhcux0","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=QY0IRIhcux0
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Ciena’s WaveLogic overview shows how coherent optical processors combine high-speed conversion, DSP, modulation, and receiver intelligence inside the transport system.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Cisco’s 400G coherent-optics documentation exposes performance-monitoring parameters including transmit and receive power, chromatic dispersion, differential group delay, second-order PMD, pre-FEC BER, post-FEC BER, error-corrected bits, and uncorrected words. These counters turn the optical module into a continuous diagnostic source rather than a simple up/down interface.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Chromatic Dispersion Is More Than a Design-Time Number</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Chromatic dispersion causes different frequency components of a pulse to travel at different group velocities. Coherent DSP can digitally compensate substantial CD, but the estimated compensation value remains useful telemetry. If the measured CD is radically different from the expected route length or changes after a restoration event, the service may be traveling a different path than intended.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That makes CD telemetry useful not only for signal quality but for topology validation. A restored wavelength that suddenly reports an additional several thousand ps/nm of dispersion may have been routed across a materially longer fiber path, which can change nonlinear and OSNR margin even if traffic remains up.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">PMD and DGD Are Dynamic</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Polarization-mode dispersion</strong> results from different polarization states experiencing different propagation delays. Differential group delay can vary with temperature, vibration, mechanical stress, and fiber condition. Modern coherent equalizers track these changes continuously.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A slowly varying DGD trace is normal. A sudden, persistent change correlated with maintenance, rerouting, or a physical event can help identify when the optical path changed. A receiver approaching its PMD-tracking limit may show increasing BER or Q penalty even while average optical power looks normal.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Cycle Slips Reveal Phase-Recovery Stress</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Coherent receivers estimate carrier phase digitally. Under severe phase noise or difficult operating conditions, the estimator can occasionally lose the correct phase trajectory and jump by a symbol-related phase increment. These <strong>cycle slips</strong> can create bursts of bit errors that may be corrected by FEC or may leak into client traffic if severe enough.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=uRbmbsqWpB8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=uRbmbsqWpB8
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Ciena explains coherent cycle slips and how phase-recovery behavior can translate into bursts of bit errors and service penalties.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Correlate Metrics Instead of Reading One Counter</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Receive power falls, OSNR stays similar:</strong> suspect added attenuation after the dominant noise sources, connector loss, fiber bend, or local insertion loss.</li><li><strong>Power stays stable, OSNR falls:</strong> suspect amplifier noise, gain imbalance, excess ASE, channel loading changes, or spectral contamination.</li><li><strong>OSNR is stable, pre-FEC BER worsens:</strong> investigate filtering, nonlinear impairment, laser/phase behavior, polarization effects, DSP stress, or hardware degradation.</li><li><strong>Pre-FEC BER worsens but post-FEC remains clean:</strong> the service is still passing, but operating margin is being consumed.</li><li><strong>CD changes abruptly:</strong> verify route restoration, wavelength path, patching, or transponder configuration.</li><li><strong>DGD/PMD changes abruptly:</strong> correlate with path changes, fiber handling, environmental events, or a different protection route.</li><li><strong>One wavelength degrades while neighbors remain stable:</strong> suspect channel-specific optics, filtering, frequency alignment, or transponder issues.</li><li><strong>Many wavelengths degrade together:</strong> suspect shared amplifiers, ROADM nodes, fiber spans, power equalization, or common infrastructure.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Trend Data Is More Powerful Than a Single Snapshot</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Threshold alarms answer, “Has this value crossed a line?” Time-series telemetry answers, “Where is this value going?” Both are necessary. A network may never cross an alarm threshold yet still show a clear six-month erosion in Q-margin, rising corrected-bit counts, or declining receive power.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Useful telemetry systems retain enough history to compare seconds, minutes, hours, days, and maintenance epochs. They also preserve configuration and topology context so engineers can distinguish a real impairment from a planned route or modulation change.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Telemetry Becomes More Valuable When It Is Automated</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Modern optical operations increasingly export performance data through management APIs and streaming telemetry rather than relying only on technicians reading local displays. The engineering goal is not to collect every possible counter. It is to collect the measurements that can answer operational questions such as: Which channels are losing margin? Which spans create the largest penalty? Did a restoration path change optical quality? Which interfaces show correlated degradation?</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/networking/comments/1mnqlib/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/networking/comments/1mnqlib/
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>An optical-networking automation discussion highlights the practical interest in NETCONF, gNMI, TAPI, telemetry, and multi-vendor operational tooling for DWDM and OTN environments.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Build a Commissioning Baseline</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Record route, span length, wavelength/frequency, baud rate, modulation, FEC mode, and expected reach.</li><li>Capture transmit power and receive power at both ends.</li><li>Measure or record OSNR using an appropriate method for the modulation and line system.</li><li>Record pre-FEC BER, post-FEC BER, Q/Q-margin, corrected-bit counts, and uncorrected-word counters.</li><li>Record coherent-DSP estimates such as CD, DGD/PMD, and frequency offset where available.</li><li>Capture amplifier gain, ROADM attenuation/equalization, and channel-power profile.</li><li>Run continuous traffic long enough to observe thermal and polarization variation.</li><li>Save the baseline with software version, configuration, physical route, and timestamp.</li><li>Repeat the capture after protection switching and restoration tests.</li><li>Define alert thresholds from design margin and observed variability rather than arbitrary round numbers.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Thresholds Need Hysteresis and Persistence</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A noisy metric can cross a threshold repeatedly and create alarm storms. Good monitoring logic often uses persistence, averaging, hysteresis, or multiple severity levels. A brief Q dip might generate a warning only if it persists for several intervals, while an uncorrected-word event may trigger immediate escalation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Thresholds should also reflect service class. A long-haul channel operating near its engineered limit may have less spare margin than a metro link. The same absolute BER or Q value can therefore mean different risk depending on the system design, FEC mode, modulation, and expected variability.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Multi-Vendor Metrics Need Normalization</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Two coherent modems may expose similarly named values that are calculated differently. OSNR may be measured optically or estimated digitally; Q may use different statistical conventions; BER may be averaged over different windows; and “margin” may be referenced to different FEC thresholds.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For multi-vendor operations, store metric definition, units, sample interval, reference bandwidth, averaging method, FEC mode, and vendor interpretation with the number itself. Normalization without metadata can create false comparisons.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Engineering Exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A 400G coherent wavelength normally operates at −5 dBm receive power, 22 dB measured OSNR, pre-FEC BER of 8 × 10<sup>−4</sup>, and 5 dB reported margin. Over four weeks, receive power remains between −5.0 and −5.2 dBm while OSNR falls to 19 dB, pre-FEC BER rises to 2.5 × 10<sup>−3</sup>, and reported margin falls to 1.8 dB. Neighboring channels on the same amplified span show a similar OSNR decline.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Identify the most likely shared fault domain and explain why connector loss at a single transponder is less likely. List the amplifier, channel-loading, ROADM, and spectrum measurements you would collect next. Then define a warning threshold and a critical threshold using trend plus absolute performance rather than a single counter.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Why can receive power look healthy while a coherent channel has poor margin?</li><li>What is the difference between pre-FEC and post-FEC BER?</li><li>Why is pre-FEC BER often useful before an outage occurs?</li><li>What optical impairment does OSNR quantify?</li><li>Why can coherent DSP report chromatic dispersion and PMD?</li><li>What might an abrupt CD change indicate operationally?</li><li>Why are time-series trends more useful than a single threshold alarm?</li><li>Why should Q or OSNR values not always be compared directly across vendors?</li><li>What does a worsening pre-FEC BER with clean post-FEC BER mean?</li><li>Why should baseline telemetry be captured after a protection-path switch?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Total optical power can remain adequate while amplifier noise, filtering, nonlinear distortion, or other impairments reduce signal quality.</li><li>Pre-FEC BER measures errors before correction; post-FEC BER measures residual errors after the FEC decoder attempts to repair them.</li><li>It can rise as link margin is consumed even while FEC still prevents client-visible errors.</li><li>The ratio of useful optical signal power to optical noise power in a defined reference bandwidth.</li><li>The coherent receiver already estimates and compensates those impairments to recover the transmitted symbols, so the DSP can expose its estimates as telemetry.</li><li>A route change, restored path, patching change, or materially different fiber length.</li><li>Trends show direction and rate of degradation before a hard limit is crossed.</li><li>Vendors may calculate the metric differently, use different averaging windows, reference bandwidths, FEC thresholds, or DSP estimators.</li><li>The link is still operational, but the FEC is consuming more coding margin and the service is closer to its failure threshold.</li><li>The protection path can have different loss, OSNR, dispersion, amplifier loading, and nonlinear margin than the normal working path.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The simplest way to think about optical monitoring is: <strong>power tells how much light arrived, OSNR tells how clean that light is, BER tells how accurately the receiver is decoding it, and DSP telemetry helps explain why.</strong> The best engineering decisions come from watching those measurements together over time instead of treating any single number as the truth.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Previous Related Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/12/osfoec-009-optical-network-protection-restoration/"><strong>OSFOEC.009: Optical Network Protection and Restoration</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/11/osfoec-008-roadm-optical-line-systems/"><strong>OSFOEC.008: ROADM and Optical Line Systems</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/09/osfoec-007-coherent-optical-transmission-engineering-i-q-modulation-qpsk-qam-coherent-receivers-dsp-osnr-fec-and-reach/"><strong>OSFOEC.007: Coherent Optical Transmission Engineering</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/osfoec-006-optical-amplification-engineering-edfa-raman-gain-noise-figure-osnr-span-planning/"><strong>OSFOEC.006: Optical Amplification Engineering</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.cisco.com/content/en/us/td/docs/iosxr/ncs5xx/interfaces/78x/b-interfaces-hardware-component-cg-78x-ncs540/configuring-400g-digital-coherent-optics.pdf">Cisco — Configuring 400G Digital Coherent Optics</a></li><li><a href="https://www.exfo.com/en/products/field-network-testing/spectral-testing/">EXFO — Spectral Testing and OSNR</a></li><li><a href="https://www.exfo.com/en/resources/glossary/optical-spectrum-analyzer-osa/">EXFO — Optical Spectrum Analyzer</a></li><li><a href="https://opg.optica.org/abstract.cfm?uri=OFC-2015-W4D.1">Optica — Optical Performance Monitoring in DSP-Based Coherent Optical Systems</a></li><li><a href="https://opg.optica.org/abstract.cfm?uri=OFC-2024-W4A.4">Optica — Digital Coherent Receiver Based Optical Performance Monitoring</a></li><li><a href="https://www.ciena.com/insights/blog/2025/smarter%2C-greener%2C-faster-the-photonic-layers-role-in-network-evolution">Ciena — Real-Time Photonic Performance Monitoring and Automation</a></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><em><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech provides technical education and analysis for informational purposes only.</em></p>
<!-- /wp:paragraph -->