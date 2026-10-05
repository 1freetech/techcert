---
title: "OSNTC.014: TCP and UDP Transport Basics"
status: published
wordpress_post_id: 20611
published: "2026-10-04T03:14:16"
live_url: "https://bitcoinversus.tech/2026/10/04/osntc-014-tcp-udp-transport-basics/"
series: "Open Source Networking Technician Certification"
pathway: networking
lesson_number: "014"
featured_media_id: 20609
youtube_1: "https://www.youtube.com/watch?v=uwoD5YsGACg"
youtube_2: "https://www.youtube.com/watch?v=rmFX1V49K8U"
youtube_3: "https://www.youtube.com/watch?v=jE_FcgpQ7Co"
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>IP gets packets between hosts. TCP and UDP determine how applications exchange data between processes on those hosts.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>OSNTC.014</strong> continues the Open Source Networking Technician Certification after <a href="https://bitcoinversus.tech/2026/10/03/osntc-013-router-basics/"><strong>OSNTC.013: Router Basics</strong></a>. Routers forward IP packets between networks; transport protocols add application-facing communication through port numbers, sequencing, acknowledgements, flow behavior, and datagram delivery.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The transport-layer model</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>application data → TCP stream or UDP datagram → IP packet → Ethernet/Wi-Fi frame → network path → destination host → destination process</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">1. TCP and UDP sit above IP</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The Internet Protocol identifies source and destination hosts and moves packets across networks. TCP and UDP operate above IP and identify communicating applications using <strong>port numbers</strong>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The earlier <a href="https://bitcoinversus.tech/2026/10/02/osntc-010-icmp-ping-basics/"><strong>ICMP and Ping Basics</strong></a> lesson covered a different IP-layer control protocol. ICMP does not use TCP or UDP ports.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Port numbers identify application endpoints</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>TCP and UDP use 16-bit port numbers from 0 through 65535. IANA divides the registry into three broad ranges:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>System Ports:</strong> 0–1023</li><li><strong>User Ports:</strong> 1024–49151</li><li><strong>Dynamic/Private Ports:</strong> 49152–65535</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Reference: <a href="https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml"><strong>IANA Service Name and Transport Protocol Port Number Registry</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A registered port suggests a conventional service, but traffic observed on that port is not automatically trustworthy and does not prove that the expected application is actually using it.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: TCP vs. UDP comparison</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=uwoD5YsGACg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=uwoD5YsGACg
</div><figcaption class="wp-element-caption"><em>PowerCert Animated Videos — TCP vs UDP Comparison.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">3. TCP is connection-oriented</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Transmission Control Protocol (TCP)</strong> establishes state between endpoints before application data is exchanged. The current consolidated TCP standard is <a href="https://www.rfc-editor.org/rfc/rfc9293.html"><strong>RFC 9293</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A TCP connection is commonly identified by the combination of:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>source IP address;</li><li>source TCP port;</li><li>destination IP address;</li><li>destination TCP port;</li><li>transport protocol.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>This five-part identification lets one server IP and one server port support many simultaneous client connections.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">4. The TCP three-way handshake</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A normal TCP connection begins with a three-step exchange:</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>SYN:</strong> the initiating endpoint requests a connection and supplies an initial sequence number.</li><li><strong>SYN-ACK:</strong> the responding endpoint acknowledges that request and supplies its own initial sequence number.</li><li><strong>ACK:</strong> the initiator acknowledges the responder.</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p>After this exchange, both endpoints have synchronized connection state and can begin transferring application data.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: TCP handshake, flags, sequence numbers, and windows</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=rmFX1V49K8U","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=rmFX1V49K8U
</div><figcaption class="wp-element-caption"><em>David Bombal — How TCP Really Works: three-way handshake, flags, sequence numbers, windows, MSS, and SACK.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">5. TCP provides ordered byte-stream delivery</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>TCP presents applications with an ordered byte stream. Sequence numbers let the receiver determine where bytes belong, while acknowledgement information reports successfully received sequence space.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>When data is lost, TCP can retransmit missing data. When packets arrive out of order, TCP can reorder the received byte stream before delivering it to the application.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This does <strong>not</strong> mean TCP guarantees that every application message will always reach the destination under every failure condition. A connection can time out, reset, lose network reachability, or terminate before completion. TCP provides mechanisms for reliable ordered transport while the connection exists; applications must still handle failures.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">6. TCP includes flow control</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>TCP receivers advertise how much receive capacity is available. This helps prevent a sender from overwhelming the receiver's buffer.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Flow control</strong> protects the receiving endpoint. <strong>Congestion control</strong> is a different function that attempts to avoid overloading the network path. Both affect how much TCP data can be sent at a given time.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">7. TCP has more transport state and header overhead</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A basic TCP header is at least 20 bytes and can grow when options are present. TCP tracks sequence state, acknowledgements, windows, flags, retransmission behavior, and other connection information.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>That extra machinery is useful when ordered delivery, retransmission, and congestion-aware transport are required.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">8. UDP is message-oriented and connectionless</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>User Datagram Protocol (UDP)</strong> sends independent datagrams without establishing a TCP-style connection first. Its base header is only 8 bytes: source port, destination port, length, and checksum.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>UDP does not itself provide TCP-style sequencing, retransmission, flow control, or congestion control. Applications that need those behaviors must add them at another layer or use a protocol that supplies them.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The IETF's <a href="https://www.rfc-editor.org/rfc/rfc8085.html"><strong>RFC 8085 UDP Usage Guidelines</strong></a> specifically warns that UDP applications must account for Internet-path variation and must not ignore congestion behavior simply because UDP itself is minimal.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">9. UDP does not mean “bad” or “unreliable application”</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The phrase “UDP is unreliable” is an oversimplification. UDP does not provide built-in delivery confirmation or retransmission, but an application can implement reliability, recovery, timing, or redundancy above UDP when appropriate.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Modern QUIC is a major example: it runs over UDP while implementing secure connection management, loss recovery, congestion control, and stream behavior above the UDP layer. HTTP/3 uses QUIC rather than TCP.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: TCP vs. UDP without the common myths</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=jE_FcgpQ7Co","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=jE_FcgpQ7Co
</div><figcaption class="wp-element-caption"><em>Practical Networking — TCP vs UDP: connection state, delivery behavior, flow control, overhead, and common myths.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">10. UDP does not mean packets move faster through routers</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Routers do not normally forward an IP packet faster merely because its payload is UDP instead of TCP. UDP can reduce transport-layer setup and state overhead, but total application performance depends on path latency, packet loss, congestion, implementation, application behavior, and recovery strategy.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>“UDP is always faster” is therefore not a technically reliable rule.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">11. Common TCP examples</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>SSH:</strong> TCP port 22</li><li><strong>HTTP/1.1 and HTTP/2:</strong> normally TCP port 80 or 443 depending on encryption</li><li><strong>SMTP:</strong> commonly TCP</li><li><strong>IMAP:</strong> commonly TCP</li><li><strong>database protocols:</strong> many use TCP</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The exact service mapping should be verified against current application documentation and the IANA registry rather than assumed from a memorized port list.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">12. Common UDP examples</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>DNS:</strong> commonly UDP port 53 for many queries, with TCP also used where required.</li><li><strong>NTP:</strong> commonly UDP port 123.</li><li><strong>DHCP:</strong> uses UDP.</li><li><strong>real-time media:</strong> often uses UDP-based protocols because timeliness can matter more than retransmitting old data.</li><li><strong>QUIC / HTTP/3:</strong> runs over UDP, commonly using UDP port 443.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The earlier <a href="https://bitcoinversus.tech/2026/10/01/osntc-006-dns-basics/"><strong>DNS Basics</strong></a> lesson is a useful example because DNS can use both UDP and TCP depending on the transaction.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">13. One port number can exist in both TCP and UDP</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>TCP port 53 and UDP port 53 are different transport endpoints even though they share the same numeric value. The transport protocol is part of the endpoint identity.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The same principle applies to port 443. IANA currently registers HTTPS on both TCP 443 and UDP 443. TCP 443 is widely associated with HTTP over TLS, while UDP 443 is used by protocols such as QUIC/HTTP/3.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">14. Client source ports are usually temporary</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A server normally listens on a known service port, while a client typically chooses a temporary local source port for the connection or exchange.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Example:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>client 192.0.2.10:53044 → server 198.51.100.20:443</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Another client can use the same server IP and destination port because its source IP or source port differs.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">15. Switches and routers do different jobs from TCP and UDP</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <a href="https://bitcoinversus.tech/2026/10/03/osntc-012-network-switch-basics/"><strong>network switch</strong></a> primarily forwards Ethernet frames inside a Layer-2 domain. A <a href="https://bitcoinversus.tech/2026/10/03/osntc-013-router-basics/"><strong>router</strong></a> forwards IP packets between networks. TCP and UDP are endpoint transport protocols used by applications.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Firewalls, load balancers, NAT devices, and middleboxes may inspect or modify transport-layer state, but ordinary endpoint transport semantics still belong to TCP, UDP, or another transport protocol.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">16. What a technician should inspect during troubleshooting</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Confirm source and destination IP addresses.</li><li>Confirm whether the application uses TCP, UDP, or both.</li><li>Confirm source and destination ports.</li><li>Verify that the server process is listening on the expected transport and port.</li><li>Check local and network firewall policy.</li><li>For TCP, determine whether the three-way handshake completes.</li><li>For TCP, look for retransmissions, resets, duplicate acknowledgements, and window problems.</li><li>For UDP, determine whether requests leave and responses return.</li><li>Check NAT or load-balancer translation where present.</li><li>Use packet capture when endpoint logs are insufficient.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">17. Fast fault-isolation examples</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>TCP SYN leaves but no SYN-ACK returns:</strong><br>check destination reachability → server listening state → firewall policy → NAT/load balancer → return path.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>TCP handshake completes but application stalls:</strong><br>check application protocol → TLS/session state → receive windows → retransmissions → server logs.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>UDP request leaves but no response returns:</strong><br>check destination port → service state → firewall → NAT mapping → application timeout/retry behavior → return path.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">18. Practice exercise</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A workstation at 10.10.5.24 opens an HTTPS connection to 10.20.8.40. The packet capture shows:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>10.10.5.24:51822 → 10.20.8.40:443 SYN<br>10.20.8.40:443 → 10.10.5.24:51822 SYN-ACK<br>10.10.5.24:51822 → 10.20.8.40:443 ACK</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Which endpoint initiated the TCP connection?</li><li>Which endpoint is acting as the server?</li><li>Which port is temporary in this example?</li><li>What does the successful three-way handshake prove?</li><li>Does the handshake prove that the HTTPS application will complete successfully?</li><li>What additional traffic should be inspected if the browser still fails after the handshake?</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What does a port number identify?</strong><br>A transport-layer application endpoint on a host.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. What are the three TCP handshake messages?</strong><br>SYN, SYN-ACK, and ACK.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. Does UDP establish a TCP-style connection before sending data?</strong><br>No. UDP sends independent datagrams without that connection-establishment exchange.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. Does TCP guarantee that an application transaction can never fail?</strong><br>No. TCP provides ordered, acknowledged transport mechanisms, but connections can still fail, reset, time out, or lose reachability.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. Can the same numeric port exist for both TCP and UDP?</strong><br>Yes. TCP and UDP have separate port namespaces.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>6. Why is “UDP is always faster” misleading?</strong><br>UDP has less built-in transport overhead, but actual performance depends on the application, network path, loss, congestion, and recovery behavior.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>7. What should be checked first when a TCP service is unreachable?</strong><br>IP reachability, the correct destination port, server listening state, firewall policy, and whether the TCP handshake completes.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>TCP and UDP solve different transport problems.</strong> TCP maintains connection state and provides ordered byte-stream transport with acknowledgement, retransmission, flow control, and congestion-control behavior. UDP provides minimal datagram transport and leaves more behavior to the application. Correct troubleshooting begins by identifying the transport protocol, port pair, endpoint state, and actual packet exchange.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->