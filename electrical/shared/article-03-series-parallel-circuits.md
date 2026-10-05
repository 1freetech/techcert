---
title: "OSEEC.003: Series and Parallel Circuits"
role: "Technician / Engineer shared foundation"
tier: 1
wordpress_post_id: 18617
published: "2026-09-26T11:53:46"
live_url: "https://bitcoinversus.tech/2026/09/26/open-source-electrical-engineering-training-program-article-3-series-and-parallel-circuits/"
status: published
---

# OSEEC.003: Series and Parallel Circuits


<p class="wp-block-paragraph">The BitcoinVersus.Tech Open-Source Electrical Engineering Training Program continues with Article 3. This lesson builds on voltage, current, resistance, and power by showing how components behave when they are connected in series or in parallel.</p>


<p><strong>In simple terms:</strong> Series and parallel describe how you connect parts in a circuit. Imagine two lamps powered by a battery. In series, electricity has one route through both lamps, one after the other. Disconnect either lamp and you break that route, so both go out. In parallel, each lamp has its own route across the battery. Disconnect one lamp and the other can stay on. Remember: <strong>series means one path; parallel means separate paths.</strong></p>

<p><strong>Definitions:</strong> A <strong>circuit</strong> is an electrical path; current needs a complete return path to flow. A <strong>series connection</strong> puts components along one path. A <strong>parallel connection</strong> puts components on separate branches connected across the same two points. A <strong>load</strong> uses electrical energy, such as a lamp or motor. A <strong>node</strong> is a connection point shared by circuit parts.</p>

<h2 class="wp-block-heading">Series Circuits</h2>
<p class="wp-block-paragraph">In a series circuit, components share one current path. The same current flows through each component. The source voltage is divided among the loads, and the individual voltage drops add to the source voltage.</p>
<p class="wp-block-paragraph">For resistors in series:</p>
<pre class="wp-block-code"><code>R_total = R1 + R2 + R3 + ...</code></pre>
<p class="wp-block-paragraph">Example: three resistors of 10 Ω, 20 Ω, and 30 Ω in series have a total resistance of 60 Ω. With a 12 V source, Ohm&#8217;s law gives I = V/R = 12/60 = 0.2 A. That same 0.2 A flows through every resistor.</p>

<h2 class="wp-block-heading">Parallel Circuits</h2>
<p class="wp-block-paragraph">In a parallel circuit, components are connected across the same two electrical nodes. Each branch therefore has the same voltage across it, while total current is the sum of the branch currents.</p>
<p class="wp-block-paragraph">For resistors in parallel:</p>
<pre class="wp-block-code"><code>1/R_total = 1/R1 + 1/R2 + 1/R3 + ...</code></pre>
<p class="wp-block-paragraph">For two parallel resistors, the shortcut is R_total = (R1 × R2) / (R1 + R2). Two 20 Ω resistors in parallel therefore produce 10 Ω total resistance.</p>

<h2 class="wp-block-heading">What a Technician Should Remember</h2>
<ul class="wp-block-list"><li>Series: current is the same through every component.</li><li>Series: voltage drops add to the source voltage.</li><li>Series: resistances add directly.</li><li>Parallel: voltage is the same across every branch.</li><li>Parallel: branch currents add to total current.</li><li>Parallel: equivalent resistance is lower than the smallest individual branch resistance.</li></ul>

<h2 class="wp-block-heading">Field Application</h2>
<p class="wp-block-paragraph">These relationships appear constantly in electrical and data-center work. Loads are commonly arranged in parallel so each receives the intended supply voltage and can operate independently. Series relationships appear inside equipment, control circuits, sensing networks, battery strings, and voltage-divider circuits. Being able to identify the topology from a schematic is a basic troubleshooting skill.</p>

<h2 class="wp-block-heading">Measurement Practice</h2>
<p class="wp-block-paragraph">With equipment de-energized and made safe according to the applicable procedure, identify which components share a single path and which connect across common nodes. For energized measurements, use properly rated instruments, PPE, and approved procedures. A voltmeter is connected across the points whose potential difference is being measured, while an ammeter measures current in the current path. Never move meter leads between current and voltage configurations without verifying the meter setup first.</p>

<h2 class="wp-block-heading">Worked Check</h2>
<p class="wp-block-paragraph">A 24 V source supplies two 12 Ω resistors in parallel. Their equivalent resistance is 6 Ω. Total source current is therefore 24/6 = 4 A. Because the resistors are equal, each branch carries 2 A. Each resistor still has the full 24 V across it.</p>

<h2 class="wp-block-heading">Video Reference</h2>
<p class="wp-block-paragraph">The Organic Chemistry Tutor provides a detailed worked tutorial covering the same series and parallel circuit concepts and calculations used in this lesson.</p>

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/7mdc-lRrW1c?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div></figure>


<h2 class="wp-block-heading">Continue Learning</h2>
<p class="wp-block-paragraph">Practice identifying series and parallel sections before doing calculations. Once that becomes automatic, mixed circuits can be reduced section by section. The next training articles will continue toward circuit laws, measurement, safety, grounding and bonding, AC/DC systems, power distribution, transformers, three-phase systems, switchgear, schematics, troubleshooting, and data-center electrical systems.</p>
<p class="wp-block-paragraph"><strong>References:</strong> Khan Academy electrical engineering material on series and parallel circuits; Vernier series and parallel circuit experiment resources; The Organic Chemistry Tutor video reference.</p>
<figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
<div class="embed-x"><blockquote class="twitter-tweet" data-width="500" data-dnt="true"><p lang="en" dir="ltr">Use the <a href="https://x.com/hashtag/promocode?src=hash&amp;ref_src=twsrc%5Etfw">#promocode</a> bitcoinversus at check out to Get 5% off <a href="https://x.com/hashtag/Bitaxe?src=hash&amp;ref_src=twsrc%5Etfw">#Bitaxe</a> Mining Products<br><br>Limited to one use per customer Happy <a href="https://x.com/hashtag/Bitcoin?src=hash&amp;ref_src=twsrc%5Etfw">#Bitcoin</a> Mining!<a href="https://t.co/0trBgXkbVd">https://t.co/0trBgXkbVd</a></p>&mdash; BitcoinVersus.Tech 📟 (@1BitcoinVersus) <a href="https://x.com/1BitcoinVersus/status/1937006164555993338?ref_src=twsrc%5Etfw">June 23, 2025</a></blockquote><script async src="https://platform.x.com/widgets.js" charset="utf-8"></script></div>
</div></figure>
<p class="wp-block-paragraph"><strong>Related BitcoinVersus.tech coverage:</strong> <a href="https://bitcoinversus.tech/2026/09/24/open-source-electrical-engineering-training-article-2-voltage-current-resistance-power/">Electrical voltage/current/power</a> · <a href="https://bitcoinversus.tech/2026/09/24/electrical-engineering-line-to-line-vs-line-to-neutral-voltage/">Line-to-line vs line-to-neutral</a> · <a href="https://bitcoinversus.tech/2026/09/27/enphase-800-vdc-ai-power-modules-texas/">Enphase 800 VDC</a> · <a href="https://bitcoinversus.tech/2026/09/27/abb-infinitus-800-vdc-ai-data-center-power/">ABB 800 VDC</a></p>
<p class="wp-block-paragraph"><strong>BitcoinVersus.Tech Editor&#8217;s Note:</strong> We volunteer daily to help ensure the credibility of information on this platform is verifiably true. BitcoinVersus.tech is not a financial advisor. This article is independent reporting and educational content for informational purposes only.</p>
