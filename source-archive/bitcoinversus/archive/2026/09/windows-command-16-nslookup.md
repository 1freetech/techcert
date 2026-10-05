# Windows Command #16: nslookup — Check DNS from Command Prompt

- Published: 2026-09-27
- Live URL: https://bitcoinversus.tech/2026/09/27/windows-command-16-nslookup-check-dns-from-command-prompt/
- WordPress Post ID: 19238
- Series: Windows Command Tech Docs
- Subject: Windows / DNS / Networking

**Windows Command #16** introduces `nslookup`, a simple built-in command for asking DNS which IP address is associated with a domain name.

## What nslookup does

DNS works a little like a contacts list: people remember a name such as `example.com`, while computers use network addresses. `nslookup` lets you inspect that lookup from Windows Command Prompt.

## Try it

```cmd
nslookup example.com
```

Open Command Prompt, type the command, and press Enter. The output normally identifies the DNS server used for the query and returns address information for the requested domain.

## Practical exercise

1. Run `nslookup example.com`.
2. Find the DNS server shown near the top.
3. Find the returned address or addresses.
4. Run the command again with another familiar website and compare the result.

## Why technicians use it

If a website name is not resolving, `nslookup` provides a fast first check of DNS. It helps separate a name-resolution problem from other connectivity problems.

## Video reference

Use a topic-specific YouTube demonstration of Windows `nslookup` as the visual reference for this lesson. Video references should directly teach the command rather than serve as generic filler.

## Key takeaway

`nslookup` asks DNS for information about a name. For a beginner, remember: **name in → DNS lookup → address information out**.
