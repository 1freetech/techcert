---
title: "Command #27 – ip (Linux OS)"
date: "2026-09-25T16:32:20"
status: "publish"
wordpress_post_id: 18541
live_url: "https://bitcoinversus.tech/2026/09/25/command-27-ip-linux-os/"
categories:
  - Information Technology
  - Linux+
  - Tech Docs
  - Technology
---

# Command #27 – ip (Linux OS)

The Linux `ip` command is one of the most useful tools for checking network interfaces, addresses, routes, and neighbors from the terminal. For data-center technicians, server operators, and miners, it is a fast first stop when a machine has lost connectivity.

## Start with the interface list

```bash
ip addr show
```

This displays network interfaces and their IPv4/IPv6 addresses. For a shorter view:

```bash
ip -br addr
```

## Check the physical link

```bash
ip link show
```

Look for interface state, MTU, and MAC address. An administratively down interface can be enabled with `sudo ip link set eth0 up`. Replace `eth0` with the actual interface name.

## Check the route to the network

```bash
ip route
ip route get 1.1.1.1
```

`ip route` shows the routing table and default gateway. `ip route get` asks the kernel which route it would use for a destination.

## Check neighboring devices

```bash
ip neigh
```

This displays the neighbor table, including IP-to-MAC mappings learned on the local network.

## Practical troubleshooting sequence

```bash
ip -br addr
ip link show
ip route
ip neigh
ping -c 4 <gateway-ip>
```

This sequence answers five basic questions: Does the interface exist? Is it up? Does it have an address? Is there a route? Can the machine reach its gateway?

## Video demonstration

https://www.youtube.com/watch?v=Kf4j_84cwNY

## Reference

Linux ip-route manual:
https://man7.org/linux/man-pages/man8/ip-route.8.html

BitcoinVersus.tech Tech Docs focuses on practical commands and field-ready troubleshooting for computing, networking, electrical systems, data centers, and Bitcoin mining infrastructure.
