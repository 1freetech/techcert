<!-- wp:paragraph -->
<p><strong>Spanning Tree Protocol (STP)</strong> is a Layer 2 protocol that prevents Ethernet switching loops while still allowing redundant physical links to exist. Redundancy is valuable because a backup cable can keep a network online after a failure, but two active Layer 2 paths can also create a loop that repeatedly circulates broadcast and unknown-unicast frames. STP solves that problem by building a <strong>loop-free logical topology</strong> on top of a physically redundant network.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=6MW5P6Ci7lw","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=6MW5P6Ci7lw
</div><figcaption class="wp-element-caption"><em>PowerCert Animated Videos — Spanning Tree Protocol explained with switching loops, broadcast storms, BPDUs, root bridge selection, and blocked paths.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Why a Layer 2 Loop Is Dangerous</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An Ethernet frame does not have the same hop-count protection that an IP packet gets from TTL. If redundant links create a loop between <a href="https://bitcoinversus.tech/2026/10/03/osntc-012-network-switch-basics/"><strong>network switches</strong></a>, a broadcast such as an <a href="https://bitcoinversus.tech/2026/10/02/osntc-009-arp-basics/"><strong>ARP</strong></a> request can be flooded from switch to switch repeatedly. The result can be a <strong>broadcast storm</strong>, duplicate frames, unstable <a href="https://bitcoinversus.tech/2026/10/02/osntc-007-mac-address-basics/"><strong>MAC address</strong></a> tables, high switch CPU load, and eventually a network that becomes nearly unusable.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=FwgVbhW2fr8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=FwgVbhW2fr8
</div><figcaption class="wp-element-caption"><em>INE — Understanding and Implementing Spanning Tree Protocol, including why Layer 2 loops and broadcast radiation are dangerous.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":21978,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc-019-network-switch-cables.jpg?w=1024" alt="Realistic network switch with connected Ethernet cables representing redundant Layer 2 links and Spanning Tree Protocol." class="wp-image-21978" /><figcaption class="wp-element-caption"><em>Redundant Ethernet links improve availability, but STP is needed to keep Layer 2 redundancy from becoming a forwarding loop. Photo by Manuel Luikenga on Unsplash.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>BPDUs Are the Messages Switches Use to Build the Tree</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>STP switches exchange <strong>Bridge Protocol Data Units (BPDUs)</strong>. Cisco’s current STP documentation explains that BPDUs carry information including the root bridge ID, path cost to the root, sending bridge ID, interface information, and protocol timers. Switches compare this information and agree on one logical tree. The protocol therefore depends on switches communicating their view of the topology instead of each switch making an isolated forwarding decision.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><a href="https://www.cisco.com/c/en/us/td/docs/switches/lan/cisco_ie3X00/software/17_4/ie3x00-stp/m-Spanning-tree-protocol.html"><strong>Cisco’s STP configuration guide</strong></a> describes this BPDU exchange directly, while <a href="https://www.juniper.net/documentation/us/en/software/junos/stp-l2/topics/topic-map/spanning-tree-overview.html"><strong>Juniper’s STP overview</strong></a> describes the same root-election and path-cost process from the RSTP perspective.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ILxKBrEXoUU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ILxKBrEXoUU
</div><figcaption class="wp-element-caption"><em>Network Direction — Cisco CCNA Spanning Tree BPDUs and the Root Bridge.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>The Root Bridge Is the Reference Point</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>STP elects one switch as the <strong>root bridge</strong>. The switch with the lowest Bridge ID wins. Bridge ID selection includes bridge priority and a MAC-derived identifier; if priorities are equal, the lower identifier breaks the tie. Every non-root switch then calculates its best path toward that root. In a planned enterprise network, engineers normally want a predictable distribution or core switch to become root instead of leaving the result to chance.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=q3IEALVcXBU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=q3IEALVcXBU
</div><figcaption class="wp-element-caption"><em>Network Warriors — STP root-bridge election, Bridge ID, root ports, designated ports, and alternate paths.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Root, Designated, and Alternate Ports Have Different Jobs</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>On each non-root switch, the <strong>root port</strong> is the port with the best path toward the root bridge. On each Ethernet segment, a <strong>designated port</strong> is selected to forward traffic toward that segment. A redundant port that would create a loop is placed into a non-forwarding role. In Rapid Spanning Tree terminology, an <strong>alternate port</strong> can remain ready as a backup path. This is the key idea: STP does not physically remove redundancy; it decides which redundant path must temporarily stop forwarding.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Ev9gy7B5hx0","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Ev9gy7B5hx0
</div><figcaption class="wp-element-caption"><em>Jeremy’s IT Lab — Analyze a real STP topology and identify root, designated, and non-designated ports.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Path Cost Decides Which Link Is Better</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>STP assigns a <strong>path cost</strong> to links and adds those costs along the path toward the root bridge. Lower total cost is preferred. Faster links generally receive more favorable default costs, although administrators can tune cost when a specific traffic path is desired. Path cost is why a network with several physical routes can still choose one deterministic forwarding path while leaving another route available for failure recovery.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=9qqA0Lc-bKI","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=9qqA0Lc-bKI
</div><figcaption class="wp-element-caption"><em>Network Direction — Spanning Tree root-port selection and path-cost calculation.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>RSTP Converges Faster Than Classic STP</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Rapid Spanning Tree Protocol (RSTP)</strong> improves recovery after topology changes. Classic IEEE 802.1D STP used slower timer-driven transitions, while RSTP introduced faster negotiation and clearer alternate-path behavior. Modern enterprise switches commonly use RSTP or vendor implementations based on it. The technician still needs the same foundation—root bridge, BPDUs, path cost, and port roles—but should expect modern networks to converge more quickly after a link failure.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=EpazNsLlPps","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=EpazNsLlPps
</div><figcaption class="wp-element-caption"><em>Jeremy’s IT Lab — Rapid Spanning Tree Protocol, Rapid PVST+, port roles, states, BPDUs, and CLI verification.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>STP Works Alongside VLANs and Physical Ethernet</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>STP lives at Layer 2, so it directly interacts with the <a href="https://bitcoinversus.tech/2026/10/02/osntc-008-ethernet-frame-basics/"><strong>Ethernet frames</strong></a>, switch ports, trunks, and <a href="https://bitcoinversus.tech/2026/09/30/osntc-004-vlan-basics/"><strong>VLANs</strong></a> already covered in this course. Depending on platform and mode, a switch may run one spanning tree for the network, separate instances per VLAN, or multiple VLANs mapped into shared spanning-tree instances. Before troubleshooting STP, always confirm that the physical link itself is healthy using the <a href="https://bitcoinversus.tech/2026/10/06/osntc-017-copper-ethernet-cabling-rj45-t568b-cat5e-cat6-cat6a-100m-poe-cable-testing/"><strong>copper-cabling</strong></a> and <a href="https://bitcoinversus.tech/2026/10/07/osntc-018-ethernet-link-negotiation-speed-duplex-auto-negotiation-link-leds-interface-errors/"><strong>link-negotiation</strong></a> checks from OSNTC.017 and OSNTC.018.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=5rpaeJNig2o","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=5rpaeJNig2o
</div><figcaption class="wp-element-caption"><em>Jeremy’s IT Lab — Configuring STP (PVST+) and verifying spanning-tree behavior on VLAN-aware Cisco switches.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:embed {"url":"https://www.reddit.com/r/ccna/comments/1vttgnq/stp_and_rstp/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/ccna/comments/1vttgnq/stp_and_rstp/
</div><figcaption class="wp-element-caption"><em>A current CCNA community discussion on why classic STP remains the foundation for understanding RSTP and modern spanning-tree behavior.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Basic Technician Verification</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When troubleshooting a switched network, verify the topology before changing configuration. On Cisco IOS-style switches, <code>show spanning-tree</code> is the fundamental command. Confirm which switch is root, the local root path cost, each port role and state, and whether topology changes are occurring unexpectedly. If a redundant port is blocking, that can be completely normal. The problem is not that STP blocked a path; the problem is when the tree is different from the intended design or changes repeatedly.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ss0ymNJPaT0","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ss0ymNJPaT0
</div><figcaption class="wp-element-caption"><em>Pedro Lino Cáceres — Physical Cisco-switch demonstration of STP, show spanning-tree, MAC flapping, and a real broadcast storm when STP is disabled.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Simple Lab</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Build three switches in a triangle in Cisco Packet Tracer or another lab environment.</li><li>Connect a PC to two different switches so traffic has redundant switch paths available.</li><li>Run <code>show spanning-tree</code> on each switch.</li><li>Identify the root bridge.</li><li>Identify each root port, designated port, and blocking or alternate port.</li><li>Disconnect one active inter-switch link and observe which backup path transitions to forwarding.</li><li>Reconnect the link and watch the topology reconverge.</li></ol>
<!-- /wp:list -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=5xMcvfn61-E","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=5xMcvfn61-E
</div><figcaption class="wp-element-caption"><em>Network Direction — How Spanning Tree works through topology calculation, blocking, topology changes, and port states.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Why does STP exist?</strong> To prevent Layer 2 switching loops while preserving redundant physical links.</li><li><strong>What is a BPDU?</strong> A Bridge Protocol Data Unit used by switches to exchange STP topology information.</li><li><strong>What is the root bridge?</strong> The switch elected as the logical reference point for the spanning-tree topology.</li><li><strong>What does a root port do?</strong> It is the non-root switch port with the best path toward the root bridge.</li><li><strong>What does a designated port do?</strong> It is the forwarding port selected for a Layer 2 segment.</li><li><strong>Why might a healthy port be blocking?</strong> STP may intentionally block a redundant path to prevent a loop.</li><li><strong>What is RSTP?</strong> Rapid Spanning Tree Protocol, a faster-converging evolution of classic STP.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Elementary Conclusion</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The easiest way to remember STP is: <strong>keep the backup cable, but block the loop.</strong> Switches exchange BPDUs, elect a root bridge, calculate the best paths, forward on the required ports, and hold redundant ports in reserve. If an active path fails, the topology can reconverge and use a backup. For a technician, the first questions are always: <strong>Who is root? Which ports are forwarding? Which port is blocked? Did the topology recently change?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=MjKcAV2atQU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=MjKcAV2atQU
</div><figcaption class="wp-element-caption"><em>Formip — A 2026 real-world outage walkthrough connecting broadcast storms, show spanning-tree, root bridge selection, BPDUs, and access-port protections.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Prior Networking Lessons</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/03/osntc-012-network-switch-basics/"><strong>OSNTC.012: Network Switch Basics</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/05/osntc-016-ipv6-addressing-neighbor-discovery-prefixes-slaac-ndp-routing-transition/"><strong>OSNTC.016: IPv6 Addressing and Neighbor Discovery</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/06/osntc-017-copper-ethernet-cabling-rj45-t568b-cat5e-cat6-cat6a-100m-poe-cable-testing/"><strong>OSNTC.017: Copper Ethernet Cabling</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/07/osntc-018-ethernet-link-negotiation-speed-duplex-auto-negotiation-link-leds-interface-errors/"><strong>OSNTC.018: Ethernet Link Negotiation</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Featured image: User_Pascal via Unsplash, cropped to exactly 1200×630. Body image: Manuel Luikenga via Unsplash. Technical references include current Cisco and Juniper STP documentation. Every YouTube embed is distinct and directly related to the lesson section it follows. The social-media embed is directly about STP/RSTP field troubleshooting and root/port-role verification.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Support and donation options are available through BitcoinVersus.Tech.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech is not a financial advisor. Content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->