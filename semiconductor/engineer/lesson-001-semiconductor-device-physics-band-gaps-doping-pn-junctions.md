---
title: "OSSEC.001: Semiconductor Device Physics — Band Gaps, Doping, and PN Junctions"
status: published
wordpress_post_id: 20450
published: "2026-10-04T00:53:24"
live_url: "https://bitcoinversus.tech/2026/10/04/ossec-001-semiconductor-device-physics-band-gaps-doping-pn-junctions/"
series: "Open Source Semiconductor Engineer Certification"
pathway: semiconductor/engineer
lesson_number: "001"
featured_media_id: 20449
youtube_1: "https://www.youtube.com/watch?v=56d9qcsHGwE"
youtube_2: "https://www.youtube.com/watch?v=z3MlkNUuq9w"
youtube_3: "https://www.youtube.com/watch?v=BHA4teZmwT0"
canonical_archive: "1freetech/Bitcoinversus.tech/archive/2026/10/ossec-001-semiconductor-device-physics-band-gaps-doping-pn-junctions.md"
---

# OSSEC.001: Semiconductor Device Physics — Band Gaps, Doping, and PN Junctions

Semiconductor engineering begins with a simple idea: electrical behavior can be designed by controlling which energy states electrons may occupy and how many mobile charge carriers are present. This first Semiconductor Engineer lesson builds on OSSTC.001 cleanroom and ESD fundamentals and establishes the device-physics foundation for later process-integration work.

## Learning path

```text
atomic bonds
    ↓
allowed energy bands + forbidden band gap
    ↓
thermal energy creates electrons + holes
    ↓
doping changes carrier concentration and Fermi level
    ↓
P-type + N-type regions create a junction
    ↓
diffusion creates a depletion region + electric field
    ↓
bias changes the barrier
    ↓
current, capacitance, breakdown, speed, leakage, and device behavior
```

An engineer asks not only whether a device conducts, but why, how much, at what temperature and bias, and how fabrication choices alter the answer.

## 1. Energy bands and the band gap

In a crystal, interactions among many atoms create ranges of allowed electron energies called bands.

- **Valence band:** highest band normally filled or nearly filled with bonding electrons.
- **Conduction band:** higher-energy band where electrons can move through the crystal and contribute strongly to conduction.
- **Band gap, Eg:** energy range between those bands with no allowed bulk-crystal states in the simplified model.

```text
Energy ↑

Conduction band
================
       ↑
      Eg
       ↓
================
Valence band
```

Semiconductors are useful because conductivity can be changed strongly by temperature, electric fields, light, and controlled impurity atoms.

Reference: MIT OpenCourseWare — Semiconductors  
https://ocw.mit.edu/courses/3-091sc-introduction-to-solid-state-chemistry-fall-2010/pages/electronic-materials/14-semiconductors/

**Video 1 — MIT OpenCourseWare, Lecture 14: Semiconductors**  
https://www.youtube.com/watch?v=56d9qcsHGwE

## 2. Electrons, holes, and conductivity

When a valence electron gains enough energy to enter the conduction band, a free electron and a hole are created.

```text
valence electron gains energy
           ↓
electron enters conduction band
           ↓
free electron  +  hole left behind
     (-)              (+)
```

For an intrinsic semiconductor in thermal equilibrium:

```text
n = p = ni
```

A useful conductivity relation is:

```text
σ = q(n μn + p μp)
```

where `n` and `p` are electron and hole concentrations and `μn`, `μp` are mobilities. Carrier concentration and mobility both matter.

## 3. Doping

Doping intentionally introduces selected impurity atoms so the equilibrium carrier population changes in a controlled way.

```text
donor dopant → N-type → electrons are majority carriers
acceptor dopant → P-type → holes are majority carriers
```

In silicon, phosphorus is a common donor and boron a common acceptor. Ordinary doping primarily changes carrier concentration and the Fermi-level position; very heavy doping requires models beyond the simplest nondegenerate approximation.

**Video 2 — Neso Academy, Intrinsic and Extrinsic Semiconductors**  
https://www.youtube.com/watch?v=z3MlkNUuq9w

## 4. Majority and minority carriers

```text
N-type:
majority → electrons
minority → holes

P-type:
majority → holes
minority → electrons
```

For a nondegenerate semiconductor in thermal equilibrium:

```text
n · p = ni²
```

If `n ≈ 10^16 cm^-3` and a simple model uses `ni ≈ 10^10 cm^-3`, then `p ≈ 10^4 cm^-3`. The exact intrinsic concentration depends strongly on material and temperature.

## 5. Fermi level

The Fermi level is an energy reference tied to the probability that available states are occupied by electrons.

```text
N-type doping → Fermi level shifts toward conduction band
P-type doping → Fermi level shifts toward valence band
```

Reference: Stanford EE 116 — Semiconductor Device Physics  
https://poplab.stanford.edu/teaching.html

