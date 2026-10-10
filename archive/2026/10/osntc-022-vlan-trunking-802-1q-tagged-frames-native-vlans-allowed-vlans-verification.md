<!-- wp:paragraph -->
<p>A <strong>VLAN trunk</strong> is a network link that carries traffic for more than one virtual LAN across the same physical connection. Instead of dedicating a separate cable to every VLAN, managed switches use <strong>IEEE 802.1Q tagging</strong> so each Ethernet frame can carry VLAN identity as it moves between switches, routers, firewalls, hypervisors, and other VLAN-aware devices. This lesson builds directly on <a href="https://bitcoinversus.tech/2026/09/30/osntc-004-vlan-basics/">OSNTC.004: VLAN Basics</a>, <a href="https://bitcoinversus.tech/2026/10/02/osntc-008-ethernet-frame-basics/">OSNTC.008: Ethernet Frame Basics</a>, and <a href="https://bitcoinversus.tech/2026/10/09/osntc-021-troubleshooting-switch-ports-link-status-errors-vlans/">OSNTC.021: Troubleshooting Switch Ports</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">LEARNING OBJECTIVES</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>By the end of this lesson, explain the difference between an access port and a trunk port, describe where the 802.1Q tag appears in an Ethernet frame, identify the native VLAN, restrict a trunk with an allowed-VLAN list, configure a basic trunk on a Cisco IOS-style switch, and verify whether the intended VLANs are actually forwarding.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">THE BASIC IDEA: ONE LINK, MULTIPLE VLANS</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An <strong>access port</strong> normally belongs to one VLAN and connects an endpoint such as a workstation, printer, server, camera, or <a href="https://bitcoinversus.tech/2026/10/07/networking-what-is-nic-network-interface-card-servers-asic-miners/">network interface card</a>. A <strong>trunk port</strong> can carry frames belonging to multiple VLANs. Trunks are commonly used between switches and on links to VLAN-aware routers, firewalls, wireless controllers, and virtualization hosts.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=A9lMH0ye1HU","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio wp-block-embed-youtube"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=A9lMH0ye1HU
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>CertBros explains VLANs, access ports, trunk ports, 802.1Q tags, and native VLAN behavior.</em></p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/linuxstonks/status/2038195517193400373","type":"rich","providerNameSlug":"x","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio wp-block-embed-x"} -->
<figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://twitter.com/linuxstonks/status/2038195517193400373
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>A Cisco Networking Academy learner highlights networking fundamentals as part of the practical path toward deeper infrastructure and security work.</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22880,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc-022-vlan-trunking-body.jpg" alt="Two Ethernet switches connected by a yellow trunk cable with blue network cables organized in a server rack." class="wp-image-22880" /></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">HOW 802.1Q TAGGING WORKS</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>IEEE 802.1Q defines VLAN-aware bridging. On a tagged Ethernet frame, a 4-byte 802.1Q field is inserted between the source MAC address and the original EtherType/length field. The tag includes a Tag Protocol Identifier and Tag Control Information. The VLAN Identifier portion is 12 bits, which provides the VLAN numbering space used by modern Ethernet switching. The active IEEE standard family continues to define bridges and VLAN bridges. See the <a href="https://standards.ieee.org/ieee/802.1Q/10323/">IEEE 802.1Q-2022 standard overview</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>When an access-device frame enters a switch, the switch associates it with that access port's VLAN. If the frame must cross a trunk, the switch can transmit it with an 802.1Q tag that identifies its VLAN. The receiving switch reads the tag, keeps the traffic in the correct logical broadcast domain, and forwards it toward another access port or trunk as appropriate.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">ACCESS PORT VS. TRUNK PORT</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Access port:</strong> normally carries one data VLAN for an endpoint.</li><li><strong>Trunk port:</strong> carries traffic for multiple VLANs over one physical or logical link.</li><li><strong>Tagged frame:</strong> includes VLAN identity in the 802.1Q field.</li><li><strong>Untagged frame:</strong> has no 802.1Q VLAN tag on the wire.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>A trunk is not automatically a faster link. It is a way to multiplex VLAN traffic across one link. If more bandwidth or redundancy is required, a trunk can be carried over a <a href="https://bitcoinversus.tech/2026/10/08/osntc-020-link-aggregation-lacp-etherchannel-port-channels-member-links-load-balancing-failure-recovery/">Link Aggregation Control Protocol (LACP) port channel</a>, provided the member interfaces use compatible trunk settings.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">THE NATIVE VLAN</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>On a typical IEEE 802.1Q trunk, one VLAN is designated as the <strong>native VLAN</strong>. Cisco documentation describes the native VLAN as the VLAN used for untagged traffic received on that trunk, and native-VLAN traffic is normally transmitted untagged. VLAN 1 is the default native VLAN on many Cisco configurations, but it can be changed. Both ends of a trunk should agree on the native VLAN. A mismatch can create confusing forwarding behavior and can interact badly with spanning-tree processing.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The native VLAN should not be confused with the management VLAN or with an access VLAN. These are separate design concepts. A technician should read the actual switch configuration rather than assuming they are identical.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">ALLOWED VLANS: CONTROL WHAT CROSSES THE TRUNK</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A trunk can be configured with an <strong>allowed-VLAN list</strong>. If VLAN 10, VLAN 20, and VLAN 30 are the only VLANs that need to cross an uplink, limiting the trunk to those VLANs reduces unnecessary exposure and makes troubleshooting easier. A VLAN may exist on both switches yet still fail across the link if it is missing from the trunk's allowed list, inactive locally, or blocked by <a href="https://bitcoinversus.tech/2026/10/08/osntc-019-spanning-tree-protocol-stp-loops-root-bridge-bpdus-port-roles-rstp/">Spanning Tree Protocol</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">BASIC CISCO IOS-STYLE CONFIGURATION</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The following example configures GigabitEthernet1/0/24 as a static trunk, allows VLANs 10, 20, and 30, and sets VLAN 99 as the native VLAN. Exact syntax varies by platform and software release. Perform configuration work only in a lab or approved maintenance window.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>enable
configure terminal
interface gigabitEthernet 1/0/24
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30
 switchport trunk native vlan 99
