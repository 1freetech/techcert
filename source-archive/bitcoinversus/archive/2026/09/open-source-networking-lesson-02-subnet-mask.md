---
title: "OSNTC.002: Subnet Masks"
status: published
wordpress_post_id: 19595
published: "2026-09-30T14:33:13"
published_gmt: "2026-09-30T18:33:13"
live_url: "https://bitcoinversus.tech/2026/09/30/open-source-networking-lesson-2-subnet-mask/"
series: "Open-Source Networking Technician Certification"
certification: OSNTC
pathway: technician
lesson_number: "002"
featured_media_id: 19632
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/09/osntc-002-cover.jpg"
featured_image_dimensions: "1200x630"
---

# OSNTC.002: Subnet Masks

<p><strong>Open-Source Networking Technician Certification (OSNTC)</strong> · Technician pathway · Lesson 002</p>


<p>Every device on a network can have an IP address, but the IP address alone does not tell the device which addresses belong to its local network. A <strong>subnet mask</strong> helps make that distinction.</p>
<p>This lesson builds directly on <a href="https://bitcoinversus.tech/2026/09/27/open-source-networking-lesson-1-ip-address/">OSNTC.001: IP Addresses</a></p>
<h2 class="wp-block-heading">A Simple Example</h2>
<p>Imagine a computer with these settings:</p>
<pre class="wp-block-code"><code>IP address:  192.168.1.25
Subnet mask: 255.255.255.0</code></pre>
<p>For this beginner example, the mask tells us that <code>192.168.1</code> identifies the local network and the final number identifies a device on that network. So <code>25</code> identifies this particular host within that local network.</p>
<h2 class="wp-block-heading">Why the Mask Matters</h2>
<p>Your computer needs to decide whether another IP address is on the same local network or whether traffic must be sent toward a router. The subnet mask is part of the information used to make that decision.</p>
<h2 class="wp-block-heading">Video: Subnet Masks Explained Visually</h2>
<p>PowerCert Animated Videos gives a visual explanation of subnet masks and begins its subnet-mask section near 1:11. Use the video to reinforce the simple network-versus-host idea before moving into subnetting math.</p>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=s_Ntt6eTn94&amp;t=71s
</div></figure>
<h2 class="wp-block-heading">Same Network Example</h2>
<pre class="wp-block-code"><code>Computer: 192.168.1.25
Printer:  192.168.1.50
Mask:     255.255.255.0</code></pre>
<p>In this simple example, both devices are in the <code>192.168.1</code> network. They can communicate locally when the rest of the network is configured correctly.</p>
<h2 class="wp-block-heading">Different Network Example</h2>
<pre class="wp-block-code"><code>Computer: 192.168.1.25
Server:   192.168.2.20
Mask:     255.255.255.0</code></pre>
<p>Here, the network portions differ: one is <code>192.168.1</code> and the other is <code>192.168.2</code>. Communication between those networks normally goes through a router.</p>
<h2 class="wp-block-heading">Data Center Example</h2>
<p>A technician might see a miner, server, switch-management interface, or laptop configured with an IP address and subnet mask. Before troubleshooting a connection, checking both values helps confirm whether the devices are intended to be on the same local network.</p>
<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list"><li>Write down <code>192.168.10.15</code> with mask <code>255.255.255.0</code>.</li><li>Write down <code>192.168.10.40</code> with the same mask.</li><li>Identify the matching network portion.</li><li>Now change the second address to <code>192.168.11.40</code>.</li><li>Identify what changed.</li></ol>
<h2 class="wp-block-heading">Key Takeaway</h2>
<p>A subnet mask works with an IP address to identify the network portion and host portion. For the common beginner example <code>255.255.255.0</code>, addresses sharing the first three octets are in the same local subnet.</p>
