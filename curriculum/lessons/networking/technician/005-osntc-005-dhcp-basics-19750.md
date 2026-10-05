---
title: "OSNTC.005: DHCP Basics"
wordpress_post_id: 19750
source: BitcoinVersus.tech
published: 2026-10-01T07:33:20
modified: 2026-10-01T07:33:52
live_url: https://bitcoinversus.tech/2026/10/01/osntc-005-dhcp-basics/
track: networking/technician
lesson_number: 5
raw_source: 005-osntc-005-dhcp-basics-19750.gutenberg.html
---

<!-- wp:paragraph --><p><strong>DHCP</strong> stands for Dynamic Host Configuration Protocol. Its basic job is simple: DHCP automatically gives a device the network settings it needs instead of making a technician type every setting by hand.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>This lesson builds on <a href="https://bitcoinversus.tech/2026/09/27/open-source-networking-lesson-1-ip-address/">OSNTC.001: IP Addresses</a>, <a href="https://bitcoinversus.tech/2026/09/30/open-source-networking-lesson-2-subnet-mask/">OSNTC.002: Subnet Masks</a>, <a href="https://bitcoinversus.tech/2026/09/30/networking-lesson-003-default-gateway/">OSNTC.003: Default Gateway</a>, and <a href="https://bitcoinversus.tech/2026/09/30/osntc-004-vlan-basics/">OSNTC.004: VLAN Basics</a>.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">A Simple Example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>You connect a laptop to a network. A few seconds later, it has settings such as:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>IP address:      192.168.1.25
Subnet mask:     255.255.255.0
Default gateway: 192.168.1.1
DNS server:      192.168.1.1</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>If you did not enter those values yourself, DHCP may have supplied them automatically.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">DHCP Server and Client</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The device asking for settings is the <strong>DHCP client</strong>. The device or service supplying those settings is the <strong>DHCP server</strong>. On a small network, the router often provides DHCP. Larger networks may use a dedicated server.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video: DHCP Explained</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>PowerCert Animated Videos demonstrates DHCP, including automatic addressing and the difference between dynamic and static IP addresses.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=e6-TaH5bkjo","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=e6-TaH5bkjo
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Dynamic vs. Static</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A <strong>dynamic</strong> address is assigned automatically and may change later. A <strong>static</strong> address is intentionally kept at a specific value. For beginner troubleshooting, the important question is whether the device is supposed to receive its settings automatically or use manually configured settings.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">What Is a DHCP Lease?</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>DHCP usually lends an address to a device for a period of time. That assignment is called a <strong>lease</strong>. The client can renew the lease while it remains on the network.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Technician Check</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Suppose a laptop should use DHCP but cannot reach the network. Start by checking whether it actually received an IP address, subnet mask, gateway, and DNS server. Missing or unexpected values can point you toward the next troubleshooting step.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Data Center Example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A technician may connect a service laptop to a management network and receive an address automatically. Some infrastructure devices may instead use fixed addresses or DHCP reservations so technicians can reliably find them again.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Connect a computer to a network that uses DHCP.</li><li>Find its IP address.</li><li>Find its subnet mask.</li><li>Find its default gateway.</li><li>Identify whether those settings were entered manually or assigned automatically.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>DHCP automatically supplies network settings to clients. For a technician, it reduces manual configuration and provides an important place to look when a device does not receive the expected network settings.</p><!-- /wp:paragraph -->