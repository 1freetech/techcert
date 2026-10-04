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

## The model

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

## Energy bands and the band gap

In a crystal, interactions among many atoms create ranges of allowed electron energies called bands.

- **Valence band:** the highest band normally filled or nearly filled with bonding electrons.
- **Conduction band:** a higher-energy band in which electrons can move through the crystal and contribute strongly to conduction.
- **Band gap, Eg:** an energy range between those bands with no allowed bulk-crystal states in the simplified model.

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

Semiconductors occupy a useful middle ground between metals and insulators because conductivity can be changed strongly by temperature, electric fields, light, and controlled impurity atoms.

Reference: MIT OpenCourseWare, *Semiconductors*: https://ocw.mit.edu/courses/3-091sc-introduction-to-solid-state-chemistry-fall-2010/pages/electronic-materials/14-semiconductors/

### Video 1
MIT OpenCourseWare — Lecture 14: Semiconductors  
https://www.youtube.com/watch?v=56d9qcsHGwE

## Electrons and holes

When enough energy promotes a valence electron into the conduction band, two carrier descriptions appear:

- an **electron**, a mobile negative charge in the conduction band;
- a **hole**, an empty valence-band state that behaves mathematically like a mobile positive charge.

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

Here `n` is electron concentration, `p` is hole concentration, and `ni` is intrinsic carrier concentration.

A useful conductivity relation is:

```text
σ = q(n μn + p μp)
```

where `q` is elementary charge magnitude and `μn`, `μp` are electron and hole mobilities. This equation shows why carrier concentration and carrier mobility both matter.

## Doping

**Doping** intentionally introduces selected impurity atoms so the equilibrium carrier population changes in a controlled way.

```text
donor dopant
    ↓
N-type material
    ↓
electrons become majority carriers

acceptor dopant
    ↓
P-type material
    ↓
holes become majority carriers
```

In silicon, phosphorus is a common donor and boron a common acceptor. Ordinary doping primarily changes carrier concentration and Fermi-level position. It does not simply turn silicon into a metal, and very heavy doping can require physics beyond the simplest nondegenerate model.

### Video 2
Neso Academy — Intrinsic and Extrinsic Semiconductors  
https://www.youtube.com/watch?v=z3MlkNUuq9w

## Majority and minority carriers

```text
N-type:
majority carrier → electrons
minority carrier → holes

P-type:
majority carrier → holes
minority carrier → electrons
```

Minority carriers remain important in diodes, bipolar transistors, photodiodes, solar cells, leakage, recombination, and transient response.

For a nondegenerate semiconductor in thermal equilibrium:

```text
n · p = ni²
```

Example: if `n ≈ 10^16 cm^-3` and a simple room-temperature model uses `ni ≈ 10^10 cm^-3`, then:

```text
p = ni² / n
  = (10¹⁰)² / 10¹⁶
  = 10⁴ cm⁻³
```

The point is the orders-of-magnitude effect; actual `ni` depends strongly on material, temperature, and model.

## Fermi level

The **Fermi level** is an energy reference tied to the probability that available states are occupied by electrons.

```text
N-type doping → Fermi level shifts toward conduction band
P-type doping → Fermi level shifts toward valence band
```

Band diagrams let engineers connect material composition and electrostatic potential to carrier populations and transport.

Reference: Stanford EE 116 — Semiconductor Device Physics: https://poplab.stanford.edu/teaching.html

## PN junction formation

A practical PN junction consists of neighboring regions with different doping profiles inside a semiconductor. Carrier concentration gradients drive diffusion after the regions are formed.