end</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Cisco's current VLAN configuration guide documents the native-VLAN and allowed-VLAN commands and notes that trunk members in the same EtherChannel must use compatible trunk parameters. See <a href="https://www.cisco.com/c/en/us/td/docs/switches/lan/c9000/lyr2-fwd/vlan/vlan-configuration-guide/configure-vlan-trunks.html">Cisco: Configure VLAN Trunking</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">VERIFY BEFORE ASSUMING THE TRUNK WORKS</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Verification is more important than the configuration command itself. A trunk can be administratively configured and still fail to carry the expected traffic because of a VLAN mismatch, missing VLAN, native-VLAN mismatch, spanning-tree state, physical-link problem, or inconsistent port-channel configuration.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>show interfaces trunk
show interfaces gigabitEthernet 1/0/24 switchport
show vlan brief
show spanning-tree interface gigabitEthernet 1/0/24 detail
show mac address-table interface gigabitEthernet 1/0/24</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>When reading <code>show interfaces trunk</code>, check the port, encapsulation, trunk status, native VLAN, VLANs allowed on the trunk, VLANs active in the management domain, and VLANs that are actually forwarding. The last category matters because an allowed VLAN is not necessarily forwarding at that moment.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">COMMON FAILURE PATTERNS</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Wrong port mode:</strong> one side is configured as access while the other is expected to trunk.</li><li><strong>Allowed-VLAN mismatch:</strong> the required VLAN is absent from one side's allowed list.</li><li><strong>Native-VLAN mismatch:</strong> each side assigns untagged traffic to a different VLAN.</li><li><strong>Missing VLAN:</strong> the VLAN is not created or active on one switch.</li><li><strong>STP blocking:</strong> the trunk exists but a redundant path is not forwarding for a VLAN.</li><li><strong>Port-channel inconsistency:</strong> LACP members do not share compatible trunk settings.</li><li><strong>Physical fault:</strong> cabling, optics, transceivers, or link negotiation fail before VLAN logic is even reached.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Use a layered troubleshooting process. Confirm the physical link first, then switchport mode, VLAN existence, allowed VLANs, native VLAN, spanning-tree state, MAC learning, and finally Layer 3 addressing or routing. This keeps the investigation aligned with the principles in <a href="https://bitcoinversus.tech/2026/10/09/osntc-021-troubleshooting-switch-ports-link-status-errors-vlans/">OSNTC.021</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">PRACTICAL LAB</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In a simulator or isolated lab, create VLAN 10 and VLAN 20 on two switches. Place one endpoint on each switch in VLAN 10 and another endpoint on each switch in VLAN 20. Configure the inter-switch link as a trunk, allow only VLANs 10 and 20, and verify same-VLAN connectivity across the switches. Then remove VLAN 20 from the allowed list and observe the failure. Restore VLAN 20, change the native VLAN consistently on both ends, and verify again.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">EXERCISES</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Explain why a trunk does not merge VLAN 10 and VLAN 20 into one broadcast domain.</li><li>Identify the purpose of the 802.1Q VLAN ID field.</li><li>Write a trunk configuration that permits only VLANs 5, 10, and 25.</li><li>Describe what could happen if two trunk endpoints use different native VLANs.</li><li>List at least four verification commands to run before changing a production trunk.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">KNOWLEDGE CHECK</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1.</strong> What is the primary purpose of a VLAN trunk? <strong>2.</strong> How large is the 802.1Q tag? <strong>3.</strong> What happens to untagged traffic received on a typical 802.1Q trunk? <strong>4.</strong> Does an allowed VLAN automatically mean it is forwarding? <strong>5.</strong> Why should both ends of the trunk use the same native VLAN?</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">ANSWER GUIDE</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1.</strong> To carry traffic for multiple VLANs across one link while preserving VLAN separation. <strong>2.</strong> Four bytes. <strong>3.</strong> It is associated with the trunk's native VLAN under the typical configuration described here. <strong>4.</strong> No. It can still be inactive or blocked from forwarding. <strong>5.</strong> A mismatch can place untagged traffic into different VLANs on each side and produce connectivity, security, or spanning-tree problems.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">CONCLUSION AND NEXT STEP</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>VLAN trunking extends logical Layer 2 networks across shared physical links. The essential technician workflow is to understand the access-versus-trunk distinction, recognize 802.1Q tagging, configure the native and allowed VLANs intentionally, and verify the forwarding state instead of trusting configuration alone. The next Networking Technician lesson should build from this foundation into inter-VLAN communication and Layer 3 switching.</p>
<!-- /wp:paragraph -->