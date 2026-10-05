---
title: "OSNTC.009: ARP Basics"
status: published
wordpress_post_id: 20102
published: "2026-10-02T17:17:38"
live_url: "https://bitcoinversus.tech/2026/10/02/osntc-009-arp-basics/"
series: "Open-Source Networking Technician Certification"
pathway: networking-technician
lesson_number: "009"
featured_media_id: 20101
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc-009-arp-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=xTOyZ6TWQdM"
youtube_2: "https://www.youtube.com/watch?v=EC1slXCT3bg"
youtube_3: "https://www.youtube.com/watch?v=4oBbrXEqkuM"
---

# OSNTC.009: ARP Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>ARP connects IPv4 addressing to Ethernet delivery by discovering which MAC address belongs to a local IPv4 address.</strong></p>

<p class="wp-block-paragraph">This lesson follows <a href="https://bitcoinversus.tech/2026/10/02/osntc-008-ethernet-frame-basics/">OSNTC.008: Ethernet Frame Basics</a>. That lesson showed that an Ethernet frame needs a destination MAC address. ARP explains how a host learns that destination MAC when it knows only the local IPv4 address.</p>

<h2 class="wp-block-heading">What ARP does</h2>
<p class="wp-block-paragraph"><strong>ARP</strong> stands for <strong>Address Resolution Protocol</strong>. On an IPv4 Ethernet LAN, a host uses ARP to map an IPv4 address to a MAC address.</p>

<pre class="wp-block-code"><code>IPv4 address  →  ARP  →  MAC address
192.168.10.25 →       → 00:11:22:33:44:55</code></pre>

<p class="wp-block-paragraph">ARP is local-link behavior. It does not resolve the MAC address of a server several routers away. If the destination is off-subnet, the host usually resolves the MAC address of its <strong>default gateway</strong> instead.</p>

<h2 class="wp-block-heading">ARP request: Who has this IPv4 address?</h2>
<p class="wp-block-paragraph">Suppose a workstation at <code>192.168.10.10</code> needs to send an IPv4 packet to <code>192.168.10.25</code> on the same subnet, but it does not know that device&#8217;s MAC address.</p>

<ol class="wp-block-list"><li>The sender checks its ARP cache.</li><li>If no usable mapping exists, it sends an ARP request.</li><li>The request is carried in an Ethernet broadcast frame with destination <code>ff:ff:ff:ff:ff:ff</code>.</li><li>Devices in that Layer 2 broadcast domain receive the request.</li><li>The device using the target IPv4 address can answer with an ARP reply.</li></ol>

<h2 class="wp-block-heading">Video 1: ARP request and reply</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/xTOyZ6TWQdM?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>NetworkLessons explains how an ARP request discovers a local host&#8217;s MAC address and how the ARP reply completes the mapping.</em></figcaption></figure>

<h2 class="wp-block-heading">ARP reply</h2>
<p class="wp-block-paragraph">The ARP reply tells the requester which MAC address is associated with the requested IPv4 address. The requester can then build the Ethernet frame needed for local delivery.</p>

<pre class="wp-block-code"><code>Question:
Who has 192.168.10.25?

Reply:
192.168.10.25 is at 00:11:22:33:44:55</code></pre>

<p class="wp-block-paragraph">A normal ARP request is broadcast because the sender does not yet know the target MAC. The reply is commonly sent directly to the requester.</p>

<h2 class="wp-block-heading">The ARP cache</h2>
<p class="wp-block-paragraph">Operating systems temporarily store learned IPv4-to-MAC mappings in an <strong>ARP cache</strong> or neighbor table. Reusing a valid cached entry avoids broadcasting a new ARP request for every packet.</p>

<p class="wp-block-paragraph">On Windows, a technician can inspect the table with:</p>
<pre class="wp-block-code"><code>arp -a</code></pre>

<p class="wp-block-paragraph">On many Linux systems, the modern command is:</p>
<pre class="wp-block-code"><code>ip neigh</code></pre>

<p class="wp-block-paragraph">Entries can be dynamic, static, incomplete, stale, reachable, or represented with other operating-system-specific states. Read the local platform&#8217;s output instead of assuming every table uses the same labels.</p>

<h2 class="wp-block-heading">Video 2: ARP table and packet flow</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/EC1slXCT3bg?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>TechTerms walks through ARP requests, replies, the ARP cache, and how the learned mapping is used to build an Ethernet frame.</em></figcaption></figure>

<h2 class="wp-block-heading">Same subnet vs. remote subnet</h2>
<p class="wp-block-paragraph">This distinction is essential.</p>

<h3 class="wp-block-heading">Same subnet</h3>
<p class="wp-block-paragraph">If the destination IPv4 address is local, the sender resolves the <strong>destination host&#8217;s MAC address</strong>.</p>

<h3 class="wp-block-heading">Remote subnet</h3>
<p class="wp-block-paragraph">If the destination is outside the local subnet, the sender keeps the remote destination IPv4 address inside the IP packet but normally resolves the <strong>default gateway&#8217;s MAC address</strong> for the local Ethernet frame.</p>

<pre class="wp-block-code"><code>Remote web server IP: 203.0.113.50
Local default gateway: 192.168.10.1

IP packet destination: 203.0.113.50
Ethernet frame destination: gateway MAC</code></pre>

