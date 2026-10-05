---
title: "OSNTC.014: TCP and UDP Transport Basics"
status: published
wordpress_post_id: 20611
published: "2026-10-04T03:14:16"
live_url: "https://bitcoinversus.tech/2026/10/04/osntc-014-tcp-udp-transport-basics/"
series: "Open-Source Networking Technician"
pathway: networking
lesson_number: "014"
featured_media_id: 20609
canonical_archive: "1freetech/Bitcoinversus.tech/archive/2026/10/osntc-014-tcp-udp-transport-basics.md"
---

# OSNTC.014: TCP and UDP Transport Basics

TCP and UDP operate above IP and provide application-facing transport through port numbers.

## Learning objectives

After this lesson, the learner should be able to:

- explain the role of TCP and UDP relative to IP;
- explain TCP/UDP port numbers and the IANA System, User, and Dynamic/Private ranges;
- describe the TCP three-way handshake;
- explain sequence numbers, acknowledgements, retransmission, flow control, and congestion-control concepts;
- explain UDP's connectionless datagram model and 8-byte base header;
- explain why UDP does not automatically mean an unreliable application;
- explain why UDP is not inherently faster at every layer;
- recognize common TCP/UDP service patterns, including DNS and QUIC/HTTP/3;
- distinguish switches, routers, and endpoint transport protocols;
- troubleshoot failed TCP handshakes and missing UDP responses.

## Key references

- RFC 9293 — TCP
- RFC 8085 — UDP Usage Guidelines
- IANA Service Name and Transport Protocol Port Number Registry

## Videos

1. PowerCert Animated Videos — https://www.youtube.com/watch?v=uwoD5YsGACg
2. David Bombal — https://www.youtube.com/watch?v=rmFX1V49K8U
3. Practical Networking — https://www.youtube.com/watch?v=jE_FcgpQ7Co

## Key rule

Transport troubleshooting starts by identifying the protocol, source/destination IPs, source/destination ports, endpoint listening state, and the actual packet exchange.

Next lesson: OSNTC.015.
