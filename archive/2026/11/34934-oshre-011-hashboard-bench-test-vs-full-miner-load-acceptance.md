---
post_id: 34934
series: "Open Source Hashboard Repair Engineering"
lesson_id: "OSHRE.011"
title: "OSHRE.011: Why Hashboards Pass Bench Tests but Fail in Miners"
status: "published"
published: "2026-11-22T18:22:51"
slug: "oshre-011-hashboard-bench-test-vs-full-miner-load-acceptance"
live_url: "https://bitcoinversus.tech/2026/11/22/oshre-011-hashboard-bench-test-vs-full-miner-load-acceptance/"
featured_media_id: 34933
featured_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/oshre-011-hashboard-bench-versus-full-load-oil-1200x630-1.jpg"
cover_style: "oil painting"
video_ids: ["4d27aw4MftA", "hAD3HGW31vY"]
categories: [792826578, 57414501, 792778074, 2509703, 6]
tags: [4545068, 765829721, 782320707, 230325488, 343933866]
content_format: "WordPress Gutenberg source HTML"
---

<!-- wp:paragraph -->
<p><strong>OSHRE.011</strong> tackles a costly repair mistake: accepting a Bitcoin mining hashboard because a fixture detects its chips once. A test jig can confirm selected electrical or communication behaviors, yet complete-miner operation adds power distribution, firmware, cooling, and sustained workload. BITMAIN <a href="https://support.bitmain.com/hc/en-us/articles/25857846551065-Precautions-and-risks-of-sending-hashboard-only-for-repair">explicitly warns</a> that a repaired board passing its test may still fail or miss original hashrate after reinstallation. Begin with <a href="https://bitcoinversus.tech/2026/11/01/hashboard-missing-asic-chip-diagnostics-test-fixtures-fault-localization/">OSHRE.003 on missing ASICs</a> and <a href="https://bitcoinversus.tech/2026/11/21/oshre-010-hashboard-thermal-imaging-emissivity-hotspot-diagnostics/">OSHRE.010 on thermal imaging</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list">
<!-- wp:list-item -->
<li>Distinguish chip enumeration, fixture testing, functional hashing, and sustained full-miner verification.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Identify logs and environmental measurements needed to explain a post-repair failure.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Calculate illustrative hashrate change and pool-share rejection percentage without inventing pass limits.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Create a traceable, safety-conscious acceptance record and define when to escalate rather than release.</li>
<!-- /wp:list-item -->
</ul>
<!-- /wp:list -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=4d27aw4MftA","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=4d27aw4MftA
</div><figcaption class="wp-element-caption"><em>ZEUS MINING, “How to install conversion and test file when use Antminer test fixture to test hashboard?” Vendor demonstration of model-specific fixture software. Not independent certification.</em> <a href="https://www.youtube.com/watch?v=4d27aw4MftA">Watch directly on YouTube</a> if embedded playback is restricted.</figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">One pass is not four passes</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Chip enumeration</strong> means a controller or fixture sees the expected ASIC responses. <strong>Fixture testing</strong> checks only the functions supported by its particular hardware and test file; incompatible fixtures can mislead. <strong>Functional hashing</strong> requires the assembled miner to process work and report valid hashes. <strong>Sustained verification</strong> determines whether output remains stable after thermal and operating conditions settle. BITMAIN publishes <a href="https://support.bitmain.com/hc/en-us/articles/900000305506-Directions-for-Hashboard-Test-Jigs">model-specific fixture compatibility</a>; passing one mode does not imply every other mode has been exercised.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read the miner and the environment together</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After authorized reassembly, compare the <strong>chain count and ASIC count</strong> against the exact model, then record <strong>firmware, board revision, clock/frequency, real-time and average hashrate, chip and PCB temperatures, fan state, power or PSU alarms, and kernel-log timestamps</strong>. BITMAIN’s <a href="https://support.bitmain.com/hc/en-us/articles/360013577314-Miner-Status-Page-Explained">status-field guide</a> distinguishes real-time from average hashrate and explains why some hardware-error counts are expected. For signals and connectors, review <a href="https://bitcoinversus.tech/2026/10/28/oshre-002-hashboard-signal-chains-clk-co-ri-bo-rst/">OSHRE.002</a> and <a href="https://bitcoinversus.tech/2026/11/01/oshre-005-hashboard-cable-connectors-contact-faults/">OSHRE.005</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A board that works cold but fails after warming may indicate cooling, intermittent contact, or other temperature-dependent faults; a bad temperature reading may instead indicate a sensor problem. No single symptom proves the repair failed. BITMAIN’s <a href="https://support.bitmain.com/hc/en-us/articles/4406645619097-Common-Problems-and-Solutions-for-ANTMINER-19-series">S19 fault guide</a> separates fan, PIC, missing-chip, PSU, and overtemperature indicators. The broader concepts connect to <a href="https://bitcoinversus.tech/2026/11/01/oshre-004-hashboard-temperature-sensors-thermal-protection-lm75a-i2c/">OSHRE.004 on thermal sensors</a> and <a href="https://bitcoinversus.tech/2026/10/27/oshre-001-hashboard-voltage-domains-power-distribution/">OSHRE.001 on voltage domains</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=hAD3HGW31vY","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=hAD3HGW31vY
</div><figcaption class="wp-element-caption"><em>ZEUS MINING, “PicoBT universal test fixture for ASIC miner hash board and power supply” (2025). Vendor overview of tester coverage; model claims must be independently checked against documentation.</em> <a href="https://www.youtube.com/watch?v=hAD3HGW31vY">Watch directly on YouTube</a> if embedded playback is restricted.</figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Calculate the performance change</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Illustrative readings:</strong> a comparable pre-repair baseline averages 100 TH/s; a repaired unit averages 92 TH/s during a suitably matched observation window. Relative decline = <strong>(100 − 92) ÷ 100 × 100 = 8%</strong>. Separately, 5 rejected pool shares among 995 accepted and 5 rejected yield <strong>5 ÷ 1,000 × 100 = 0.5%</strong> rejected. These examples describe different metrics, not validated service limits. Network latency, pool behavior, measurement duration, and firmware tuning can confound the diagnosis. <a href="https://academy.braiins.com/braiins-os/autotuning">Braiins</a> documents variation with temperatures and tuning conditions.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Release decision and documented evidence</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list">
<!-- wp:list-item -->
<li><strong>Before approval:</strong> record miner serial, board identity, original fault, repair actions, compatible fixture mode, and fixture outcome.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>During approved testing:</strong> save logs and comparable temperature, fan, hashrate, power, and pool-share trends at startup and after stabilization.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>At handoff:</strong> compare results with the exact model’s manufacturer criteria and service procedure; flag unexplained drops, protection events, and intermittent faults.</li>
<!-- /wp:list-item -->
</ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>A <strong>burn-in</strong> is a defined powered stress test, not an arbitrary number of hot operating hours; <a href="https://s3vi.ndc.nasa.gov/ssri-kb/topics/47/">NASA’s reliability guidance</a> describes its purpose. No universal duration or temperature applies to every miner. Energized diagnostics, cable movement, firmware changes, and power testing require qualified authorization and approved safety procedures; never bypass protection or probe live high-current rails to reproduce a fault.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Check your understanding</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Question:</strong> Does full chip detection prove stable hashing? <strong>Answer:</strong> No. <strong>Question:</strong> Can an 8% drop alone identify a defective ASIC? <strong>Answer:</strong> No; compare equivalent conditions, logs, and cooling. <strong>Question:</strong> What permits release? <strong>Answer:</strong> documented conformity with model-specific acceptance requirements and no unresolved safety-related alarms.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiative, please scan the QR code below.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24593,"sizeSlug":"medium","linkDestination":"none"} -->
<figure class="wp-block-image size-medium"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr.png?w=300" alt="BitcoinVersus.Tech voluntary research support QR code" class="wp-image-24593" /></figure>
<!-- /wp:image -->
