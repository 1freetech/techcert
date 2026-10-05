---
title: "Windows Command #17 – tracert (Windows OS)"
status: published
wordpress_post_id: 19257
published: "2026-09-27T18:50:45"
live_url: "https://bitcoinversus.tech/2026/09/27/windows-command-17-tracert/"
series: "Windows Commands"
command_number: 17
youtube: "https://www.youtube.com/watch?v=CI3-AuWYDqA"
---

# Windows Command #17 – tracert (Windows OS)

The Windows `tracert` command shows the path your computer takes toward another computer or website.

## Basic Command

```bat
tracert microsoft.com
```

Think of each **hop** as another stop on a road trip toward the destination.

## Simple Example

```text
1    2 ms    1 ms    2 ms    192.168.1.1
2   12 ms   11 ms   13 ms    ...
3   20 ms   19 ms   21 ms    ...
```

The left number is the hop number. The times are milliseconds.

## Familiar Examples

- Gaming: inspect the route toward an online destination.
- Websites: see the network path toward a site.
- Home networking: the first hop is often a local network device such as your router.

An asterisk does not automatically mean the Internet is broken; some devices do not return the response `tracert` expects.

## Video Reference

Laurence Tindall — How to Run a Traceroute in Windows 10 & 11.

https://www.youtube.com/watch?v=CI3-AuWYDqA

## Practice

1. Open Command Prompt.
2. Run `tracert microsoft.com`.
3. Find hop 1.
4. Count the hops.
5. Explain a hop in your own words.

## Key Takeaway

`tracert` shows the path toward a network destination one hop at a time.
