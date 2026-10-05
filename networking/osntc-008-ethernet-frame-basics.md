---
title: "OSNTC.008: Ethernet Frame Basics"
status: published
wordpress_post_id: 20026
published: "2026-10-02T10:52:49"
source_url: "https://bitcoinversus.tech/2026/10/02/osntc-008-ethernet-frame-basics/"
series: "Open-Source Networking Technician Certification"
certification: OSNTC
pathway: technician
tier: 1
lesson_number: "008"
featured_media_id: 20025
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc-008-cover.jpg"
featured_image_dimensions: "1200x630"
youtube:
  - "https://www.youtube.com/watch?v=I7u3L8UM0kc"
  - "https://www.youtube.com/watch?v=qXtS1o1HGso"
  - "https://www.youtube.com/watch?v=pNAg2i5aU78"
validation: "Live cover and three embedded YouTube players verified; frame sizes and field arithmetic checked."
---

# OSNTC.008: Ethernet Frame Basics

Canonical published Gutenberg content follows. Cover is featured media only.

<!-- wp:paragraph -->
<p>A device does not place a bare IP packet directly onto an Ethernet link. It wraps that packet in an <strong>Ethernet frame</strong> so switches and network interfaces know where the local transmission should go and whether it arrived without a detected bit error.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Definition:</strong> an Ethernet frame is the link-layer unit of data carried across an Ethernet network. <strong>Plain English:</strong> it is a local delivery envelope. The destination and source MAC addresses are written on the outside, while the higher-layer data rides inside as the payload.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This technician lesson builds on <a href="https://bitcoinversus.tech/2026/10/01/osntc-005-dhcp-basics/">OSNTC.005: DHCP Basics</a>, <a href="https://bitcoinversus.tech/2026/10/01/osntc-006-dns-basics/">OSNTC.006: DNS Basics</a>, and <a href="https://bitcoinversus.tech/2026/10/02/osntc-007-mac-address-basics/">OSNTC.007: MAC Address Basics</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The five fields technicians should recognize</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A common untagged Ethernet II frame, counted from the destination address through the FCS, contains these fields:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Destination MAC — 6 bytes:</strong> the intended local recipient, a multicast group, or the broadcast address.</li><li><strong>Source MAC — 6 bytes:</strong> the interface that transmitted the frame onto this link.</li><li><strong>EtherType — 2 bytes:</strong> identifies the payload protocol. Common examples include <code>0x0800</code> for IPv4, <code>0x86DD</code> for IPv6, and <code>0x0806</code> for ARP.</li><li><strong>Payload and padding — 46 to 1500 bytes:</strong> carries the higher-layer data; padding fills a short payload to the minimum size.</li><li><strong>Frame Check Sequence (FCS) — 4 bytes:</strong> carries a CRC value used to detect corruption.</li></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Destination MAC | Source MAC | EtherType | Payload + Pad | FCS
     6 bytes     |   6 bytes  |  2 bytes  | 46–1500 B    | 4 B</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This simplified field strip is an Ethernet II frame. The preamble and Start Frame Delimiter help the receiver synchronize and identify the beginning on the medium, but they are normally excluded from the familiar 64-byte minimum and 1518-byte maximum frame sizes.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 1: inspect an Ethernet frame field by field</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Core Networking Classes compares Ethernet II and IEEE 802.3 framing. For this lesson, focus first on the destination, source, type or length, payload, and FCS fields.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=I7u3L8UM0kc","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=I7u3L8UM0kc
