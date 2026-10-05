---
title: "Windows Command #21 – getmac (Windows OS)"
status: published
wordpress_post_id: 19861
published: "2026-10-01T12:58:54"
live_url: "https://bitcoinversus.tech/2026/10/01/windows-command-21-getmac/"
series: "Windows Commands"
lesson_number: "21"
command: "getmac"
featured_media_id: 19864
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-21-getmac-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=bW760ckr3mo"
---

# Windows Command #21 – getmac (Windows OS)

The Windows `getmac` command displays MAC addresses associated with network adapters.

## Basic Syntax

```bat
getmac
```

The most important beginner field is **Physical Address**.

## Verbose Output

```bat
getmac /v
```

The `/v` option adds more adapter details.

## Video

https://www.youtube.com/watch?v=bW760ckr3mo

## Table Output

```bat
getmac /fo table /v
```

## Troubleshooting Example

If a switch or DHCP server shows a device by MAC address, compare that value with the output from `getmac /v` on the Windows computer.

## Data Center Example

A technician can compare a server NIC's MAC address with the address learned on a switch port to help verify the physical connection.

## MAC Address vs. IP Address

An IP address identifies a device logically on an IP network and can change. A MAC address identifies a network interface at the data-link layer, though virtualization and privacy features can alter the address presented by software.

## Practice

1. Open Command Prompt.
2. Run `getmac`.
3. Count the physical addresses.
4. Run `getmac /v`.
5. Identify the address for the active Ethernet or Wi-Fi adapter.

## Key Takeaway

`getmac` is a fast way to identify Windows network-adapter MAC addresses for troubleshooting, inventory, switch, and DHCP work.
