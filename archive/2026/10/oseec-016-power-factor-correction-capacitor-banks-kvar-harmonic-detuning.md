<!-- wp:paragraph -->
<p><strong>Power factor correction (PFC) reduces unnecessary reactive current by supplying reactive power closer to the load.</strong> In industrial AC systems, inductive loads such as motors and transformers can draw more current than the real-power demand alone would require. A properly engineered capacitor bank supplies capacitive kVAR locally so the upstream source carries less reactive current.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Tv_7XWf96gg","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Tv_7XWf96gg
</div><figcaption class="wp-element-caption"><em>The Engineering Mindset — Power factor, real/reactive/apparent power, leading versus lagging current, and the basic reason capacitors improve an inductive load’s power factor.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Start With kW, kVA, kVAR, and the Power Triangle</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The starting relationship is <strong>PF = kW / kVA</strong>. Real power in kW performs useful work, apparent power in kVA represents the total RMS electrical burden, and reactive power in kVAR represents energy moving back and forth between electric and magnetic fields. BitcoinVersus.Tech’s <a href="https://bitcoinversus.tech/2026/10/06/energy-what-is-power-factor-kw-kva-kvar/"><strong>power-factor evergreen</strong></a> explains those quantities at an introductory level, while <a href="https://bitcoinversus.tech/2026/10/02/oseec-008-three-phase-power-fundamentals/"><strong>OSEEC.008</strong></a> provides the three-phase foundation used in industrial systems.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22049,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oseec-016-power-factor-correction-current-diagram.jpg?w=1024" alt="NIST power factor correction diagram showing an inductive load and capacitor correction reducing line current." class="wp-image-22049" /><figcaption class="wp-element-caption"><em>NIST illustration of power-factor correction: a capacitor supplies reactive current locally so less current is drawn from the upstream line. Image via Wikimedia Commons.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Size the Required Correction in kVAR</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The standard engineering relationship is <code>Qc = P × (tan φ1 − tan φ2)</code>, where <code>P</code> is the real load in kW, <code>φ1 = cos⁻¹(PF1)</code> is the existing power-factor angle, and <code>φ2 = cos⁻¹(PF2)</code> is the desired angle. For a 500 kW load improving from 0.75 to 0.95 power factor, the required correction is about <strong>277 kVAR</strong>. That is the theoretical compensation target before selecting real capacitor-bank step sizes, voltage ratings, protection, harmonic design, and operating margin.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=dAoEmjUZUGM","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=dAoEmjUZUGM
</div><figcaption class="wp-element-caption"><em>The Electric Academy — Step-by-step capacitor sizing for power-factor correction using the existing and target power factors.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Correction Reduces Current but Does Not Reduce the Load’s Real kW</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Power-factor correction does not magically reduce the mechanical or thermal work a load is doing. A 500 kW process still needs roughly 500 kW of real power. What changes is the reactive component and therefore the apparent power and line current. Lower current can reduce <code>I²R</code> losses, free transformer and conductor capacity, reduce voltage drop, and sometimes avoid utility penalties tied to poor power factor. It is different from a <a href="https://bitcoinversus.tech/2026/10/07/energy-what-is-demand-charge-peak-power-electricity-bill/"><strong>demand-charge</strong></a> reduction strategy, although the two can affect the same facility bill in different ways.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=yHukB1aT36M","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=yHukB1aT36M
</div><figcaption class="wp-element-caption"><em>D. Leith — Worked AC power-factor-correction example showing how capacitor compensation reduces source current.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Fixed Banks Fit Stable Loads; Automatic Banks Fit Changing Loads</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>fixed capacitor bank</strong> applies roughly the same kVAR whenever it is energized, so it suits a stable load. An <strong>automatic power-factor-correction bank</strong> divides the total kVAR into switchable steps. A controller measures system conditions and adds or removes capacitor stages as the load changes. Schneider Electric’s current <a href="https://www.se.com/us/en/download/document/BQT2027101/"><strong>PowerLogic PFC installation and operation manual</strong></a> describes automatic low-voltage banks with capacitors, switching devices, controllers, and—in detuned designs—series reactors.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=GJDL-PhfTyQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=GJDL-PhfTyQ
</div><figcaption class="wp-element-caption"><em>Zenthral Code — Capacitor-bank operation, fixed versus automatic correction, kVAR sizing, current reduction, and overcorrection risk.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Do Not Correct Past the Actual Reactive Demand</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Too much capacitance can push a system from lagging toward a <strong>leading power factor</strong>. That can create undesirable voltage behavior and control instability, especially as motors or other inductive loads switch off while fixed capacitors remain connected. Automatic banks reduce this risk by removing stages as reactive demand falls. The engineering target is normally a controlled high power factor—not blindly forcing maximum capacitance onto the bus.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=KtpODKUYiTI","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=KtpODKUYiTI
</div><figcaption class="wp-element-caption"><em>Electrical Engineer — Capacitor-bank calculation, practical selection, and protective-device considerations for power-factor-correction panels.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Harmonics Change the Capacitor-Bank Design</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This is where OSEEC.016 connects directly to <a href="https://bitcoinversus.tech/2026/10/07/oseec-015-power-quality-engineering-harmonics-thd-voltage-sags-swells-transients-measurement/"><strong>OSEEC.015 Power Quality Engineering</strong></a>. Capacitive reactance falls as frequency rises, so harmonic currents can stress capacitors and can create resonance with the system inductance. Schneider’s current PowerLogic documentation describes <strong>detuned capacitor banks</strong> that combine capacitors with series reactors so the bank does not amplify troublesome harmonic frequencies. A site with VFDs, UPS systems, rectifiers, switch-mode supplies, or other nonlinear loads therefore needs harmonic measurements and engineering review before capacitor-bank selection.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/ElectricalEngineering/comments/fai88l/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/ElectricalEngineering/comments/fai88l/
</div><figcaption class="wp-element-caption"><em>A directly relevant ElectricalEngineering discussion on why reactors are installed with power-factor-correction capacitors, including detuning and harmonic-resonance concerns.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Verify the Correction With Measurements</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After commissioning, verify the system with actual measurements rather than assuming the controller setting is correct. Record three-phase voltage, current, kW, kVA, kVAR, power factor, and current/voltage THD at representative load conditions. Confirm that capacitor stages switch in the intended order, the current falls as expected, the final power factor remains stable, and no stage shows abnormal current, temperature, blown fuses, contactor damage, or harmonic stress. The correction system should be evaluated across the facility’s real load range, not just at one instant.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=beuWPzaPo3E","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=beuWPzaPo3E
</div><figcaption class="wp-element-caption"><em>Power and Energy Channel — Three-phase power, power-factor, and power-factor-angle measurement concepts used to verify correction results.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Engineering Exercise</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>A three-phase facility load is 500 kW at 0.75 power factor.</li><li>The engineering target is 0.95 power factor.</li><li>Calculate <code>φ1 = cos⁻¹(0.75)</code> and <code>φ2 = cos⁻¹(0.95)</code>.</li><li>Use <code>Qc = P × (tan φ1 − tan φ2)</code>.</li><li>Confirm that the theoretical correction is approximately 277 kVAR.</li><li>Explain why selecting a real 277 kVAR bank is not the final design step.</li><li>List the additional checks: voltage rating, step sizes, controller strategy, overcurrent protection, CT location/polarity, harmonics, detuning, ventilation, and commissioning measurements.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What does a capacitor bank supply?</strong> Capacitive reactive power, typically expressed in kVAR.</li><li><strong>Does PFC reduce the load’s real kW requirement?</strong> Normally no; it reduces reactive current and apparent-power burden.</li><li><strong>What formula sizes theoretical correction?</strong> <code>Qc = P × (tan φ1 − tan φ2)</code>.</li><li><strong>Why use an automatic bank?</strong> To add or remove capacitor stages as reactive demand changes.</li><li><strong>What is overcorrection?</strong> Applying too much capacitive reactive power, potentially creating a leading power factor.</li><li><strong>Why can harmonics make a plain capacitor bank unsafe?</strong> Capacitors can draw harmonic current and resonate with system inductance, causing excessive stress or amplification.</li><li><strong>What does a detuned reactor do?</strong> It shifts the capacitor-bank resonance away from troublesome harmonic frequencies and limits harmonic stress.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Prior Electrical Engineering Lessons</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/02/oseec-006-capacitance-inductance-reactance/"><strong>OSEEC.006: Capacitance, Inductance, and Reactance</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/02/oseec-008-three-phase-power-fundamentals/"><strong>OSEEC.008: Three-Phase Power Fundamentals</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/06/oseec-014-arc-flash-engineering-arcing-current-incident-energy-clearing-time-boundaries-labels-mitigation/"><strong>OSEEC.014: Arc-Flash Engineering</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/07/oseec-015-power-quality-engineering-harmonics-thd-voltage-sags-swells-transients-measurement/"><strong>OSEEC.015: Power Quality Engineering</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is a real automatic power-factor-correction capacitor bank showing the exact regulator, fuses, contactors, capacitors, and control transformer discussed in this lesson, cropped to 1200×630. The body image is a directly relevant NIST power-factor-correction current diagram. Technical references include Schneider Electric’s current 2026 PowerLogic PFC documentation. Every media item relates directly to power-factor correction, capacitor sizing, automatic banks, or harmonic detuning.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Support and donation options are available through BitcoinVersus.Tech.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech is not a financial advisor. Content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->