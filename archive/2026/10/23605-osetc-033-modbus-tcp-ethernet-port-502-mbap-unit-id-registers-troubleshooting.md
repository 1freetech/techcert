---
post_id: 23605
title: "OSETC.033: Modbus TCP over Ethernet — Port 502, MBAP Header, Unit IDs, Registers, and Troubleshooting"
live_url: "https://bitcoinversus.tech/2026/10/11/osetc-033-modbus-tcp-ethernet-port-502-mbap-unit-id-registers-troubleshooting/"
slug: "osetc-033-modbus-tcp-ethernet-port-502-mbap-unit-id-registers-troubleshooting"
featured_media_id: 23602
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-033-modbus-tcp-cover-1200x630-1.jpg"
status: publish
content_hash: "62b92971a5763309b4af1203b54a3cf82c843923"
---

<!-- wp:paragraph --><p><strong>Modbus TCP carries the familiar Modbus request-and-response model over standard Ethernet and TCP/IP instead of an RS-485 serial bus.</strong> The register map and function-code concepts remain recognizable, but the transport changes completely: devices are addressed by IP, TCP manages the connection, and each Modbus TCP message begins with a seven-byte MBAP header.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/09/osetc-032-modbus-rtu-rs485-wiring-addressing-function-codes-registers-crc-troubleshooting/">OSETC.032: Modbus RTU Over RS-485</a>. The goal is to separate what stays the same at the Modbus application layer from what changes when the traffic moves onto Ethernet.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Learning Objectives</h2><!-- /wp:heading -->
<!-- wp:list --><ul><li>Explain how Modbus TCP differs from Modbus RTU.</li><li>Identify TCP port 502 and the client/server connection model.</li><li>Read the seven-byte MBAP header.</li><li>Explain the purpose of the Transaction Identifier and Unit Identifier.</li><li>Relate Modbus function codes and registers to Ethernet transport.</li><li>Use basic network tools to troubleshoot timeouts and connection failures.</li><li>Recognize the security limitations of traditional Modbus TCP.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2>Ethernet, TCP/IP, and Modbus Are Different Layers</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Ethernet provides the local network link. IP provides logical addressing and routing. TCP provides a reliable byte stream between endpoints. Modbus defines the industrial application messages carried inside that connection. Keeping those layers separate is one of the fastest ways to troubleshoot a failed system.</p><!-- /wp:paragraph -->
<!-- wp:image {"id":23603,"sizeSlug":"large","linkDestination":"none"} --><figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-033-industrial-ethernet-switch.jpg?w=400" alt="DIN-rail industrial Ethernet switch used in automation networks." class="wp-image-23603" /><figcaption class="wp-element-caption"><em>Industrial Ethernet switch. Photo by eks Engel GmbH &amp; Co. KG, CC BY-SA 3.0 DE, via Wikimedia Commons.</em></figcaption></figure><!-- /wp:image -->
<!-- wp:paragraph --><p>A device can have a perfectly good Ethernet link while Modbus still fails because the wrong IP address, TCP port, function code, register offset, or application setting is being used. Conversely, no amount of register-map troubleshooting can fix a broken Ethernet path.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Modbus TCP Normally Uses TCP Port 502</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The Modbus Organization identifies TCP port <strong>502</strong> as the well-known port for Modbus TCP/IP. A Modbus client opens a TCP connection to the server's IP address and port 502, sends requests, and receives responses over that connection.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>Client: 192.168.10.20
Server: 192.168.10.50
TCP port: 502

Connection target:
192.168.10.50:502</code></pre><!-- /wp:code -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=iuangLrEN-Y","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">[youtube https://www.youtube.com/watch?v=iuangLrEN-Y]</div><figcaption class="wp-element-caption"><em>Dr. Mahmoud Abdelrahim demonstrates PLC-to-HMI communication over Modbus TCP/IP using Ethernet.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2>The MBAP Header Replaces the RTU Address-and-CRC Framing</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A Modbus TCP Application Data Unit starts with a <strong>seven-byte MBAP header</strong> before the normal Modbus function code and data. MBAP stands for Modbus Application Protocol. The header contains four fields:</p><!-- /wp:paragraph -->
<!-- wp:list --><ul><li><strong>Transaction Identifier — 2 bytes:</strong> chosen by the client and copied into the matching response.</li><li><strong>Protocol Identifier — 2 bytes:</strong> normally <code>0x0000</code> for Modbus.</li><li><strong>Length — 2 bytes:</strong> the number of bytes that follow, including the Unit Identifier and Modbus PDU.</li><li><strong>Unit Identifier — 1 byte:</strong> especially useful when a TCP gateway is forwarding the request to a downstream Modbus device.</li></ul><!-- /wp:list -->
<!-- wp:code --><pre class="wp-block-code"><code>MBAP Header (7 bytes)

