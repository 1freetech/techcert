---
lesson_id: OSHRE.003
track: "Open-Source Hashboard Repair Engineering"
level: "Super-Fundamentals"
title: "Diagnosing Missing ASIC Chips on a Hashboard"
post_id: 27838
url: "https://bitcoinversus.tech/2026/11/01/hashboard-missing-asic-chip-diagnostics-test-fixtures-fault-localization/"
published_date: "2026-11-01"
wordpress_category_ids: [57414501, 792778074, 284207, 2509703]
featured_media_id: 27845
featured_image_dimensions: "1200x630"
featured_art_style: "Anime editorial artwork"
featured_person: "Fictional Middle Eastern/North African adult male hashboard engineer, aged 40s-50s"
in_story_media_count: 4
in_story_media: ["21674: real BM1387B ASIC photo, CC BY 4.0", "s7Fy8r3uNXc: ZEUS MINING universal tester video", "21686: real board-level maintenance photo, CC BY-SA 2.0", "j2MEHNfxMcU: D-Central Antminer 19-series repair video"]
video_embed_method: "Gutenberg core/shortcode; [youtube https://www.youtube.com/watch?v=VIDEO_ID]"
quality_assurance: "WordPress published raw/rendered read-back confirms two YouTube iframe players with correct IDs and adjacent captions; two licensed real in-body photos; original QR; verbatim approved Editor's Note; 1200x630 featured cover. Independent browser playback and mobile screenshot untested; public web fetch inaccessible."
next_lesson: OSHRE.004
---

