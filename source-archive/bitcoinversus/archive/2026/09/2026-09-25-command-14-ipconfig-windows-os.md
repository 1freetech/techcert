---
title: "Command #14 – ipconfig (Windows OS)"
date: "2026-09-25T20:52:48"
status: "publish"
wordpress_post_id: 18569
live_url: "https://bitcoinversus.tech/2026/09/25/command-14-ipconfig-windows-os/"
categories:
  - Windows
  - Information Technology
  - Tech Docs
  - Technology
---

# Command #14 – ipconfig (Windows OS)

Windows `ipconfig` is a fast command-line tool for inspecting a machine's TCP/IP configuration and troubleshooting DHCP, gateway, and DNS problems. Microsoft documents it for Windows 10, Windows 11, Windows Server, and Azure Local.

## Basic network configuration

```cmd
ipconfig
```

The basic output shows IPv4 and IPv6 addresses, subnet information, and the default gateway for network adapters.

## Get the full adapter details

```cmd
ipconfig /all
```

Use `/all` when you need more detail, including adapter information, DHCP state, DNS configuration, and physical addressing. In a server rack or data-center troubleshooting session, this is usually the most useful starting point.

## Renew a DHCP address

```cmd
ipconfig /release
ipconfig /renew
```

These commands release and renew DHCP configuration. Be careful when running them remotely because releasing the active adapter can interrupt the connection you are using to administer the machine.

## Flush the DNS resolver cache

```cmd
ipconfig /flushdns
```

This clears the local DNS resolver cache. It is useful when a hostname resolves incorrectly after a DNS record has changed or when testing name-resolution problems.

## Field troubleshooting workflow

```cmd
ipconfig /all
ping <default-gateway>
nslookup example.com
tracert example.com
```

Read the commands as a sequence: verify local addressing, test the gateway, test DNS resolution, then inspect the path beyond the local network. If the address begins with `169.254`, investigate DHCP connectivity because Windows can use an automatic private address when it cannot obtain the expected DHCP configuration.

## Official references

Microsoft Learn: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/ipconfig

Microsoft Support: https://support.microsoft.com/en-us/windows/experience/connectivity-networking/fix-ethernet-connection-problems-in-windows

## Video lesson

https://www.youtube.com/watch?v=2a5B9QX4Yw8

BitcoinVersus.tech Tech Docs focuses on practical field-ready commands for computing, networking, data centers, electrical infrastructure, and Bitcoin mining operations.
