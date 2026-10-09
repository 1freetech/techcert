---
title: "OSNTC.020: Link Aggregation and LACP — EtherChannel, Port Channels, Member Links, Load Balancing, and Failure Recovery"
status: published
wordpress_post_id: 22264
wordpress_status: publish
published: "2026-10-08T21:39:19"
live_url: "https://bitcoinversus.tech/2026/10/08/osntc-020-link-aggregation-lacp-etherchannel-port-channels-member-links-load-balancing-failure-recovery/"
series: "Open Source Networking Technician Certification"
certification: OSNTC
pathway: networking
lesson_number: "020"
lesson_topic: "Link Aggregation and LACP"
featured_media_id: 22262
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc020-lacp-cover-1200x630-1.jpg"
body_media_id: 22263
seo_title: "OSNTC.020: LACP, EtherChannel & Link Aggregation"
seo_description: "Learn LACP and EtherChannel: port-channels, member links, active/passive modes, load balancing, failure recovery, Cisco configuration, verification, and troubleshooting."
---

<!-- wp:paragraph -->
<p><strong>Elementary overview:</strong> link aggregation lets several physical Ethernet connections behave like <strong>one logical link</strong>. Instead of forcing <a href="https://bitcoinversus.tech/2026/10/08/osntc-019-spanning-tree-protocol-stp-loops-root-bridge-bpdus-port-roles-rstp/">Spanning Tree Protocol (STP)</a> to block most parallel Layer 2 links, a properly formed bundle can keep multiple member links active while the network treats them as one logical interface. <strong>Link Aggregation Control Protocol (LACP)</strong> is the standards-based control protocol commonly used to negotiate and maintain that bundle.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=xuo69Joy_Nc","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=xuo69Joy_Nc</div><figcaption class="wp-element-caption"><em>Jeremy’s IT Lab explains why EtherChannel is used, how load balancing works, and how LACP, PAgP, and static bundles differ.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22263,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc020-lacp-body-1200x700-1.jpg?w=1024" alt="Technical diagram showing an LACP active switch and passive switch joined by four member links in one logical port-channel with flow hashing examples" class="wp-image-22263" /><figcaption class="wp-element-caption"><em>LACP can negotiate several compatible Ethernet member links into one logical port-channel while traffic flows are distributed across active members.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Why Link Aggregation Exists</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Imagine two switches connected by four 1 Gb/s Ethernet cables. If those cables are simply four independent Layer 2 paths, STP may place redundant paths into a non-forwarding state to prevent a switching loop. Link aggregation changes the topology presented to the rest of the network: the parallel member links are grouped into a <strong>Link Aggregation Group (LAG)</strong>, and the MAC client can treat the group as a single logical link. IEEE 802.1AX defines this basic model for full-duplex point-to-point links.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The result is useful for two reasons: <strong>aggregate capacity</strong> can increase across many simultaneous traffic flows, and the logical link can remain available when an individual member link fails. That is different from saying one single flow automatically becomes four times faster. Actual traffic distribution depends on the platform’s load-balancing method and the characteristics of the flows.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>LAG, EtherChannel, and Port-Channel Are Related Terms</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>LAG</strong> is the generic idea: multiple physical links acting as one logical link. <strong>EtherChannel</strong> is Cisco terminology for its link-bundling feature. A <strong>port-channel</strong> is the logical interface representing the bundle on Cisco-style platforms. Other vendors use terms such as LAG, bond, aggregate Ethernet, trunk group, or team, but the central concept is similar.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The member interfaces are still real physical Ethernet ports. Their electrical or optical link state, negotiated speed, duplex behavior, cabling, and interface errors still matter. If a member will not join a bundle, first confirm the fundamentals from <a href="https://bitcoinversus.tech/2026/10/07/osntc-018-ethernet-link-negotiation-speed-duplex-auto-negotiation-link-leds-interface-errors/">OSNTC.018: Ethernet Link Negotiation</a> and, for copper, <a href="https://bitcoinversus.tech/2026/10/06/osntc-017-copper-ethernet-cabling-rj45-t568b-cat5e-cat6-cat6a-100m-poe-cable-testing/">OSNTC.017: Copper Ethernet Cabling</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>LACP Negotiates the Bundle</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>LACP exchanges control information so devices can decide which compatible links belong in the same aggregation. Cisco’s current EtherChannel documentation lists factors such as speed, duplex, native VLAN, and trunking state among the properties that can affect whether ports are dynamically grouped. The exact compatibility checks and limits are platform-specific, so production work should always use the documentation for the actual switch model and software release.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Active and Passive LACP Modes</strong></h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Side A</th><th>Side B</th><th>Result</th></tr></thead><tbody><tr><td>active</td><td>active</td><td>Can form because both sides initiate LACP</td></tr><tr><td>active</td><td>passive</td><td>Can form because the active side initiates</td></tr><tr><td>passive</td><td>active</td><td>Can form because the active side initiates</td></tr><tr><td>passive</td><td>passive</td><td>Does not form through LACP because neither side initiates</td></tr></tbody></table><figcaption class="wp-element-caption"><em>Cisco documents active as an initiating state and passive as a responding state.</em></figcaption></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p><strong>Active</strong> mode sends LACP packets to begin negotiation. <strong>Passive</strong> mode responds when it receives LACP traffic but does not initiate the negotiation itself. For that reason, active/active and active/passive combinations can form, while passive/passive does not.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=rSyP3u9v4-M","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=rSyP3u9v4-M</div><figcaption class="wp-element-caption"><em>Jeremy’s IT Lab covers EtherChannel load balancing, configuration, matching member settings, Layer 3 EtherChannel, and verification commands.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>All Member Links Must Agree on the Important Parameters</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A port-channel is not a license to mix unrelated interfaces. The members must be sufficiently compatible to operate as one logical link. On a Layer 2 bundle, this commonly means consistent speed, duplex, switchport mode, native VLAN, allowed VLANs, and other relevant port settings. A mismatch can prevent a member from bundling or can place it into an individual, suspended, or otherwise non-forwarding state depending on the platform.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is why <a href="https://bitcoinversus.tech/2026/09/30/osntc-004-vlan-basics/">VLAN</a> configuration matters. If two member links disagree about trunk state or VLAN handling, the logical interface would not behave consistently. A strong technician therefore compares both the <strong>physical member configuration</strong> and the <strong>logical port-channel configuration</strong> instead of checking only whether the LEDs are green.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>STP Sees the Bundle as One Logical Path</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>One of the most important connections to the previous lesson is that a correctly formed Layer 2 EtherChannel is presented to STP as a single logical port. STP therefore makes its topology decision about the port-channel rather than treating every member as a separate parallel forwarding path. This is how a bundle can use multiple physical links without creating the same Layer 2 loop that four independent forwarding links would create.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That does <em>not</em> mean STP becomes unnecessary. Port-channels can still participate in larger redundant Layer 2 topologies, and STP can block an entire logical port-channel if the overall topology requires it. Link aggregation solves one problem—bundling parallel links between endpoints—while STP still protects the broader switched topology.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Load Balancing Usually Works by Hashing Flows</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Switches generally do not take every Ethernet frame from one conversation and round-robin successive frames across different members. Instead, platforms normally use a hashing decision based on fields such as source/destination MAC addresses, IP addresses, and sometimes transport-layer ports. That helps keep frames belonging to a flow on a consistent member link and avoids creating unnecessary packet reordering.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This creates an important technician lesson: <strong>four 1 Gb/s members do not guarantee one 4 Gb/s flow.</strong> The bundle may offer roughly 4 Gb/s of aggregate forwarding capacity across many well-distributed flows, but one flow can still be limited by the capacity of the member selected for it. This is the same reason <a href="https://bitcoinversus.tech/2026/10/06/networking-bandwidth-vs-throughput-vs-latency-whats-the-difference/">bandwidth and throughput</a> should not be treated as interchangeable.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Failure Recovery Happens at the Member Level</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If one active member link fails, a healthy aggregation can continue operating on the remaining active members. The available aggregate capacity drops, and the device redistributes affected traffic according to its platform behavior. Recovery time is not guaranteed to be literally zero; forwarding behavior depends on hardware, software, hashing, timers, and the nature of the failure. The important point is that losing one cable does not necessarily mean losing the entire logical link.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Some platforms also support minimum-link policies. Cisco documents <code>port-channel min-links</code> behavior that can intentionally hold a port-channel down when too few members remain active to provide the required capacity. That can be safer than silently running a critical service on a severely degraded bundle.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Basic Cisco LACP Configuration Example</strong></h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>configure terminal
interface range GigabitEthernet1/0/1-2
 switchport mode trunk
 channel-group 1 mode active
 exit
