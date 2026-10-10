---
title: "OSDCEC.008: Data Center Water Systems — Cooling Loops, Cooling Towers, Water Quality, Blowdown, and WUE"
status: published
wordpress_post_id: 22813
published_at: "2026-10-09T19:59:42"
live_url: "https://bitcoinversus.tech/2026/10/09/osdcec-008-data-center-water-systems-cooling-loops-towers-water-quality-blowdown-wue/"
slug: "osdcec-008-data-center-water-systems-cooling-loops-towers-water-quality-blowdown-wue"
featured_media_id: 22811
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osdcec-008-water-systems-cover.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 22812
body_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osdcec-008-water-systems-body.jpg"
body_media_dimensions: "1200x675"
youtube_urls:
  - "https://www.youtube.com/watch?v=4BRcXRfxs1g"
  - "https://www.youtube.com/watch?v=Qvw0OF_GCe0"
social_urls:
  - "https://www.reddit.com/r/datacenter/comments/1tj5cze/is_this_information_about_closed_loop_cooling/"
  - "https://twitter.com/DCVC/status/2026048308104593744"
no_text_boxes: true
classic_content: false
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>A data center water system has one basic engineering job: move heat reliably without letting water quality, water consumption, leaks, or treatment failures become the next failure domain.</strong> The difficult part is that not every water loop behaves the same way. A closed chilled-water or facility-water loop can recirculate the same fluid for long periods, while an evaporative cooling-tower system intentionally loses water to the atmosphere and must continuously replace, treat, and control that water.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/05/osdcec-003-data-center-cooling-engineering-airflow-deltat-containment-psychrometrics-economization-liquid-cooling/"><strong>OSDCEC.003: Data Center Cooling Engineering</strong></a>, <a href="https://bitcoinversus.tech/2026/10/07/osdcec-005-data-center-monitoring-controls-bms-epms-dcim-snmp-modbus-alarms-trending/"><strong>OSDCEC.005: Data Center Monitoring and Controls</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/08/osdcec-007-data-center-reliability-engineering-availability-mtbf-mttr-fmea-rca-change-control/"><strong>OSDCEC.007: Data Center Reliability Engineering</strong></a>. The focus here is the water side of the cooling plant: closed loops, condenser-water systems, cooling towers, makeup water, blowdown, water chemistry, filtration, WUE, leak detection, and the engineering tradeoff between water use and electrical efficiency.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>How closed cooling loops differ from open evaporative cooling-tower loops.</li><li>Why chilled-water and condenser-water systems are separate circuits.</li><li>What makeup water, evaporation, drift, and blowdown mean.</li><li>Why dissolved minerals become concentrated as tower water evaporates.</li><li>How cycles of concentration affect both water use and water chemistry risk.</li><li>Why scale, corrosion, fouling, and microbiological growth matter to heat transfer and reliability.</li><li>How conductivity control, filtration, treatment, and trending support stable operation.</li><li>How Water Usage Effectiveness, or WUE, connects facility water consumption to IT energy.</li><li>Why dry cooling and closed-loop liquid cooling can reduce on-site water consumption while creating other design tradeoffs.</li><li>Why leak detection and water containment belong in reliability engineering, not only plumbing maintenance.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Start By Separating The Water Loops</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A common source of confusion is treating every pipe carrying water as part of one cooling circuit. In a conventional water-cooled central plant, the <strong>chilled-water loop</strong> and the <strong>condenser-water loop</strong> perform different jobs.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The chilled-water loop normally carries cooled water from the chiller to CRAHs, air handlers, heat exchangers, or other cooling equipment and then returns warmer water to the chiller. This loop is typically closed. If the loop is tight, routine water consumption should be small because the same fluid is circulated repeatedly.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The condenser-water loop is different when a cooling tower is used. The chiller transfers heat into condenser water, pumps move that heat to the cooling tower, and the tower rejects much of the heat through evaporation. Because water is intentionally evaporated and some water is intentionally discharged as blowdown, the system requires continuing makeup water.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=4BRcXRfxs1g","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=4BRcXRfxs1g
</div><figcaption class="wp-element-caption"><em>MEP Academy — “Air Cooled vs WaterCooled Data Centers.” This lesson compares air-cooled chillers, dry coolers, water-cooled chillers, cooling towers, chilled-water systems, WUE, and the energy-versus-water tradeoff.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22812,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osdcec-008-water-systems-body.jpg" alt="Three engineers inspecting cooling-water piping, valves, pumps, heat exchangers, and cooling equipment at a modern data center." class="wp-image-22812" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech lesson image for OSDCEC.008.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Cooling Towers Consume Water By Design</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Cooling towers reject heat efficiently because a portion of the circulating water evaporates into the air. That phase change removes heat, but the evaporated water leaves its dissolved minerals behind. The remaining water therefore becomes progressively more concentrated unless the operator removes some of it.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The Department of Energy identifies three normal water-loss paths in a cooling tower: <strong>evaporation</strong>, <strong>blowdown</strong>, and <strong>drift</strong>. Makeup water replaces those losses. Any unintended basin overflow, valve leakage, piping leak, or other unaccounted loss adds further demand and should be treated as an operational problem rather than accepted as normal consumption.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Evaporation performs the cooling work. Drift is liquid water carried out with the tower air stream. Blowdown is a controlled discharge used to keep dissolved minerals and contaminants from concentrating beyond acceptable limits.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Blowdown Protects The System From Its Own Concentration</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>As pure water evaporates, calcium, magnesium, chlorides, silica, treatment chemicals, and other dissolved constituents remain behind. If their concentration climbs too far, scale can form on heat-transfer surfaces, corrosion can accelerate, and suspended material can contribute to fouling.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Blowdown removes a portion of this concentrated water and replaces it with lower-concentration makeup water. The engineering objective is not “minimum blowdown at any cost.” It is <strong>the minimum blowdown that safely maintains chemistry, heat-transfer performance, equipment life, and biological control.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/datacenter/comments/1tj5cze/is_this_information_about_closed_loop_cooling/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/datacenter/comments/1tj5cze/is_this_information_about_closed_loop_cooling/
</div><figcaption class="wp-element-caption"><em>r/datacenter discussion: operators and engineers distinguish closed chilled-water loops from evaporative systems and discuss the energy tradeoff of air-cooled versus water-consuming heat rejection.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Cycles Of Concentration Measure How Hard The Water Is Being Reused</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Cycles of concentration</strong> compare the dissolved-mineral concentration in the recirculating tower water with the concentration in the makeup water. The same concept can also be approximated from makeup and blowdown flow under stable operating conditions.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Higher cycles mean the system reuses water more times before discharging it, which generally reduces blowdown and makeup demand. But higher cycles also increase the concentration of dissolved solids. The practical maximum therefore depends on source-water quality, materials of construction, tower operating temperature, treatment chemistry, biological control, and the equipment vendor's limits.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>DOE guidance notes that many systems operate around two to four cycles, while six or more may be practical in some installations. The same guidance gives a useful example: increasing from three to six cycles can reduce cooling-tower makeup water by about 20 percent and blowdown by about 50 percent. That is a significant efficiency improvement, but only if chemistry remains controlled.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Conductivity Gives Operators A Fast Chemistry Signal</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Electrical conductivity rises as dissolved ionic material becomes more concentrated. Cooling-tower controllers can continuously monitor conductivity and open the blowdown valve when the programmed limit is exceeded.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A data center engineer should trend makeup flow, blowdown flow, conductivity, cycles of concentration, chemical-feed status, basin level, and relevant temperature data rather than treating each reading as an isolated value. A sudden change in the relationship between makeup and blowdown can reveal a stuck valve, controller error, overflow, leak, bad meter, or chemistry problem before it becomes a thermal or reliability event.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is where the concepts from <a href="https://bitcoinversus.tech/2026/10/07/osdcec-005-data-center-monitoring-controls-bms-epms-dcim-snmp-modbus-alarms-trending/"><strong>OSDCEC.005</strong></a> become operationally important: a water system should be trended as an engineered process, not watched only when somebody sees water on the floor.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Water Quality Is A Heat-Transfer And Reliability Problem</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>DOE guidance identifies four major concerns in open-recirculating cooling systems: <strong>corrosion, scaling, fouling, and microbiological activity.</strong> Each can increase maintenance requirements, reduce heat-transfer effectiveness, or damage equipment.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Scale:</strong> mineral deposits create an insulating layer on heat-transfer surfaces and can restrict flow.</li><li><strong>Corrosion:</strong> chemical or electrochemical attack can damage piping, tubes, heat exchangers, basins, and fittings.</li><li><strong>Fouling:</strong> dirt, suspended solids, debris, and organic material can clog strainers and coat heat-transfer surfaces.</li><li><strong>Microbiological growth:</strong> biofilm can reduce heat transfer, obstruct flow, accelerate under-deposit corrosion, and create health risks in open cooling systems.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Water treatment is therefore not an optional cosmetic program. Treatment chemistry, side-stream filtration, conductivity control, sampling, cleaning, and specialist review all support the thermal plant's design capacity and equipment life.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Side-Stream Filtration Removes What Chemistry Cannot</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A side-stream filtration system continuously removes a portion of the recirculating tower water, filters suspended solids and organic material, and returns the cleaned water to the system. DOE notes that this can reduce fouling, scaling risk, and conditions that support microbiological growth.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Filtration does not replace chemical treatment because dissolved material remains dissolved. Instead, filtration and chemistry solve different parts of the water-quality problem. A strong program uses both where the system design and source-water conditions justify them.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">WUE Measures Water Against IT Energy</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Water Usage Effectiveness, or WUE, connects facility water use to the energy consumed by IT equipment.</strong> DOE expresses site WUE as annual site water usage in liters divided by annual IT equipment energy use in kilowatt-hours. The result is commonly reported in liters per kilowatt-hour.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>WUE is useful because raw annual gallons can be misleading when comparing facilities of very different sizes. A larger site will usually use more total water simply because it supports more compute. WUE normalizes water consumption against the IT energy being supported.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>WUE should still be interpreted with context. Climate, water source, cooling architecture, hours of economization, rack density, temperature setpoints, local water stress, and how the metric boundary is defined can all affect the number.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Qvw0OF_GCe0","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Qvw0OF_GCe0
</div><figcaption class="wp-element-caption"><em>Open Compute Project — “Water Energy Nexus in Data Center Design.” This conference session examines WUE, local water stress, water reuse, closed-loop cooling, power tradeoffs, and location-aware water-efficiency decisions.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Dry Cooling Can Trade Water For Electricity And Equipment</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A facility can reduce evaporative water demand by rejecting heat through air-cooled chillers or dry coolers. That can simplify water treatment and reduce dependence on makeup water, but heat rejection to dry outdoor air may require larger heat-exchanger surfaces, more fan power, higher approach temperatures, or mechanical chilling during hot conditions.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is why “use less water” cannot be evaluated separately from electrical efficiency, climate, design temperature, available site area, capital cost, reliability, and workload density. The best engineering answer depends on the full site constraint set.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Recent high-temperature liquid-cooling designs make this tradeoff more interesting. NVIDIA's DSX facility reference design, for example, uses a 45°C facility-water design point with dry coolers and specifies no cooling-tower blowdown in that reference architecture. The larger lesson is not that every data center should copy one design, but that warmer liquid loops can expand the conditions under which heat can be rejected without evaporation.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/DCVC/status/2026048308104593744","type":"rich","providerNameSlug":"twitter","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-twitter wp-block-embed-twitter"><div class="wp-block-embed__wrapper">
https://twitter.com/DCVC/status/2026048308104593744
</div><figcaption class="wp-element-caption"><em>DCVC on X discusses water-intensive facilities, including data centers, and the broader challenge of expanding industrial capacity without increasing net water consumption.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Liquid Cooling Does Not Automatically Mean High Water Consumption</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Direct-to-chip liquid cooling, rear-door heat exchangers, and facility-water loops move heat with liquid close to the rack, but that does not automatically mean the facility consumes large volumes of water. The rack loop can be closed, while final heat rejection may use dry coolers, evaporative equipment, chillers, or a hybrid approach.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The correct engineering question is therefore: <strong>where does heat finally leave the facility, and what resources are consumed at that final heat-rejection step?</strong> Separating the rack cooling medium from the site heat-rejection method prevents misleading conclusions.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Leaks Are A Capacity And Availability Issue</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Water where it does not belong can damage electrical equipment, reduce cooling capacity, trigger shutdowns, create slip hazards, and force emergency isolation of critical loops. Leak risk should therefore be included in FMEA, commissioning, controls, maintenance, and change-management planning.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Place leak detection where piping, valves, heat exchangers, CDUs, pumps, and rack liquid connections create credible exposure.</li><li>Know which valves isolate each failure domain.</li><li>Verify drainage and containment paths.</li><li>Alarm abnormal makeup-water demand because it can indicate an unseen leak.</li><li>Trend differential pressure and pump behavior because hydraulic changes can reveal faults before visual inspection does.</li><li>Test leak sensors and isolation sequences during commissioning rather than assuming they work.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Engineer The Water System As A Measured Process</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A mature operating program should know the expected relationships among thermal load, evaporation, makeup water, blowdown, conductivity, cycles of concentration, chemical feed, pump operation, and outdoor conditions. When one variable moves without the others, investigate the discrepancy.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For example, rising makeup flow with stable IT load and stable weather may indicate overflow, leakage, excessive blowdown, failed level control, or a bad meter. Rising conductivity with little blowdown may indicate a stuck valve or controller problem. Increasing chiller approach temperature with deteriorating water-quality indicators may point toward scale or fouling.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Engineering Exercise</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Draw the facility's chilled-water and condenser-water loops as two separate systems.</li><li>Mark which loop is closed and which loop loses water to the environment.</li><li>Locate the makeup-water meter, blowdown meter, conductivity sensor, treatment injection points, and cooling-tower basin level controls.</li><li>Identify every point where a leak could expose electrical or IT equipment.</li><li>List which BMS or DCIM trends would reveal excessive water use before a monthly utility bill arrives.</li><li>Calculate site WUE from annual water consumption and annual IT energy if those values are available.</li><li>Compare the present cycles of concentration with the water-treatment program's target and investigate any mismatch.</li><li>Describe what happens to energy use, water use, and capital equipment if the site changes from evaporative heat rejection to dry cooling.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Why does a cooling tower need makeup water?</strong> Because water is lost through evaporation, blowdown, drift, and any unintended leakage or overflow.</li><li><strong>Why is blowdown necessary?</strong> It removes concentrated dissolved material so water chemistry remains within acceptable limits.</li><li><strong>What do higher cycles of concentration usually do to water consumption?</strong> They reduce blowdown and makeup demand, but increase dissolved-solids concentration and therefore require adequate chemistry control.</li><li><strong>What four major cooling-water problems does DOE highlight?</strong> Corrosion, scaling, fouling, and microbiological activity.</li><li><strong>What does conductivity tell an operator?</strong> It provides a fast indication of dissolved ionic concentration and is commonly used to control cooling-tower blowdown.</li><li><strong>What is WUE?</strong> Facility water use normalized by IT equipment energy use, commonly expressed in liters per kilowatt-hour.</li><li><strong>Does liquid cooling automatically consume large amounts of water?</strong> No. The rack or facility liquid loop can be closed; water consumption depends heavily on how the facility ultimately rejects heat.</li><li><strong>Why can dry cooling reduce water use but raise another cost?</strong> Rejecting heat to dry air can require more fan energy, larger heat exchangers, higher temperatures, or mechanical chilling in hot conditions.</li><li><strong>Why is a leak a reliability-engineering issue?</strong> It can remove cooling capacity, damage electrical or IT systems, and force isolation or shutdown of critical equipment.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.energy.gov/cmei/femp/cooling-water-efficiency-opportunities-federal-data-centers"><strong>U.S. Department of Energy — Cooling Water Efficiency Opportunities for Federal Data Centers</strong></a></li><li><a href="https://www.energy.gov/cmei/femp/best-management-practice-10-cooling-tower-management"><strong>U.S. Department of Energy — Cooling Tower Management</strong></a></li><li><a href="https://www.energy.gov/cmei/femp/water-efficient-technology-opportunity-side-stream-filtration-cooling-towers"><strong>U.S. Department of Energy — Side Stream Filtration for Cooling Towers</strong></a></li><li><a href="https://docs.nvidia.com/dsx/facilities-infra/reference-design-overview"><strong>NVIDIA DSX — Facilities Infrastructure Reference Design Overview</strong></a></li><li><a href="https://www.opencompute.org/events/ocp-summit/2025-ocp-global-summit/"><strong>Open Compute Project — 2025 Global Summit</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>A data center water system is not just plumbing.</strong> It is a thermal, chemical, controls, sustainability, and reliability system. Keep closed loops separate from evaporative loops in your mental model, measure makeup and blowdown, control cycles of concentration, protect heat-transfer surfaces, trend the process, understand WUE, and design leak detection and isolation with the same seriousness applied to electrical redundancy.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is original 1200×630 color-pencil artwork created specifically for OSDCEC.008 and is not reused in the body. The lesson uses a separate original 1200×675 photograph. Media is embedded through native responsive Gutenberg blocks, and ordinary lesson content uses normal-flow Gutenberg structure with no text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->