Transaction ID   2 bytes
Protocol ID      2 bytes
Length           2 bytes
Unit ID          1 byte

Then:
Function Code + Data</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Unlike Modbus RTU, Modbus TCP does not append the Modbus RTU two-byte CRC field to every application message. Error detection and reliable delivery are handled by the Ethernet/TCP/IP stack. That distinction is useful when reading packet captures because the TCP frame is not simply an RTU frame copied byte-for-byte onto Ethernet.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Transaction IDs Let the Client Match Responses</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The Transaction Identifier is one of the most useful fields when analyzing traffic. The client assigns an identifier to a request, and the server copies that value into the corresponding response. In Wireshark or another packet analyzer, matching transaction IDs help determine whether a request received the correct response.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>If requests leave the client but no response with the matching transaction ID returns, the next question is whether the server received the request, rejected it, timed out, or sent a response that was lost or blocked on the network.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>The Unit Identifier Matters Most at Gateways</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>On a direct Ethernet connection, the server is already identified by its IP address and TCP connection. The Unit Identifier becomes especially important when one IP endpoint represents a gateway to several downstream Modbus devices. The gateway can use the Unit ID to choose which serial or internal device should receive the request.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>Do not assume every device treats the Unit Identifier identically. Some direct Modbus TCP servers ignore most Unit ID values, while gateways may require an exact downstream address. Use the device manual rather than guessing.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Function Codes and Registers Still Matter</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Moving to Ethernet does not eliminate Modbus coils and registers. Function 03 still reads holding registers, Function 04 still reads input registers, Function 06 still writes one holding register, and Function 16 still writes multiple holding registers. The register map remains device-specific.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>Example request concept

Server IP: 192.168.10.50
Port: 502
Unit ID: 1
Function: 03 Read Holding Registers
Start offset: 100
Quantity: 2</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The same address-offset trap from Modbus RTU still applies. A manual may display a reference such as <code>40101</code> while the protocol request expects a zero-based offset such as <code>100</code>. Software tools vary, so confirm whether the field expects a raw PDU offset or a human-readable register reference.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IXwUwcahiF4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">[youtube https://www.youtube.com/watch?v=IXwUwcahiF4]</div><figcaption class="wp-element-caption"><em>General Technology Knowledge gives a basic Modbus TCP/IP walkthrough with PLC-oriented examples.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2>Troubleshoot the Network Before the Register Map</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li><strong>Link:</strong> verify the Ethernet port has link and activity where expected.</li><li><strong>IP configuration:</strong> confirm IP address, subnet mask, and gateway.</li><li><strong>Reachability:</strong> use <code>ping</code> when the device permits ICMP, but remember a failed ping does not always prove the device is offline.</li><li><strong>ARP:</strong> confirm the expected MAC address is being learned for a local-subnet device.</li><li><strong>TCP port:</strong> test whether port 502 is reachable with an approved network tool.</li><li><strong>Application role:</strong> confirm which endpoint is the Modbus client and which is the server.</li><li><strong>Unit ID:</strong> confirm the correct value, especially through a gateway.</li><li><strong>Function and offset:</strong> verify the exact manufacturer register map.</li><li><strong>Packet capture:</strong> inspect TCP handshakes, requests, responses, exception codes, retransmissions, and transaction IDs.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Useful Technician Commands</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>Windows
ping 192.168.10.50
arp -a
PowerShell: Test-NetConnection 192.168.10.50 -Port 502

Linux
ping 192.168.10.50
ip neigh
nc -vz 192.168.10.50 502