interface Port-channel1
 switchport mode trunk
end

show etherchannel summary
show lacp neighbor
show interfaces port-channel 1</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This is an <strong>example</strong>, not a universal copy-and-paste configuration. Interface names, supported commands, maximum bundle size, load-balancing choices, and whether configuration belongs on the members or the logical interface vary by platform. Always confirm the syntax for the device in front of you before changing production networking.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=8gKF2fMMjA8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=8gKF2fMMjA8</div><figcaption class="wp-element-caption"><em>Jeremy’s IT Lab demonstrates EtherChannel configuration and verification in a hands-on CCNA lab.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What to Verify Before You Change Anything</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Physical state:</strong> Are all intended member links actually up, with expected speed and duplex?</li><li><strong>Bundle state:</strong> Does <code>show etherchannel summary</code> show the expected logical channel and bundled members?</li><li><strong>LACP neighbor:</strong> Does each side see the expected partner and member ports?</li><li><strong>Mode pairing:</strong> Is at least one side active?</li><li><strong>Layer 2 consistency:</strong> Do access/trunk mode, native VLAN, and allowed VLANs match?</li><li><strong>Logical interface:</strong> Is the port-channel itself up and carrying the expected VLANs or Layer 3 addressing?</li><li><strong>STP state:</strong> Is the logical port-channel forwarding or intentionally blocked by spanning tree?</li><li><strong>Errors:</strong> Are any members showing CRC errors, drops, flaps, or negotiation problems?</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Common Failure Patterns</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Passive + passive:</strong> neither side initiates LACP, so the bundle does not form.</li><li><strong>Speed or duplex mismatch:</strong> one member is incompatible with the rest of the group.</li><li><strong>Trunk mismatch:</strong> one side or one member is configured differently.</li><li><strong>VLAN mismatch:</strong> native or allowed VLAN settings do not agree.</li><li><strong>Wrong cables or ports:</strong> the intended members do not actually terminate on the expected peer.</li><li><strong>Static bundle mismatch:</strong> a forced bundle can remove some protocol-level protection against incorrect cabling or configuration.</li><li><strong>Uneven utilization:</strong> the bundle is healthy, but the traffic hash places heavy flows on the same member.</li><li><strong>Partial physical failure:</strong> the port-channel stays up but loses aggregate capacity because one or more members fail.</li></ul>
<!-- /wp:list -->

