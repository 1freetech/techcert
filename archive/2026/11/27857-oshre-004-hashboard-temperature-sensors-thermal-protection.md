---
lesson_id: OSHRE.004
track: "Open-Source Hashboard Repair Engineering"
level: "Super-Fundamentals"
title: "OSHRE.004: Hashboard Temperature Sensors and Thermal Protection"
wordpress_post_id: 27857
url: "https://bitcoinversus.tech/2026/11/01/oshre-004-hashboard-temperature-sensors-thermal-protection-lm75a-i2c/"
published_date: "2026-11-01"
wordpress_category_ids: [57414501, 792778074, 284207, 2509703]
featured_media_id: 27856
featured_image_dimensions: "1200x630"
featured_image_style: "wordless comic editorial artwork"
featured_person: "Fictional white adult woman repair engineer in her 50s-60s"
in_story_media_count: 4
in_story_media:
  - "WordPress image 21686: licensed real mining-machine maintenance photo, CC BY-SA 2.0"
  - "WordPress image 21674: licensed real BM1387B ASIC closeup photo, CC BY 4.0"
  - "YouTube -68fZBB1Jy0: ZEUS MINING S19j Pro temperature-sensor repair module demonstration"
  - "YouTube uvF1MwJ5I-0: ZEUS MINING Antminer S19 troubleshooting lesson"
youtube_embeds: "WordPress core/shortcode [youtube ...] embeds with rendered iframe players; two video captions immediately after blocks"
editorial_qa: "WordPress raw and rendered content re-read after publication; correct title/SEO; 2 iframe video embeds; 2 licensed photos; 1200x630 featured cover; Editor's Note and QR footer all present."
qa_limits: "Actual third-party playback was not independently tested; desktop/mobile browser screenshots unavailable. Rendered iframe verification is not a playback guarantee."
next_oshre_lesson: OSHRE.005
---

