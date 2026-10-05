---
title: "Linux Command #32 – uptime (Linux OS)"
status: published
wordpress_post_id: 19770
published: "2026-10-01T10:50:28"
live_url: "https://bitcoinversus.tech/2026/10/01/linux-command-32-uptime/"
series: "Linux Command"
lesson_number: "32"
command: "uptime"
featured_media_id: 19772
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-32-uptime-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=U0HnfE6gLq8"
---

# Linux Command #32 – uptime (Linux OS)

The Linux **`uptime`** command quickly shows how long a computer has been running, how many user sessions are active, and recent system load.

## Basic Command

```bash
uptime
```

Example:

```text
10:24:17 up 3 days, 4:26, 2 users, load average: 0.18, 0.24, 0.20
```

The output shows current time, time since boot, logged-in sessions, and load averages over approximately 1, 5, and 15 minutes.

## Video

https://www.youtube.com/watch?v=U0HnfE6gLq8

## Pretty Output

```bash
uptime -p
```

Example:

```text
up 3 days, 4 hours, 26 minutes
```

## System Start Time

```bash
uptime -s
```

This shows when the system started.

## Technician Example

If a server unexpectedly returns online, `uptime` can quickly reveal whether it recently rebooted.

## Bitcoin Mining Example

On a Linux management computer at a mining site, `uptime` can show whether the management system recently restarted before a technician investigates applications, networking, or connected miners.

## Practice

1. Run `uptime`.
2. Identify how long the machine has been running.
3. Run `uptime -p`.
4. Run `uptime -s`.
5. Identify the system start time.

## Key Takeaway

`uptime` is a fast first-check command for system running time, active user sessions, and recent load.
