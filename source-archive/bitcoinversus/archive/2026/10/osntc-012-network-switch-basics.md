---
title: "OSNTC.012: Network Switch Basics"
status: published
wordpress_post_id: 20263
published: "2026-10-03T11:57:39"
live_url: "https://bitcoinversus.tech/2026/10/03/osntc-012-network-switch-basics/"
series: "Open-Source Networking Technician"
pathway: networking
lesson_number: "012"
featured_media_id: 20262
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc-012-network-switch-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=9DSSyffnMn0"
youtube_2: "https://www.youtube.com/watch?v=Msxpr_8kiTk"
youtube_3: "https://www.youtube.com/watch?v=Wu_vHj9PnxQ"
---

# OSNTC.012: Network Switch Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>A network switch connects devices on a local network and forwards Ethernet frames between its ports.</strong></p>

<p class="wp-block-paragraph">Think of a small office. A PC, printer, server, and Wi-Fi access point can all plug into the same Ethernet switch. The switch gives those wired devices a place to exchange local network traffic.</p>

<h2 class="wp-block-heading">Start with one simple picture</h2>
<pre class="wp-block-code"><code>PC ─────┐
Printer ─┼── Network Switch
Server ──┤
AP ──────┘</code></pre>

<p class="wp-block-paragraph">Each cable connects to a switch <strong>port</strong>. A port is simply a connection point on the switch.</p>

<h2 class="wp-block-heading">What does the switch actually do?</h2>
<p class="wp-block-paragraph">For basic Ethernet switching, remember three actions:</p>
<ol class="wp-block-list"><li>A frame arrives on a switch port.</li><li>The switch learns the source MAC address and associates it with the port where the frame arrived.</li><li>The switch uses its learned MAC-address information to decide where to forward Ethernet frames.</li></ol>

<p class="wp-block-paragraph">You do not need to memorize an advanced table yet. Just remember: <strong>MAC address → switch port.</strong></p>

<h2 class="wp-block-heading">Video 1: How a switch learns MAC addresses</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/9DSSyffnMn0?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This focused lesson shows how an Ethernet switch learns which MAC addresses are reachable through its ports.</em></figcaption></figure>

<h2 class="wp-block-heading">A tiny example</h2>
<p class="wp-block-paragraph">Suppose a PC is connected to port 1 and a printer is connected to port 4.</p>
<pre class="wp-block-code"><code>Port 1 → PC
Port 4 → Printer</code></pre>

<p class="wp-block-paragraph">As traffic arrives, the switch can learn which source MAC addresses appear on those ports. When it knows where the destination MAC address is, it can forward the frame toward the appropriate port instead of sending that known unicast frame everywhere.</p>

<h2 class="wp-block-heading">What if the switch does not know the destination yet?</h2>
<p class="wp-block-paragraph">If the destination MAC address is unknown, a basic Ethernet switch can <strong>flood</strong> that frame out other appropriate ports in the same VLAN. When devices reply, the switch learns more MAC-to-port information.</p>

<p class="wp-block-paragraph">“Flood” does not mean the network is broken. It is a normal switching behavior for certain traffic, including an unknown unicast destination.</p>

<h2 class="wp-block-heading">Video 2: Layer-2 switching fundamentals</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/Msxpr_8kiTk?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This networking lesson walks through how a Layer-2 switch receives, learns from, and forwards Ethernet frames.</em></figcaption></figure>

<h2 class="wp-block-heading">Switch vs. router</h2>
<p class="wp-block-paragraph">Beginners often mix these up.</p>
<ul class="wp-block-list"><li><strong>Switch:</strong> commonly connects devices within a LAN and makes Layer-2 forwarding decisions using MAC addresses.</li><li><strong>Router:</strong> connects IP networks and makes routing decisions using IP addresses.</li></ul>

<p class="wp-block-paragraph">A home “Wi-Fi router” often combines several functions in one box, such as routing, Ethernet switching, and wireless access. That does not make the functions identical.</p>

<h2 class="wp-block-heading">How this connects to earlier OSNTC lessons</h2>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/osntc-007-mac-address-basics/">OSNTC.007: MAC Address Basics</a> introduced the address a switch uses for basic Layer-2 forwarding decisions.</p>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/osntc-008-ethernet-frame-basics/">OSNTC.008: Ethernet Frame Basics</a> introduced the frame that moves through the Ethernet LAN.</p>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/03/osntc-011-network-interface-card-nic-basics/">OSNTC.011: Network Interface Card (NIC) Basics</a> introduced the network interface that connects an endpoint to the network.</p>

<p class="wp-block-paragraph">Now those ideas fit together:</p>
<pre class="wp-block-code"><code>Computer
   ↓
NIC
   ↓
Ethernet cable
   ↓
Switch port
   ↓
Ethernet frame
   ↓
MAC-based forwarding</code></pre>

<h2 class="wp-block-heading">Video 3: Switch learning and forwarding</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/Wu_vHj9PnxQ?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This lesson reinforces MAC learning, flooding, and forwarding with a LAN-switch example.</em></figcaption></figure>

<h2 class="wp-block-heading">Link lights are a useful first check</h2>
<p class="wp-block-paragraph">Many Ethernet switch ports and NICs have link/activity indicators. The exact LED colors and blink patterns are <strong>not universal</strong>; they depend on the hardware manufacturer and model.</p>

<p class="wp-block-paragraph">For troubleshooting, do not assume “green always means one exact speed” or “amber always means an error.” Read the device documentation. The useful beginner question is simply: <strong>does the port show the expected physical link state for this hardware?</strong></p>

<h2 class="wp-block-heading">Simple technician troubleshooting</h2>
<p class="wp-block-paragraph">Imagine a workstation cannot reach anything on the LAN. Start with the physical path before changing advanced settings:</p>
<ol class="wp-block-list"><li>Is the Ethernet cable connected at both ends?</li><li>Does the NIC show a link?</li><li>Does the switch port show the expected link state?</li><li>Is the cable plugged into the intended switch port?</li><li>Is the port enabled and in the expected VLAN?</li><li>Does the computer have the expected IP configuration?</li></ol>

<p class="wp-block-paragraph">This gives you a clean troubleshooting order: <strong>physical connection first, then switching configuration, then IP configuration.</strong></p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Calling every network box a router.</li><li>Thinking a switch normally forwards based on the destination IP address instead of the Ethernet destination MAC address.</li><li>Assuming every switch LED color means the same thing on every model.</li><li>Assuming a connected cable proves the switch port is correctly configured.</li><li>Forgetting that VLANs can logically separate ports even when they are on the same physical switch.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list"><li>Draw one switch with four ports.</li><li>Connect a PC to port 1 and a printer to port 4.</li><li>Write “PC MAC” beside port 1 and “Printer MAC” beside port 4.</li><li>Explain in one sentence what the switch learns.</li><li>Explain the basic difference between a switch and a router.</li><li>Name three physical things you would check if a switch-connected PC had no network access.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong>A network switch connects devices on a LAN and forwards Ethernet frames between ports.</strong> At the beginner level, remember the relationship: the switch learns <strong>which source MAC addresses are reachable through which ports</strong>, then uses destination MAC information to make forwarding decisions.</p>
