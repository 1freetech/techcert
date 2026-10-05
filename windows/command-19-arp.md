---
title: "Windows Command #19 – arp (Windows OS)"
module: Windows OS
lesson: 19
published: "2026-10-01T07:26:17"
wordpress_post_id: 19742
source_url: "https://bitcoinversus.tech/2026/10/01/windows-command-19-arp/"
featured_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-19-cover.jpg"
featured_image_id: 19738
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=cn8Zxh9bPio"
video_creator: "PowerCert Animated Videos"
validation: "Command syntax checked against Microsoft documentation; no Windows runtime test claimed."
---

# Windows Command #19 – arp (Windows OS)

Canonical published Gutenberg content follows. Cover is featured media only.

<!-- wp:paragraph -->
<p>Your Windows computer knows a router’s IP address, but an Ethernet frame needs a local hardware address too. The ARP cache keeps that pairing handy. Reading it can help you investigate the local connection before you trace a path across the internet.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A simple definition</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>ARP</strong> stands for <strong>Address Resolution Protocol</strong>. For IPv4 communication on a local link, it discovers the MAC address associated with a next-hop IP address. A <strong>MAC address</strong> is a link-layer address; a <strong>cache</strong> is a stored set of mappings that can be reused.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Plain English: an IP address identifies where a packet is going; the local MAC address tells the network interface where to send the next frame. If the destination is outside your subnet, that next frame usually goes to your gateway, rather than directly to the distant server.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In this Open CERT lesson, you will display the cache, read a sample entry, and look for your own gateway. Use Command Prompt on Windows 10 or 11. The viewing commands normally work without an administrator window.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Display the cache</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Open Start, search for <strong>Command Prompt</strong>, and enter:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>arp -a</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The command prints tables grouped by network interface. In each table, <strong>Internet Address</strong> is the IPv4 address, <strong>Physical Address</strong> is the associated MAC address, and <strong>Type</strong> describes the entry.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Example only: <code>192.168.1.1</code> paired with <code>02-aa-bb-cc-dd-01</code>, marked <code>dynamic</code>. Those invented addresses match the cover illustration; they are not a discovery from your computer.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A dynamic entry was learned and can age out. A static entry is not aged in the same way. Some displayed static rows are multicast or broadcast mappings supplied by the system, so static does not automatically mean someone configured a device.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Watch ARP work</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PowerCert’s animation explains the request-and-reply exchange behind the table. Watch how a sender learns a local address, then return to inspect your own cache.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=cn8Zxh9bPio","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=cn8Zxh9bPio
</div><figcaption class="wp-element-caption"><em>PowerCert Animated Videos — ARP Explained: Address Resolution Protocol.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice: find your gateway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Start with <code>ipconfig</code>, covered in the earlier <a href="https://bitcoinversus.tech/2026/09/25/command-14-ipconfig-windows-os/">Windows ipconfig lesson</a>. Find the connected Ethernet or Wi-Fi adapter and record its IPv4 address and Default Gateway. Ignore disconnected adapters.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Suppose your actual gateway is <code>192.168.1.1</code>. Run the following, replacing that example with the gateway shown on your computer:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>ping -n 1 192.168.1.1</code><br><code>arp -a 192.168.1.1</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Sending local traffic can cause Windows to resolve the gateway’s MAC address. Compare the table with your notes. A ping reply confirms an ICMP response; a cache entry only shows an address mapping. Even if ping times out, a mapping may exist because ARP and ICMP are separate exchanges.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>With multiple adapters, narrow the display to one interface. If your computer’s own IPv4 address is <code>192.168.1.20</code>, the example is:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>arp -a -N 192.168.1.20</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Replace that value with your adapter’s own IPv4 address. The capital <code>-N</code> matters. It selects the interface, not the remote device you want to inspect.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Understand the limits</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The cache is not a complete inventory of every connected device. It reflects mappings available to that computer, and entries can disappear. An absent entry alone does not prove a device is offline.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For an ordinary routed internet connection, expect a local next-hop mapping, usually the gateway, rather than the remote website’s MAC address. IPv6 uses Neighbor Discovery instead of ARP. VPNs and virtual adapters can make the output look different.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A changed MAC address is a clue to investigate, not automatic proof of an attack. Equipment replacement, gateway redundancy, or virtualization can explain changes. Confirm against trusted network records.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>After checking the local hop, use <a href="https://bitcoinversus.tech/2026/09/30/windows-command-18-pathping/">Windows Command #18 – pathping</a> to investigate the wider route. These tools answer different troubleshooting questions.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Quick review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1.</strong> Which command displays the cache? <strong>2.</strong> Does a cached mapping prove a device answers ping? <strong>3.</strong> What address goes after <code>-N</code>?</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Answers:</strong> 1. <code>arp -a</code>. 2. No. 3. Your own interface’s IPv4 address.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Takeaway:</strong> Use <code>arp -a</code> to inspect local IPv4-to-MAC mappings. Read the correct interface, compare the gateway entry, and interpret the result alongside other evidence.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>References:</strong> <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/arp">Microsoft’s arp command reference</a> and <a href="https://www.rfc-editor.org/info/rfc826/">the ARP specification, RFC 826</a>. Command syntax was checked against Microsoft documentation; the practice sequence is provided for you to run on Windows.</p>
<!-- /wp:paragraph -->
