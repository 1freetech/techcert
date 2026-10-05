---
title: "Command #13 – systeminfo (Windows OS)"
date: "2026-09-24T20:16:35"
wordpress_post_id: 18452
live_url: "https://bitcoinversus.tech/2026/09/24/command-13-systeminfo-windows-os/"
slug: "command-13-systeminfo-windows-os"
categories:
  - CompTIA Network+
  - Information Technology
  - Tech Docs
  - technology
---

# Command #13 – systeminfo (Windows OS)

The Windows `systeminfo` command gives technicians a fast way to inspect a computer from Command Prompt. It reports the Windows version, system manufacturer and model, BIOS information, installed memory, network adapters, boot time, and other configuration details without opening several different menus.

## Basic command

```cmd
systeminfo
```

Open Command Prompt, type the command, and press Enter. Windows will collect the local machine's configuration and print the results in the terminal.

## What to look for

- **OS Name and OS Version:** useful when confirming the installed Windows edition and build.
- **System Manufacturer and System Model:** useful when identifying unfamiliar hardware.
- **BIOS Version:** useful during firmware and hardware troubleshooting.
- **Total Physical Memory:** a quick check of installed RAM.
- **System Boot Time:** shows when the machine last started.
- **Network Card(s):** provides information about detected network adapters.

## Useful output formats

```cmd
systeminfo /fo list
systeminfo /fo table
systeminfo /fo csv
```

Microsoft supports LIST, TABLE, and CSV output. CSV is especially useful when system information needs to be saved or processed as structured data.

## Check another Windows computer

```cmd
systeminfo /s COMPUTERNAME
```

The `/s` option targets a remote computer by name or IP address when the user has the required access. Microsoft also provides `/u` and `/p` options for supplying account credentials. Avoid putting passwords directly into reusable scripts or documentation.

## Why technicians use systeminfo

For field support, data-center work, and ordinary Windows troubleshooting, `systeminfo` is a useful first inspection command. Before changing drivers, firmware, networking, or operating-system settings, a technician can establish what machine and Windows build they are actually working on.

## Quick practice

```cmd
systeminfo
systeminfo /fo table
systeminfo /fo csv
```

Compare the three outputs. Then locate the OS version, BIOS version, installed memory, boot time, and network adapter information.

## Official reference

Microsoft documents the complete syntax and supported parameters in its official Windows command reference: https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/systeminfo

---

**BitcoinVersus.Tech Editor's Note:**  
We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb

https://x.com/1BitcoinVersus/status/1937006164555993338

BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.
