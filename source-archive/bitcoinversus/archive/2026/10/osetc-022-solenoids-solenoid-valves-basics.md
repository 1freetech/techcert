---
title: "OSETC.022: Solenoids and Solenoid Valves Basics"
status: published
wordpress_post_id: 20178
published: "2026-10-02T19:46:08"
live_url: "https://bitcoinversus.tech/2026/10/02/osetc-022-solenoids-solenoid-valves-basics/"
series: "Open-Source Electrical Technician"
pathway: electrical/technician
lesson_number: "022"
featured_media_id: 20177
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-022-solenoids-solenoid-valves-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=O5HmvDsW7gw"
youtube_2: "https://www.youtube.com/watch?v=-MLGr1_Fw0c"
youtube_3: "https://www.youtube.com/watch?v=ZYL_X9NwHvk"
---

# OSETC.022: Solenoids and Solenoid Valves Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>A solenoid turns electrical energy into a small mechanical movement. A solenoid valve uses that movement to open, close, or redirect the flow of air or liquid.</strong></p>

<p class="wp-block-paragraph">You have seen the basic idea in everyday life: an electrical signal tells a physical device to move. In industrial controls, the signal might energize a coil, pull a metal plunger, and change the position of a valve.</p>

<h2 class="wp-block-heading">The basic solenoid</h2>
<ul class="wp-block-list"><li><strong>Coil:</strong> wire wound around a core area.</li><li><strong>Plunger:</strong> a movable metal piece.</li><li><strong>Spring:</strong> often returns the plunger when power is removed.</li><li><strong>Electrical terminals:</strong> connect the coil to its control voltage.</li></ul>
<p class="wp-block-paragraph">When the coil is energized, its magnetic field moves the plunger. When power is removed, a spring or another mechanical force commonly returns it.</p>

<h2 class="wp-block-heading">Video 1: Solenoid valve working principle</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=O5HmvDsW7gw?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span>
</div><figcaption class="wp-element-caption"><em>This focused animation shows how electrical solenoid action moves the valve mechanism and controls flow.</em></figcaption></figure>

<h2 class="wp-block-heading">From solenoid to solenoid valve</h2>
<p class="wp-block-paragraph">A valve controls flow. Add an electrically operated solenoid to the valve, and an electrical control circuit can tell the valve when to change position.</p>
<p class="wp-block-paragraph">A simple example is an air line feeding a pneumatic cylinder. A control signal energizes the solenoid coil, the valve changes position, and compressed air is allowed to move through the selected path.</p>

<h2 class="wp-block-heading">Normally closed and normally open</h2>
<ul class="wp-block-list"><li><strong>Normally closed (NC):</strong> the normal unpowered state blocks the controlled flow path.</li><li><strong>Normally open (NO):</strong> the normal unpowered state allows the controlled flow path.</li></ul>
<p class="wp-block-paragraph">The word <strong>normally</strong> refers to the device&#8217;s normal state when its operating coil is not energized. Always verify the actual device diagram and manufacturer information instead of assuming.</p>

<h2 class="wp-block-heading">Video 2: How solenoid valves work</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=-MLGr1_Fw0c?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span>
</div><figcaption class="wp-element-caption"><em>The Engineering Mindset explains the parts, operation, and common uses of solenoid valves.</em></figcaption></figure>

<h2 class="wp-block-heading">How this fits the control circuit</h2>
<p class="wp-block-paragraph">The recent OSETC lessons introduced common <strong>inputs</strong>: limit switches, proximity sensors, and photoelectric sensors. A solenoid valve is a useful example of an <strong>output</strong>. A sensor can report a condition; the control circuit can then command an actuator such as a solenoid valve.</p>
<p class="wp-block-paragraph">For example, a photoelectric sensor detects a box. The control logic decides what should happen. A relay or controller output energizes a solenoid valve. The valve then changes airflow to move a pneumatic mechanism.</p>

<h2 class="wp-block-heading">A simple electrical check</h2>
<p class="wp-block-paragraph">If a solenoid valve does not operate, technicians may investigate questions such as:</p>
<ul class="wp-block-list"><li>Is the correct control voltage reaching the coil?</li><li>Is the coil rated for that voltage and type of power?</li><li>Is the electrical connector secure?</li><li>Is the coil open or damaged?</li><li>Is the plunger or valve mechanically stuck?</li><li>Is the required air or fluid supply actually present?</li></ul>
<p class="wp-block-paragraph">Electrical and mechanical problems can produce similar symptoms, so troubleshooting should separate the command signal, the coil, the mechanical movement, and the process supply.</p>

<h2 class="wp-block-heading">Video 3: Solenoid valve animation</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=ZYL_X9NwHvk?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span>
</div><figcaption class="wp-element-caption"><em>This cutaway animation reinforces how the coil, plunger, and valve mechanism work together.</em></figcaption></figure>

<h2 class="wp-block-heading">Safety: control is not isolation</h2>
<p class="wp-block-paragraph">Turning off a control signal or de-energizing a solenoid command is not automatically the same thing as safely isolating hazardous energy. Stored pressure, electrical energy, gravity, or another energy source may still exist. Follow the equipment&#8217;s approved energy-control procedure and lockout/tagout requirements before servicing.</p>
<p class="wp-block-paragraph">This is the same principle introduced in <a href="https://bitcoinversus.tech/2026/09/30/osetc-011-lockout-tagout-energy-isolation/">OSETC.011: Lockout/Tagout and Energy Isolation</a>: control devices are not substitutes for proper energy isolation.</p>

<h2 class="wp-block-heading">Simple data-center example</h2>
<p class="wp-block-paragraph">Imagine a cooling-water system with an electrically operated valve. A control signal can tell the valve to open or close, but a technician troubleshooting the system still has to think about both sides of the device: the electrical coil and the physical fluid system.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Assuming every solenoid valve is normally closed.</li><li>Applying the wrong coil voltage.</li><li>Assuming a working coil proves the valve itself is mechanically free.</li><li>Forgetting that air or liquid pressure can remain even when the electrical command is off.</li><li>Treating a control switch as an energy-isolation device.</li></ul>

<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list"><li>Name the two major parts of the basic electrical-to-mechanical action: the <strong>coil</strong> and the <strong>plunger</strong>.</li><li>Explain what “normally closed” means.</li><li>Describe the chain: sensor → control decision → solenoid valve → physical movement.</li><li>Explain why removing the control signal does not by itself prove that all hazardous energy has been isolated.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph">A solenoid converts an electrical command into mechanical motion. A solenoid valve uses that motion to control flow. For an electrical technician, the important skill is understanding the chain from <strong>control voltage → coil → plunger → valve movement → physical process</strong>, while keeping control commands separate from proper energy isolation.</p>
