---
title: "OSFEC.001: Microcontroller Architecture — Memory Maps, Registers, and Interrupts"
status: published
wordpress_post_id: 20545
published: "2026-10-04T02:26:32"
live_url: "https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/"
series: "Open Source Firmware Engineer Certification"
pathway: firmware/engineer
lesson_number: "001"
featured_media_id: 20539
youtube_1: "https://www.youtube.com/watch?v=xo0x86i2F84"
youtube_2: "https://www.youtube.com/watch?v=FYOi9QQn5XY"
youtube_3: "https://www.youtube.com/watch?v=BzGdHrAPeks"
canonical_archive: "1freetech/Bitcoinversus.tech/archive/2026/10/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts.md"
---

# OSFEC.001: Microcontroller Architecture — Memory Maps, Registers, and Interrupts

Firmware engineering begins where software meets silicon. This lesson establishes the architecture vocabulary required for drivers, buses, RTOS work, secure boot, update systems, timing analysis, and production diagnostics.

## Learning objectives

After this lesson, the learner should be able to:

- describe the major blocks inside a modern microcontroller;
- explain a memory map and memory-mapped I/O;
- distinguish hardware register semantics from ordinary RAM;
- explain the role and limits of volatile-qualified hardware access;
- explain vector tables and the Cortex-M NVIC model;
- distinguish polling from interrupt-driven design;
- reason about interrupt priorities, bounded handlers, latency, and shared-state races;
- explain how processor faults fit into the exception system;
- recognize why ordering and synchronization can matter at the hardware/software boundary;
- use the exact processor architecture manual, vendor reference manual, datasheet, startup code, headers, and errata as implementation truth.

## Core system model

CPU executes instructions → memory system resolves addresses → flash/SRAM/peripheral regions respond → hardware changes state → events generate interrupts → interrupt controller prioritizes service → handler executes → normal execution resumes

## Key concepts

### Memory map
A memory map assigns address regions to executable code, SRAM, peripheral registers, and system-control resources. The architecture defines the broad framework while the silicon vendor defines the actual device implementation.

### Memory-mapped I/O
Peripheral control and status registers occupy processor address space. They are not ordinary RAM: reads and writes can have hardware side effects.

### Register semantics
Registers may be read/write, read-only, write-only, write-one-to-clear, write-one-to-set, self-clearing, latched, or reserved. The reference manual defines correct behavior.

### Vector table and NVIC
The vector table associates reset, exception, and interrupt events with handlers. The NVIC manages Cortex-M interrupt enable, pending/active state, and configurable priorities.

### Timing
Interrupt response is a budget, not an instant event. Worst-case latency includes pending time, higher-priority activity, exception entry, and handler execution.

### Shared state
Normal code and interrupt handlers can race on shared state. Volatile access does not provide atomicity or synchronization.

### Faults
Cortex-M processors can report architecture-dependent fault classes. Production firmware should preserve useful diagnostic evidence and have an intentional recovery policy.

## Prior lessons

- OSFTC.001 — Firmware Images, Safe Flashing, Bootloaders, and Recovery Basics
- Armv8-M Architecture Explained
- Program Status Registers in Armv8-M Architecture

## Videos

1. https://www.youtube.com/watch?v=xo0x86i2F84
2. https://www.youtube.com/watch?v=FYOi9QQn5XY
3. https://www.youtube.com/watch?v=BzGdHrAPeks
