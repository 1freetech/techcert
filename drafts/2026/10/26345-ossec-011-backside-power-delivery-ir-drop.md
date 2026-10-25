---
title: "OSSEC.011: Backside Power Delivery and IR Drop"
status: draft
wordpress_post_id: 26345
preview_url: "https://bitcoinversus.tech/?p=26345&preview=true"
edit_url: "https://bitcoinversus.tech/wp-admin/post.php?post=26345&action=edit"
featured_media_id: 26340
featured_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossec_011_backside_power_cover_1200x630.jpg"
featured_image_dimensions: "1200x630"
featured_image_style: "realistic editorial photography"
body_image_id: 26343
body_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/silicon-wafer-close-view-wikimedia.jpg"
body_image_license: "CC BY 4.0; Le hollandais volant; Wikimedia Commons"
youtube: ["https://www.youtube.com/watch?v=XnR9j7ljAx4","https://www.youtube.com/watch?v=OtAWftbX2Jk","https://www.youtube.com/watch?v=fc_xzN6UErI"]
social: ["https://www.reddit.com/r/hardware/comments/1b3kukx/","https://www.reddit.com/r/intel/comments/1d1kuto/"]
native_embeds_rendered: true
social_embeds_verified: true
youtube_playback_verified: false
publication_gate: held
rotation_advanced: false
qa_note: "All three embedded players initialized, but video remained at 0:00 with readyState 0. The official Intel video also buffered on its direct YouTube page in the same QA browser. Actual playback remains unverified, not established as globally broken."
archived_at: "2026-10-25T03:56:40.980Z"
---

