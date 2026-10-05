---
title: "OSNTC.011: Network Interface Card (NIC) Basics"
status: published
wordpress_post_id: 20256
published: "2026-10-03T11:04:47"
live_url: "https://bitcoinversus.tech/2026/10/03/osntc-011-network-interface-card-nic-basics/"
series: "Open-Source Networking Technician"
pathway: networking
lesson_number: "011"
featured_media_id: 20255
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc-011-network-interface-card-nic-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=pzamZqPRrbY"
youtube_2: "https://www.youtube.com/watch?v=cZIwDJs_7ZQ"
youtube_3: "https://www.youtube.com/watch?v=HqsovjPAIG4"
---

# OSNTC.011: Network Interface Card (NIC) Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>A network interface is the part of a device that lets it connect to a network.</strong></p>

<p class="wp-block-paragraph">You will often hear the term <strong>NIC</strong>, short for <strong>Network Interface Card</strong> or network interface controller. The everyday idea is simple: the NIC or network adapter is the computer&#8217;s connection point to Ethernet or Wi-Fi.</p>

<p class="wp-block-paragraph">It does not always have to be a separate card. A network interface can be built into a motherboard, installed as an add-in card, or connected through a device such as a USB network adapter.</p>

<h2 class="wp-block-heading">Start with one simple picture</h2>
<pre class="wp-block-code"><code>Computer
   ↓
Network interface
   ↓
Ethernet cable or Wi-Fi
   ↓
Network</code></pre>

<p class="wp-block-paragraph">If the network interface cannot communicate correctly, the computer may have perfectly good software and still fail to reach the network.</p>

<h2 class="wp-block-heading">Wired NIC</h2>
<p class="wp-block-paragraph">A wired Ethernet interface commonly provides an RJ45 Ethernet port. You connect an Ethernet cable from that port to network equipment such as a switch.</p>

<p class="wp-block-paragraph">Many Ethernet interfaces also have small link/activity indicators near the port. Their exact colors and blink patterns vary by manufacturer, so never assume a particular LED color has the same meaning on every device. Check the hardware documentation when the exact indication matters.</p>

<h2 class="wp-block-heading">Video 1: What a NIC is</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/pzamZqPRrbY?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This beginner lesson explains what a Network Interface Card is and why a computer needs a network interface.</em></figcaption></figure>

<h2 class="wp-block-heading">Wireless network interface</h2>
<p class="wp-block-paragraph">A Wi-Fi adapter performs the same basic job—connecting the device to a network—but it uses radio instead of an Ethernet cable.</p>

<p class="wp-block-paragraph">A laptop may therefore have more than one network interface:</p>
<ul class="wp-block-list"><li>an Ethernet interface for a cable, and</li><li>a Wi-Fi interface for wireless networking.</li></ul>

<p class="wp-block-paragraph">Each interface is its own network connection and can have its own configuration.</p>

<h2 class="wp-block-heading">Four things a technician should recognize</h2>
<ol class="wp-block-list"><li><strong>Link:</strong> does the interface have a working physical or wireless connection?</li><li><strong>MAC address:</strong> the interface uses a Layer 2 address for local network communication.</li><li><strong>IP configuration:</strong> the interface can be assigned IP information so it can communicate at the IP layer.</li><li><strong>Speed:</strong> the interface and its network connection support particular link rates and capabilities.</li></ol>

<p class="wp-block-paragraph">You already learned the MAC-address concept in <a href="https://bitcoinversus.tech/2026/10/02/osntc-007-mac-address-basics/">OSNTC.007: MAC Address Basics</a>.</p>

<h2 class="wp-block-heading">Video 2: Viewing wired and wireless NIC information</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/cZIwDJs_7ZQ?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This lab shows how wired and wireless network interfaces appear as separate adapters with their own information.</em></figcaption></figure>

<h2 class="wp-block-heading">How the NIC connects earlier lessons</h2>
<p class="wp-block-paragraph">The NIC is where several earlier networking ideas meet.</p>

<pre class="wp-block-code"><code>NIC / network adapter
      ↓
MAC address
      ↓
Ethernet or Wi-Fi connection
      ↓
IP configuration
      ↓
Network communication</code></pre>

<p class="wp-block-paragraph">For wired Ethernet, the interface sends and receives Ethernet frames. That connects directly to <a href="https://bitcoinversus.tech/2026/10/02/osntc-008-ethernet-frame-basics/">OSNTC.008: Ethernet Frame Basics</a>.</p>

<p class="wp-block-paragraph">Once IP communication is configured, tools such as ping can help test reachability, as covered in <a href="https://bitcoinversus.tech/2026/10/02/osntc-010-icmp-ping-basics/">OSNTC.010: ICMP and Ping Basics</a>.</p>

<h2 class="wp-block-heading">Video 3: NIC fundamentals</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/HqsovjPAIG4?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This networking-basics video reinforces the role of the network interface controller in connecting a computer to a network.</em></figcaption></figure>

<h2 class="wp-block-heading">Simple troubleshooting example</h2>
<p class="wp-block-paragraph">A workstation cannot reach the network. Before changing DNS servers, routes, or application settings, check the network interface itself.</p>

<ol class="wp-block-list"><li>Is the Ethernet cable connected, or is Wi-Fi enabled?</li><li>Does the operating system show the intended network adapter?</li><li>Does the wired interface show a link?</li><li>Does the interface have the expected IP configuration?</li><li>Can it reach the local gateway or another appropriate test target?</li></ol>

<p class="wp-block-paragraph">This order keeps troubleshooting simple: start close to the computer, then move outward.</p>

<h2 class="wp-block-heading">Do not confuse the NIC with the switch</h2>
<p class="wp-block-paragraph">The <strong>NIC belongs to the endpoint</strong>—for example, the PC or server. A <strong>network switch</strong> is separate network equipment that connects multiple Ethernet devices together.</p>

<pre class="wp-block-code"><code>PC NIC ── Ethernet cable ── Switch</code></pre>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Thinking every NIC must be a removable expansion card.</li><li>Calling the Ethernet cable itself the NIC.</li><li>Assuming Wi-Fi and Ethernet are the same interface.</li><li>Assuming a link light proves DNS, routing, or an application is working.</li><li>Assuming every manufacturer&#8217;s link LEDs use the same colors.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list"><li>Find the Ethernet or Wi-Fi interface on a computer you are allowed to inspect.</li><li>Identify whether it is built in, an add-in card, or an external adapter.</li><li>Find its MAC address.</li><li>Find its current IP address.</li><li>If it is wired, identify the Ethernet port and cable.</li><li>Explain the difference between the NIC and the network switch in one sentence.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong>The network interface is the computer&#8217;s connection to the network.</strong> It may be wired or wireless, built in or added later. For basic troubleshooting, recognize the interface, check its connection, identify its MAC address and IP configuration, and then test communication outward from the device.</p>