<!-- wp:paragraph --><p>A <strong>missing ASIC-chip report</strong> is a diagnostic observation from a Bitcoin mining control board or dedicated hashboard tester: fewer mining chips responded than the firmware expected. The number can be zero, a partial chain, or an apparently complete count despite poor mining performance. In each case, the engineer must separate <strong>chip discovery</strong> from <strong>chip health</strong>. A reported missing chip is not necessarily a failed silicon die.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This reference lesson belongs to the Hashboard Repair Engineering curriculum. It follows <a href="https://bitcoinversus.tech/2026/10/27/oshre-000-bitcoin-mining-anatomy-of-the-hashboard/">the anatomy of a hashboard</a>, <a href="https://bitcoinversus.tech/2026/10/27/oshre-001-hashboard-voltage-domains-power-distribution/">voltage domains and power distribution</a>, and <a href="https://bitcoinversus.tech/2026/10/28/oshre-002-hashboard-signal-chains-clk-co-ri-bo-rst/">hashboard signal chains</a>. Its focus is interpreting evidence, assigning a fault to the appropriate subsystem, and knowing when to stop and refer the board for controlled repair.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">What you will learn</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Distinguish an absent hashboard from a board that is present but reports zero or fewer-than-expected ASICs.</li><li>Understand why the correct expected count depends on the exact model, silicon generation and PCB revision.</li><li>Use miner logs, maintenance history and compatible test-fixture results to narrow plausible causes without treating an error message as a complete diagnosis.</li><li>Build a safe evidence trail for service escalation, rework authorization and post-repair validation.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">What an ASIC count really measures</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>An <a href="https://bitcoinversus.tech/2026/10/07/bitcoin-mining-hardware-what-is-hashboard-asic-board/">ASIC hashboard</a> carries a chain of chips that perform the SHA-256 calculations used in Bitcoin mining. During initialization, the controller communicates with the board and attempts to discover the chips or confirm their responses. The displayed count is therefore a snapshot of <em>detected communication under specific power, clock, reset, software and thermal conditions</em>. A healthy-looking number does not prove every chip can mine valid work at operational frequency.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A classic Antminer S19 BM1398 board typically has <strong>76 ASICs</strong>. The S19 Pro's documented BM1398 implementation has <strong>114 ASICs</strong>. Those figures are not interchangeable and do not automatically apply to a board identified only by the marketing name “S19,” let alone to newer S19 XP or S21 variants. Record the silkscreen PCB identifier and validate the applicable repair manual before judging an expected number. See the <a href="https://www.zeusbtc.com/manuals/Antminer-S19-Hash-Board-Repair-Guide.asp">S19 repair manual</a> and the <a href="https://www.zeusbtc.com/manuals/antminer-s19-pro-hash-board-repair-guide.asp">S19 Pro guide</a> for the differing architectures.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":21674,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/antminer-bm1387b-asic-board-source.jpg" alt="Photograph of a real BM1387B Bitcoin mining ASIC on a green printed circuit board, showing chip package and neighboring electronic components" class="wp-image-21674" /><figcaption class="wp-element-caption"><em>Real BM1387B ASIC board detail. Photograph by <a href="https://commons.wikimedia.org/wiki/File:Pcb1_-_Antminer_BM1387B_-_John_McMaster.jpg">John McMaster / Wikimedia Commons</a>, <a href="https://creativecommons.org/licenses/by/4.0/">CC BY 4.0</a>. This older BM1387 generation illustrates real chip packaging; it is <strong>not</strong> an S19 BM1398 board.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p>The same physical-looking board family can hide important revisions. A replacement ASIC, tester firmware or fixture cable selected solely by product name may be incompatible. Misidentification can invalidate a test before a technician ever reaches the suspected chip.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Three different symptom classes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Board not detected:</strong> the controller may fail to establish communication with an entire hashboard. Investigate the reported board slot, connector seating, control-board interface, recognized board revision and power state before declaring the PCB defective.</li><li><strong>Zero ASICs on a detected chain:</strong> software may report <code>Chain 0 only find 0 asic</code>. Causes can include insufficient power, a shorted supply domain, missing clock or reset signaling, defective interface circuitry, or an open chain. The exact first failure point is still unknown.</li><li><strong>Partial count:</strong> a log such as <code>Chain 0 only find 6 asic, will power off hash board 0</code> means only six chips were confirmed in that scan. The remaining unconfirmed chips are <em>not</em> automatically six separate defects—or proof that the seventh chip's silicon is bad. A break in the communication path, local power or test setup can prevent downstream responses.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><a href="https://support.bitmain.com/hc/en-us/articles/27245455307033-TIPS-for-Common-Scenario-of-Miners-Restart">Bitmain's restart guidance</a> explicitly warns operators not to repeatedly restart a miner when one hashboard reports only some ASICs, because secondary damage may occur. A fleet technician should preserve logs and follow the manufacturer's service route instead of cycling power until the alarm disappears.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The role of the compatible hashboard test fixture</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A dedicated hashboard tester can check chip discovery independently of a production control board, provided the fixture, support cables, test software, voltage source and cooling method have been validated for the exact board revision. Bitmain's official <a href="https://support.bitmain.com/hc/en-us/articles/900001565643-How-to-set-up-V1-0-test-jig-manual-for-S17-T17-S17e-T17e-and-S19-series-miners">S17/S19-series test-jig documentation</a> explains why fixture setup and required cooling are part of a valid test. An incorrect test configuration is a possible source of false failures.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=s7Fy8r3uNXc]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=s7Fy8r3uNXc">ZEUS MINING, “Tutorial for Antminer universal test fixture upgraded version”</a> (July 2025). An original demonstration of a repair fixture using compatible example hashboards. Its settings and connection process are model-specific; observe only unless qualified and following the current manufacturer's procedure.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The fixture is <strong>an instrument, not an oracle</strong>. One reported failing chip index may signify the first point beyond which the tester received no valid response. An engineer must still determine whether the cause is a missing domain voltage, damaged passive component, unstable clock or reset, faulty ASIC, physical connector defect or incorrect testing configuration. An observation belongs in the record even when the underlying cause is unresolved.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">A safe diagnostic intake workflow</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Record the identity:</strong> asset ID, miner model, firmware, control-board revision, hashboard slot, PCB silkscreen identifier, ASIC type, and previously verified chip count. Include any repair history.</li><li><strong>Capture the original evidence:</strong> kernel logs, alarms, chain count, hardware version, thermal readings, uptime and frequency/voltage settings before any reboot or firmware modification. Note whether pool and network connectivity are normal.</li><li><strong>Stop on electrical warning signs:</strong> burnt connector, liquid ingress, damaged cable, discolored copper, suspected short circuit, smell of overheating, or a partial-chip count. Follow isolation/lockout procedures; do not reconnect a known faulty board to production power.</li><li><strong>Inspect de-energized hardware:</strong> after professionally isolating, disconnecting and verifying the unit is safe, inspect cable seating, pin deformation, contamination, damaged heatsinks, loose fasteners and PCB distortion. Follow manufacturer instructions, ESD precautions and site policy.</li><li><strong>Choose the test boundary:</strong> a permitted control-cable inspection may resolve a slot communication problem; a questionable PCB or suspected power fault belongs at a qualified hashboard repair bench with suitable approved test fixtures.</li><li><strong>Escalate with evidence:</strong> state “chain responds with six of the expected 76 ASICs” rather than “70 bad chips.” Document the exact firmware and tester message, the conditions of the test and what remains unproven.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>This workflow is purposely not a live-board probing recipe. Antminer power supplies and board capacitors present substantial electrical hazards, and seemingly simple field tricks such as bridging ASIC test points or modifying power sequencing can damage hardware or injure a technician. Those activities require model-specific instructions, authorization, appropriate equipment and a qualified repair environment.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":21686,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/antminer-board-level-maintenance-real-photo.jpg" alt="Real photograph showing opened Bitcoin mining machines with exposed circuit boards and cooling hardware on a maintenance bench" class="wp-image-21686" /><figcaption class="wp-element-caption"><em>Real opened Bitcoin mining hardware during maintenance. Photograph by <a href="https://commons.wikimedia.org/wiki/File:Cam_2020-06-27_05-13-59_(50051439498).jpg">Steve Rainwater / Wikimedia Commons</a>, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC BY-SA 2.0</a>. This is a general maintenance example, not the S19 fault case described below.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p>A visual inspection is a necessary first filter, not a guarantee. A clean connector can still have a damaged contact; a visually normal ASIC may be electrically faulty; and an overheating board can have intact-looking chips but impaired airflow. Record what is seen, what is measured and what is inferred as three separate categories.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical case: one S19 chain detects six chips</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Consider an <strong>illustrative</strong> 76-chip S19 board that previously worked normally. The system remains reachable over the network, two other boards initialize correctly, but the kernel log reports <code>Chain 0 only find 6 asic, will power off hash board 0</code>. The right first conclusion is <strong>incomplete enumeration of chain 0</strong>. It is not yet proof that chip seven failed. The machine's total hashrate may fall, but that does not identify an individual component.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The operator preserves the log and takes the affected unit out of production following the service procedure. The repair intake confirms the PCB revision and prior configuration and inspects the de-energized cable and board. A qualified technician then decides whether to perform fixture-assisted discovery, approved electrical measurements and component-level diagnosis. A chain break near a particular chip could arise from signal continuity, passives, domain supply or chip attachment. The defect is not closed until the chosen corrective action passes a repeatable verification test.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical case: every board reports zero ASICs</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>If three separate boards simultaneously report no discoverable ASICs, one common control, power, firmware or tester condition becomes a plausible cause. However, a common-cause hypothesis is not proof: multiple shorts and simultaneous physical damage remain possible. Bitmain's <a href="https://support.bitmain.com/hc/en-us/articles/14588260408601-Solution-of-Zero-Hashrate-on-S19-Miner">zero-hashrate guidance</a> lists power, firmware, network/pool and hashboard problems among the possible origins of zero mining output; those categories should be tested rather than conflated.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A miner that cannot reach the pool is not equivalent to a hashboard reporting zero ASICs. Network telemetry, available control-board diagnostics and the difference between <em>chip discovery</em> and <em>accepted pool shares</em> are especially useful here. The absence of share submissions is a symptom shared by many unrelated failures.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Watching a professional repair workflow</h2><!-- /wp:heading -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=j2MEHNfxMcU]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=j2MEHNfxMcU">D-Central, “Antminer 19 Series Hashboard Repair — Bitcoin ASIC Miner Repair LIVE”</a> (September 2022). A professional repair technician demonstrates troubleshooting. Compare the observed symptom, test evidence, and corrective action; do not duplicate energized or rework procedures without proper training.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>While reviewing the demonstration, ask which evidence establishes a failing board rather than a failing control-board connection, which tester configuration is being used, and whether post-repair tests address both chip discovery and stable mining output. A successful one-time enumeration does not establish reliability under sustained thermal load.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">After repair: what acceptance actually means</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Identification:</strong> the correct board and ASIC type are documented; original faults and corrective work are traceable to the service ticket.</li><li><strong>Electrical inspection:</strong> an authorized technician verifies no remaining shorts, damaged pads, connector defects or unsafe repair residue.</li><li><strong>Fixture result:</strong> the correct expected count and functional test complete using a validated model-specific setup. One count is not the entire acceptance test.</li><li><strong>Operational stability:</strong> mining remains stable at authorized settings, with no new thermal alarms, repeated dropped chains or unacceptable hardware error trend.</li><li><strong>Return-to-service evidence:</strong> dates, technician, firmware version, test results, temperature and accepted shares or hashrate are recorded. If results disagree, the board remains quarantined.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The repair objective is not simply to make a red alarm turn green. It is to re-establish a safe, repeatable operating condition while preserving enough data for future root-cause analysis. Learn how <a href="https://bitcoinversus.tech/2026/10/13/what-an-asic-miner-control-board-does/">miner control boards</a> participate in discovery, why <a href="https://bitcoinversus.tech/2026/10/13/why-bitcoin-miner-power-supplies-fail/">power-supply faults</a> are a separate diagnostic path, and why <a href="https://bitcoinversus.tech/2026/09/27/bitcoin-mining-hashboard-consolidation-compatibility/">hashboard interchangeability</a> cannot be assumed.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>A 76-chip hashboard reports six discoverable ASICs. What has actually been established, and what has not?</li><li>Why would a successful scan with the wrong test fixture or firmware configuration be untrustworthy?</li><li>How does a zero-hashrate condition differ from a zero-ASIC chain error?</li><li>Why is it safer to preserve an original partial-count log than repeatedly reboot the miner?</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answer guide:</strong> The first result establishes a partial communication response under one test condition, not the number of defective silicon dies. A fixture must match the board revision and intended test profile or its output cannot be interpreted reliably. Zero hashrate can result from network, pool, controller, power or board problems, whereas zero ASIC count is a specific failed chip-discovery observation. Repeated restarting can worsen a fault, and Bitmain advises avoiding it on partial-count failures.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Primary technical references and related study</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Manufacturer and service references: <a href="https://support.bitmain.com/hc/en-us/articles/27245455307033-TIPS-for-Common-Scenario-of-Miners-Restart">Bitmain — abnormal restart and missing ASIC warning</a>; <a href="https://support.bitmain.com/hc/en-us/articles/900001565643-How-to-set-up-V1-0-test-jig-manual-for-S17-T17-S17e-T17e-and-S19-series-miners">Bitmain — V1.0 fixture preparation</a>; <a href="https://support.bitmain.com/hc/en-us/articles/14587681700889-Solution-of-Low-Hashrate-on-S19-Miner">Bitmain — low S19 hashrate</a>; <a href="https://support.bitmain.com/hc/en-us/articles/14588260408601-Solution-of-Zero-Hashrate-on-S19-Miner">Bitmain — zero S19 hashrate</a>; <a href="https://www.zeusbtc.com/manuals/Antminer-S19-Hash-Board-Repair-Guide.asp">S19 BM1398 board service manual</a>; <a href="https://www.zeusbtc.com/manuals/antminer-s19-pro-hash-board-repair-guide.asp">S19 Pro service manual</a>; <a href="https://d-central.tech/manuals/antminer-s19-maintenance-repair-guide/">D-Central maintenance guide</a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Original BitcoinVersus.Tech donation QR code requesting 5,000 sats" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open this lesson on a laptop or larger screen and scan the original QR image with a compatible Bitcoin wallet. Verify the receiving address <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong> before sending.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->