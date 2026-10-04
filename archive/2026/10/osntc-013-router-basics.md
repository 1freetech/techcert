---
title: "OSNTC.013: Router Basics"
status: published
wordpress_post_id: 20370
published: "2026-10-03T22:48:42"
live_url: "https://bitcoinversus.tech/2026/10/03/osntc-013-router-basics/"
series: "Open Source Networking Technician Certification"
subject: networking
lesson_number: "013"
featured_media_id: 20368
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc.013-router-basics-cover.png"
youtube_1: "https://www.youtube.com/watch?v=H7-NR3Q3BeI"
youtube_2: "https://www.youtube.com/watch?v=AzXys5kxpAM"
youtube_3: "https://www.youtube.com/watch?v=Ep-x_6kggKA"
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>A router connects different IP networks and forwards packets from one network toward another.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/03/osntc-012-network-switch-basics/">OSNTC.012: Network Switch Basics</a>. A switch mainly helps devices communicate inside a local Layer-2 network. A router is what gives traffic a path <strong>between IP networks</strong>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Start with one simple picture</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>Network A                     Network B
192.168.10.0/24               192.168.20.0/24

PC ── Switch ── Router ── Switch ── Server
               ↑      ↑
          one interface
          in each network</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The router has a connection into both networks. When a packet must travel from Network A to Network B, the router examines the destination IP address and decides where to send the packet next.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">A switch and a router solve different problems</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Switch:</strong> usually forwards Ethernet frames inside a LAN using MAC-address information.</li><li><strong>Router:</strong> forwards IP packets between networks using destination IP addresses and a routing table.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>This distinction is important because home equipment often combines routing, Ethernet switching, Wi-Fi, DHCP, NAT, and firewall functions in one box. The box may be called a “router,” but those are still separate networking functions.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Switches and routers in the same picture</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=H7-NR3Q3BeI","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=H7-NR3Q3BeI
</div><figcaption class="wp-element-caption"><em>Practical Networking — Hub, Bridge, Switch, Router. This lesson compares the major network devices and shows why routers are used to move traffic between networks.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">How does a computer know it needs a router?</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A host first asks a simple question: <strong>Is the destination IP local, or is it on another network?</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The host uses its own IP address and subnet mask to make that decision. Review <a href="https://bitcoinversus.tech/2026/09/30/open-source-networking-lesson-2-subnet-mask/">OSNTC.002: Subnet Masks</a> if that step is not yet comfortable.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Destination is local
        ↓
Send directly on the local LAN

Destination is remote
        ↓
Send the packet toward the default gateway</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The <strong>default gateway</strong> is normally a router interface on the same local network as the host. That is why <a href="https://bitcoinversus.tech/2026/09/30/networking-lesson-003-default-gateway/">OSNTC.003: Default Gateway</a> comes directly into play here.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The router needs addresses too</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A router interface connected to an Ethernet network normally has its own IP address and its own Layer-2 address. A router connecting two Ethernet networks therefore has addressing information for each side.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Network A
192.168.10.0/24

Router interface: 192.168.10.1
        │
      ROUTER
        │
Router interface: 192.168.20.1

Network B
192.168.20.0/24</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Those addresses let hosts reach the router locally and let the router participate in each connected IP network.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The routing table is the router's map</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A router does not blindly send every packet to the internet. It consults a <strong>routing table</strong>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A beginner-friendly routing table can be imagined like this:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Destination network       Send toward
192.168.10.0/24           directly connected
192.168.20.0/24           directly connected
10.0.0.0/8                next-hop router
0.0.0.0/0                 default route</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The router compares the packet's destination IP address with routes it knows. If it has a matching route, it forwards the packet using that route. If it has no usable route, it cannot correctly forward the packet toward that destination.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Cisco describes the same core behavior: routers read destination IP information and use routing information to direct packets between networks.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Reference: <a href="https://www-cloud.cisco.com/site/us/en/learn/topics/small-business/what-is-a-router.html">Cisco — What Is a Router?</a></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Routing tables and route decisions</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=AzXys5kxpAM","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=AzXys5kxpAM
</div><figcaption class="wp-element-caption"><em>Practical Networking — Everything Routers Do, Part 1. This lesson explains router interfaces, routing tables, directly connected routes, static routes, and dynamic routes.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">A packet crossing a router, step by step</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Suppose a PC at <code>192.168.10.25</code> wants to reach a server at <code>192.168.20.50</code>.</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>The PC compares the server's IP address with its own local subnet.</li><li>The PC determines that <code>192.168.20.50</code> is remote.</li><li>The PC sends the traffic toward its default gateway.</li><li>The local switch forwards the Ethernet frame toward the router interface.</li><li>The router receives the frame and processes the IP packet.</li><li>The router checks the destination IP address against its routing table.</li><li>The router chooses the outgoing interface or next hop.</li><li>The router builds the appropriate Layer-2 frame for the next Ethernet link.</li><li>The packet continues toward the destination network.</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p>One important idea is hidden in step 8: <strong>the IP packet is being routed, but the Ethernet frame is local to each link.</strong> The incoming Layer-2 frame is not simply carried unchanged across every router.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Host A
  │ Ethernet frame #1
  ▼
Router
  │ Ethernet frame #2
  ▼
