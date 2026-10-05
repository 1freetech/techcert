---
title: "OSSEC.001: Semiconductor Device Physics — Band Gaps, Doping, and PN Junctions"
wordpress_post_id: 20450
source: BitcoinVersus.tech
published: 2026-10-04T00:53:24
modified: 2026-10-04T01:03:46
live_url: https://bitcoinversus.tech/2026/10/04/ossec-001-semiconductor-device-physics-band-gaps-doping-pn-junctions/
track: semiconductor/engineer
lesson_number: 1
raw_source: 001-ossec-001-semiconductor-device-physics-band-gaps-doping-pn-junctions-20450.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Semiconductor engineering starts with one idea: electrical behavior can be designed by controlling which energy states electrons can occupy and how many mobile charge carriers exist.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is <strong>OSSEC.001</strong>, the first lesson in the Open Source Semiconductor Engineer Certification track. It builds on the technician-level cleanroom and ESD foundation from <a href="https://bitcoinversus.tech/2026/10/04/osstc-001-semiconductor-fab-cleanroom-contamination-esd-basics/">OSSTC.001</a> and moves into the physics engineers use to reason about devices and process tradeoffs.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The entire lesson in one model</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>atomic bonds<br>↓<br>allowed energy bands + forbidden <a href="https://bitcoinversus.tech/2026/01/11/semiconductor-characterization-the-band-gap/">band gap</a><br>↓<br>thermal energy creates electrons + holes<br>↓<br><a href="https://bitcoinversus.tech/2026/01/09/semiconductor-crystals-intrinsic-semiconductor-vs-extrinsic-semiconductor/">doping</a> changes carrier concentration and <a href="https://bitcoinversus.tech/2025/12/27/semiconductor-physics-understanding-the-fermi-level/">Fermi level</a><br>↓<br><a href="https://bitcoinversus.tech/2026/01/08/semiconductor-fundamentals-p-type-semiconductor/">P-type</a> + <a href="https://bitcoinversus.tech/2026/01/06/n-type-semiconductor-overview/">N-type</a> regions create a <a href="https://bitcoinversus.tech/2026/01/13/semiconductor-characterization-p-n-junction-diode/">PN junction</a><br>↓<br>diffusion creates a depletion region + electric field<br>↓<br>bias changes the barrier<br>↓<br><a href="https://bitcoinversus.tech/2026/01/12/semiconductor-physics-diode-i-v-characteristics/">current</a>, <a href="https://bitcoinversus.tech/2026/01/17/semiconductor-components-diode-electrical-characterization/">capacitance, breakdown</a>, speed, leakage, and device behavior</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>An engineer is not only asking, “Does the diode conduct?” The engineer asks <strong>why</strong>, <strong>how much</strong>, <strong>under what bias</strong>, <strong>at what temperature</strong>, and <strong>how the fabrication process changes the answer</strong>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">1. Why silicon is useful</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>In a <a href="https://bitcoinversus.tech/2026/03/18/semiconductor-physics-lattice-atom/">crystal lattice</a>, large numbers of atoms interact. Instead of treating every electron as occupying an isolated atomic energy level, solid-state physics describes groups of allowed energies called <strong>bands</strong>.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Valence band:</strong> the highest band that is normally filled or nearly filled with bonding electrons.</li><li><strong>Conduction band:</strong> a higher-energy band in which electrons can move through the crystal and contribute strongly to conduction.</li><li><strong>Band gap, E<sub>g</sub>:</strong> an energy range between those bands with no allowed bulk crystal states in the simplified model.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Energy ↑<br><br>Conduction band<br>↑<br>E<sub>g</sub> ← band gap<br>↓<br>Valence band</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Metals have available states that make conduction easy. Insulators have a comparatively large forbidden gap. Semiconductors occupy the useful middle ground: their conductivity can be changed dramatically by temperature, electric fields, light, and controlled impurity atoms.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>MIT OpenCourseWare's semiconductor lecture covers band gaps, charge carriers, intrinsic and extrinsic semiconductors, dopants, and conductivity as a unified picture. See <a href="https://ocw.mit.edu/courses/3-091sc-introduction-to-solid-state-chemistry-fall-2010/pages/electronic-materials/14-semiconductors/">MIT OpenCourseWare — Semiconductors</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Semiconductor fundamentals</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=56d9qcsHGwE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=56d9qcsHGwE
</div><figcaption class="wp-element-caption"><em>MIT OpenCourseWare — Lecture 14: Semiconductors. A broad engineering introduction to carrier generation, doping, and semiconductor behavior.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Electrons and holes are both charge carriers</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>When enough energy promotes a valence electron into the conduction band, two useful carrier descriptions appear:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Electron:</strong> a mobile negative charge in the conduction band.</li><li><strong>Hole:</strong> an empty valence-band state that behaves mathematically like a mobile positive charge.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>valence electron gains energy<br>↓<br>electron enters conduction band<br>↓<br>free electron + hole left behind<br>(−) and (+)</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For an <a href="https://bitcoinversus.tech/2026/01/09/semiconductor-crystals-intrinsic-semiconductor-vs-extrinsic-semiconductor/"><strong>intrinsic semiconductor</strong></a> in equilibrium, electrons and holes are generated in pairs, so:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>n = p = n<sub>i</sub></strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Here <strong>n</strong> is electron concentration, <strong>p</strong> is hole concentration, and <strong>n<sub>i</sub></strong> is the intrinsic carrier concentration. These values depend strongly on temperature and semiconductor material.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">3. Conductivity depends on both concentration and mobility</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A useful semiconductor conductivity relationship is:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>σ = q(n μ<sub>n</sub> + p μ<sub>p</sub>)</strong></p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>σ</strong> = conductivity</li><li><strong>q</strong> = magnitude of electron charge</li><li><strong>n, p</strong> = electron and hole concentrations</li><li><strong>μn, μp</strong> = electron and hole mobilities</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>This equation matters because increasing carrier concentration does not automatically improve every device property. Heavy doping can also change mobility, electric fields, junction capacitance, recombination, contact behavior, and breakdown characteristics.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Doping: intentionally changing the carrier population</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Doping</strong> means intentionally introducing selected impurity atoms into a semiconductor so the equilibrium carrier population changes in a controlled way.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>donor dopant<br>↓<br>adds an easily ionized electron state<br>↓<br>N-type material<br>↓<br>electrons become majority carriers<br><br>acceptor dopant<br>↓<br>creates an easily ionized hole state<br>↓<br>P-type material<br>↓<br>holes become majority carriers</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>In silicon, group-V elements such as phosphorus are commonly used as donors, while group-III elements such as boron are commonly used as acceptors. The exact choice depends on the material system and process integration.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A key engineering point: ordinary doping primarily changes <strong>carrier concentration and Fermi-level position</strong>. It does not simply “turn silicon into metal,” and it does not mean the crystal suddenly has a completely different ordinary band gap. At very heavy doping levels, additional effects such as band-gap narrowing and incomplete simple-model behavior become important.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Intrinsic vs. extrinsic semiconductors</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=z3MlkNUuq9w","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=z3MlkNUuq9w
</div><figcaption class="wp-element-caption"><em>Neso Academy — Intrinsic and Extrinsic Semiconductors. Focuses on intrinsic material, doped material, and the distinction between N-type and P-type regions.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Majority and minority carriers</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Doping does not remove the other carrier type.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>N-type:</strong><br>majority carrier → electrons<br>minority carrier → holes<br><br><strong>P-type:</strong><br>majority carrier → holes<br>minority carrier → electrons</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Minority carriers matter enormously in diodes, bipolar transistors, photodiodes, solar cells, recombination, leakage, and transient behavior.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">6. The mass-action relationship</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>For a nondegenerate semiconductor in thermal equilibrium, the electron and hole concentrations obey the mass-action relationship:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>n · p = n<sub>i</sub><sup>2</sup></strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>If donor doping pushes the electron concentration far above the intrinsic value, the equilibrium hole concentration becomes much smaller. The reverse is true for acceptor-doped P-type material.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For a simple room-temperature example, if a silicon region has an electron concentration around 10<sup>16</sup> cm<sup>-3</sup> and a model uses n<sub>i</sub> ≈ 10<sup>10</sup> cm<sup>-3</sup>, then:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>p = n<sub>i</sub><sup>2</sup> / n</strong><br>= (10<sup>10</sup>)<sup>2</sup> / 10<sup>16</sup><br>= 10<sup>4</sup> cm<sup>−3</sup></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The purpose of this example is the <strong>orders-of-magnitude effect</strong>. Real n<sub>i</sub> values depend on temperature and the material/model used.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">7. The Fermi level: the occupancy reference engineers track</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <a href="https://bitcoinversus.tech/2025/12/27/semiconductor-physics-understanding-the-fermi-level/"><strong>Fermi level</strong></a> is an energy reference connected to the probability that available states are occupied by electrons. In an equilibrium band diagram, it is one of the fastest ways to understand how <a href="https://bitcoinversus.tech/2025/12/28/semiconductor-physics-carrier-statistics/">carrier statistics</a> and doping change carrier populations.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>N-type doping → Fermi level shifts toward conduction band<br>P-type doping → Fermi level shifts toward valence band</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is why band diagrams are so useful: they let an engineer translate material composition and electrostatic potential into carrier behavior.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Stanford's EE 116 semiconductor-device course sequence places energy bands, doping, Fermi level, drift, diffusion, PN diodes, MOS structures, and transistors in exactly this progression. See <a href="https://poplab.stanford.edu/teaching.html">Stanford EE 116 — Semiconductor Device Physics</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">8. Put P-type and N-type regions together: a PN junction</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <a href="https://bitcoinversus.tech/2026/01/13/semiconductor-characterization-p-n-junction-diode/">PN junction</a> is not normally manufactured by physically gluing separate chunks together. Engineers create neighboring regions with different <a href="https://bitcoinversus.tech/2026/01/08/semiconductor-fundamentals-p-type-semiconductor/">P-type</a> and <a href="https://bitcoinversus.tech/2026/01/06/n-type-semiconductor-overview/">N-type</a> doping profiles inside the semiconductor.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Immediately after the junction exists, carrier concentration gradients drive diffusion:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>N side:</strong> many electrons<br><strong>P side:</strong> many holes<br><br>electrons and holes diffuse across the boundary<br>↓<br>recombination occurs near the boundary<br>↓<br>mobile carriers are depleted locally<br>↓<br>fixed ionized dopants remain<br>↓<br>space charge creates an electric field<br>↓<br>depletion region + built-in potential form</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The electric field produced by the exposed ionized dopants opposes further majority-carrier diffusion. At thermal equilibrium, diffusion and drift balance so there is no net DC current through the isolated junction.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Georgia Tech provides an interactive PN-junction visualization where doping density and applied voltage can be changed while observing depletion behavior and minority carriers: <a href="https://learnqm.gatech.edu/Semiconductor-Physics-Visualization/ch15/index.html">Georgia Tech — PN Junctions</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: PN-junction formation</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=BHA4teZmwT0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=BHA4teZmwT0
</div><figcaption class="wp-element-caption"><em>Jordan Edmunds — PN Junction Introduction. A university-level explanation of carrier diffusion, recombination, fixed charge, and depletion-region formation.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">9. Built-in potential</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Under the standard abrupt-junction, nondegenerate, equilibrium approximation, the built-in voltage can be written as:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>V<sub>bi</sub> = (kT / q) ln(N<sub>A</sub>N<sub>D</sub> / n<sub>i</sub><sup>2</sup>)</strong></p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>k</strong> = Boltzmann constant</li><li><strong>T</strong> = absolute temperature</li><li><strong>q</strong> = elementary charge magnitude</li><li><strong>N<sub>A</sub></strong> = acceptor concentration</li><li><strong>N<sub>D</sub></strong> = donor concentration</li><li><strong>n<sub>i</sub></strong> = intrinsic carrier concentration</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Example: using N<sub>A</sub> = N<sub>D</sub> = 10<sup>16</sup> cm<sup>-3</sup>, n<sub>i</sub> = 10<sup>10</sup> cm<sup>-3</sup>, and kT/q ≈ 0.0259 V at about 300 K gives a built-in voltage of roughly <strong>0.71 V</strong>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>That does <strong>not</strong> mean every silicon diode has a magical fixed 0.7 V threshold. The familiar “0.7 V” rule is only a rough circuit-level approximation. Real <a href="https://bitcoinversus.tech/2026/01/12/semiconductor-physics-diode-i-v-characteristics/">diode I-V behavior</a> and forward voltage depend on current density, geometry, temperature, recombination, <a href="https://bitcoinversus.tech/2026/02/01/semiconductor-physics-diode-series-resistance/">series resistance</a>, doping, and device construction.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">10. Depletion width is an engineering variable</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>In the depletion approximation for a one-dimensional abrupt junction, the total depletion width has the form:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>W = √[(2 ε<sub>s</sub> / q)(1/N<sub>A</sub> + 1/N<sub>D</sub>)(V<sub>bi</sub> + V<sub>R</sub>)]</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The equation immediately exposes several engineering trends:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>Lower doping generally produces a wider depletion region.</li><li>Higher reverse bias increases depletion width.</li><li>The more lightly doped side receives more of the depletion-region extension.</li><li>Depletion width directly affects junction capacitance and electric-field distribution.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">11. Forward bias and reverse bias</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/02/04/semiconductor-physics-forward-bias/"><strong>Forward bias:</strong></a><br>P side made more positive than N side<br>↓<br>barrier is reduced<br>↓<br>majority carriers cross the junction more easily<br>↓<br>large diffusion current can develop<br><br><a href="https://bitcoinversus.tech/2026/01/12/semiconductor-physics-diode-i-v-characteristics/"><strong>Reverse bias:</strong></a><br>P side made more negative than N side<br>↓<br>barrier increases<br>↓<br>depletion region widens<br>↓<br>small leakage current flows until breakdown mechanisms dominate</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Toshiba's semiconductor e-learning material gives a concise reference for zero-bias, forward-bias, and reverse-bias PN-junction behavior: <a href="https://toshiba.semicon-storage.com/ap-en/semiconductor/knowledge/e-learning/discrete/chap1/chap1-6.html">Toshiba — PN Junction</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">12. Why a semiconductor engineer cares about the doping profile</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A schematic that says “P” and “N” hides a large amount of process engineering. Real devices have spatially varying dopant concentration.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Process choices:</strong><br>dopant species<br>implant dose<br>implant energy<br>diffusion temperature / time<br><a href="https://bitcoinversus.tech/2026/02/15/semiconductor-physics-the-annealing-process/">activation anneal</a><br>masking geometry<br>prior thermal budget<br>↓<br>actual doping profile versus depth<br>↓<br>resistance + field + depletion width + junction depth<br>↓<br>capacitance + leakage + breakdown + switching behavior</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is the bridge between <strong>device physics</strong> and <strong>process integration</strong>. The engineer cannot optimize one parameter in isolation.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">13. Common engineering tradeoffs</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Higher doping can reduce <a href="https://bitcoinversus.tech/2026/01/21/semiconductor-physics-contact-resistance/">bulk/contact resistance</a></strong>, but it can also increase <a href="https://bitcoinversus.tech/2026/01/17/semiconductor-components-diode-electrical-characterization/">junction capacitance</a> and alter mobility, recombination, and breakdown behavior.</li><li><strong>Lower doping can widen depletion regions</strong> and support higher voltages in some structures, but it increases resistive loss.</li><li><strong>Abrupt versus graded junction profiles</strong> change electric-field shape and capacitance.</li><li><strong><a href="https://bitcoinversus.tech/2026/02/15/semiconductor-physics-the-annealing-process/">Thermal processing</a></strong> activates dopants but can also cause diffusion that changes junction depth and lateral dimensions.</li><li><strong>Temperature</strong> changes intrinsic carrier concentration, mobility, leakage, and <a href="https://bitcoinversus.tech/2026/01/12/semiconductor-physics-diode-i-v-characteristics/">diode I-V behavior</a>.</li><li><strong>Very heavy doping</strong> can push the device beyond simple nondegenerate textbook assumptions.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">14. Engineer's troubleshooting question set</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Suppose a fabricated diode shows lower <a href="https://bitcoinversus.tech/2026/01/17/semiconductor-components-diode-electrical-characterization/">breakdown voltage and higher junction capacitance</a> than expected. That is an electrical-characterization problem to explain, not simply “the diode is bad.” Start asking:</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Did the measured doping concentration match target?</li><li>Did the implant dose or energy shift?</li><li>Did a thermal step diffuse the junction deeper or change its gradient?</li><li>Is the depletion width smaller than expected?</li><li>Is the electric field peaking somewhere unexpected?</li><li>Did geometry or edge termination change?</li><li>Is leakage dominated by bulk generation, surface defects, contamination, or junction damage?</li><li>Do process-control measurements agree with electrical test data?</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p>The device equation tells you what variables matter. The process history tells you which variable may have moved.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">15. Practice exercise</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Answer these without memorizing slogans. Explain the physical reason.</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Why does N-type material still contain holes?</li><li>What happens to the Fermi level when donor concentration increases?</li><li>Why does a depletion region contain charge even though it is depleted of mobile majority carriers?</li><li>Why does reverse bias normally widen the depletion region?</li><li>If one side of a PN junction is much more lightly doped, which side should receive most of the depletion width?</li><li>Why is “a silicon diode turns on at exactly 0.7 V” an oversimplification?</li><li>Why can increasing doping improve one device metric and hurt another?</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What is a band gap?</strong><br>An energy range between allowed bands in which the simplified bulk crystal has no allowed electron states.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. What does donor doping do?</strong><br>It increases the equilibrium electron population and normally moves the Fermi level toward the conduction band.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. What does acceptor doping do?</strong><br>It increases the equilibrium hole population and normally moves the Fermi level toward the valence band.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. What creates the depletion-region electric field?</strong><br>Carrier diffusion and recombination leave behind fixed ionized dopant charge near the junction.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. What does forward bias do to the junction barrier?</strong><br>It reduces the effective barrier and allows much greater carrier injection across the junction.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>6. What does reverse bias do?</strong><br>It increases the junction barrier and depletion width until leakage or breakdown mechanisms become significant.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Semiconductor devices are engineered electrostatics.</strong> Band structure determines which states are available. Doping sets carrier populations and shifts the Fermi level. Diffusion between differently doped regions creates a space-charge field. Applied voltage changes that field. From those pieces come the current, capacitance, leakage, switching speed, and breakdown behavior that engineers eventually turn into diodes, transistors, sensors, solar cells, power devices, and integrated circuits.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>material physics<br>↓<br>doping profile<br>↓<br>electrostatics<br>↓<br>carrier transport<br>↓<br>device behavior<br>↓<br>process + circuit tradeoffs</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Modeling note: the simple equations in this introductory lesson assume idealized conditions such as thermal equilibrium, nondegenerate statistics, and an abrupt one-dimensional junction where stated. Real semiconductor devices require more complete models when those assumptions fail.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Display note: the diagrams in this lesson are plain educational diagrams, not simulations of a Windows, Linux, or VS Code terminal. No terminal color palette is being represented.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->