<!-- wp:group -->
<div class="wp-block-group">
<!-- wp:paragraph {"fontSize":"large"} -->
<p class="has-large-font-size"><strong>IPv6 expands Internet Protocol addressing from 32 bits to 128 bits and changes several technician workflows at the same time.</strong> OSNTC.016 follows <a href="https://bitcoinversus.tech/2026/10/05/osntc-015-nat-pat-basics-private-addresses-port-translation-state-tables-troubleshooting/"><strong>OSNTC.015: NAT and PAT Basics</strong></a> by moving from IPv4 address conservation toward globally scalable IPv6 addressing, where technicians must recognize prefixes, address types, autoconfiguration, neighbor discovery, and IPv6 routing behavior.</p>
<!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=CpLznUxkzg8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=CpLznUxkzg8
</div><figcaption class="wp-element-caption"><em>Professor Messer — IPv6 Addressing, CompTIA Network+ N10-009. Introduces IPv6 addressing and coexistence with IPv4.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Read and shorten IPv6 addresses correctly.</li><li>Interpret IPv6 prefix lengths such as /64.</li><li>Distinguish global unicast, link-local, unique-local, multicast, and loopback addresses.</li><li>Explain SLAAC and DHCPv6 at technician level.</li><li>Explain how Neighbor Discovery replaces key IPv4 ARP functions.</li><li>Configure and verify basic IPv6 connectivity.</li><li>Recognize IPv6 routing and IPv4-to-IPv6 transition methods.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">IPv6 notation, hexadecimal, and compression</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>An IPv6 address contains eight 16-bit hexadecimal groups, for a total of 128 bits. Leading zeros inside a group can be omitted, and one continuous run of all-zero groups can be replaced once with <code>::</code>; therefore <code>2001:0db8:0000:0000:0000:0000:0000:0025</code> can be written as <code>2001:db8::25</code>. A technician must be able to expand and compress addresses without changing their value.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Flf4lHUr1FU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Flf4lHUr1FU
</div><figcaption class="wp-element-caption"><em>Intelligence Quest — IPv6 Address Compression Explained. Demonstrates leading-zero removal, double-colon compression, and correct expansion.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Prefixes and the common /64 boundary</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>An IPv6 prefix length identifies how many leading bits describe the network portion of an address. A typical LAN uses a <code>/64</code>, leaving 64 bits for the interface identifier; for example, <code>2001:db8:10:20::/64</code> identifies the subnet while the remaining bits identify interfaces. Prefix length is conceptually similar to an IPv4 subnet mask, but IPv6 technicians normally work directly with CIDR notation instead of dotted-decimal masks.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vc1zVGy2iOs","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vc1zVGy2iOs
</div><figcaption class="wp-element-caption"><em>Pedro Lino Cáceres — IPv6 tutorial for CCNA. Covers IPv6 structure, representation, address types, and practical configuration.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Global, link-local, unique-local, multicast, and loopback addresses</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>IPv6 technicians should recognize several important address scopes. Global unicast addresses are generally drawn from <code>2000::/3</code> and are designed for globally routable communication; link-local addresses use <code>fe80::/10</code> and operate only on the local Layer 2 link; unique-local space uses <code>fc00::/7</code>; multicast begins with <code>ff00::/8</code>; and the loopback address is <code>::1</code>. Unlike IPv4, ordinary IPv6 operation does not use broadcast addressing.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=X6TDCSGe0IY","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=X6TDCSGe0IY
</div><figcaption class="wp-element-caption"><em>Mohamed Herak — IPv6 Addressing: Address Types. Reviews link-local, unique-local, global unicast, and multicast address categories.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">SLAAC and DHCPv6</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Stateless Address Autoconfiguration allows an IPv6 host to learn network information from Router Advertisement messages and construct an address without relying on an IPv4-style DHCP exchange. DHCPv6 can still provide stateful addressing or additional configuration, depending on the network design. A technician should inspect Router Advertisements, address assignment, prefix information, default-router behavior, and DNS configuration instead of assuming that every IPv6 client receives all settings from DHCP.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=jlG_nrCOmJc","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=jlG_nrCOmJc
</div><figcaption class="wp-element-caption"><em>OneMarcFifty — IPv6 explained: SLAAC and DHCPv6. Covers Router Solicitation, Router Advertisement, autoconfiguration, and DHCPv6 behavior.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Neighbor Discovery replaces key ARP functions</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>IPv6 Neighbor Discovery Protocol uses ICMPv6 messages and multicast to perform functions that IPv4 separates across ARP and other mechanisms. Neighbor Solicitation and Neighbor Advertisement messages discover local-link neighbors, while Router Solicitation and Router Advertisement messages help hosts discover routers and prefixes. The neighbor cache is therefore one of the first places to inspect when a host has an IPv6 address but cannot reach a device on the same link.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=crupCqdfmj8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=crupCqdfmj8
</div><figcaption class="wp-element-caption"><em>Wendell Odom's Network Upskill — Neighbor Discovery Protocol. Explains how IPv6 NDP replaces ARP-style neighbor resolution and uses solicited-node multicast.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Configuration and verification</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>IPv6 troubleshooting begins by verifying the interface state, assigned global and link-local addresses, prefix length, default route, neighbor cache, and end-to-end ICMPv6 reachability. On Cisco-style devices, useful commands include <code>show ipv6 interface brief</code>, <code>show ipv6 neighbors</code>, <code>show ipv6 route</code>, and IPv6-aware <code>ping</code>; on Linux, technicians can use <code>ip -6 addr</code>, <code>ip -6 route</code>, <code>ip -6 neigh</code>, and <code>ping -6</code>.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=xDNrUh_FABg","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=xDNrUh_FABg
</div><figcaption class="wp-element-caption"><em>NetworkShip — IPv6 Configuration in Cisco Packet Tracer. Demonstrates global and link-local addressing, verification, and IPv6 ping tests.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:preformatted --><pre class="wp-block-preformatted">Cisco-style verification
show ipv6 interface brief
show ipv6 neighbors
show ipv6 route
ping 2001:db8:10:20::25