```text
N side                       P side
many electrons               many holes
     e⁻  → → →       ← ← ←  h⁺

carriers diffuse across boundary
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

At thermal equilibrium, the electric field from fixed ionized dopants opposes further majority-carrier diffusion, and drift and diffusion currents balance.

Interactive reference: Georgia Tech — PN Junctions: https://learnqm.gatech.edu/Semiconductor-Physics-Visualization/ch15/index.html

### Video 3
Jordan Edmunds — PN Junction Introduction  
https://www.youtube.com/watch?v=BHA4teZmwT0

## Built-in potential

For the standard abrupt-junction, nondegenerate, equilibrium approximation:

```text
Vbi = (kT / q) ln(NA ND / ni²)
```

- `k` = Boltzmann constant
- `T` = absolute temperature
- `q` = elementary charge magnitude
- `NA` = acceptor concentration
- `ND` = donor concentration
- `ni` = intrinsic carrier concentration

With `NA = ND = 10^16 cm^-3`, `ni = 10^10 cm^-3`, and `kT/q ≈ 0.0259 V` at about 300 K, the simplified result is roughly `0.71 V`.

That does **not** mean every silicon diode has an exact 0.7 V threshold. Forward voltage depends on current density, geometry, temperature, recombination, series resistance, doping, and construction.

## Depletion width

For a one-dimensional abrupt junction under the depletion approximation:

```text
W = √[(2 εs / q)(1/NA + 1/ND)(Vbi + VR)]
```

Useful trends:

- lower doping generally gives a wider depletion region;
- greater reverse bias widens the depletion region;
- more depletion width extends into the more lightly doped side;
- depletion width affects junction capacitance and electric-field distribution.

## Forward and reverse bias

```text
Forward bias:
P side more positive than N side
        ↓
barrier reduced
        ↓
carrier injection increases

Reverse bias:
P side more negative than N side
        ↓
barrier increases
        ↓
depletion region widens
        ↓
small leakage until breakdown mechanisms dominate
```

Reference: Toshiba — PN Junction: https://toshiba.semicon-storage.com/ap-en/semiconductor/knowledge/e-learning/discrete/chap1/chap1-6.html

## Why doping profiles matter to engineers

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
actual doping profile versus depth
        ↓
resistance + field + depletion width + junction depth
        ↓
capacitance + leakage + breakdown + switching behavior
```

This is the bridge between device physics and process integration.

## Engineering tradeoffs

- Higher doping can reduce bulk/contact resistance but can increase capacitance and alter mobility, recombination, and breakdown.
- Lower doping can widen depletion regions and support higher voltage in some structures but increases resistive loss.
- Abrupt versus graded profiles change electric-field shape and capacitance.
- Thermal processing activates dopants but can also diffuse junctions.
- Temperature changes intrinsic carrier concentration, mobility, leakage, and diode I-V behavior.
- Very heavy doping can invalidate simple nondegenerate approximations.

## Troubleshooting exercise

If a fabricated diode has lower breakdown voltage and higher capacitance than expected, ask:

1. Did measured doping concentration match target?
2. Did implant dose or energy shift?
3. Did thermal processing change junction depth or gradient?
4. Is depletion width smaller than expected?
5. Is the electric field peaking unexpectedly?
6. Did geometry or edge termination change?
7. Is leakage dominated by bulk generation, surface defects, contamination, or junction damage?
8. Do process-control measurements agree with electrical-test data?

The device equations identify variables that matter; process history helps identify which variable moved.

## Knowledge check

1. **What is a band gap?** An energy range between allowed bands where the simplified bulk crystal has no allowed electron states.
2. **What does donor doping do?** Increases equilibrium electron population and normally shifts the Fermi level toward the conduction band.
3. **What does acceptor doping do?** Increases equilibrium hole population and normally shifts the Fermi level toward the valence band.
4. **What creates the depletion-region electric field?** Carrier diffusion/recombination exposes fixed ionized dopant charge near the junction.
5. **What does forward bias do?** Reduces the effective barrier and increases carrier injection.
6. **What does reverse bias do?** Raises the barrier and widens depletion until leakage or breakdown mechanisms become significant.

## Key takeaway

**Semiconductor devices are engineered electrostatics.** Band structure determines available states. Doping sets carrier populations and shifts the Fermi level. Diffusion between differently doped regions creates a space-charge field. Applied voltage changes that field. Those pieces determine current, capacitance, leakage, switching speed, and breakdown behavior.

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

Modeling note: introductory equations above use idealized assumptions such as thermal equilibrium, nondegenerate statistics, and an abrupt one-dimensional junction where stated. Real devices require more complete models when those assumptions fail.
