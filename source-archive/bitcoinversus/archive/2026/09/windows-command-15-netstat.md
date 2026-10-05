---
title: "Command #15 – netstat (Windows OS)"
publication_date: "2026-09-26"
wordpress_post_id: 18631
status: published
live_url: "https://bitcoinversus.tech/2026/09/26/command-15-netstat-windows-os/"
categories:
  - Windows
  - Information Technology
  - Tech Docs
  - Technology
series: "Windows Commands"
lesson_number: 15
---

# Command #15 – netstat (Windows OS)

Windows Command #15 covers `netstat`, a built-in command-line utility for examining network connections, listening ports, protocol statistics, process IDs, and routing information.

## Show Active Connections
```cmd
netstat
```
Used without parameters, `netstat` displays active TCP connections.

## Show Connections and Listening Ports
```cmd
netstat -a
```
The `-a` option adds TCP and UDP listening ports.

## Use Numeric Addresses
```cmd
netstat -n
```
The `-n` option displays IP addresses and port numbers numerically.

## Find the Owning Process
```cmd
netstat -ano
```
This combination displays connections and listening ports numerically and includes the owning process ID (PID). Compare the PID with Task Manager to identify the application using a connection or port.

## Filter the Output
```cmd
netstat -ano | findstr LISTENING
netstat -ano | findstr :443
```
Piping output into `findstr` helps isolate a connection state or port.

## Protocol Statistics and Routes
```cmd
netstat -s
netstat -r
```
`netstat -s` displays statistics by protocol. `netstat -r` displays the IP routing table, equivalent to `route print`.

## Practical Troubleshooting
If an application cannot accept connections, first confirm that the expected port is listening. If a port is unexpectedly occupied, use `netstat -ano` to obtain its PID and identify the owning process. Treat unfamiliar connections as leads for investigation, not automatic proof of malicious activity.

## Video Reference
PowerCert Animated Videos — NETSTAT Command Explained

https://www.youtube.com/watch?v=8UZFpCQeXnM

## Practice
Open Command Prompt and run `netstat -ano`. Identify one ESTABLISHED connection and one LISTENING entry, note their local ports and PIDs, and locate the corresponding process in Task Manager.

## Reference
Microsoft Learn documentation for the Windows `netstat` command.