<!-- wp:paragraph -->
<p><strong>Backside power delivery moves a chip’s power-distribution wiring to the opposite side of the wafer from its main signal interconnects.</strong> OSSEC.011 follows <a href="https://bitcoinversus.tech/2026/10/15/ossec-010-complementary-fet-cfet-architecture-vertical-nmos-pmos-stacking-monolithic-sequential-parasitics-scaling/">OSSEC.010 on CFET stacking</a>, but studies a separate engineering problem: getting a stable supply voltage to densely packed transistors. <a href="https://www.intel.com/content/www/us/en/newsroom/news/powervia-intel-achieves-chipmaking-breakthrough.html">Intel’s PowerVia explanation</a> shows how separating power from signal routing can shorten the power path and relieve frontside congestion. The goal is better delivery, not a new source of electricity.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list">
<!-- wp:list-item -->
<li>Backside power delivery changes the wiring architecture; it is not the same as gate-all-around channels or CFET transistor stacking.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Resistive voltage drop follows ΔV = I × R. Lower path resistance can preserve more voltage at the load.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Buried power rails and nano-through-silicon vias are one implementation, not a universal recipe.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>A useful comparison includes power integrity, routing, contacts, thermal behavior, manufacturability, and reliability.</li>
<!-- /wp:list-item -->
</ul>
<!-- /wp:list -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=XnR9j7ljAx4","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=XnR9j7ljAx4
</div><figcaption class="wp-element-caption"><em>Intel Technology’s PowerVia animation introduces the separation of backside power wiring from frontside signals.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:embed {"url":"https://www.reddit.com/r/hardware/comments/1b3kukx/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/hardware/comments/1b3kukx/
</div><figcaption class="wp-element-caption"><em>A 2024 r/hardware discussion raises practical questions about backside connections and alignment. Community comments are discussion prompts, not verification of today’s product roadmaps.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Think of signal wires as messages and power wires as the supply routes that let the receivers work. Sharing the frontside metal stack makes both networks compete for space. <a href="https://www.imec-int.com/en/articles/how-power-chips-backside">Imec’s process overview</a> explains how wider, less resistive backside routes can feed the devices through vertical connections. The basic electrical principle is the same as <a href="https://bitcoinversus.tech/2026/09/29/osetc-005-ohms-law-field-calculations/">Ohm’s law</a>: current flowing through resistance causes a voltage drop. Real chip power grids are distributed networks, so this simple model is a starting point, not a full signoff simulation.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=OtAWftbX2Jk","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=OtAWftbX2Jk
</div><figcaption class="wp-element-caption"><em>Intel Foundry’s short PowerVia overview connects backside routing with power-delivery resistance and usable frontside space.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Follow the Power Path</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list">
<!-- wp:list-item -->
<li><strong>Conventional frontside path:</strong> supply connections feed a frontside metal-and-via network, which reaches local rails and transistor terminals.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>One backside implementation:</strong> backside metal feeds nano-through-silicon vias, then buried power rails and device contacts. Other schemes use different backside contacts; <a href="https://www.imec-int.com/en/articles/backside-power-delivery-options-dtco-study">imec’s comparison</a> explains why connectivity choices matter.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Manufacturing sequence:</strong> in imec’s illustrated buried-rail flow, frontside fabrication is followed by carrier bonding, wafer thinning, backside via formation, and backside metallization. Exact materials and dimensions depend on the process.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Keep the boundaries clear:</strong> <a href="https://bitcoinversus.tech/2026/10/13/ossec-009-gate-all-around-nanosheet-electrostatics/">GAA electrostatics</a> concerns gate control of the channel; CFET stacks complementary transistors; backside power changes how supply and return connections reach them.</li>
<!-- /wp:list-item -->
</ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Worked IR-Drop Example</h2>
<!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list">
<!-- wp:list-item -->
<li><strong>Assumptions:</strong> an illustrative local circuit draws 0.20 A from a 0.70 V source. The effective resistance of its supply-and-return path is 0.10 Ω. These are teaching values, not measurements of a commercial process.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Original path:</strong> ΔV = 0.20 A × 0.10 Ω = 0.020 V = 20 mV. The available local supply difference is approximately 0.680 V.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Lower-resistance path:</strong> at the same current, 0.04 Ω gives ΔV = 8 mV and approximately 0.692 V at the load.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Interpretation:</strong> the modeled resistive drop falls by (20 − 8) ÷ 20 = 60%. That is not a 60% reduction in total chip energy, temperature, or execution time.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Model limit:</strong> fast current changes also involve inductance and decoupling. Timing, workload, and spatially varying current must be included in a real power-integrity analysis.</li>
<!-- /wp:list-item -->
</ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What an Engineer Must Check</h2>
<!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list">
<!-- wp:list-item -->
<li><strong>Electrical access:</strong> extract the complete rail, via, interface, and <a href="https://bitcoinversus.tech/2026/01/21/semiconductor-physics-contact-resistance/">contact resistance</a>. A short route is not automatically a low-resistance route.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Dynamic behavior:</strong> compare worst-case local voltage across switching activity, process, voltage, and temperature conditions—not only average DC drop.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Integration:</strong> inspect wafer-thinning uniformity, backside alignment, isolation, and metal continuity. Check thermal behavior and long-term current-density limits.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>Design closure:</strong> compare routed area, timing, and power with equivalent circuit assumptions. <a href="https://blogs.sw.siemens.com/calibre/2026/09/30/solving-the-extraction-challenges-of-cfet-and-backside-power/">Siemens’ extraction discussion</a> highlights the need to model both sides of the structure.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><strong>System boundary:</strong> die-level supply routing is only one part of <a href="https://bitcoinversus.tech/2026/08/14/the-semiconductor-packaging-flow/">semiconductor packaging and assembly</a>. It does not eliminate package losses, voltage regulation, or cooling.</li>
<!-- /wp:list-item -->
</ul>
<!-- /wp:list -->

<!-- wp:embed {"url":"https://www.reddit.com/r/intel/comments/1d1kuto/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/intel/comments/1d1kuto/
</div><figcaption class="wp-element-caption"><em>This 2024 r/intel thread discusses the longer explainer below. Its dated forecasts should not be treated as current production evidence.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list">
<!-- wp:list-item -->
<li>Sketch separate paths for a logic signal, VDD supply, and VSS return. Mark the transistor layer and the two wafer faces.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Repeat the worked calculation at 0.40 A while keeping both resistance values unchanged.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Calculate I²R loss for each original 0.20 A path. Explain why this is path loss rather than total chip power.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Write a comparison plan that holds workload and operating conditions constant while checking local voltage, timing, temperature, and yield.</li>
<!-- /wp:list-item -->
</ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list">
<!-- wp:list-item -->
<li>Does backside power delivery require CFET stacking?</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Why can lower-resistance delivery improve the voltage available to a load?</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>What are the new drops at 0.40 A for 0.10 Ω and 0.04 Ω?</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>What are the path losses at 0.20 A?</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Why is an IR-drop percentage not a complete chip-efficiency result?</li>
<!-- /wp:list-item -->
</ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list">
<!-- wp:list-item -->
<li>No. The power-routing architecture and transistor-stacking architecture address different problems.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>With current held constant, ΔV = I × R decreases as path resistance decreases.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>40 mV and 16 mV, respectively.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>4 mW and 1.6 mW, using P = I²R.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Total behavior also depends on device switching and leakage, workload, timing, regulation, packaging, thermal conditions, and other losses.</li>
<!-- /wp:list-item -->
</ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Backside power delivery gives the power network its own physical routing space and can reduce the resistance between a supply and the active devices. The useful habit is to follow the complete current loop, calculate the voltage actually available at the load, and then test the full design. A smaller modeled IR drop is meaningful evidence about that power path; it becomes a product-level benefit only after the surrounding circuit and manufacturing constraints are evaluated.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=fc_xzN6UErI","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=fc_xzN6UErI
</div><figcaption class="wp-element-caption"><em>Further viewing: Asianometry’s 2024 historical explainer develops the backside-power concept in more depth. Use the linked primary sources for process details and distinguish historical forecasts from current facts.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":26343,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/silicon-wafer-close-view-wikimedia.jpg?w=1024" alt="Repeating patterned dies on a silicon wafer, shown as general fabrication context." class="wp-image-26343" /><figcaption class="wp-element-caption"><em>General wafer context—not a backside-power cross-section. Photo: Le hollandais volant / <a href="https://commons.wikimedia.org/wiki/File:Silicon_wafer_close_view.jpg">Wikimedia Commons</a>, <a href="https://creativecommons.org/licenses/by/4.0/">CC BY 4.0</a>. Source image unchanged; resized for display.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Sources and Further Reading</h2>
<!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list">
<!-- wp:list-item -->
<li><a href="https://www.intel.com/content/www/us/en/newsroom/news/powervia-intel-achieves-chipmaking-breakthrough.html">Intel: PowerVia manufacturing and test-chip explanation</a> — primary source, June 5, 2023.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><a href="https://www.imec-int.com/en/articles/how-power-chips-backside">imec: Backside power delivery</a> — buried-rail process flow and integration tradeoffs.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><a href="https://www.imec-int.com/en/articles/backside-power-delivery-options-dtco-study">imec: A DTCO study of backside connectivity options</a>.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><a href="https://blogs.sw.siemens.com/calibre/2026/09/30/solving-the-extraction-challenges-of-cfet-and-backside-power/">Siemens EDA: CFET and backside-power extraction challenges</a> — September 30, 2026.</li>
<!-- /wp:list-item -->
</ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><em><strong>BitcoinVersus.Tech Editor's Note:</strong><br />We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->