Linux verification
ip -6 addr
ip -6 route
ip -6 neigh
ping -6 2001:db8:10:20::25</pre><!-- /wp:preformatted -->

<!-- wp:heading --><h2 class="wp-block-heading">IPv6 routing</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>IPv6 routers forward traffic by longest-prefix match just as IPv4 routers do, but IPv6 routing tables contain IPv6 prefixes and can use link-local next-hop addresses. Static routes are useful for small or controlled topologies, while dynamic routing protocols such as OSPFv3 can distribute IPv6 reachability in larger networks. When an IPv6 destination fails, technicians should separate local-link neighbor discovery from the routed path and verify each hop in sequence.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=oh0Ozw1ttz4","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=oh0Ozw1ttz4
</div><figcaption class="wp-element-caption"><em>Network Direction — IPv6 Routing Explained. Covers static IPv6 routes, link-local next hops, and OSPFv3 concepts.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">IPv4 and IPv6 coexistence</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Most production environments migrate gradually rather than switching from IPv4 to IPv6 in one event. Dual-stack systems run both protocols, tunneling can carry one protocol across another network, and translation mechanisms such as NAT64 allow IPv6-only clients to reach IPv4-only services under defined conditions. Technicians should identify which transition method is in use before troubleshooting because an IPv6 symptom can originate in native IPv6 routing, DNS64, translation state, or the remaining IPv4 path.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=EhCzKyojkNs","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=EhCzKyojkNs
</div><figcaption class="wp-element-caption"><em>Sunny Classroom — IPv4 to IPv6 Transition with NAT64. Explains coexistence, translation, and IPv6-to-IPv4 connectivity.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Reference standards</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><a href="https://www.rfc-editor.org/rfc/rfc4291">RFC 4291 — IPv6 Addressing Architecture</a></li><li><a href="https://www.rfc-editor.org/rfc/rfc4861">RFC 4861 — Neighbor Discovery for IPv6</a></li><li><a href="https://www.rfc-editor.org/rfc/rfc4862">RFC 4862 — IPv6 Stateless Address Autoconfiguration</a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Prior lessons</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/05/osntc-015-nat-pat-basics-private-addresses-port-translation-state-tables-troubleshooting/">OSNTC.015: NAT and PAT Basics</a></li><li><a href="https://bitcoinversus.tech/2026/10/04/osntc-014-tcp-udp-transport-basics/">OSNTC.014: TCP and UDP Transport Basics</a></li><li><a href="https://bitcoinversus.tech/2026/10/03/osntc-013-router-basics/">OSNTC.013: Router Basics</a></li><li><a href="https://bitcoinversus.tech/2026/10/02/osntc-009-arp-basics/">OSNTC.009: ARP Basics</a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->
<!-- wp:ordered-list --><ol class="wp-block-list"><li>Expand <code>2001:db8:20::45</code> into all eight hexadecimal groups.</li><li>Compress <code>2001:0db8:0000:0000:0000:00aa:0000:0001</code> correctly.</li><li>Identify the scope or type of <code>fe80::1</code>, <code>::1</code>, <code>2001:db8::25</code>, and <code>ff02::1</code>.</li><li>Explain why a /64 leaves 64 bits for an interface identifier.</li><li>Compare SLAAC with DHCPv6 in two or three sentences.</li><li>Map IPv4 ARP terminology to the closest IPv6 Neighbor Discovery behavior.</li><li>Use a lab or Packet Tracer topology to verify an IPv6 address, neighbor entry, route, and ping.</li><li>Describe one situation where NAT64 would be required.</li></ol><!-- /wp:ordered-list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->
<!-- wp:ordered-list --><ol class="wp-block-list"><li>How many bits are in an IPv6 address?</li><li>How many times can <code>::</code> appear in one compressed IPv6 address?</li><li>What prefix identifies IPv6 link-local addresses?</li><li>What protocol family carries Neighbor Solicitation and Router Advertisement messages?</li><li>What does SLAAC allow a host to do?</li><li>Which command shows IPv6 neighbors on a Cisco-style device?</li><li>Can an IPv6 static route use a link-local next hop?</li><li>What does NAT64 accomplish?</li></ol><!-- /wp:ordered-list -->

<!-- wp:heading {"level":3} --><h3 class="wp-block-heading">Answers</h3><!-- /wp:heading -->
<!-- wp:ordered-list --><ol class="wp-block-list"><li>128 bits.</li><li>Once.</li><li><code>fe80::/10</code>.</li><li>ICMPv6.</li><li>Learn prefix/router information and construct an IPv6 address without a stateful address lease.</li><li><code>show ipv6 neighbors</code>.</li><li>Yes, when the platform and route syntax identify the appropriate outgoing interface or otherwise disambiguate the next hop.</li><li>It translates between IPv6 and IPv4 so compatible IPv6-only and IPv4-only endpoints can communicate through a translation system.</li></ol><!-- /wp:ordered-list -->
</div>
<!-- /wp:group -->