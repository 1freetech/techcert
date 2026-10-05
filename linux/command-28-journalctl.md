---
title: "Command #28 – `journalctl` (Linux OS)"
publication_date: "2026-09-26"
wordpress_post_id: 18625
status: published
live_url: "https://bitcoinversus.tech/2026/09/26/linux-command-28-troubleshoot-system-logs-with-journalctl/"
categories:
  - Linux+
  - Tech Docs
  - Information Technology
  - Technology
series: "Linux Commands"
lesson_number: 28
---

# Command #28 – `journalctl` (Linux OS)

Linux Command #28 covers `journalctl`, the command-line interface for reading and filtering logs collected by `systemd-journald`. For technicians and administrators, it is one of the fastest ways to investigate failed services, boot problems, authentication events, and other system behavior.

## Start With the Journal

```bash
journalctl
```

Running the command without filters displays journal entries available to your account. Because a busy system can produce a large amount of output, practical troubleshooting usually starts by narrowing the results.

## Current Boot

```bash
journalctl -b
```

The `-b` option limits output to the current boot. This is useful when a server, workstation, or data-center system developed a problem after its most recent restart.

## Inspect One Service

```bash
journalctl -u ssh
journalctl -u nginx
journalctl -u docker
```

The `-u` option filters by a systemd unit. Substitute the actual service name on your system. This is especially useful after `systemctl status` reports that a service failed.

## Watch Logs Live

```bash
journalctl -u ssh -f
```

The `-f` option follows new journal entries as they arrive. A technician can keep this running while reproducing a fault in another terminal.

## Filter by Time

```bash
journalctl --since "1 hour ago"
journalctl --since "today"
journalctl -u ssh --since "yesterday"
```

Time filtering reduces noise when you know approximately when an incident occurred.

## Show Errors

```bash
journalctl -p err
journalctl -b -p err
```

The priority filter can isolate higher-severity messages. Combining it with `-b` is a useful first check after a problematic boot.

## Kernel Messages

```bash
journalctl -k
journalctl -k -b
```

Kernel messages can reveal hardware detection, storage, driver, networking, and other low-level problems. In data-center troubleshooting, these entries can help distinguish an application failure from an operating-system or hardware issue.

## A Practical Troubleshooting Pattern

```bash
systemctl status ssh
journalctl -u ssh -b
journalctl -u ssh --since "30 minutes ago"
journalctl -u ssh -f
```

First check service status. Then inspect that service's current-boot history, narrow the time window, and finally follow the log while reproducing the problem.

## Be Careful With Log Cleanup

`journalctl` also supports journal maintenance and vacuum operations. Do not remove logs casually. Production environments may have operational, security, audit, or retention requirements. Preserve evidence before deleting historical records.

## Video Reference

Learn Linux TV — journalctl Basics: How to Easily Check Your Linux Logs

https://www.youtube.com/watch?v=0dG3vUYt7Uk

## Practice

On a systemd-based Linux test machine, identify one running service with `systemctl`. Use `journalctl -u` to inspect its logs, restrict the results to the current boot, then follow new entries live.

## Reference

systemd journal documentation and Learn Linux TV's Linux Crash Course lesson on `journalctl`.
