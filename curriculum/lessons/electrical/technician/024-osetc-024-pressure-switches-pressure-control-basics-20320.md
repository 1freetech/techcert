---
title: "OSETC.024: Pressure Switches and Pressure Control Basics"
wordpress_post_id: 20320
source: BitcoinVersus.tech
published: 2026-10-03T21:37:16
modified: 2026-10-03T21:37:16
live_url: https://bitcoinversus.tech/2026/10/03/osetc-024-pressure-switches-pressure-control-basics/
track: electrical/technician
lesson_number: 24
raw_source: 024-osetc-024-pressure-switches-pressure-control-basics-20320.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>A pressure switch turns a change in air, gas, or liquid pressure into a simple electrical contact change.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/03/osetc-023-float-switches-level-control-basics/">OSETC.023: Float Switches and Level Control Basics</a>. A float switch senses <strong>level</strong>. A pressure switch senses <strong>pressure</strong>. Both turn a physical condition into an electrical signal that a control circuit can use.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The basic chain is:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>Pressure changes
      ↓
Diaphragm / bellows / piston moves
      ↓
Internal mechanism moves
      ↓
Electrical contact changes state
      ↓
Pump, compressor, fan, alarm, relay, or controller responds</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">The simplest pressure-switch idea</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Imagine a water tank connected to a pump. The system pressure drops when water is used. At a chosen low-pressure point, the pressure switch changes contact state and the pump starts. As the pump raises pressure, the switch reaches a higher pressure point and changes state again so the pump stops.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Pressure falls to cut-in
        ↓
Switch changes state
        ↓
Pump starts
        ↓
Pressure rises
        ↓
Pressure reaches cut-out
        ↓
Switch changes state again
        ↓
Pump stops</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Pressure-switch operation and diagnosis</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=i02Tl9NsXxg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=i02Tl9NsXxg
</div><figcaption class="wp-element-caption"><em>HVAC School — Pressure Switch Diagnosis. A practical explanation of pressure-switch operation, contacts, schematics, and basic diagnostic thinking.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Pressure is the input</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The pressure switch does not create pressure. It reacts to pressure supplied through a port, tube, pipe connection, or sensing line.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Inside the device, pressure acts on a mechanical sensing element such as a diaphragm, bellows, or piston. That movement operates a snap mechanism or contact assembly. The electrical contacts are the output.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Normally open and normally closed</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>You may see pressure-switch contacts marked <strong>NO</strong>, <strong>NC</strong>, and <strong>COM</strong>.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>NO — normally open:</strong> the contact path is open in the device's defined normal state.</li><li><strong>NC — normally closed:</strong> the contact path is closed in the defined normal state.</li><li><strong>COM — common:</strong> the moving contact that switches between the NO and NC paths on many devices.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Do not assume that “normal” means zero pressure.</strong> The exact normal state depends on the device design and manufacturer definition. Use the wiring diagram and datasheet.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Cut-in and cut-out</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>Cut-in</strong> is the pressure where the controlled action begins. <strong>Cut-out</strong> is the pressure where that action stops.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For a common water-pump example:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>40 psi = cut-in  → pump starts
60 psi = cut-out → pump stops</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>That does <strong>not</strong> mean every pressure switch uses 40/60 psi. Those values are only an example. The correct setpoints come from the equipment design, manufacturer instructions, and approved operating limits.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Differential is the gap between switching points</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The <strong>differential</strong> is the difference between the two switching pressures.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Differential = cut-out − cut-in

Example:
60 psi − 40 psi = 20 psi differential</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Manufacturer documentation from Danfoss describes differential as the difference between cut-in and cut-out values and warns that an excessively small differential can cause rapid cycling or “hunting.” Schneider Electric also documents separate operating-point and differential adjustments on pressure-switch models that support them.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Reference: <a href="https://assets.danfoss.com/documents/latest/100195/AF222986432811en-020403.pdf">Danfoss pressure and temperature switch introduction</a> and <a href="https://www.se.com/us/en/faqs/FA118738/">Schneider Electric 9013 pressure-switch adjustment guidance</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Pump pressure switch in a real system</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Cntz7sCCJOg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Cntz7sCCJOg
</div><figcaption class="wp-element-caption"><em>PlumbingsCool — a recent well-pump pressure-switch demonstration showing cut-in, cut-out, pressure-gauge verification, wiring, and adjustment concepts.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Rising-pressure and falling-pressure action</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Some switches are designed to change state as pressure <strong>rises</strong>. Others change state as pressure <strong>falls</strong>. A high-pressure safety switch and a low-pressure safety switch therefore may use opposite contact actions.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is why a technician should ask four questions before touching the wiring:</p><!-- /wp:paragraph -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>What pressure is the device sensing?</li><li>Should the switch react to rising pressure or falling pressure?</li><li>What are the specified cut-in and cut-out points?</li><li>What should the electrical contacts do at each point?</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Automatic reset and manual reset</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>An <strong>automatic-reset</strong> pressure switch returns to its other contact state automatically when pressure moves back through the reset point.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A <strong>manual-reset</strong> safety switch requires a person to reset it after the pressure condition returns to an acceptable range. Manual reset is commonly used where an abnormal pressure condition should not allow automatic restart without inspection.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Danfoss documentation shows both automatic-reset and manual-reset pressure controls and notes that the reset pressure depends on the cut-out point and the switch differential.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">High-pressure and low-pressure protection</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Pressure switches are often used as protective devices, not just ordinary ON/OFF controls.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>High-pressure switch:</strong> can stop equipment when pressure rises too high.</li><li><strong>Low-pressure switch:</strong> can stop or inhibit equipment when pressure falls too low.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>For example, Danfoss describes high- and low-pressure switches in heat-pump systems as protective controls that keep operating pressure inside the intended range.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Differential-pressure switches sense a pressure difference</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A normal pressure switch may compare system pressure with atmospheric pressure. A <strong>differential-pressure switch</strong> compares pressure at two sensing ports.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Pressure at Port A
        │
        ├── compare ──► switch changes state at set differential
        │
