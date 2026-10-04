---
title: "OSNTC.014: TCP and UDP Transport Basics"
status: published
wordpress_post_id: 20611
published: "2026-10-04T03:14:16"
live_url: "https://bitcoinversus.tech/2026/10/04/osntc-014-tcp-udp-transport-basics/"
series: "Open Source Networking Technician Certification"
subject: networking
lesson_number: "014"
featured_media_id: 20609
canonical_archive: "1freetech/Bitcoinversus.tech/archive/2026/10/osntc-014-tcp-udp-transport-basics.md"
---

# OSNTC.014: TCP and UDP Transport Basics

This lesson teaches transport-layer fundamentals after OSNTC.013 Router Basics.

## Core outcomes

Learners should be able to explain the difference between IP forwarding and transport-layer delivery; identify TCP and UDP port numbers; describe the IANA port ranges; explain the TCP SYN → SYN-ACK → ACK handshake; explain sequence numbers, acknowledgements, retransmission, flow control, and congestion-control concepts; explain the UDP datagram model; distinguish protocol overhead from actual end-to-end performance; identify common TCP/UDP services; and troubleshoot transport-layer failures using endpoint state and packet evidence.

## Standards and references

- RFC 9293 — Transmission Control Protocol (TCP)
- RFC 8085 — UDP Usage Guidelines
- IANA Service Name and Transport Protocol Port Number Registry

## Videos

1. https://www.youtube.com/watch?v=uwoD5YsGACg
2. https://www.youtube.com/watch?v=rmFX1V49K8U
3. https://www.youtube.com/watch?v=jE_FcgpQ7Co

## Important corrections to common shorthand

- TCP does not guarantee that an application transaction can never fail.
- UDP does not mean an application cannot implement reliability.
- UDP does not make packets inherently travel faster through routers.
- TCP and UDP use separate port namespaces, so the same numeric port can exist for both.
- HTTP/3 uses QUIC over UDP rather than TCP.

Next networking technician lesson: OSNTC.015.
