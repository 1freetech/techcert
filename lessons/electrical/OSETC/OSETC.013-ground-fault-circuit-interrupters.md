---
title: "OSETC.013: Ground-Fault Circuit Interrupters (GFCIs)"
status: published
wordpress_post_id: 19855
published: "2026-10-01T12:53:04"
live_url: "https://bitcoinversus.tech/2026/10/01/osetc-013-ground-fault-circuit-interrupters/"
series: "Open-Source Electrical Engineering Technician Certification"
certification: OSETC
pathway: technician
tier: 1
lesson_number: "013"
featured_media_id: 19854
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-013-ground-fault-circuit-interrupters-cover.jpg"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=XTPQe6GtqlM"
references:
  - "https://www.osha.gov/etools/construction/electrical-incidents/ground-fault-circuit-interrupters"
  - "https://www.cpsc.gov/s3fs-public/099_0.pdf"
---

# OSETC.013: Ground-Fault Circuit Interrupters (GFCIs)

**A ground-fault circuit interrupter (GFCI) is a safety device that watches whether the current leaving on the hot conductor matches the current returning on the neutral. If some current takes an unintended path, the GFCI quickly interrupts power.**

In plain language: electricity sent into a load should come back through the intended circuit. A mismatch suggests that some current may be flowing through water, damaged insulation, equipment grounding paths—or a person. The GFCI reacts to that imbalance. It does not wait for a normal circuit breaker to detect a large overload.

## Why this follows grounding and bonding

In [OSETC.012: Grounding and Bonding Basics](https://bitcoinversus.tech/2026/10/01/osetc-012-grounding-bonding-basics/), you learned how grounding and bonding help create intentional fault-current paths. A GFCI adds another layer: it compares current going out with current coming back and trips when the difference is unsafe. These protections work together, but they are not the same thing.

## The simple operating idea

1. **Normal condition:** the current on the hot conductor and the returning current on the neutral are essentially equal.
2. **Ground-fault condition:** some current leaves the intended return path.
3. **Protective response:** the GFCI senses the difference and opens the circuit.

OSHA explains that a Class A GFCI detects a difference of about 5 milliamperes and can shut off power in as little as 1/40 of a second. That speed reduces risk, but it does not make electrical contact safe.

[Watch: GFCI breaker basics — The Engineering Mindset](https://www.youtube.com/watch?v=XTPQe6GtqlM)

*Watch for the current-balance principle and the trip mechanism.*

## Three forms you should recognize

- **Receptacle type:** a wall outlet with visible TEST and RESET buttons.
- **Circuit-breaker type:** protection built into a breaker at the electrical panel.
- **Portable or cord-connected type:** protection in an extension assembly or temporary power device.

The location and form can change, but the principle stays the same: detect leakage by comparing outgoing and returning current.

## TEST and RESET: what the buttons mean

The **TEST** button creates an internal imbalance so the device should trip. The **RESET** button restores operation after a successful test and after the fault condition has been removed. Testing verifies the protective mechanism—it is not an invitation to open the device or perform energized work.

### Safe recognition exercise

Follow the manufacturer’s instructions and your site’s electrical-safety procedure. For a receptacle-type device, a common check uses a small lamp: with the lamp on, press TEST. The lamp should turn off. Press RESET and the lamp should turn on again. The U.S. Consumer Product Safety Commission recommends testing after installation, at least monthly, after a power failure, and according to the manufacturer’s directions.

**If TEST does not remove power, RESET does not restore it, the device is damaged, or the area is wet:** stop using the receptacle, label or report it according to site procedure, and have a qualified person evaluate it. Do not disassemble it for this lesson.

## What a GFCI does not do

- It does not replace a circuit breaker or fuse that provides overload and short-circuit protection. Review [OSETC.010: Fuses & Circuit Breakers](https://bitcoinversus.tech/2026/09/30/osetc-010-fuses-circuit-breakers/).
- It does not make energized work acceptable. Use the isolation principles from [OSETC.011: Lockout/Tagout & Energy Isolation](https://bitcoinversus.tech/2026/09/30/osetc-011-lockout-tagout-energy-isolation/).
- It may not protect a person who contacts two live conductors, such as two hot wires or a hot and neutral, because the current can still remain balanced.
- It reduces shock risk; it does not eliminate every electrical hazard.

## Quick knowledge check

1. What two current values does a GFCI compare?
2. What should happen when the TEST button is pressed?
3. Why is a GFCI not a substitute for lockout/tagout?
4. Name three common GFCI forms.

### Answers

1. Current leaving on the hot conductor and current returning on the neutral.
2. The GFCI should trip and remove power from the protected load.
3. A GFCI can reduce shock risk but does not establish a verified de-energized condition or control hazardous energy.
4. Receptacle, circuit-breaker, and portable or cord-connected types.

## Technician takeaway

A GFCI is an imbalance detector. Recognize its form, understand what TEST and RESET do, follow the required test procedure, and remove a failed device from service. Treat it as one protective layer—not permission to work live.

## References

- [OSHA: Ground-Fault Circuit Interrupters](https://www.osha.gov/etools/construction/electrical-incidents/ground-fault-circuit-interrupters)
- [U.S. CPSC: GFCI Fact Sheet](https://www.cpsc.gov/s3fs-public/099_0.pdf)