Host B

The IP packet is forwarded.
The Layer-2 frame changes for the next link.</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">ARP still matters around a router</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>On an IPv4 Ethernet LAN, a device may need ARP to learn the MAC address associated with the next local IPv4 hop. For a remote destination, the sending host normally needs the Layer-2 address of its local default gateway—not the MAC address of the remote server across the internet.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>That connects directly to OSNTC.009: ARP Basics: ARP resolves information needed for the <strong>local link</strong>, while routing moves the packet toward a different IP network.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Watch a router forward the packet</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Ep-x_6kggKA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Ep-x_6kggKA
</div><figcaption class="wp-element-caption"><em>Practical Networking — Everything Routers Do, Part 2. This walkthrough follows packet forwarding through routing-table and ARP-table decisions step by step.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Directly connected, static, and dynamic routes</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A router can learn routes in several ways. At this stage, remember only the categories:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Directly connected route:</strong> the network is attached directly to one of the router's active interfaces.</li><li><strong>Static route:</strong> an administrator manually configures the route.</li><li><strong>Dynamic route:</strong> routing protocols allow routers to exchange reachability information automatically.</li><li><strong>Default route:</strong> a catch-all route used when a more specific known route is not available.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>You do not need OSPF or BGP yet. First understand what a route means: <strong>for this destination, send the packet this way.</strong></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Router vs. default gateway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>These words are related but not identical.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>A <strong>router</strong> is a device or software function that forwards packets between IP networks.</li><li>A <strong>default gateway</strong> is the local next-hop address a host uses when it needs to reach a destination outside its own local network and has no more specific host route.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>In a small LAN, the default gateway is commonly an IP address assigned to a router interface.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">A home router is really several devices in one</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A typical home Wi-Fi router may perform several jobs at once:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>IP routing</li><li>Ethernet switching</li><li>Wi-Fi access point</li><li>DHCP server</li><li>NAT</li><li>Basic firewalling</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Do not let the all-in-one box blur the concepts. In enterprise and data-center networks, these functions may be split across many separate devices and systems.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Data-center example</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Imagine one server VLAN uses <code>10.20.10.0/24</code> and another uses <code>10.20.20.0/24</code>. A Layer-2 switch can carry each VLAN, but traffic moving between those IP networks needs a Layer-3 routing function somewhere in the path.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Server VLAN 10
10.20.10.0/24
       │
       ▼
 Layer-3 routing
       │
       ▼
Server VLAN 20
10.20.20.0/24</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>That routing function might exist on a dedicated router, a Layer-3 switch, a firewall, or another device capable of IP forwarding. The basic routing logic is still the same.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Basic technician troubleshooting</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>If a host can reach local devices but cannot reach a different network, work in a simple order:</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>Check the host IP address.</strong></li><li><strong>Check the subnet mask.</strong></li><li><strong>Check the configured default gateway.</strong></li><li><strong>Ping the local gateway if policy allows.</strong></li><li><strong>Check whether the router interface is up.</strong></li><li><strong>Check whether the router has a route toward the destination.</strong></li><li><strong>Check the return path.</strong> The remote side also needs a way back.</li><li><strong>Check ACL/firewall policy</strong> if routing appears correct but traffic is still blocked.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Useful commands without pretending the output is universal</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The exact appearance of command output depends on the operating system and environment. These are plain-text command examples, not simulated terminal screenshots.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Windows:</strong></p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>ipconfig
ping &lt;gateway-address&gt;
tracert &lt;destination&gt;</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><strong>Linux:</strong></p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>ip addr
ip route
ping &lt;gateway-address&gt;
traceroute &lt;destination&gt;</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><em>No colors are assigned here because these are code examples, not claims about a specific terminal's default color scheme.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Thinking a switch and a router do the same job.</li><li>Thinking every device called a “router” is only doing routing.</li><li>Forgetting that a host decides local vs. remote using its subnet information.</li><li>Assuming the remote server's MAC address is needed across the entire routed path.</li><li>Forgetting that routers need a valid return path too.</li><li>Changing DNS when the real problem is a missing gateway or route.</li><li>Assuming “ping fails” automatically means “router is broken.”</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Draw two different /24 networks with one router between them.</li><li>Give the router one IP address in each network.</li><li>Explain why a switch alone does not automatically route between the two IP networks.</li><li>Explain what a routing table tells a router.</li><li>Explain why the sending host uses its default gateway for a remote destination.</li><li>Describe what happens to the Ethernet frame when a packet crosses a router.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What is the primary job of a router?</strong><br>To forward IP packets between networks.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. What information does a router primarily use for a basic forwarding decision?</strong><br>The destination IP address together with its routing table.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. What does a host normally do when the destination is outside its own local network?</strong><br>It sends the traffic toward an appropriate gateway, commonly its configured default gateway.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. Does the same Ethernet frame remain unchanged across every router?</strong><br>No. A router forwards the IP packet and uses the appropriate Layer-2 framing for the next link.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>A router connects IP networks. A host sends remote traffic toward a gateway, and the router uses the destination IP address plus its routing table to choose where the packet goes next.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Once this is clear, routing tables, static routes, dynamic routing protocols, NAT, and troubleshooting become much easier to understand.</p><!-- /wp:paragraph -->