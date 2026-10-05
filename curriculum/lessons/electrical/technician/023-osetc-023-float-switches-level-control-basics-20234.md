---
title: "OSETC.023: Float Switches and Level Control Basics"
wordpress_post_id: 20234
source: BitcoinVersus.tech
published: 2026-10-03T08:02:30
modified: 2026-10-03T08:02:30
live_url: https://bitcoinversus.tech/2026/10/03/osetc-023-float-switches-level-control-basics/
track: electrical/technician
lesson_number: 23
raw_source: 023-osetc-023-float-switches-level-control-basics-20234.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>A float switch turns liquid level into a simple electrical ON/OFF signal.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Picture the float inside a toilet tank or the float on a sump pump. As the water rises or falls, the float moves. In an electrical float switch, that movement changes an electrical contact.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The basic chain is:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>Liquid level changes
        ↓
Float moves
        ↓
Electrical contact changes
        ↓
Pump, alarm, relay, or control input responds</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">The simplest example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Imagine a tank being filled with water. A float switch is mounted near the top.</p><!-- /wp:paragraph -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>The water level rises.</li><li>The float rises with the water.</li><li>At a certain level, the switch changes state.</li><li>The control circuit can stop a fill pump or turn on a high-level alarm.</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p>That is level control in its most basic form: <strong>physical level → switch movement → electrical signal.</strong></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Float-switch wiring in practice</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=f6W2X2v0OzE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=f6W2X2v0OzE
</div><figcaption class="wp-element-caption"><em>This practical lesson shows a float switch as a liquid-level device and demonstrates its electrical contacts.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Normally open and normally closed</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Float switches can use different contact arrangements. You may see <strong>NO</strong> for normally open and <strong>NC</strong> for normally closed.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>“Normal” means the switch's defined resting or unactuated condition. It does <strong>not</strong> automatically mean “tank empty” for every float switch.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Normally open:</strong> the contact is open in its normal condition.</li><li><strong>Normally closed:</strong> the contact is closed in its normal condition.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The important rule is simple: <strong>check the actual switch markings, wiring diagram, and manufacturer instructions.</strong> Do not guess which wire or position is NO or NC.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">One float can control an alarm</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A high-level float does not have to run a pump directly. It can simply tell a control circuit that the water is too high.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Water rises
   ↓
High-level float changes state
   ↓
Control circuit sees the signal
   ↓
Alarm turns on</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This is useful because the float's job stays simple: <strong>sense the level and change an electrical state.</strong></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Wiring a float switch for pump control</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=z2a5aKmXd4w","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=z2a5aKmXd4w
</div><figcaption class="wp-element-caption"><em>This step-by-step example connects float-switch movement to automatic water-pump control.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Two levels make pump control easier to understand</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Some systems use separate low-level and high-level sensing points.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>A <strong>low-level</strong> switch can request filling or protect a pump from running dry.</li><li>A <strong>high-level</strong> switch can stop filling or trigger an overflow alarm.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>For example:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>LOW LEVEL  → start filling
HIGH LEVEL → stop filling</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The exact action depends on the system design. The labels “high” and “low” tell you what level is being sensed; the wiring and control logic determine what happens next.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">How this connects to solenoid valves</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The previous lesson, <a href="https://bitcoinversus.tech/2026/10/02/osetc-022-solenoids-solenoid-valves-basics/">OSETC.022: Solenoids and Solenoid Valves Basics</a>, covered an output device that can control fluid flow.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Now the pieces can work together:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>Float switch senses level
        ↓
Control circuit makes a decision
        ↓
Solenoid valve opens or closes
        ↓
Water flow changes</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The float switch is the <strong>input</strong>. The solenoid valve is an <strong>output</strong>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Attaching a float switch to a pump</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=2veutu-TPYg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=2veutu-TPYg
</div><figcaption class="wp-element-caption"><em>This pump-focused demonstration shows the physical relationship between a float switch, changing water level, and pump operation.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Simple data-center example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Imagine a cooling-water collection tank. A high-level float switch changes state when the water reaches an unwanted level. The control system can use that signal to turn on an alarm or command other equipment according to the site's design.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The technician does not need to begin with advanced automation theory. Start with four questions:</p><!-- /wp:paragraph -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>What is the actual liquid level?</li><li>Can the float move freely?</li><li>Does the electrical contact change when the float moves?</li><li>Does the control circuit receive the expected signal?</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Basic troubleshooting</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>With the equipment safely isolated when required, basic checks may include:</p><!-- /wp:paragraph -->
<!-- wp:list --><ul class="wp-block-list"><li>Look for a stuck or obstructed float.</li><li>Check for damaged wiring or loose terminals.</li><li>Identify the correct common, NO, and NC contacts from the device documentation.</li><li>Use an appropriate meter and approved procedure to verify whether the contact changes state.</li><li>Compare the real liquid level with the signal seen by the control system.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Do not permanently bypass a float switch or other safety/control device just to make equipment run. If energy isolation is required, follow the principles from <a href="https://bitcoinversus.tech/2026/09/30/osetc-011-lockout-tagout-energy-isolation/">OSETC.011: Lockout/Tagout and Energy Isolation</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Assuming every float switch has the same wire colors or contact action.</li><li>Assuming “normally open” always means “open when the tank is empty.”</li><li>Testing only the electrical side and forgetting to check whether the float is physically stuck.</li><li>Replacing a switch before checking the actual liquid level and wiring.</li><li>Bypassing a protective switch instead of finding out why it changed state.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Draw a tank with one float switch.</li><li>Label the liquid level, float, electrical contact, and pump or alarm.</li><li>Explain what physically causes the contact to change.</li><li>Explain the difference between NO and NC without assuming a particular tank level.</li><li>Describe one use for a high-level switch and one use for a low-level switch.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>A float switch converts liquid-level movement into an electrical contact change.</strong> That simple ON/OFF signal can help control a pump, valve, alarm, relay, or control-system input. Always verify the actual device's contact action and wiring instead of guessing.</p><!-- /wp:paragraph -->