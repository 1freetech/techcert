---
title: "OSFTC.001: Firmware Images, Safe Flashing, Bootloaders, and Recovery Basics"
status: published
wordpress_post_id: 20534
published: "2026-10-04T02:16:55"
live_url: "https://bitcoinversus.tech/2026/10/04/osftc-001-firmware-images-safe-flashing-bootloaders-recovery-basics/"
series: "Open Source Firmware Technician Certification"
pathway: firmware/technician
lesson_number: "001"
featured_media_id: 20530
youtube_1: "https://www.youtube.com/watch?v=dARiwyQ3IJ0"
youtube_2: "https://www.youtube.com/watch?v=qMUzLU636s8"
youtube_3: "https://www.youtube.com/watch?v=IC108KdVYz4"
canonical_archive: "1freetech/Bitcoinversus.tech/archive/2026/10/osftc-001-firmware-images-safe-flashing-bootloaders-recovery-basics.md"
---

# OSFTC.001: Firmware Images, Safe Flashing, Bootloaders, and Recovery Basics

The first Open Source Firmware Technician lesson establishes the field workflow for identifying hardware, validating firmware images, preserving recoverability, flashing through supported interfaces, and proving the device works afterward.

## Core outcomes

Learners should be able to identify the exact target and hardware revision; record current firmware and bootloader state; back up configuration and recoverable data; distinguish integrity from authenticity; understand bootloaders and recovery modes; use UART, SWD, and JTAG safely; control erase/program/verify workflows; recognize raw binary address risks; preserve rollback paths; and perform post-flash functional validation.

## Safe firmware workflow

```text
identify target
      ↓
record current state
      ↓
back up configuration/image when supported
      ↓
verify approved image + compatibility
      ↓
confirm recovery path
      ↓
flash with stable power
      ↓
verify programmed contents
      ↓
reboot and validate workload
      ↓
document evidence + rollback state
```

## Key field principles

- Start with the target, not the file.
- Never assume a similar board uses the same image or recovery path.
- A checksum/hash can prove integrity relative to a trusted reference; it does not by itself prove authenticity.
- Avoid unnecessary full-chip erase operations.
- Treat bootloader, firmware image, configuration, calibration, keys, and factory data as separate assets.
- A successful flash is not the same as a successful repair.
- Preserve a documented recovery/rollback route before making the change.

## Videos

1. https://www.youtube.com/watch?v=dARiwyQ3IJ0 — STM32 boot modes and SWD.
2. https://www.youtube.com/watch?v=qMUzLU636s8 — SWD/ST-Link programming and debugging.
3. https://www.youtube.com/watch?v=IC108KdVYz4 — JTAG/SWD debug protocols and flash programming.

## Prior BitcoinVersus foundations linked in the live lesson

- Armv8-M architecture
- Braiins firmware compatibility/install restrictions
- AxeOS open-source firmware fundamentals
- Solo Satoshi Bitaxe/NerdAxe web flasher
- NMAxe safer recovery
- AxeOS first-boot-to-first-share validation

Canonical live lesson: https://bitcoinversus.tech/2026/10/04/osftc-001-firmware-images-safe-flashing-bootloaders-recovery-basics/
