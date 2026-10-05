---
title: "OSETC.023: Float Switches and Level Control Basics"
status: published
wordpress_post_id: 20234
published: "2026-10-03T08:02:30"
live_url: "https://bitcoinversus.tech/2026/10/03/osetc-023-float-switches-level-control-basics/"
series: "Open-Source Electrical Technician"
pathway: electrical/technician
lesson_number: "023"
featured_media_id: 20233
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-023-float-switches-level-control-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=f6W2X2v0OzE"
youtube_2: "https://www.youtube.com/watch?v=z2a5aKmXd4w"
youtube_3: "https://www.youtube.com/watch?v=2veutu-TPYg"
---

# OSETC.023: Float Switches and Level Control Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>A float switch turns liquid level into a simple electrical ON/OFF signal.</strong></p>

<p class="wp-block-paragraph">Picture the float inside a toilet tank or the float on a sump pump. As the water rises or falls, the float moves. In an electrical float switch, that movement changes an electrical contact.</p>

<p class="wp-block-paragraph">The basic chain is:</p>
<pre class="wp-block-code"><code>Liquid level changes
        ↓
Float moves
        ↓
Electrical contact changes
        ↓
Pump, alarm, relay, or control input responds</code></pre>

<h2 class="wp-block-heading">The simplest example</h2>
<p class="wp-block-paragraph">Imagine a tank being filled with water. A float switch is mounted near the top.</p>
<ol class="wp-block-list"><li>The water level rises.</li><li>The float rises with the water.</li><li>At a certain level, the switch changes state.</li><li>The control circuit can stop a fill pump or turn on a high-level alarm.</li></ol>

<p class="wp-block-paragraph">That is level control in its most basic form: <strong>physical level → switch movement → electrical signal.</strong></p>

<h2 class="wp-block-heading">Video 1: Float-switch wiring in practice</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/f6W2X2v0OzE?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This practical lesson shows a float switch as a liquid-level device and demonstrates its electrical contacts.</em></figcaption></figure>

<h2 class="wp-block-heading">Normally open and normally closed</h2>
<p class="wp-block-paragraph">Float switches can use different contact arrangements. You may see <strong>NO</strong> for normally open and <strong>NC</strong> for normally closed.</p>

<p class="wp-block-paragraph">“Normal” means the switch&#8217;s defined resting or unactuated condition. It does <strong>not</strong> automatically mean “tank empty” for every float switch.</p>

<ul class="wp-block-list"><li><strong>Normally open:</strong> the contact is open in its normal condition.</li><li><strong>Normally closed:</strong> the contact is closed in its normal condition.</li></ul>

<p class="wp-block-paragraph">The important rule is simple: <strong>check the actual switch markings, wiring diagram, and manufacturer instructions.</strong> Do not guess which wire or position is NO or NC.</p>

<h2 class="wp-block-heading">One float can control an alarm</h2>
<p class="wp-block-paragraph">A high-level float does not have to run a pump directly. It can simply tell a control circuit that the water is too high.</p>

<pre class="wp-block-code"><code>Water rises
   ↓
High-level float changes state
   ↓
Control circuit sees the signal
   ↓
Alarm turns on</code></pre>

<p class="wp-block-paragraph">This is useful because the float&#8217;s job stays simple: <strong>sense the level and change an electrical state.</strong></p>

<h2 class="wp-block-heading">Video 2: Wiring a float switch for pump control</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/z2a5aKmXd4w?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This step-by-step example connects float-switch movement to automatic water-pump control.</em></figcaption></figure>

<h2 class="wp-block-heading">Two levels make pump control easier to understand</h2>
<p class="wp-block-paragraph">Some systems use separate low-level and high-level sensing points.</p>

<ul class="wp-block-list"><li>A <strong>low-level</strong> switch can request filling or protect a pump from running dry.</li><li>A <strong>high-level</strong> switch can stop filling or trigger an overflow alarm.</li></ul>

<p class="wp-block-paragraph">For example:</p>
<pre class="wp-block-code"><code>LOW LEVEL  → start filling
HIGH LEVEL → stop filling</code></pre>

<p class="wp-block-paragraph">The exact action depends on the system design. The labels “high” and “low” tell you what level is being sensed; the wiring and control logic determine what happens next.</p>

<h2 class="wp-block-heading">How this connects to solenoid valves</h2>
<p class="wp-block-paragraph">The previous lesson, <a href="https://bitcoinversus.tech/2026/10/02/osetc-022-solenoids-solenoid-valves-basics/">OSETC.022: Solenoids and Solenoid Valves Basics</a>, covered an output device that can control fluid flow.</p>

<p class="wp-block-paragraph">Now the pieces can work together:</p>
<pre class="wp-block-code"><code>Float switch senses level
        ↓
Control circuit makes a decision
        ↓
Solenoid valve opens or closes
        ↓
Water flow changes</code></pre>

<p class="wp-block-paragraph">The float switch is the <strong>input</strong>. The solenoid valve is an <strong>output</strong>.</p>

<h2 class="wp-block-heading">Video 3: Attaching a float switch to a pump</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/2veutu-TPYg?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This pump-focused demonstration shows the physical relationship between a float switch, changing water level, and pump operation.</em></figcaption></figure>

<h2 class="wp-block-heading">Simple data-center example</h2>
<p class="wp-block-paragraph">Imagine a cooling-water collection tank. A high-level float switch changes state when the water reaches an unwanted level. The control system can use that signal to turn on an alarm or command other equipment according to the site&#8217;s design.</p>

<p class="wp-block-paragraph">The technician does not need to begin with advanced automation theory. Start with four questions:</p>
<ol class="wp-block-list"><li>What is the actual liquid level?</li><li>Can the float move freely?</li><li>Does the electrical contact change when the float moves?</li><li>Does the control circuit receive the expected signal?</li></ol>

<h2 class="wp-block-heading">Basic troubleshooting</h2>
<p class="wp-block-paragraph">With the equipment safely isolated when required, basic checks may include:</p>
<ul class="wp-block-list"><li>Look for a stuck or obstructed float.</li><li>Check for damaged wiring or loose terminals.</li><li>Identify the correct common, NO, and NC contacts from the device documentation.</li><li>Use an appropriate meter and approved procedure to verify whether the contact changes state.</li><li>Compare the real liquid level with the signal seen by the control system.</li></ul>

<p class="wp-block-paragraph">Do not permanently bypass a float switch or other safety/control device just to make equipment run. If energy isolation is required, follow the principles from <a href="https://bitcoinversus.tech/2026/09/30/osetc-011-lockout-tagout-energy-isolation/">OSETC.011: Lockout/Tagout and Energy Isolation</a>.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Assuming every float switch has the same wire colors or contact action.</li><li>Assuming “normally open” always means “open when the tank is empty.”</li><li>Testing only the electrical side and forgetting to check whether the float is physically stuck.</li><li>Replacing a switch before checking the actual liquid level and wiring.</li><li>Bypassing a protective switch instead of finding out why it changed state.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list"><li>Draw a tank with one float switch.</li><li>Label the liquid level, float, electrical contact, and pump or alarm.</li><li>Explain what physically causes the contact to change.</li><li>Explain the difference between NO and NC without assuming a particular tank level.</li><li>Describe one use for a high-level switch and one use for a low-level switch.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong>A float switch converts liquid-level movement into an electrical contact change.</strong> That simple ON/OFF signal can help control a pump, valve, alarm, relay, or control-system input. Always verify the actual device&#8217;s contact action and wiring instead of guessing.</p>
