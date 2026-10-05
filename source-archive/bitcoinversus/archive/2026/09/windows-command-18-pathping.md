---
title: "Windows Command #18 – pathping (Windows OS)"
status: published
wordpress_post_id: 19674
published: "2026-09-30T22:27:18"
live_url: "https://bitcoinversus.tech/2026/09/30/windows-command-18-pathping/"
series: "Windows Commands"
command_number: 18
featured_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/09/windows-command-18-pathping-cover.jpg"
youtube: "https://www.youtube.com/watch?v=ynUGngoK8sU"
---

# Windows Command #18 – pathping (Windows OS)

A video call keeps freezing. You can reach the website, but something along the connection may be unreliable. Your next step is to collect evidence before changing settings.

In [Windows Command #17, tracert](https://bitcoinversus.tech/2026/09/27/windows-command-17-tracert/), you learned to inspect the route. `pathping` follows that route and repeatedly probes its hops to estimate delay and packet loss.

## Start with a familiar destination

Open Command Prompt and run:

`pathping /n microsoft.com`

The `/n` option skips name lookups for intermediate routers. The command lists hops first, then collects statistics. Let it finish; this stage can take a few minutes.

For a shorter practice sample, request 20 probes per hop:

`pathping /n /q 20 microsoft.com`

The default is 100. A smaller sample is quicker, but gives you less evidence.

## Watch the command in action

Watch the demonstration, then return to your own report and identify the destination row.

https://www.youtube.com/watch?v=ynUGngoK8sU

*Roger Zimmerman — How the pathping command works.*

## Read the results carefully

**RTT** means round-trip time. **Lost/Sent** compares missing replies with probes sent. For example, 2 missing replies out of 20 is 10%.

**Source to Here** summarizes results from your computer to that hop. **This Node/Link** estimates loss at an individual router or link; a vertical bar marks a link row.

Loss shown at one router does not necessarily mean it fails to forward traffic. Compare later hops and the destination before blaming a device.

## Practice: write a useful support note

Run one test to a destination you normally use. Record the time, destination, whether you used Wi-Fi or Ethernet, and the destination’s reported loss. Write: “At [time], pathping to [destination] reported [result] while [symptom] occurred.”

If the symptom returns, repeat the same test and compare your notes. Include incomplete results rather than guessing what missing replies mean.

## Key takeaway

`pathping` helps you investigate an unreliable connection by collecting route and reply statistics. Use the report as evidence to investigate, rather than a reason to replace equipment immediately.

Reference: [Microsoft Learn: pathping syntax and output](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/pathping).
