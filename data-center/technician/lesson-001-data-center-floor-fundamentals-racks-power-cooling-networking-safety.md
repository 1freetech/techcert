---
title: "OSDCTC.001: Data Center Floor Fundamentals — Racks, Power, Cooling, Networking, and Safety"
status: published
wordpress_post_id: 20490
published: "2026-10-04T01:22:34"
live_url: "https://bitcoinversus.tech/2026/10/04/osdctc-001-data-center-floor-fundamentals-racks-power-cooling-networking-safety/"
series: "Open Source Data Center Technician Certification"
pathway: data-center/technician
lesson_number: "001"
featured_media_id: 20489
youtube_1: "https://www.youtube.com/watch?v=6HaQ6Qfioxc"
youtube_2: "https://www.youtube.com/watch?v=Y_8P3wzxsqY"
youtube_3: "https://www.youtube.com/watch?v=iRLCUWbi0o4"
canonical_archive: "1freetech/Bitcoinversus.tech/archive/2026/10/osdctc-001-data-center-floor-fundamentals-racks-power-cooling-networking-safety.md"
---

# OSDCTC.001: Data Center Floor Fundamentals — Racks, Power, Cooling, Networking, and Safety

A data center technician works where IT hardware, electrical power, cooling, networking, monitoring, and physical safety meet. This first lesson gives technicians a map of the data-center floor before later lessons go deeper into rack-and-stack, server hardware, cabling, power, cooling, console access, and fault isolation.

## Learning objectives

After this lesson, the learner should be able to:

- identify racks, rails, rack units, blanking panels, cable managers, servers, switches, patch panels, and rack PDUs;
- explain the high-level power path from utility or generator through switchgear, UPS, distribution, rack PDU, and server power supplies;
- explain why dual-corded equipment should use truly independent A/B power paths;
- recognize room air, in-row, rear-door heat exchanger, direct-to-chip liquid, and immersion cooling;
- explain hot-aisle/cold-aisle airflow and why recirculation hurts equipment cooling;
- identify switches, routers, VLANs, NICs, copper, and fiber as parts of the data-center network path;
- recognize monitoring and DCIM alarms as evidence to investigate rather than proof of a single failed part;
- explain N, N+1, 2N, and the operational idea behind concurrent maintainability;
- preserve redundancy during maintenance and troubleshooting;
- perform a structured technician walkdown and change one controlled variable at a time.

## System model

```text
utility / generator power
          ↓
switchgear + UPS + distribution
          ↓
       rack power
          ↓
servers + storage + network equipment
          ↓
     computing becomes heat
          ↓
       cooling removes heat
          ↓
       networks move data
          ↓
 monitoring exposes abnormal state
```

## Technician workflow

Before touching a rack or cable, confirm the asset, rack, U-position, power feed, network path, redundancy state, and approved work procedure. Record alarms before clearing them. Preserve evidence. Make one controlled change at a time. Verify service and redundancy after the work.

## Prior foundations

The live lesson links existing BitcoinVersus lessons for electrical distribution and PDUs, overcurrent protection, temperature control, switch basics, router basics, VLANs, NICs, interlocks/permissives, and data-center cabling.

## Videos

1. Schneider Electric — What is a data center?: https://www.youtube.com/watch?v=6HaQ6Qfioxc
2. MEP Academy — Data Center Power Flow: https://www.youtube.com/watch?v=Y_8P3wzxsqY
3. MEP Academy — Data Center Cooling Methods Explained: https://www.youtube.com/watch?v=iRLCUWbi0o4

## Key rule

**Identify before touching. Preserve redundancy before changing. Verify after restoring service.**