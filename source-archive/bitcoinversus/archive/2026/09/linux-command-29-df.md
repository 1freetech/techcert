---
title: "Linux Command #29 – df (Linux OS)"
status: published
wordpress_post_id: 19232
wordpress_status: publish
published: "2026-09-27T18:05:42"
live_url: "https://bitcoinversus.tech/2026/09/27/linux-command-29-df-check-available-disk-space/"
series: "Linux Commands"
command_number: 29
youtube: "https://www.youtube.com/watch?v=dcBWezi-yOY"
---

# Linux Command #29 – df (Linux OS)

The Linux `df` command answers a simple question: **how much storage space is available?**

## Start With df -h

```bash
df -h
```

The `-h` option means human-readable, displaying familiar sizes such as MB, GB, and TB.

## Simple Example

```text
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       500G  300G  200G  60% /
```

The example shows about 500 GB total, 300 GB used, and 200 GB available.

## Familiar Examples

- Gaming: Is there enough space for another game?
- Movies/music: Is there room for downloads?
- Photos: Is storage getting full?
- Bitcoin mining: Does a Linux management computer still have free disk space?

## Try It

Run `df -h` and locate **Size**, **Avail**, and **Use%**.

## Video Reference

CodeLucky — Linux df Command Tutorial: Display Disk Space & File Systems.

https://www.youtube.com/watch?v=dcBWezi-yOY

## Practice

1. Run `df -h`.
2. Find total storage.
3. Find available storage.
4. Find the percentage in use.
5. Explain what `df -h` tells you.

## Key Takeaway

Remember `df -h` as: **How much storage do I have left?**
