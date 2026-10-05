---
title: "OSNTC.005: DHCP Basics"
status: published
wordpress_post_id: 19750
published: "2026-10-01T07:33:20"
live_url: "https://bitcoinversus.tech/2026/10/01/osntc-005-dhcp-basics/"
series: "Open-Source Networking Technician Certification"
certification: OSNTC
pathway: technician
lesson_number: "005"
featured_media_id: 19753
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc-005-dhcp-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=e6-TaH5bkjo"
---

# OSNTC.005: DHCP Basics

**DHCP** stands for Dynamic Host Configuration Protocol. It automatically gives a device the network settings it needs instead of requiring a technician to enter every setting by hand.

## A Simple Example

```text
IP address:      192.168.1.25
Subnet mask:     255.255.255.0
Default gateway: 192.168.1.1
DNS server:      192.168.1.1
```

If these values were not entered manually, DHCP may have supplied them automatically.

## DHCP Server and Client

The device asking for settings is the **DHCP client**. The device or service supplying them is the **DHCP server**. A small router often provides DHCP; larger networks may use a dedicated server.

## Video: DHCP Explained

PowerCert Animated Videos:

https://www.youtube.com/watch?v=e6-TaH5bkjo

## Dynamic vs. Static

A **dynamic** address is assigned automatically and may change. A **static** address is intentionally kept at a specific value.

## DHCP Lease

DHCP usually lends an address for a period of time. That assignment is a **lease**, which the client can renew.

## Technician Check

When a device should use DHCP but cannot reach the network, check whether it received an IP address, subnet mask, default gateway, and DNS server.

## Data Center Example

A service laptop may receive an address automatically on a management network. Infrastructure devices may use fixed addresses or DHCP reservations so technicians can reliably find them again.

## Practice

1. Connect a computer to a network that uses DHCP.
2. Find its IP address.
3. Find its subnet mask.
4. Find its default gateway.
5. Identify whether the settings were entered manually or assigned automatically.

## Key Takeaway

DHCP automatically supplies network settings to clients and is an important technician troubleshooting point when a device does not receive the expected configuration.