<p class="wp-block-paragraph">The router removes that incoming Ethernet frame and creates a new Layer 2 frame for the next link.</p>

<h2 class="wp-block-heading">Video 3: ARP for CCNA troubleshooting</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/4oBbrXEqkuM?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Network Engineer Pro traces the ARP process with network diagrams and connects it to Cisco/CCNA troubleshooting.</em></figcaption></figure>

<h2 class="wp-block-heading">What an ARP packet contains</h2>
<p class="wp-block-paragraph">Technicians do not need to memorize every bit immediately, but they should recognize these key fields:</p>
<ul class="wp-block-list"><li><strong>Operation:</strong> request or reply.</li><li><strong>Sender MAC address.</strong></li><li><strong>Sender IPv4 address.</strong></li><li><strong>Target MAC address.</strong></li><li><strong>Target IPv4 address.</strong></li></ul>

<p class="wp-block-paragraph">ARP itself is carried directly inside an Ethernet frame using EtherType <code>0x0806</code>.</p>

<h2 class="wp-block-heading">ARP and switches</h2>
<p class="wp-block-paragraph">Do not confuse the ARP table with a switch MAC-address table.</p>

<ul class="wp-block-list"><li><strong>ARP table:</strong> maps IPv4 addresses to MAC addresses.</li><li><strong>Switch MAC table:</strong> maps MAC addresses to switch ports and VLAN context.</li></ul>

<p class="wp-block-paragraph">A workstation can know the correct MAC from ARP while a switch independently learns which physical port leads toward that MAC.</p>

<h2 class="wp-block-heading">Practical troubleshooting sequence</h2>
<ol class="wp-block-list"><li>Confirm the host&#8217;s IPv4 address and subnet mask.</li><li>Decide whether the destination should be local or routed through the gateway.</li><li>Inspect the ARP/neighbor table.</li><li>Ping or generate approved traffic if you need the host to attempt resolution.</li><li>Recheck the ARP table for a learned or incomplete entry.</li><li>On the switch, verify the relevant VLAN and MAC-learning state.</li><li>If authorized, capture traffic and look for the ARP request and expected reply.</li></ol>

<p class="wp-block-paragraph">An incomplete ARP entry tells you resolution did not finish. It does not by itself prove whether the cause is a disconnected endpoint, wrong VLAN, wrong subnet, blocked path, duplicate addressing, interface problem, or another fault.</p>

<h2 class="wp-block-heading">Duplicate IPv4 addresses</h2>
<p class="wp-block-paragraph">If two devices claim the same IPv4 address, ARP behavior can become inconsistent. A host may learn one MAC and later another. Symptoms can include intermittent reachability, sessions moving between devices, or operating-system duplicate-address warnings.</p>

<p class="wp-block-paragraph">When investigating a suspected duplicate, record the changing MAC addresses and trace each MAC through the switch infrastructure rather than immediately deleting ARP entries and losing useful evidence.</p>

<h2 class="wp-block-heading">ARP security note</h2>
<p class="wp-block-paragraph">Classic ARP does not provide built-in authentication. Hosts can receive incorrect IPv4-to-MAC claims, which is why enterprise networks may use controls such as segmentation, DHCP snooping, Dynamic ARP Inspection, endpoint protections, or static mappings in specific designs.</p>

<p class="wp-block-paragraph">This lesson focuses on normal ARP operation and troubleshooting. Defensive ARP-security controls belong in later networking/security lessons.</p>

<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list"><li>Explain in one sentence what ARP resolves.</li><li>State why an ARP request is usually broadcast.</li><li>Identify which MAC a host needs when sending to a remote subnet.</li><li>Run the approved ARP/neighbor-table command on a lab machine and identify one dynamic entry.</li><li>Explain the difference between an ARP table and a switch MAC table.</li></ol>

<h2 class="wp-block-heading">Knowledge check</h2>
<p class="wp-block-paragraph"><strong>Question:</strong> What does ARP map?<br><strong>Answer:</strong> an IPv4 address to a MAC address on the local link.</p>
<p class="wp-block-paragraph"><strong>Question:</strong> What Ethernet destination is used for a normal ARP request?<br><strong>Answer:</strong> the broadcast address <code>ff:ff:ff:ff:ff:ff</code>.</p>
<p class="wp-block-paragraph"><strong>Question:</strong> If the destination is remote, whose MAC does the sender normally resolve?<br><strong>Answer:</strong> the local default gateway&#8217;s MAC address.</p>

<h2 class="wp-block-heading">Previous OSNTC lessons</h2>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/osntc-008-ethernet-frame-basics/">OSNTC.008: Ethernet Frame Basics</a></p>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/osntc-007-mac-address-basics/">OSNTC.007: MAC Address Basics</a></p>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/01/osntc-006-dns-basics/">OSNTC.006: DNS Basics</a></p>

<h2 class="wp-block-heading">Reference</h2>
<p class="wp-block-paragraph">The original protocol is defined in <a href="https://www.rfc-editor.org/rfc/rfc826">RFC 826: An Ethernet Address Resolution Protocol</a>.</p>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph">ARP is the bridge between local IPv4 addressing and Ethernet MAC delivery. First decide whether the destination is local or remote, then identify which IPv4-to-MAC mapping the host actually needs.</p>
