---
title: "OSETC.025: Temperature Switches and Thermostat Control Basics"
wordpress_post_id: 20418
source: BitcoinVersus.tech
published: 2026-10-04T00:29:20
modified: 2026-10-04T00:29:20
live_url: https://bitcoinversus.tech/2026/10/04/osetc-025-temperature-switches-thermostat-control-basics/
track: electrical/technician
lesson_number: 25
raw_source: 025-osetc-025-temperature-switches-thermostat-control-basics-20418.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>A temperature switch or thermostat turns a temperature condition into an electrical contact change that can start, stop, alarm, or protect equipment.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/03/osetc-024-pressure-switches-pressure-control-basics/">OSETC.024: Pressure Switches and Pressure Control Basics</a>. A pressure switch senses pressure. A thermostat or temperature switch senses temperature. The control idea is the same: a physical condition changes, the sensing element reacts, and electrical contacts change state.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Temperature changes
        ↓
Sensor reacts
        ↓
Switch mechanism changes state
        ↓
Electrical contacts open or close
        ↓
Heater, fan, compressor, relay, alarm, or controller responds</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">The simplest thermostat example</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Imagine a cooling system. As temperature rises above a chosen point, the thermostat changes contact state and cooling starts. As temperature falls far enough, the contacts return to their other state and cooling stops.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Temperature rises
      ↓
Cooling cut-in point reached
      ↓
Thermostat changes state
      ↓
Cooling starts
      ↓
Temperature falls
      ↓
Cooling cut-out point reached
      ↓
Thermostat changes state again
      ↓
Cooling stops</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Danfoss describes industrial temperature switches as electromechanical controls that provide a switch contact that operates at a set temperature, with differential adjustment available on many models.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Reference: <a href="https://www.danfoss.com/en-us/products/sen/switches/industrial-temperature-switches/">Danfoss — Industrial Temperature Switches</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: How to set up a temperature switch</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=7ShuS4DFHKA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=7ShuS4DFHKA
</div><figcaption class="wp-element-caption"><em>Danfoss Sensing Solutions — How to set up a Danfoss temperature switch. This walkthrough shows a rising-temperature application and explains adjustable differential.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Setpoint and differential</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <strong>setpoint</strong> is the temperature where the control is intended to switch. The <strong>differential</strong>, sometimes called hysteresis, is the gap between the two switching points.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Cooling turns ON at 80°F
Cooling turns OFF at 75°F

Differential = 80°F − 75°F = 5°F</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The exact relationship depends on the specific control and whether it is configured for heating, cooling, rising temperature, or falling temperature. Always use the manufacturer's switching diagram.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A differential prevents rapid ON/OFF cycling around one exact temperature.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Without enough differential:
79.9°F → OFF
80.0°F → ON
79.9°F → OFF
80.0°F → ON

Result: rapid cycling / hunting</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Normally open, normally closed, and common</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Many temperature controls use contacts marked <strong>NO</strong>, <strong>NC</strong>, and <strong>COM</strong>.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>NO — normally open:</strong> open in the control's defined normal state.</li><li><strong>NC — normally closed:</strong> closed in the defined normal state.</li><li><strong>COM — common:</strong> the moving contact on many SPDT controls.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Do not assume “normal” means room temperature or zero degrees. The manufacturer defines the contact state relative to the sensing condition and control design.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Different ways to sense temperature</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Temperature switches and thermostats can use several sensing methods.</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Sensing method</th><th>Basic idea</th><th>Common use</th></tr></thead><tbody><tr><td><strong>Bimetal</strong></td><td>Two bonded metals expand differently and move as temperature changes.</td><td>Simple thermal switches, equipment protection, thermostats.</td></tr><tr><td><strong>Remote bulb + capillary</strong></td><td>A temperature-sensitive charge changes pressure inside a bulb/capillary system and moves a mechanism.</td><td>Refrigeration, HVAC, industrial controls.</td></tr><tr><td><strong>Electronic sensor + controller</strong></td><td>A thermistor, RTD, or other sensor changes an electrical value that a controller interprets.</td><td>Digital thermostats, building controls, process systems.</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>Honeywell describes bimetal thermostat designs that open or close contacts on temperature rise, while Danfoss industrial controls include room, duct, and remote-bulb sensing arrangements.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Reference: <a href="https://automation.honeywell.com/us/en/products-backup/sensing-solutions/sensors/temperature-and-humidity-sensors/thermostats/3100-series-thermostat">Honeywell — 3100 Series Thermostats</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Mechanical temperature control basics</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=6z0uQ31fNaA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=6z0uQ31fNaA
</div><figcaption class="wp-element-caption"><em>HVAC School — Mechanical Temperature Control Basics with the Danfoss KPU 19. Covers the sensing bulb, capillary tube, SPDT contacts, setpoint, and differential.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Remote bulb and capillary controls</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A remote-bulb thermostat separates the sensing point from the electrical switch body.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Remote sensing bulb
        │
        │ capillary tube
        ▼
Thermostat mechanism
        │
        ▼
Electrical contacts</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The bulb must be placed where it senses the intended temperature. A damaged, kinked, or incorrectly routed capillary can make the control inaccurate or inoperative.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Do not cut, crush, or sharply bend a sealed sensing bulb/capillary assembly. If its charge is lost, the control generally cannot sense correctly.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Heating logic and cooling logic can be opposite</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A heating thermostat and a cooling thermostat may use opposite contact actions.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>HEATING EXAMPLE
Temperature falls
      ↓