<!-- wp:paragraph --><p>A <strong>hashboard temperature sensor</strong> is the part of a Bitcoin mining circuit board that reports thermal conditions to its control electronics. Without trustworthy readings, firmware cannot safely determine whether a miner should continue hashing, slow down, or shut down. This lesson explains temperature-monitoring hardware, sensor communication, the difference between real overheating and a false temperature alarm, and how to document a safe repair decision.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Hashboard Repair Engineering is a technical curriculum covering the physical <a href="https://bitcoinversus.tech/2026/10/27/oshre-000-bitcoin-mining-anatomy-of-the-hashboard/">anatomy of ASIC hashboards</a>, their <a href="https://bitcoinversus.tech/2026/10/27/oshre-001-hashboard-voltage-domains-power-distribution/">power domains</a>, their <a href="https://bitcoinversus.tech/2026/10/28/oshre-002-hashboard-signal-chains-clk-co-ri-bo-rst/">communication signals</a>, and <a href="https://bitcoinversus.tech/2026/11/01/hashboard-missing-asic-chip-diagnostics-test-fixtures-fault-localization/">missing-chip diagnoses</a>. Temperature monitoring is a separate system: a chain can enumerate its mining ASICs correctly yet still stop because temperature information is invalid.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning outcomes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Identify the purpose of external digital temperature sensors and the distinction between a sensor reading and the mining ASIC's internal junction temperature.</li><li>Describe the roles of the I²C bus, supply voltage, decoupling, address selection, and cooling hardware in the thermal monitoring chain.</li><li>Distinguish thermal protection, sensor read failure, and mechanical airflow problems using firmware logs and maintenance evidence.</li><li>Create a documented, de-energized inspection and repair escalation plan without bypassing safety controls.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Why a mining hashboard measures temperature</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A mining ASIC converts electrical input into heat while performing SHA-256 calculations. That heat must pass through package materials, heat spreaders and heatsinks to the moving air or cooling liquid. Temperature sensing provides information for fan control, power or frequency reduction, and emergency protection; its absence can be dangerous even when the machine's reported hashrate looks normal.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Three temperatures must not be confused. <strong>Ambient or inlet air temperature</strong> describes the air entering the miner; <strong>board or sensor temperature</strong> describes the position of a local sensing device; and <strong>ASIC junction temperature</strong> describes the semiconductor die itself. A local board sensor cannot always read the hottest individual junction. Different miner generations and firmware may use different sensor locations and protection algorithms.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":21686,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/antminer-board-level-maintenance-real-photo.jpg" alt="Real Bitcoin mining machines opened for board-level cleaning and inspection, showing ASIC boards, physical heatsinks and the machine cooling layout" class="wp-image-21686" /><figcaption class="wp-element-caption"><em>Real ASIC mining equipment opened for maintenance, photographed by <a href="https://commons.wikimedia.org/wiki/File:Cam_2020-06-27_05-13-59_(50051439498).jpg">Steve Rainwater</a>, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC BY-SA 2.0</a>. The photo illustrates heat sinks, board access and cooling maintenance; it is not evidence of a specific temperature-sensor fault.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p>A thermal alarm may be a correct response to heat, a response to invalid measurements, or a combination of the two. The engineering task is to identify which evidence points toward the sensor circuit and which points toward the cooling environment. <a href="https://support.bitmain.com/hc/en-us/articles/4406645619097-Common-Problems-and-Solutions-for-ANTMINER-19-series">Bitmain's S19-series troubleshooting guide</a> asks operators to check dust accumulation, inlet air conditions, exhaust clearance and temperature-protection logs before returning affected hardware to service.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Digital sensors, the LM75A and the I²C interface</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <strong>LM75A</strong> is a digital temperature sensor integrated circuit commonly discussed in Antminer S19 service documentation. A typical LM75A-class device has power and ground pins, two I²C communication lines called <strong>SDA</strong> (serial data) and <strong>SCL</strong> (serial clock), address-selection pins, and an overtemperature output. The host reads encoded temperature values through the bus. The IC is not a fan, a thermocouple, or an ASIC core.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The specific <a href="https://www.zeusbtc.com/manuals/Antminer-S19-Hash-Board-Repair-Guide.asp">Antminer S19 BM1398 hashboard service guide</a> identifies <strong>four LM75A sensors, U4, U6, U7 and U8</strong>, plus a network of associated resistors and capacitors. It shows a nominal <strong>3.3 V</strong> sensor power rail and <strong>4.7 kΩ</strong> I²C pull-up resistors. These are details for the documented board revision—not an instruction to assume all S19, S19 XP, S21, WhatsMiner or hydro configurations use the same layout.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>I²C uses open-drain signaling: a device pulls a line low, while the pull-up network allows it to return high. A short, disconnected conductor, missing pull-up, invalid address, poorly attached IC or lost 3.3-volt supply can prevent communication. But a reported bus or sensor failure is <em>not</em> a definitive parts diagnosis. A shared communications fault may affect several sensors simultaneously, while one localized solder joint can affect one device.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":21674,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/antminer-bm1387b-asic-board-source.jpg" alt="Detailed real photograph of a Bitmain BM1387B ASIC soldered to a green circuit board with nearby passive electronic components" class="wp-image-21674" /><figcaption class="wp-element-caption"><em>Real PCB package and surface-mount component photograph by <a href="https://commons.wikimedia.org/wiki/File:Pcb1_-_Antminer_BM1387B_-_John_McMaster.jpg">John McMaster / Wikimedia Commons</a>, <a href="https://creativecommons.org/licenses/by/4.0/">CC BY 4.0</a>. This photo shows an older <strong>BM1387B mining ASIC</strong>, not an LM75A temperature sensor. Consult the linked S19 manual for the actual U4/U6/U7/U8 sensor layout.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p>The temperature sensor's presence on the PCB creates an electrical measuring system; it does not make the sensing path infallible. Loss of I²C communication can look like a thermal problem, while true overheating can still be caused by a blocked fan, degraded thermal interface, obstructed fins or unsuitable ambient conditions. Never substitute a single observed temperature for the complete thermal protection decision.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">How miner logs describe different thermal faults</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Manufacturer and firmware error systems use different vocabulary. On an <strong>Antminer S19 XP</strong>, Bitmain's documented codes distinguish <code>P:1</code> (<strong>high-temperature protection</strong>) from <code>J:6</code> (<strong>temperature-sensing failure</strong>). On Braiins OS, code <code>T5</code> means <strong>hashboard temperature sensor outage</strong>: the firmware cannot read temperature from a running chain. These three codes are <em>not</em> universal synonyms across all miner models or firmware releases.</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Observation</th><th>What is established</th><th>What is NOT established</th></tr></thead><tbody><tr><td>A temperature-sensor read fails</td><td>Monitoring data was unavailable or invalid</td><td>That the board is physically overheated or that the sensor chip alone is defective</td></tr><tr><td>Fan-speed fault with rising temperature</td><td>Cooling and temperature alarms coincide</td><td>That a particular ASIC has failed</td></tr><tr><td>Only one board has a sensor error</td><td>The symptom is localized to one reported chain</td><td>That shared cabling, firmware, PSU or test setup is proven healthy</td></tr><tr><td>Temperature looks plausible again</td><td>At least one sample was read</td><td>Stable, accurate readings under sustained operation</td></tr></tbody></table><figcaption class="wp-element-caption"><em>Diagnostic inference guide: distinguish observations from proposed causes before authorizing repair.</em></figcaption></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>The <a href="https://support.bitmain.com/hc/en-us/articles/10845468564633-S19-XP-log-diagnosis-and-processing-methods">official S19 XP log reference</a> categorizes <code>P:1</code> separately from <code>J:6</code>. <a href="https://academy.braiins.com/braiins-os/technical-resources">Braiins' technical error-code reference</a> classifies <code>T5</code> as an outage and suggests approved power-drain or cable checks before escalating to hashboard repair or replacement. These references help classify the symptom, but neither by itself identifies a specific failed surface-mount component.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video study: a temperature-sensor module on a real hashboard</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>ZEUS MINING shows a temperature-sensor repair module used on an Antminer S19j Pro hashboard. The demonstration is useful for identifying what the sensor package, mounting area and service tooling look like. It is an independent repair-vendor video, not a universal manufacturer-approved field procedure. The lesson does not recommend copying hot-air rework, modifying safety circuits, or installing a substitute sensor without the exact board schematic and formal authorization.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=-68fZBB1Jy0]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=-68fZBB1Jy0">ZEUS MINING, “How to use temperature sensing board to repair the temperature failure of the Antminer hash board?”</a> (May 25, 2024). Demonstrates actual S19j Pro sensor-related repair equipment. Manufacturer configurations and safety requirements vary.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">A practical classification workflow</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A good diagnostic record separates observations from possible explanations. That discipline is especially important when alarms appear after tuning, component replacement, cleaning or firmware changes. Use the following steps as an <strong>intake and decision workflow</strong>, not as authorization to perform live-electrical tests.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Identify the exact unit:</strong> record the machine model, hashboard revision, serial/asset ID, control board, firmware and cooling configuration. Avoid treating the name “S19” as sufficient technical identification.</li><li><strong>Capture the original evidence:</strong> preserve kernel log entries and timestamps, reported board or sensor temperatures, fan speeds, inlet/ambient readings, tuning settings, board detection and shutdown reason.</li><li><strong>Distinguish fault classes:</strong> document whether the event is a true high-temperature alarm, sensor read failure, fan/coolant alarm, intermittent loss of a reported temperature, or an unexplained drop in hashrate.</li><li><strong>Respond to safety alarms:</strong> if the miner reports overheating, abnormal smell, liquid ingress, damaged power connections or unreliable temperature feedback, follow the manufacturer's protective shutdown and site lockout procedures; never force the board to keep hashing without monitoring.</li><li><strong>Inspect only after approved isolation:</strong> examine de-energized fan and cable connectors, dust and airflow obstructions, mechanical damage, visible corrosion, thermal interface condition and evidence of prior repair. Maintain ESD safeguards.</li><li><strong>Escalate electrical tests:</strong> qualified repair personnel can use revision-matched diagrams and fixtures to test approved supply, I²C and sensor-circuit conditions at an authorized bench. A site operator should not improvise energized probes or component swaps.</li><li><strong>Retest against an acceptance record:</strong> confirm stable sensor communications, reasonable thermal trends, protection behavior and sustained mining under authorized cooling and workload conditions before returning hardware to service.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>A safe inspection is not just a matter of “turning it off.” AC power supplies and capacitors may retain energy, and board-level components can be damaged by electrostatic discharge or unintended contact. Personnel must follow applicable lockout, isolation, discharge, manufacturer's fixture and return-to-service procedures.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical example: a cold board reports an overheat condition</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Imagine a miner that has been shut down overnight in a controlled 24 °C room. On startup, its management page suddenly displays an implausibly high sensor value, and the firmware triggers thermal protection. That is <strong>an illustrative symptom, not proof of a failed LM75A</strong>. The first evidence collection would include the exact firmware error code, independent room-air measurement, time of the alarm, fan status, other board readings and any recent maintenance.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>If several reported temperatures are invalid at the same moment, shared sensor power, cabling, controller communication and configuration become important possibilities. If only one sensor on one board fails intermittently, a localized board issue becomes more plausible, but it still needs a qualified repair diagnosis. The unit should not be placed back in production simply by disabling alarms or changing thresholds.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical example: the outlet is hot but sensors still respond</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A miner can have legitimate temperature data and still overheat. Suppose a unit has a much warmer outlet than inlet and fans are operating near their limit. A technician investigates dust accumulation, heat-sink condition, inadequate air separation, rising inlet temperature or obstructed exhaust. The fact that a sensor responds does not guarantee that the cooling system is sufficient; the temperature trend and the actual thermal path matter.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is why <a href="https://bitcoinversus.tech/2026/10/13/why-bitcoin-miner-power-supplies-fail/">power-supply faults</a>, environmental factors and thermal protection should not be merged into one generic “bad hashboard” category. Bitmain's <a href="https://support.bitmain.com/hc/en-us/articles/18237912339097-Troubleshooting-and-solutions-for-ANTMINER-failures">general troubleshooting guidance</a> separates sensor errors, fan faults, power delivery and hashboard problems.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video study: broad S19 diagnosis before replacing a sensor</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A separate ZEUS MINING troubleshooting lesson discusses S19 zero-hashrate conditions and considers temperature-sensing circuitry alongside other board subsystems. Watch for the difference between testing a hypothesis and diagnosing a specific failed device. The vendor presents repair techniques for qualified technicians; this course emphasizes reading evidence correctly and avoiding uncontrolled field rework.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=uvF1MwJ5I-0]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=uvF1MwJ5I-0">ZEUS MINING, “Repair tutorial for Antminer S19 not hashing — ZMRC Antminer repair course”</a> (January 12, 2024). Covers thermal sensing as one possible cause of a no-hash condition, alongside power and chain problems.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Repair validation and documentation</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>For a sensor-related repair to be accepted, the technician must establish more than a new numeric reading. A meaningful closeout includes identified board revision and sensor part; documented fault and test method; complete inspection of any solder or thermal damage; reliable communication over a representative operating period; normal-looking relationships between reported temperatures and independently observed cooling conditions; and successful return to authorized mining settings without recurrent thermal alarms.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The correct replacement part and I²C address or pinout depend on the exact board design. Some vendors sell small adapter modules to bypass difficult component-level rework; such solutions may be useful in professional repair shops, but their claimed compatibility is not a guarantee of compliance or reliability for every firmware version. Protecting the hardware matters more than obtaining a temporarily green dashboard.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Why can a hashboard count all expected mining ASICs yet still be taken offline for a temperature-sensor error?</li><li>What is the difference between Bitmain's S19 XP <code>P:1</code> and <code>J:6</code> error categories?</li><li>What does Braiins OS <code>T5</code> establish, and what cause remains unconfirmed?</li><li>Why does an LM75A need a functioning supply and I²C bus as well as the sensor IC itself?</li><li>What minimum evidence should be recorded before declaring a sensor repair complete?</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answer guide:</strong> Chip enumeration checks mining-chain communication, not the separate thermal monitoring path. <code>P:1</code> signals high-temperature protection; <code>J:6</code> indicates a temperature-sensing fault in the referenced S19 XP implementation. <code>T5</code> indicates temperature-sensor data is unavailable from a running chain; it does not prove a particular component has failed. Digital sensors rely on their power and communication interface. A closeout needs a supported hardware diagnosis, stable readable temperatures, cooling verification and repeatable protected operation.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">References and further study</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Primary and technical references: <a href="https://support.bitmain.com/hc/en-us/articles/4406645619097-Common-Problems-and-Solutions-for-ANTMINER-19-series">Bitmain — S19-series common fault classes</a>; <a href="https://support.bitmain.com/hc/en-us/articles/10845468564633-S19-XP-log-diagnosis-and-processing-methods">Bitmain — S19 XP P:1 and J:6 logs</a>; <a href="https://academy.braiins.com/braiins-os/technical-resources">Braiins Academy — T5 sensor outage</a>; <a href="https://www.zeusbtc.com/manuals/Antminer-S19-Hash-Board-Repair-Guide.asp">Antminer S19 hashboard repair guide — U4/U6/U7/U8, I²C and 3.3 V</a>; <a href="https://www.zeusbtc.com/blog/details/5125-replacement-steps-for-antminer-19-series-lm75a-temperature-sensor-chip">ZEUS MINING — LM75A repair context</a>. Related lessons: <a href="https://bitcoinversus.tech/2026/10/28/oshre-002-hashboard-signal-chains-clk-co-ri-bo-rst/">signal-chain diagnostics</a> and <a href="https://bitcoinversus.tech/2026/11/01/hashboard-missing-asic-chip-diagnostics-test-fixtures-fault-localization/">missing ASIC chip diagnosis</a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="BitcoinVersus.Tech original Bitcoin donation QR code for 5,000 sats" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open this lesson on a laptop or larger display and scan the QR image with a compatible Bitcoin wallet. Verify the destination address before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->