---
title: "OSNTC.006: DNS Basics"
status: published
wordpress_post_id: 19831
published: "2026-10-01T12:17:19"
live_url: "https://bitcoinversus.tech/2026/10/01/osntc-006-dns-basics/"
series: "Open-Source Networking Technician Certification"
certification: OSNTC
pathway: technician
tier: 1
lesson_number: "006"
featured_media_id: 19834
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc-006-dns-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=mpQZVYPuDGU"
---

# OSNTC.006: DNS Basics

DNS stands for **Domain Name System**. Its basic job is to help devices turn easy-to-remember names such as `example.com` into IP addresses that computers can use to communicate.

This lesson follows **OSNTC.005: DHCP Basics**. DHCP can provide DNS-server addresses; DNS then helps the device find services by name.

## Names and IP Addresses

People remember names more easily than numeric addresses. DNS connects the two.

## A Simple DNS Lookup

1. You enter a domain name.
2. Your device asks its configured DNS resolver.
3. The DNS system finds or retrieves the appropriate record.
4. The resolver returns the answer.
5. Your device can contact the destination using the returned address.

## Video

https://www.youtube.com/watch?v=mpQZVYPuDGU

## DNS Resolver

A DNS resolver is the DNS server your device asks for help. Its address may be supplied through DHCP or configured manually.

## A and AAAA Records

An **A record** maps a name to an IPv4 address. An **AAAA record** maps a name to an IPv6 address.

## Test DNS With nslookup

```
nslookup example.com
```

A technician can use `nslookup` to distinguish name-resolution trouble from general network-connectivity trouble.

## Data Center Example

If a server is reachable by IP address but not hostname, the network path may be working while DNS configuration or records need attention.

## Bitcoin Mining Example

A miner may use a pool hostname. DNS must resolve that hostname before the miner can connect, so DNS failure can look like pool-connectivity trouble.

## Practice

1. Explain DNS in one sentence.
2. Find the DNS server configured on your computer.
3. Run `nslookup example.com`.
4. Identify the name queried and address returned.
5. Explain why IP connectivity without hostname resolution can point toward DNS.

## Key Takeaway

DNS translates human-friendly names into network information such as IP addresses. Technician fundamentals are identifying the configured resolver, testing a lookup, and recognizing name-resolution failures.
