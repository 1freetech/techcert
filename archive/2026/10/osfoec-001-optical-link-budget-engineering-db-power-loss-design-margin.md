---
title: "OSFOEC.001: Optical Link Budget Engineering — dB, Power Budget, Loss Budget, and Design Margin"
status: published
wordpress_post_id: 20520
published: "2026-10-04T01:59:11"
live_url: "https://bitcoinversus.tech/2026/10/04/osfoec-001-optical-link-budget-engineering-db-power-loss-design-margin/"
series: "Open Source Fiber Optics Engineer Certification"
pathway: fiber-optics/engineer
lesson_number: "001"
featured_media_id: 20515
youtube_1: "https://www.youtube.com/watch?v=PPwOHzLQU2k"
youtube_2: "https://www.youtube.com/watch?v=as6AXnGjdUE"
youtube_3: "https://www.youtube.com/watch?v=QEzHQoTM1KM"
canonical_archive: "1freetech/Bitcoinversus.tech/archive/2026/10/osfoec-001-optical-link-budget-engineering-db-power-loss-design-margin.md"
---

# OSFOEC.001: Optical Link Budget Engineering — dB, Power Budget, Loss Budget, and Design Margin

The first Open Source Fiber Optics Engineer lesson establishes the quantitative framework for engineering optical links before later lessons on dispersion, wavelength systems, coherent optics, FEC, DWDM/CWDM, transceiver selection, and nonlinear effects.

## Core outcomes

Learners should be able to distinguish dB from dBm; calculate maximum allowable path loss from minimum transmitter output and receiver sensitivity; estimate passive cable-plant loss from fiber, mated connections, splices, splitters, and other passive components; calculate raw and reserved design margin; perform a receiver-overload check using maximum transmitter output and maximum allowed receiver input; connect attenuation and insertion loss to link design; recognize measurement uncertainty; understand why dispersion can limit high-speed reach even when received power is adequate; and turn the engineering budget into an installation acceptance criterion.

## Core equations

```text
P_RX(dBm) = P_TX(dBm) - total optical loss(dB) + optical gain(dB)

maximum allowable loss = minimum TX output - receiver sensitivity

total passive loss = fiber loss + connection loss + splice loss + passive-device loss

fiber loss = attenuation coefficient(dB/km) × length(km)
```

## Worked example

For a simplified 10 km singlemode link with minimum TX output −2 dBm, receiver sensitivity −15 dBm, 0.35 dB/km fiber loss, four 0.5 dB mated connections, two 0.1 dB fusion splices, and 3 dB reserve:

- power budget = 13 dB
- fiber loss = 3.5 dB
- connection loss = 2.0 dB
- splice loss = 0.2 dB
- expected passive loss = 5.7 dB
- raw margin = 7.3 dB
- remaining design margin after reserve = 4.3 dB

## Prior BitcoinVersus foundations linked in the live lesson

- OSFOTC.001 — Fiber Optic Safety, Handling, Inspection, and Cleaning Basics
- Fiber Optic Training: Attenuation
- Fiber Optics Training: Insertion Loss
- Fiber Optic Training: Optical Power Meter
- Fiber Optic Training: Polarization Mode Dispersion (PMD)
- Fiber Optic Training: Fiber Optic Characterization
- Fiber Optic Training: Splitters vs. Taps

## Videos

1. FOA Lecture 55 — The Mysterious dB of Fiber Optics: https://www.youtube.com/watch?v=PPwOHzLQU2k
2. FOA Lecture 26 — Loss Budgets: https://www.youtube.com/watch?v=as6AXnGjdUE
3. FOA Lecture 49 — Attenuation in a Fiber Optic Link: https://www.youtube.com/watch?v=QEzHQoTM1KM

## Engineer rule

**Design from guaranteed worst-case transceiver limits, calculate passive loss, reserve margin, check overload, then make the field acceptance test prove the design.**