Thermostat calls for heat
      ↓
Heater turns ON

COOLING EXAMPLE
Temperature rises
      ↓
Thermostat calls for cooling
      ↓
Cooling turns ON</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Never diagnose a thermostat by assuming which contact “should” be open. First identify whether the control is heating or cooling, whether the switch changes on rise or fall, and which terminals the schematic uses.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Automatic reset vs. manual reset</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>An <strong>automatic-reset</strong> temperature control returns to its normal operating state when temperature moves back through the reset point.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A <strong>manual-reset</strong> high-limit or low-limit control requires a person to reset it after the abnormal temperature condition is corrected. Manual reset is often used where automatic restart could be unsafe.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: HVACR temperature-control logic</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=i2x5rOzatbU","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=i2x5rOzatbU
</div><figcaption class="wp-element-caption"><em>The Engineering Mindset — HVACR Temperature Control Basics. Explains thermostat temperature-control logic in heating and cooling systems.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Temperature switch vs. temperature sensor</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <strong>temperature switch</strong> usually gives a discrete contact output: ON/OFF, open/closed, alarm/not alarm.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A <strong>temperature sensor</strong> often provides a continuously varying value that another controller interprets.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Temperature switch:
Temperature → contact changes state

Temperature sensor:
Temperature → changing resistance / voltage / current / digital value
                    ↓
                 controller</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Some devices combine both functions inside one product, so always read the wiring diagram and datasheet.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Data-center example: cooling alarm or fan control</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A temperature switch can be used as a simple high-temperature alarm or as part of a fan-control circuit.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Room / duct / equipment temperature rises
                ↓
Temperature switch reaches setpoint
                ↓
Contact changes state
                ↓
Alarm, relay, fan, or controller input activates</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>If the alarm appears wrong, do not immediately replace the switch. First verify the actual temperature and the sensing location.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">ASIC-mining example: overtemperature protection</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Mining and power equipment can use temperature switches or thermal protectors to stop equipment, energize cooling, or produce an alarm when a component becomes too hot.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The correct response depends on the circuit design. A high-temperature switch might open a control circuit, close an alarm contact, or feed a PLC/BMS input.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Basic troubleshooting sequence</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>Measure the real temperature.</strong> Use an approved instrument at the correct sensing location.</li><li><strong>Identify the control's setpoint and differential.</strong> Use the datasheet or equipment documentation.</li><li><strong>Determine expected contact state.</strong> Check heating/cooling logic and rising/falling action.</li><li><strong>Inspect the sensing element.</strong> Check bulb placement, capillary condition, mounting, and physical contact with the measured surface or medium where applicable.</li><li><strong>Verify electrical contact change safely.</strong> Use the approved isolation and test procedure.</li><li><strong>Check the rest of the control circuit.</strong> The switch may be working while a relay, contactor, controller input, or wiring fault prevents the final equipment from operating.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">A thermostat can be correct while the temperature still looks wrong</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Temperature at the sensor may differ from temperature somewhere else in the room or equipment.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>A thermostat near a hot electrical cabinet may read higher than room average.</li><li>A sensor beside a supply-air outlet may read lower than occupied-space temperature.</li><li>A remote bulb that is loose from a pipe or coil may not measure the intended surface temperature.</li><li>Heat from sunlight, motors, transformers, electronics, or poor airflow can bias the reading.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Always ask: <strong>What temperature is this sensor actually measuring?</strong></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Confusing setpoint with differential.</li><li>Assuming heating and cooling contacts act the same way.</li><li>Changing the setpoint before measuring actual temperature.</li><li>Replacing the thermostat before checking the sensing bulb or sensor location.</li><li>Damaging a capillary tube by sharply bending or crushing it.</li><li>Bypassing a high-temperature safety control to make equipment run.</li><li>Assuming a switch contact can carry any load without checking its contact rating.</li><li>Confusing a temperature switch with an analog temperature sensor.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Safe practice exercise</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use a low-voltage training thermostat or de-energized control that you are authorized to test.</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Identify COM, NO, and NC if the device provides them.</li><li>Find the setpoint and differential information.</li><li>Record the starting temperature.</li><li>Slowly warm or cool the sensor within its approved range.</li><li>Measure when the contacts change state.</li><li>Continue in the opposite direction and record the reset point.</li><li>Calculate the observed differential.</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p>Do not heat a sensor with an uncontrolled flame, exceed its rated range, or energize a circuit you are not qualified to work on.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What does a temperature switch do?</strong><br>It changes electrical contact state when the sensed temperature reaches a defined switching condition.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. What is differential?</strong><br>The temperature difference between the switch's two operating points.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. Why is differential useful?</strong><br>It prevents rapid cycling around one exact temperature.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. Why can a remote-bulb thermostat read incorrectly?</strong><br>The bulb may be mounted in the wrong location, the capillary may be damaged, or the bulb may not have good thermal contact with the intended measurement point.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. Is a temperature switch the same thing as a temperature sensor?</strong><br>Not necessarily. A switch usually gives a discrete contact output, while a sensor often provides a continuously varying measurement to a controller.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>A temperature switch converts a temperature condition into an electrical decision.</strong> The technician should verify the real temperature, sensing location, setpoint, differential, contact logic, and complete control circuit before deciding that the thermostat itself has failed.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Display note: all diagrams in this lesson are plain educational control diagrams, not simulated terminals. No terminal color palette is used or invented.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->