Pressure at Port B</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This is useful for filters, fans, air handlers, clean rooms, pumps, and other systems where the difference between two pressures tells you something important.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Example: as an air filter becomes clogged, pressure drop across the filter can increase. A differential-pressure switch can use that change to trigger an alarm or maintenance signal.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Honeywell describes adjustable differential-pressure switches for HVAC and energy-management applications that can sense vacuum, pressure, and differential pressure.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Differential-pressure switch basics</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=UttEnCuAfu4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=UttEnCuAfu4
</div><figcaption class="wp-element-caption"><em>Skillset Automation — a concise industrial-automation explanation of differential-pressure switching and how two pressure points are compared.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Data-center example: filter or fan proving</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>In a data-center cooling system, a differential-pressure switch may be used across a filter or air path. The building-management or control system can use the contact signal as a simple indication that pressure difference has crossed a setpoint.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A technician should not jump directly to “bad switch.” First compare the switch signal with the actual physical condition. A clogged filter, blocked sensing tube, failed fan, kinked hose, loose fitting, or incorrect pressure source can all change the switch result.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Pump-system example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>For a pump system, the control chain may look like this:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Water is used
      ↓
System pressure falls
      ↓
Pressure switch reaches cut-in
      ↓
Contactor / controller starts pump
      ↓
Pump raises pressure
      ↓
Pressure switch reaches cut-out
      ↓
Pump stops</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The pressure switch may control a motor starter or relay rather than carrying the full motor current directly. Always use the actual schematic and contact ratings.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Basic troubleshooting sequence</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>Verify the real pressure.</strong> Use the approved gauge or instrument for the system.</li><li><strong>Check the pressure path.</strong> Look for blocked ports, pinched tubing, leaks, frozen condensate, or closed valves where applicable.</li><li><strong>Identify the expected switch state.</strong> Use the schematic and manufacturer documentation.</li><li><strong>Verify contact change safely.</strong> With the correct isolation and test procedure, check whether the contacts change at the expected pressure.</li><li><strong>Check the control circuit.</strong> Confirm the relay, controller, or starter receives the expected signal.</li><li><strong>Compare actual switching pressure with the setpoint.</strong> Do not adjust the switch just because the equipment is not running.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Stored pressure is hazardous energy</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Turning off electrical power does <strong>not</strong> automatically remove pressure. A vessel, pipe, hose, accumulator, refrigeration circuit, pneumatic line, or hydraulic system can remain pressurized after electrical energy is isolated.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Before servicing, follow the equipment's approved energy-control procedure. Isolate electrical energy and pressure energy as required, release or restrain stored energy safely, and verify the safe condition. Review <a href="https://bitcoinversus.tech/2026/09/30/osetc-011-lockout-tagout-energy-isolation/">OSETC.011: Lockout/Tagout and Energy Isolation</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Assuming NO and NC always correspond to zero pressure.</li><li>Changing a setpoint before measuring the actual pressure.</li><li>Confusing cut-in, cut-out, and differential.</li><li>Replacing the switch before checking blocked sensing tubing or ports.</li><li>Bypassing a pressure safety switch to make equipment run.</li><li>Ignoring stored pressure after electrical lockout.</li><li>Using the switch scale as if it were a precision pressure gauge.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Draw a pressure switch connected to a pipe and label the pressure input and electrical output.</li><li>For a 40 psi cut-in and 60 psi cut-out, calculate the differential.</li><li>Explain the difference between a high-pressure switch and a low-pressure switch.</li><li>Explain why a blocked sensing tube can look like a bad pressure switch.</li><li>Give one example where a differential-pressure switch is more useful than a single-port pressure switch.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>1. What physical condition does a pressure switch sense?</strong><br>Pressure, or in a differential-pressure switch, the difference between two pressures.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong>2. What is differential?</strong><br>The difference between the two switching points, such as cut-in and cut-out.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong>3. Does electrical lockout guarantee that pressure is gone?</strong><br>No. Stored pressure must be isolated and relieved or otherwise controlled according to the approved procedure.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong>4. Should you adjust a pressure switch before measuring actual system pressure?</strong><br>No. Measure and understand the real condition first.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>A pressure switch converts a pressure condition into an electrical contact change.</strong> The technician's job is to understand the real pressure, the expected cut-in/cut-out behavior, the contact state, and the complete control circuit before deciding that the switch itself has failed.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Display note: the diagrams in this lesson are plain text learning diagrams, not simulated terminals. No terminal color palette is being invented or represented.</em></p><!-- /wp:paragraph -->