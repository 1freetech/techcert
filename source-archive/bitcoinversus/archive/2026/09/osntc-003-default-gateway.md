---
title: "OSNTC.003: Default Gateway"
status: published
wordpress_post_id: 19630
published: "2026-09-30T19:28:43"
published_gmt: "2026-09-30T23:28:43"
live_url: "https://bitcoinversus.tech/2026/09/30/networking-lesson-003-default-gateway/"
series: "Open-Source Networking Technician Certification"
certification: OSNTC
pathway: technician
lesson_number: "003"
featured_media_id: 19633
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/09/osntc-003-cover.jpg"
featured_image_dimensions: "1200x630"
---

# OSNTC.003: Default Gateway

<p><strong>Open-Source Networking Technician Certification (OSNTC)</strong> · Technician pathway · Lesson 003</p>



<p>A <strong>default gateway</strong> is the next-hop router address a device uses when no more specific route matches its destination. In a basic network, it provides the path from the local subnet to other networks, including the internet.</p>



<p>Start with <a href="https://bitcoinversus.tech/2026/09/27/open-source-networking-lesson-1-ip-address/">OSNTC.001: IP Addresses</a> and <a href="https://bitcoinversus.tech/2026/09/30/open-source-networking-lesson-2-subnet-mask/">OSNTC.002: Subnet Masks</a>. By the end of lesson 003, you should be able to identify a gateway, explain when it is used, and check the setting without changing a working network.</p>



<h2 class="wp-block-heading">Three Settings, Three Jobs</h2>



<p><strong>IP address:</strong> identifies the device’s network interface. <strong>Subnet mask:</strong> identifies the local subnet. <strong>Default gateway:</strong> identifies the router interface used for destinations without a more specific route.</p>



<p>Imagine a laptop configured with IP address <strong>192.168.10.25</strong>, mask <strong>255.255.255.0</strong> (/24), and gateway <strong>192.168.10.1</strong>. The gateway normally needs to be reachable on that same local subnet. The final number is not always 1; use the address assigned by the network administrator.</p>



<h2 class="wp-block-heading">Local Traffic or Routed Traffic?</h2>



<p>A printer at <strong>192.168.10.50</strong> is in the laptop’s local /24 subnet. In a simple Ethernet network, the laptop can send traffic to it directly through the local network rather than through its default gateway.</p>



<p>A server at <strong>192.168.20.50</strong> is outside that subnet. If the laptop has no specific route to that network, it sends the packet to <strong>192.168.10.1</strong>. The router then chooses its own next hop. A valid gateway alone does not guarantee delivery; routes, firewall rules, and the return path must also work.</p>



<p>The following short animation reviews the decision before we move into a practical check.</p>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=pCcJFdYNamc
</div><figcaption class="wp-element-caption"><em>PowerCert Animated Videos explains how a default gateway connects local devices to other networks.</em></figcaption></figure>



<h2 class="wp-block-heading">Check Your Gateway</h2>



<p>On Windows, open Command Prompt and run <strong>ipconfig</strong>. Read the IPv4 address, subnet mask, and default gateway for the adapter you actually use. On Linux, run <strong>ip route</strong> and look for a line such as <strong>default via 192.168.10.1 dev eth0</strong>. Your interface name and address may differ. VPNs and multiple adapters can create several routes.</p>



<p>For an authorized connectivity check, try <strong>ping 192.168.10.1</strong> using your actual gateway address. A reply confirms ICMP reachability at that moment. No reply does not prove the router is down because ICMP may be blocked. Record the settings before troubleshooting; do not replace them with example addresses.</p>



<h2 class="wp-block-heading">Data Center Example</h2>



<p>A technician can reach a miner’s local management page but the miner cannot reach a remote pool. An absent or incorrect gateway is one possibility. Check the miner’s address, mask, and gateway against the approved configuration, then investigate upstream routing, DNS, and firewall policy. Local connectivity and remote connectivity are different tests.</p>



<h2 class="wp-block-heading">Practice and Review</h2>



<p>With laptop <strong>192.168.10.25/24</strong> and gateway <strong>192.168.10.1</strong>, decide which destination is local: <strong>192.168.10.80</strong> or <strong>192.168.30.80</strong>. Which would use the default gateway if no specific route exists?</p>



<p><strong>Answer:</strong> 192.168.10.80 is local. Traffic to 192.168.30.80 uses the default gateway in the stated example. A gateway is a route out of the local subnet; it is not the device’s own address or automatically its DNS server.</p>
