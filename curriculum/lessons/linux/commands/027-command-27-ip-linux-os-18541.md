---
title: "Command #27 – ip (Linux OS)"
wordpress_post_id: 18541
source: BitcoinVersus.tech
published: 2026-09-25T16:32:20
modified: 2026-09-27T00:50:00
live_url: https://bitcoinversus.tech/2026/09/25/command-27-ip-linux-os/
track: linux/commands
lesson_number: 27
raw_source: 027-command-27-ip-linux-os-18541.gutenberg.html
---

<!-- wp:paragraph --><p>The Linux <code>ip</code> command is one of the most useful tools for checking network interfaces, addresses, routes, and neighbors from the terminal. For data-center technicians, server operators, and miners, it is a fast first stop when a machine has lost connectivity.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Start with the interface list</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>ip addr show</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>This displays network interfaces and their IPv4/IPv6 addresses. For a shorter view, use:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>ip -br addr</code></pre><!-- /wp:code -->
<!-- wp:heading --><h2 class="wp-block-heading">Check the physical link</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>ip link show</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Look for the interface state, MTU, and MAC address. An interface that is administratively down can be enabled with <code>sudo ip link set eth0 up</code>. Replace <code>eth0</code> with the actual interface name.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Check the route to the network</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>ip route
ip route get 1.1.1.1</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>ip route</code> shows the routing table and default gateway. <code>ip route get</code> asks the kernel which route it would use for a specific destination. That makes it useful for distinguishing an interface problem from a routing problem.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Check neighboring devices</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>ip neigh</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>This displays the neighbor table, including IP-to-MAC mappings learned on the local network. In a rack or mining deployment, it can help confirm whether a server can resolve a nearby gateway or peer at Layer 2.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">A practical troubleshooting sequence</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>ip -br addr
ip link show
ip route
ip neigh
ping -c 4 &lt;gateway-ip&gt;</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>This sequence answers five basic questions: Does the interface exist? Is it up? Does it have an address? Is there a route? Can the machine reach its gateway?</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video demonstration</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Kf4j_84cwNY","type":"video","providerNameSlug":"youtube"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=Kf4j_84cwNY</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Reference</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The <code>ip</code> utilities are part of iproute2, the standard Linux networking toolset. The Linux manual documentation for <code>ip route</code> explains that <code>ip route get</code> reports the route to a destination as the kernel sees it.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><a href="https://man7.org/linux/man-pages/man8/ip-route.8.html">Linux ip-route manual</a></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong>BitcoinVersus.tech Tech Docs</strong> focuses on practical commands and field-ready troubleshooting for computing, networking, electrical systems, data centers, and Bitcoin mining infrastructure.</p><!-- /wp:paragraph -->