Packet capture filter
modbus || tcp.port == 502</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Use tools only on networks you are authorized to troubleshoot. A port test proves TCP reachability, not that the correct register data exists. A successful TCP handshake followed by a Modbus exception response is an application-layer clue, not a cabling failure.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Read Modbus Exception Responses</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A Modbus server can respond with an exception when it understood the request framing but cannot perform the requested operation. Common examples include illegal function, illegal data address, and illegal data value. These responses are valuable because they prove communication reached the application layer.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>If there is no TCP connection at all, stay focused on addressing, routing, firewall rules, server availability, and port configuration. If the server returns an exception, move upward to function codes, offsets, quantities, access permissions, and device state.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Field Discussion: TCP Versus RTU</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.reddit.com/r/PLC/comments/1r2u3qo/modbus_tcpip_to_modbus_rtu/","type":"rich","providerNameSlug":"reddit","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">https://www.reddit.com/r/PLC/comments/1r2u3qo/modbus_tcpip_to_modbus_rtu/</div><figcaption class="wp-element-caption"><em>A recent r/PLC discussion compares a working Modbus TCP implementation with the changes required to move the same system to Modbus RTU.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2>Traditional Modbus TCP Is Not Automatically Secure</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Traditional Modbus TCP was designed for interoperability and simplicity, not modern authentication and encryption. Do not expose port 502 directly to untrusted networks. Industrial deployments should use appropriate segmentation, firewall policy, access control, monitoring, and vendor-supported security architecture.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>The Modbus Organization also publishes a Modbus Security specification that adds TLS and certificate-based authentication and uses port 802. Device support must be verified before assuming that a given PLC, drive, gateway, or SCADA package implements it.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Practice Lab</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li>Build or use an authorized lab with one Modbus TCP client and one server.</li><li>Record both IP addresses, subnet masks, and the server's TCP port.</li><li>Verify Ethernet link and IP reachability.</li><li>Test TCP port 502.</li><li>Read one known holding register with Function 03.</li><li>Capture the transaction in Wireshark.</li><li>Identify the Transaction ID, Protocol ID, Length, Unit ID, Function Code, and register offset.</li><li>Intentionally query an unused register and record the returned exception, if the device provides one.</li><li>Change only one variable at a time and document the result.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Knowledge Check</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li>What TCP port is normally used by Modbus TCP?</li><li>How many bytes are in the MBAP header?</li><li>What does the Transaction Identifier do?</li><li>When is the Unit Identifier especially important?</li><li>Does Modbus TCP append the Modbus RTU CRC field?</li><li>Does Function 03 change meaning when the transport changes from RTU to TCP?</li><li>What does a successful TCP connection prove?</li><li>What does a Modbus exception response prove?</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Answer Guide</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li>TCP port 502.</li><li>Seven bytes.</li><li>It lets the client associate a response with the request that generated it.</li><li>When a TCP gateway represents multiple downstream Modbus devices.</li><li>No. Traditional Modbus TCP uses the MBAP header and relies on the underlying Ethernet/TCP/IP stack rather than the RTU CRC field.</li><li>No. Function 03 still means Read Holding Registers.</li><li>That the client reached a listening TCP endpoint; it does not prove the requested register exists or is correct.</li><li>That the request reached the Modbus application layer and the server understood enough of it to reject the operation with a defined exception.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>Modbus TCP is easiest to troubleshoot when you separate the layers.</strong> First prove Ethernet and IP. Then prove TCP port 502. Then inspect the MBAP header, Unit ID, function code, register offset, and device response. Do not jump straight to register scaling when the TCP connection itself is failing.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>References</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Primary references: <a href="https://www.modbus.org/modbus-specifications">Modbus Organization — Specifications and Implementation Guides</a>, <a href="https://www.modbus.org/docs/Modbus_Messaging_Implementation_Guide_V1_0b.pdf">MODBUS Messaging on TCP/IP Implementation Guide V1.0b</a>, and <a href="https://www.modbus.org/file/secure/modbusprotocolspecification.pdf">MODBUS Application Protocol Specification V1.1b3</a>.</p><!-- /wp:paragraph -->
<!-- wp:separator --><hr class="wp-block-separator has-alpha-channel-opacity" /><!-- /wp:separator -->
<!-- wp:paragraph --><p><strong>Advertisement</strong></p><!-- /wp:paragraph -->
<!-- wp:shortcode -->[tweet https://twitter.com/1BitcoinVersus/status/1937006164555993338]<!-- /wp:shortcode -->
<!-- wp:paragraph --><p><strong><em><sup>BitcoinVersus.Tech Editor's Note:</sup></em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em><sup>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our independent technical education work, please donate Bitcoin here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</sup></em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This lesson is for informational and educational purposes.</em></p><!-- /wp:paragraph -->