</div><figcaption class="wp-element-caption"><em>Core Networking Classes — Ethernet Frame Deep Dive.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why the frame has two addresses</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A switch learns from the <strong>source MAC</strong> address. It records the source address and the port where that frame arrived. It then examines the <strong>destination MAC</strong> to decide where to forward the frame.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If the destination is already in the switch MAC table, the switch can forward toward the learned port. If the destination is unknown, the switch floods the frame out other eligible ports in the same VLAN. A broadcast is also flooded within that broadcast domain.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Simple example:</strong> a scoreboard computer sends an Ethernet frame to a local display controller. The source field names the computer interface; the destination field names the display interface. The score update itself is inside the payload.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Frame versus packet</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>frame</strong> is used for delivery across one Ethernet link or Layer 2 domain. A <strong>packet</strong> is a Layer 3 unit, such as an IPv4 packet, carried inside the frame payload. When a router forwards the packet onto a different Ethernet link, it removes the incoming frame and builds a new frame with MAC addresses appropriate for the next link.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That is why a remote server’s MAC address is normally absent from a workstation’s local frame. For an off-subnet destination, the workstation sends the local Ethernet frame to its default gateway’s MAC address while keeping the remote IP address in the encapsulated IP packet.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 2: learn the seven on-wire parts</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sunny Classroom includes the preamble and Start Frame Delimiter in its on-wire walkthrough. Compare that full transmission view with the five-field frame strip above.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=qXtS1o1HGso","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=qXtS1o1HGso
</div><figcaption class="wp-element-caption"><em>Sunny Classroom — 7 Parts of an Ethernet Frame.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Minimum size, padding, and FCS</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An untagged Ethernet frame is normally at least <strong>64 bytes</strong> from destination MAC through FCS. If the higher-layer payload is shorter than 46 bytes, padding fills the difference. The usual maximum is <strong>1518 bytes</strong> for the same untagged count: 14 bytes of header, 1500 bytes of payload, and 4 bytes of FCS.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The sender calculates a CRC and places it in the FCS. The receiver performs its own calculation. A mismatch indicates a damaged frame, which is normally discarded. FCS detects errors; it does not repair the frame or request retransmission by itself. Higher-layer protocols may provide recovery.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Troubleshooting note:</strong> CRC or FCS error counters can point toward damaged cabling, bad optics or transceivers, electrical interference, duplex-era issues, or faulty interfaces. The counter identifies a symptom. It does not prove one specific cause.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 3: follow data across Ethernet</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Wendell Odom connects MAC addresses, switch decisions, and Ethernet delivery. Follow the frame from the sender to the switch and then toward the local destination.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=pNAg2i5aU78","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=pNAg2i5aU78
</div><figcaption class="wp-element-caption"><em>Wendell Odom’s Network Upskill — How Data Actually Travels Across Ethernet.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Where a VLAN tag fits</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>On an IEEE 802.1Q trunk, a four-byte VLAN tag is inserted after the source MAC address and before the original EtherType field. The tag lets devices associate the frame with a VLAN across the trunk. This expands the commonly counted maximum frame from 1518 to 1522 bytes, and the transmitting device calculates the FCS for the tagged frame. <a href="https://www.cisco.com/c/en/us/support/docs/lan-switching/8021q/17056-741-4.html">Cisco’s 802.1Q guide</a> documents the tag placement and size.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>An access port normally sends and receives ordinary untagged traffic for its assigned VLAN from an endpoint. A trunk can carry multiple VLANs between network devices. Always verify the actual port configuration rather than deciding from cable type alone.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A practical technician workflow</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Identify the interface:</strong> record the expected device MAC address.</li><li><strong>Check the switch table:</strong> verify which port learned that source MAC and in which VLAN.</li><li><strong>Confirm the destination:</strong> decide whether the frame should target a local host, broadcast, multicast group, or default gateway.</li><li><strong>Review counters:</strong> look for CRC/FCS errors, runts, giants, drops, and link changes using approved tools.</li><li><strong>Capture when authorized:</strong> in Wireshark, expand the Ethernet II header to see source, destination, and EtherType. Many host captures do not include the wire FCS because hardware may remove or validate it before the capture reaches software.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice and answers</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1.</strong> Which MAC address does a switch learn from? <strong>Answer:</strong> the source MAC address.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>2.</strong> What does EtherType <code>0x0800</code> identify? <strong>Answer:</strong> an IPv4 payload.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>3.</strong> Why is padding added? <strong>Answer:</strong> to bring a short payload up to the Ethernet minimum.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>4.</strong> Does FCS correct a damaged frame? <strong>Answer:</strong> no; it supports error detection.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>5.</strong> What changes when a router forwards an IP packet onto another Ethernet link? <strong>Answer:</strong> the router builds a new Ethernet frame with next-link MAC addresses.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>6.</strong> Where is an 802.1Q tag inserted? <strong>Answer:</strong> after the source MAC and before the original EtherType field.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An Ethernet frame carries a local source, a local destination, a payload type, the payload itself, and an error-detection value. Read those fields in order, then connect them to the switch port, VLAN, and next-hop decision.</p>
<!-- /wp:paragraph -->