## 6. PN junction formation

A PN junction consists of neighboring differently doped regions. Carrier concentration gradients drive diffusion.

```text
N side                       P side
many electrons               many holes
     e⁻  → → →       ← ← ←  h⁺

carriers diffuse
       ↓
recombination near boundary
       ↓
mobile carriers depleted locally
       ↓
fixed ionized dopants remain
       ↓
space charge creates electric field
       ↓
depletion region + built-in potential
```

At thermal equilibrium, drift and diffusion balance, producing no net DC current through an isolated junction.

Interactive reference: Georgia Tech — PN Junctions  
https://learnqm.gatech.edu/Semiconductor-Physics-Visualization/ch15/index.html

**Video 3 — Jordan Edmunds, PN Junction Introduction**  
https://www.youtube.com/watch?v=BHA4teZmwT0

## 7. Built-in potential

For an ideal abrupt, nondegenerate junction in equilibrium:

```text
Vbi = (kT / q) ln(NA ND / ni²)
```

With `NA = ND = 10^16 cm^-3`, `ni = 10^10 cm^-3`, and `kT/q ≈ 0.0259 V` at about 300 K, the simplified result is about `0.71 V`.

The familiar “0.7 V silicon diode” rule is only a rough circuit approximation. Real forward voltage depends on current density, geometry, temperature, recombination, series resistance, doping, and device construction.

## 8. Depletion width

For a one-dimensional abrupt junction under the depletion approximation:

```text
W = √[(2 εs / q)(1/NA + 1/ND)(Vbi + VR)]
```

Engineering trends:

- lower doping generally widens the depletion region;
- higher reverse bias widens it;
- more depletion extends into the more lightly doped side;
- depletion width changes junction capacitance and field distribution.

## 9. Forward and reverse bias

```text
Forward bias
→ barrier reduced
→ carrier injection increases

Reverse bias
→ barrier increases
→ depletion widens
→ leakage remains small until breakdown mechanisms dominate
```

Reference: Toshiba — PN Junction  
https://toshiba.semicon-storage.com/ap-en/semiconductor/knowledge/e-learning/discrete/chap1/chap1-6.html

## 10. From fabrication to device behavior

```text
process choices
├── dopant species
├── implant dose
├── implant energy
├── diffusion temperature / time
├── activation anneal
├── masking geometry
└── prior thermal budget
        ↓
doping profile versus depth
        ↓
resistance + electric field + depletion width + junction depth
        ↓
capacitance + leakage + breakdown + switching behavior
```

This is the bridge from device physics to process integration.

## Engineering tradeoffs

- Higher doping can reduce resistance but increase capacitance and alter mobility, recombination, and breakdown behavior.
- Lower doping can support wider depletion regions and higher voltages in some structures but increases resistive loss.
- Abrupt and graded junction profiles produce different field and capacitance behavior.
- Thermal processing activates dopants but can also diffuse junctions.
- Temperature affects intrinsic carriers, mobility, leakage, and the diode I-V curve.
- Very heavy doping can invalidate simple textbook assumptions.

## Troubleshooting exercise

If a fabricated diode shows lower breakdown voltage and higher junction capacitance than expected, ask:

1. Did doping concentration match target?
2. Did implant dose or energy shift?
3. Did thermal processing alter junction depth or gradient?
4. Is depletion width smaller than expected?
5. Is the electric field peaking unexpectedly?
6. Did geometry or edge termination change?
7. Is leakage dominated by bulk generation, surface defects, contamination, or junction damage?
8. Do process-control measurements agree with electrical-test data?

The device equations identify variables that matter; process history identifies which variable may have moved.

## Knowledge check

1. **Band gap:** an energy range between allowed bands with no allowed bulk-crystal states in the simplified model.
2. **Donor doping:** raises equilibrium electron concentration and usually shifts the Fermi level toward the conduction band.
3. **Acceptor doping:** raises equilibrium hole concentration and usually shifts the Fermi level toward the valence band.
4. **Depletion-region field:** fixed ionized dopant charge exposed after carrier diffusion/recombination creates it.
5. **Forward bias:** reduces the effective junction barrier and increases carrier injection.
6. **Reverse bias:** raises the barrier and widens depletion until leakage or breakdown mechanisms dominate.

## Key takeaway

**Semiconductor devices are engineered electrostatics.** Band structure determines available states. Doping sets carrier populations and shifts the Fermi level. Diffusion creates a space-charge field at junctions. Applied voltage changes that field. Those pieces control current, capacitance, leakage, switching speed, and breakdown.

```text
material physics
      ↓
doping profile
      ↓
electrostatics
      ↓
carrier transport
      ↓
device behavior
      ↓
process + circuit tradeoffs
```

Modeling note: these introductory equations assume idealized conditions such as thermal equilibrium, nondegenerate statistics, and an abrupt one-dimensional junction where stated. Real devices require more complete models when those assumptions fail.
