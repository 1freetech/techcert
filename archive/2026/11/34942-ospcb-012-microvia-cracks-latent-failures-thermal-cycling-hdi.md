---
post_id: 34942
lesson_number: "OSPCB.012"
series: "Open Source Printed Circuit Board Engineering"
title: "OSPCB.012: Why Microvias Crack After a PCB Passes Inspection"
status: "published"
date: "2026-11-22T18:27:43"
slug: "ospcb-012-microvia-cracks-latent-failures-thermal-cycling-hdi"
live_url: "https://bitcoinversus.tech/2026/11/22/ospcb-012-microvia-cracks-latent-failures-thermal-cycling-hdi/"
featured_media_id: 34939
featured_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/ospcb-012-microvia-reliability-cover-1200x630-1.jpg"
cover_style: "photorealistic"
watermark_source: "exact crop from OSHRE.011 prior approved cover"
youtube_ids: ["RDYOek36aGc", "8QQXOEOoSq4"]
categories: [233999, 792709720, 284207, 2509703, 6]
tags: [766616331, 304802, 458471, 839485, 151031]
objective_coverage: "Four separately taught sections plus answer-key assessment"
content_format: "Gutenberg HTML"
---

<!-- wp:paragraph -->
<p><strong>OSPCB.012</strong> investigates a hidden defect in high-density printed circuit boards: a tiny copper connection can pass inspection at room temperature yet open during assembly or service. Industry standards organization <a href="https://www.electronics.org/news-release/ipc-issues-electronics-industry-warning-printed-board-microvia-reliability-high">IPC warned in 2019</a> that some microvia failures appear only after solder reflow or environmental stress. Begin with <a href="https://bitcoinversus.tech/2026/10/24/ospcb-002-pads-vias-through-holes/">OSPCB.002 on vias</a> and <a href="https://bitcoinversus.tech/2026/11/14/ospcb-008-pcb-vias-annular-rings-drill-aspect-ratio-fabrication-kicad-10/">OSPCB.008 on fabrication limits</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Objective 1:</strong> Identify microvias and distinguish stacked from staggered HDI connections.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Objective 2:</strong> Explain why weak copper interfaces can fail under thermal stress despite passing room-temperature tests.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Objective 3:</strong> Calculate aspect ratios and distinguish manufacturability from reliability.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Objective 4:</strong> Evaluate acceptance evidence and determine when to escalate a suspected failure.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Objective 1 — Microvia construction and layout</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>microvia</strong> is a small interlayer connection, typically laser-drilled through thin dielectric in a high-density interconnect (<strong>HDI</strong>) board. Metallization joins an upper copper land to a lower <strong>target pad</strong>. <strong>Stacked microvias</strong> sit vertically above one another, whereas <strong>staggered microvias</strong> are horizontally offset and connected with copper routing. Stacking saves space but adds aligned plated interfaces. Fabricator <a href="https://www.ncabgroup.com/microvias/">NCAB Group</a> recommends limiting certain complex stacks to two microvia levels and avoiding direct stacking above buried vias when possible. Such guidance requires design-specific review; not every stack will fail.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=RDYOek36aGc","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=RDYOek36aGc
</div><figcaption class="wp-element-caption"><em>Altium Academy, “Mechanical Drilling vs. Laser Drilling in PCB Vias.” Zach Peterson describes laser-drilled microvias and fabrication trade-offs.</em> <a href="https://www.youtube.com/watch?v=RDYOek36aGc">Watch directly on YouTube</a> if embedded playback is restricted.</figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Objective 2 — Why cold continuity misses a hot defect</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>weak microvia interface</strong> can develop where plated copper bonds to its target pad. Reflow heating or repeated expansion stresses the joint. A microscopic separation may interrupt current while hot and then partly close as copper cools, leaving a deceptively normal resistance reading. IPC identified latent faults after reflow, environmental screening and field use, even on boards previously accepted by standard inspections. A simple continuity beep therefore does not establish long-term interconnect reliability. Compare the visible opens discussed in <a href="https://bitcoinversus.tech/2026/11/22/ospcb-011-diagnosing-pcb-open-short-circuits-continuity-netlist/">OSPCB.011</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Objective 3 — Practice the geometry</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Worked calculation:</strong> suppose a microvia passes through <strong>75 µm</strong> of dielectric with a nominal <strong>100 µm</strong> hole diameter. Aspect ratio equals depth divided by diameter: <strong>75 ÷ 100 = 0.75:1</strong>. If depth increases to 125 µm without increasing diameter, the ratio becomes <strong>1.25:1</strong>, raising a separate manufacturability question. Neither ratio measures copper adhesion, plating defects, or expected lifetime. For design approval, review capture land, target land, drill quality, filling, and materials with the fabricator. <a href="https://www.altium.com/documentation/altium-designer/pcb/blind-buried-micro-vias">Altium’s technical documentation</a> describes layer-pair drilling and HDI via fabrication.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=8QQXOEOoSq4","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=8QQXOEOoSq4
</div><figcaption class="wp-element-caption"><em>Altium Academy, “HDI PCB Design Review: nRF5340 Stackup &amp; Microvia Mistakes to Fix” (2026). Practical review of stackup and manufacturing constraints.</em> <a href="https://www.youtube.com/watch?v=8QQXOEOoSq4">Watch directly on YouTube</a> if embedded playback is restricted.</figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Objective 4 — Test and document reliability</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A qualified laboratory may fabricate <strong>representative daisy-chain coupons</strong> matching the actual microvia geometry and materials, then monitor <strong>four-wire resistance</strong> continuously during approved thermal stress or reflow. The goal is to capture an opening while the structure is stressed instead of relying only on a cold end-point result. Cross-sections, lot history and manufacturer qualification criteria provide additional evidence. <a href="https://resources.altium.com/p/ipc-warning-about-microvia-reliability-high-performance-products">Altium’s IPC warning analysis</a> describes the value of such measurements. Read <a href="https://bitcoinversus.tech/2026/11/21/ospcb-010-aoi-xray-in-circuit-functional-testing/">OSPCB.010 on inspection methods</a> and <a href="https://bitcoinversus.tech/2026/11/22/oshre-011-hashboard-bench-test-vs-full-miner-load-acceptance/">OSHRE.011 on acceptance limits</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Record the affected net, stackup, board revision, manufacturing lot, thermal history, measurement temperature, test procedure, and all resistance readings. Escalate suspected latent faults to engineering rather than treating a passing room-temperature test as conclusive. Never heat, flex, energize, or probe production hardware outside approved safety procedures.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Objective-by-objective assessment</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1.</strong> Vertically aligned microvias are <em>stacked</em>; offset connections are <em>staggered</em>. <strong>2.</strong> A cool board can pass continuity because an interface may reconnect as temperature drops. <strong>3.</strong> Depth 60 µm divided by diameter 100 µm gives <strong>0.60:1</strong>, not a guaranteed service life. <strong>4.</strong> A reliable acceptance decision needs representative, approved evidence under relevant operating stresses and documented engineering review.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Lesson takeaway:</strong> HDI reliability depends on sound copper interfaces, suitable geometry, validated fabrication, and testing capable of exposing intermittent faults.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>We volunteer daily to ensure the credibility of the information on the platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiative, please scan the QR code below.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24593,"sizeSlug":"medium","linkDestination":"none"} -->
<figure class="wp-block-image size-medium"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr.png?w=300" class="wp-image-24593" alt="BitcoinVersus.Tech research support QR code" /></figure>
<!-- /wp:image -->
