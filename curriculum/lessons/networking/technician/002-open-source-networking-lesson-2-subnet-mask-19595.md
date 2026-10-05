---
title: "OSNTC.002: Subnet Masks"
wordpress_post_id: 19595
source: BitcoinVersus.tech
published: 2026-09-30T14:33:13
modified: 2026-10-01T07:28:38
live_url: https://bitcoinversus.tech/2026/09/30/open-source-networking-lesson-2-subnet-mask/
track: networking/technician
lesson_number: 2
raw_source: 002-open-source-networking-lesson-2-subnet-mask-19595.gutenberg.html
---

<!-- wp:paragraph -->
<p><strong>Open-Source Networking Technician Certification (OSNTC)</strong> · Technician pathway · Lesson 002</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Every device on a network can have an IP address, but the IP address alone does not tell the device which addresses belong to its local network. A <strong>subnet mask</strong> helps make that distinction.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>This lesson builds directly on <a href="https://bitcoinversus.tech/2026/09/27/open-source-networking-lesson-1-ip-address/">OSNTC.001: IP Addresses</a></p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">A Simple Example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Imagine a computer with these settings:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>IP address:  192.168.1.25
Subnet mask: 255.255.255.0</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>For this beginner example, the mask tells us that <code>192.168.1</code> identifies the local network and the final number identifies a device on that network. So <code>25</code> identifies this particular host within that local network.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Why the Mask Matters</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Your computer needs to decide whether another IP address is on the same local network or whether traffic must be sent toward a router. The subnet mask is part of the information used to make that decision.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video: Subnet Masks Explained Visually</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>PowerCert Animated Videos gives a visual explanation of subnet masks and begins its subnet-mask section near 1:11. Use the video to reinforce the simple network-versus-host idea before moving into subnetting math.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=s_Ntt6eTn94\u0026amp;t=71s","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=s_Ntt6eTn94&amp;t=71s
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Same Network Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>Computer: 192.168.1.25
Printer:  192.168.1.50
Mask:     255.255.255.0</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>In this simple example, both devices are in the <code>192.168.1</code> network. They can communicate locally when the rest of the network is configured correctly.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Different Network Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>Computer: 192.168.1.25
Server:   192.168.2.20
Mask:     255.255.255.0</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Here, the network portions differ: one is <code>192.168.1</code> and the other is <code>192.168.2</code>. Communication between those networks normally goes through a router.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Data Center Example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A technician might see a miner, server, switch-management interface, or laptop configured with an IP address and subnet mask. Before troubleshooting a connection, checking both values helps confirm whether the devices are intended to be on the same local network.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Write down <code>192.168.10.15</code> with mask <code>255.255.255.0</code>.</li><li>Write down <code>192.168.10.40</code> with the same mask.</li><li>Identify the matching network portion.</li><li>Now change the second address to <code>192.168.11.40</code>.</li><li>Identify what changed.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A subnet mask works with an IP address to identify the network portion and host portion. For the common beginner example <code>255.255.255.0</code>, addresses sharing the first three octets are in the same local subnet.</p><!-- /wp:paragraph -->