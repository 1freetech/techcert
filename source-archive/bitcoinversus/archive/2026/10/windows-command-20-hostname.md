---
title: "Windows Command #20 – hostname (Windows OS)"
status: published
wordpress_post_id: 19775
published: "2026-10-01T10:53:19"
live_url: "https://bitcoinversus.tech/2026/10/01/windows-command-20-hostname/"
series: "Windows Command"
lesson_number: "20"
command: "hostname"
featured_media_id: 19779
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-20-hostname-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=GQuyFINGUVo"
---

# Windows Command #20 – hostname (Windows OS)

The Windows **`hostname`** command displays the host-name portion of the computer's full name.

## Basic Command

```bat
hostname
```

Example:

```text
DC-TECH-01
```

That is the computer's host name and can help a technician identify the machine being serviced.

## Video

https://www.youtube.com/watch?v=GQuyFINGUVo

## Another Way to Check

```bat
echo %COMPUTERNAME%
```

Microsoft notes that this usually returns the same computer name, commonly in uppercase.

## Data Center Example

Before working from a maintenance ticket, run `hostname` and compare the returned name with the asset or ticket record.

## Networking Example

Host names make it easier to distinguish computers connected to the same network.

## Practice

1. Open Command Prompt.
2. Run `hostname`.
3. Write down the returned computer name.
4. Run `echo %COMPUTERNAME%`.
5. Compare the results.

## Key Takeaway

`hostname` is a quick identification command that tells a technician the name of the Windows computer being used.