<!-- wp:embed {"url":"https://www.linkedin.com/posts/kartheek-kartheek123d_cisco-networking-etherchannel-activity-7502615493464346624-_bBt","type":"rich","providerNameSlug":"linkedin","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-linkedin wp-block-embed-linkedin"><div class="wp-block-embed__wrapper">https://www.linkedin.com/posts/kartheek-kartheek123d_cisco-networking-etherchannel-activity-7502615493464346624-_bBt</div><figcaption class="wp-element-caption"><em>A current networking-practitioner overview of EtherChannel, LACP modes, member consistency, verification commands, and flow-based load balancing.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Simple Packet Tracer Lab</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Place two switches in Cisco Packet Tracer.</li><li>Connect two or more matching Ethernet interfaces between them.</li><li>Configure both member sets as trunks.</li><li>Configure one switch with LACP <code>active</code> and the other with <code>passive</code>.</li><li>Run <code>show etherchannel summary</code> and confirm the members are bundled.</li><li>Run <code>show lacp neighbor</code> and identify the peer.</li><li>Generate traffic through the switches.</li><li>Disconnect one member cable and confirm that the logical port-channel remains operational on the surviving member or members.</li><li>Reconnect the member and observe it rejoin the bundle.</li><li>Change both sides to passive and observe that LACP no longer initiates formation; restore a valid mode pairing afterward.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Technician Mental Model</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Think of a port-channel as <strong>one logical interface with several physical lanes underneath it</strong>. LACP helps the two endpoints agree on which lanes belong in the same road. STP sees the road rather than every individual lane. A traffic hash decides which lane a given flow uses, and a failed lane can be removed while the road continues on the remaining members.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Exercises</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Explain in your own words why four independent switch links can create an STP problem while four links in one port-channel do not create the same parallel-link topology.</li><li>Write the four active/passive LACP combinations and mark which three can form.</li><li>On a lab switch, compare <code>show interfaces</code>, <code>show etherchannel summary</code>, and <code>show lacp neighbor</code>. Write down what unique information each command provides.</li><li>Create a two-member bundle, unplug one member, and record what changes in logical state, member state, and available aggregate capacity.</li><li>Explain why one large data transfer may not use the combined bandwidth of every member even when the bundle is healthy.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is a LAG?</strong> A Link Aggregation Group: multiple physical links presented as one logical link.</li><li><strong>What is LACP?</strong> The control protocol used to negotiate and maintain standards-based link aggregation.</li><li><strong>What does active mode do?</strong> It initiates LACP negotiation by sending LACP packets.</li><li><strong>Will passive/passive form an LACP bundle?</strong> No, because neither side initiates negotiation.</li><li><strong>What does STP see on a correctly formed Layer 2 port-channel?</strong> One logical port rather than each member as an independent parallel path.</li><li><strong>Does four 1 Gb/s members guarantee one 4 Gb/s TCP flow?</strong> No. Traffic is typically distributed by a hash, so one flow normally stays on one member.</li><li><strong>What happens if one member fails?</strong> The bundle can continue on remaining active members, though aggregate capacity decreases and recovery behavior is platform-dependent.</li><li><strong>Why must member configurations be consistent?</strong> The links must behave as one logical interface; incompatible speed, duplex, VLAN, or trunk settings can keep members from bundling correctly.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Primary Technical References</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://1.ieee802.org/tsn/802-1ax-rev/">IEEE 802.1AX-2020 — Link Aggregation</a></li><li><a href="https://www.cisco.com/c/en/us/td/docs/switches/lan/c9000/lyr2-fwd/etherchannel/etherchannel-configuration-guide/etherchannels.html">Cisco EtherChannel Configuration Guide — EtherChannels</a></li><li><a href="https://www.cisco.com/c/en/us/support/docs/lan-switching/etherchannel/12023-4.html">Cisco — Understanding EtherChannel Load Balance and Redundancy</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Elementary Review</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>LACP is how compatible physical Ethernet links can negotiate into one logical bundle.</strong> The port-channel can provide aggregate capacity and member-level redundancy, STP treats the bundle as one logical path, and a hashing algorithm distributes traffic flows across members. When a bundle fails to form, verify the physical links, LACP mode, member configuration, VLAN/trunk consistency, logical port-channel state, and peer information before making changes.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured artwork is a unique 1200×630 technical cover created specifically for OSNTC.020 under the tightened BitcoinVersus/Open CERT cover-art rule and is not reused inside the body. The separate 1200×700 teaching diagram illustrates the LACP bundle and flow-hashing model. Vendor commands are examples and should be checked against the exact platform before production use.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->