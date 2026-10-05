---
title: "Windows Command #21 – getmac (Windows OS)"
wordpress_post_id: 19861
source: BitcoinVersus.tech
published: 2026-10-01T12:58:54
modified: 2026-10-01T12:59:21
live_url: https://bitcoinversus.tech/2026/10/01/windows-command-21-getmac/
track: windows/commands
lesson_number: 21
raw_source: 021-windows-command-21-getmac-19861.gutenberg.html
---

<!-- wp:paragraph --><p>The Windows <code>getmac</code> command displays the MAC addresses associated with network adapters on a computer. A MAC address is a hardware-level identifier used by network interfaces, and technicians often need it when troubleshooting switches, DHCP reservations, device inventory, or adapter identity.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Basic Syntax</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>getmac</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Running the command without options lists the physical addresses detected for local network adapters.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">What the Output Means</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The most important field for a beginner is <strong>Physical Address</strong>. That value is the MAC address for a network interface. A computer can show more than one MAC address because it may have Ethernet, Wi-Fi, virtual, Bluetooth, VPN, or other adapters.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Verbose Output</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>getmac /v</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>/v</code> option adds more detail so you can better match a MAC address to its adapter.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video: Windows getmac Command</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>This short Windows networking walkthrough demonstrates the <code>getmac</code> command and how it can be used to identify adapter MAC addresses.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=bW760ckr3mo","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=bW760ckr3mo
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Table Output</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>getmac /fo table /v</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>/fo table</code> asks Windows to display the results in table format, while <code>/v</code> keeps the extra adapter details visible.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Simple Troubleshooting Example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Suppose a switch or DHCP server shows a device by MAC address and you need to confirm which Windows computer it belongs to. Running <code>getmac /v</code> gives you the local adapter addresses so you can compare them with the address seen on the network.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Data Center Example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>During rack-and-stack work, a technician may need to confirm which Ethernet interface is connected to a particular switch port. Matching the server's MAC address with the switch's learned address can help verify the connection.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">MAC Address vs. IP Address</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>An IP address and a MAC address are not the same thing. An IP address identifies a device logically on an IP network and can change. A MAC address identifies a network interface at the data-link layer, although software, virtualization, and privacy features can sometimes change or randomize the address that appears.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Open Command Prompt.</li><li>Run <code>getmac</code>.</li><li>Count how many physical addresses appear.</li><li>Run <code>getmac /v</code>.</li><li>Identify which address belongs to your active Ethernet or Wi-Fi adapter.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>getmac</code> is a fast Windows command for identifying the MAC addresses associated with network adapters. For technicians, it is especially useful when matching a computer to switch, DHCP, inventory, or troubleshooting information.</p><!-- /wp:paragraph -->