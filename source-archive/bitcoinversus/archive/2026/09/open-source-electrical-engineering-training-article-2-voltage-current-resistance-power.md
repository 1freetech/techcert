---
title: "OSEEC.002: Voltage, Current, Resistance, and Power"
date: "2026-09-24T23:58:16"
wordpress_post_id: 18475
live_url: "https://bitcoinversus.tech/2026/09/24/open-source-electrical-engineering-training-article-2-voltage-current-resistance-power/"
slug: "open-source-electrical-engineering-training-article-2-voltage-current-resistance-power"
categories:
  - electrical engineering
  - Tech Docs
---

# OSEEC.002: Voltage, Current, Resistance, and Power

**In simple terms:** Think of a simple DC circuit like water moving through a pipe. Voltage is like the pressure difference that drives flow. Current is like the amount flowing each second. Resistance makes flow harder. Power tells you how quickly energy is delivered or used. For example, a 12 V device drawing 2 A uses 24 W. The water comparison is only a memory aid, but it helps separate the four ideas before you use the formulas.

**Definitions:** **Voltage (V)** is electrical potential difference between two points, measured in volts. **Current (I)** is the rate of electric-charge flow, measured in amperes (A). **Resistance (R)** is opposition to current, measured in ohms (Ω). **Power (P)** is the rate of energy transfer, measured in watts (W). One watt means one joule of energy per second.

Article 2 establishes four quantities that appear throughout nearly every later electrical lesson: voltage, current, resistance, and power. The goal is not memorization alone. It is learning what each quantity means when looking at a real circuit, meter reading, power supply, rack, or piece of industrial equipment.

## Voltage: electrical potential difference

Voltage is the electrical potential difference between two points. A meter reading represents a difference between its measurement points.

## Current: movement of electric charge

Current describes the rate of electric-charge flow and is measured in amperes. Current measurements help evaluate load conditions, circuit utilization, imbalance, and equipment behavior.

## Resistance: opposition to current

Resistance is measured in ohms. Ohm's law connects voltage, current, and resistance:

```
V = I × R
I = V / R
R = V / I
```

If a 12 V source is applied across a 6 Ω resistance:

```
I = 12 V / 6 Ω = 2 A
```

## Power

For a simple DC circuit:

```
P = V × I
```

A 12 V load drawing 2 A uses 24 W in this simplified example. Later lessons extend these concepts into AC systems, power factor, and three-phase power.

## Why these quantities matter

These relationships become the language used to interpret equipment labels, breaker loading, power supplies, ASIC miners, server racks, batteries, control circuits, and test-instrument readings.

## Practice

1. A 24 V circuit has 12 Ω of resistance. Calculate current.
2. A device operates at 48 V and draws 5 A. Calculate power.
3. A 120 V load draws 10 A. Calculate its simple V×I numerical product while remembering that later AC lessons will distinguish real power and power factor.

## Safety boundary

These examples are mathematical training, not authorization to work energized. Real electrical work requires appropriate training, procedures, PPE, test equipment, and compliance with applicable rules and the authority having jurisdiction.

---

**BitcoinVersus.Tech Editor's Note:** We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. Support our research: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb

BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.
