---
title: "OSNTC.004: VLAN Basics"
status: published
wordpress_post_id: 19724
published: "2026-09-30T23:55:34"
source_url: "https://bitcoinversus.tech/2026/09/30/osntc-004-vlan-basics/"
series: "Open-Source Networking Technician Certification"
certification: OSNTC
pathway: technician
lesson_number: "004"
featured_media_id: 19721
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/09/osntc-004-cover.jpg"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=MmwF1oHOvmg"
---

# OSNTC.004: VLAN Basics

<!-- wp:paragraph -->
<p><strong>Simple explanation:</strong> A VLAN lets one physical managed switch behave like several separate local networks. The cable and switch can be shared, while devices are placed into different logical groups.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Definition:</strong> A <em>virtual local area network (VLAN)</em> is a logical group of switch ports and devices that share a Layer 2 network. A VLAN ID, such as 10 or 20, identifies that group on a switch.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In <a href="https://bitcoinversus.tech/2026/09/27/open-source-networking-lesson-1-ip-address/">OSNTC.001: IP Addresses</a>, we learned how an address identifies a network interface. <a href="https://bitcoinversus.tech/2026/09/30/open-source-networking-lesson-2-subnet-mask/">OSNTC.002: Subnet Masks</a> helps distinguish local addresses. <a href="https://bitcoinversus.tech/2026/09/30/networking-lesson-003-default-gateway/">OSNTC.003: Default Gateway</a> explained the router path to other networks. This lesson adds a way to separate traffic at the switch.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why use VLANs?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Imagine one office switch serving staff computers and IP phones. A network administrator can put the computers in a data VLAN and the phones in a voice VLAN. This separates traffic into logical groups without requiring a different physical switch for every group. The right design depends on network policy and switch configuration.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The cover shows a switch with ports grouped into VLAN 10 and VLAN 20. Those labels are examples only; VLAN numbers do not automatically mean “data,” “voice,” or any particular security level.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">VLANs, IP subnets, and gateways</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A VLAN is a Layer 2 switching concept. An IP subnet is a Layer 3 addressing range. Networks often assign one IP subnet to each VLAN, but the words do not mean the same thing. A VLAN assignment alone does not give a device an IP address or a default gateway.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Devices in separate VLANs generally cannot exchange ordinary traffic directly through Layer 2 switching. A router or Layer 3 switch can route between VLANs when that routing is configured. Firewalls or access rules can then limit what crosses between them. Segmentation helps organize traffic, but does not by itself guarantee security.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Access ports and trunk links</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An <strong>access port</strong> usually connects an endpoint, such as a workstation, to one assigned VLAN. The endpoint commonly sends ordinary untagged Ethernet frames; the switch associates that port’s traffic with its configured VLAN.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A <strong>trunk</strong> is a switch-to-switch or switch-to-router link that can carry traffic for multiple VLANs. With IEEE 802.1Q, the network equipment adds VLAN tags to identify traffic on that link. Both ends need compatible settings, and only intended VLANs should be allowed. Cisco’s documentation summarizes the different access and trunk roles.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Watch a visual explanation</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Practical Networking gives a short visual introduction to what VLANs are. Watch the explanation here, then use the office example below to check what VLAN membership does and does not tell us.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=MmwF1oHOvmg","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=MmwF1oHOvmg
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Video: “What are VLANs? — the simplest explanation” — Practical Networking.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A simple switch plan</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Consider a managed switch with two configured groups: VLAN 10 for office computers and VLAN 20 for phones. Port 1 connects to a computer assigned to VLAN 10. Port 9 connects to an IP phone assigned to VLAN 20. Port 16 connects to another managed switch and is configured as a trunk carrying both VLANs.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The numbering and ports are illustrative. A switch does not infer the intended VLAN from a cable or device name. An authorized administrator must configure VLAN membership and, on trunk links, the VLANs allowed across the connection.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Paper check</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Answer without changing a live switch: <strong>1.</strong> If a laptop is plugged into an access port assigned to VLAN 10, which VLAN does the switch associate with its traffic? <strong>2.</strong> Can a VLAN by itself route the laptop to VLAN 20? <strong>3.</strong> What is the trunk in the example for?</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Answers:</strong> 1. VLAN 10. 2. No. Inter-VLAN traffic needs a configured router or Layer 3 switch, and policy may control it. 3. It carries multiple configured VLANs between switches while keeping their traffic identified.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A VLAN groups traffic logically on a switched network. Access ports usually place an endpoint in one VLAN; trunks carry multiple VLANs between network devices. IP subnetting and routing work alongside VLANs, and correct configuration matters.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Reference: <a href="https://www.cisco.com/c/en/us/support/docs/smb/switches/Cisco-Business-Switching/kmgmt-2253-assign-an-interface-vlan-as-an-access-or-trunk-port-on-a-swi.html">Cisco’s access and trunk port documentation</a> defines these port roles and shows how their settings are applied. This lesson is a concept overview; do not change production switch settings without authorization and the site’s approved network plan.</p>
<!-- /wp:paragraph -->
