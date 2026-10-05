---
title: "Command #26 – ss (Linux OS)"
date: "2026-09-24T20:17:55"
wordpress_post_id: 18453
live_url: "https://bitcoinversus.tech/2026/09/24/command-26-ss-linux-os/"
slug: "command-26-ss-linux-os"
categories:
  - Information Technology
  - Linux+
  - Tech Docs
  - technology
---

# Command #26 – ss (Linux OS)

The Linux `ss` command shows socket statistics and active network connections. It is one of the fastest command-line tools for checking which ports are listening, which TCP or UDP connections exist, and which processes are using network sockets.

## Basic command

```bash
ss
```

Running `ss` with no options displays open non-listening sockets, including established connections.

## Show listening ports

```bash
ss -l
```

The `-l` option limits the output to listening sockets. This is useful when checking whether a server or service is actually waiting for connections.

## TCP and UDP

```bash
ss -t
ss -u
ss -t -a
ss -u -a
```

`-t` selects TCP sockets, `-u` selects UDP sockets, and `-a` includes both listening and non-listening sockets.

## A practical technician command

```bash
ss -tulpn
```

This combination is useful during Linux and data-center troubleshooting. It can show TCP and UDP sockets, listening ports, numeric addresses and ports, and process information. Process details may require elevated permissions depending on the system.

## Why ss matters

If a web server, monitoring agent, database, mining service, or other network application appears unreachable, `ss` helps answer a basic question: is the service actually listening on the expected port? It can also help identify established connections and unexpected network listeners before deeper troubleshooting begins.

## Quick practice

```bash
ss
ss -l
ss -t -a
ss -u -a
ss -tulpn
```

Compare the output from each command. Look for the socket type, state, local address and port, peer address and port, and process information when available.

## Reference

The Linux `ss(8)` manual describes the command as a utility for investigating sockets and documents its TCP, UDP, listening, process, numeric-output, filtering, and socket-statistics options.

---

**BitcoinVersus.Tech Editor's Note:**  
We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb

https://x.com/1BitcoinVersus/status/1937006164555993338

BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.
