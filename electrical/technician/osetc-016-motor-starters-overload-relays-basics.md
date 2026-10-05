---
title: "OSETC.016: Motor Starters and Overload Relays Basics"
status: published
wordpress_post_id: 19902
published: "2026-10-01T14:07:29"
live_url: "https://bitcoinversus.tech/2026/10/01/osetc-016-motor-starters-overload-relays-basics/"
series: "Open-Source Electrical Engineering Technician Certification"
certification: OSETC
pathway: technician
tier: 1
lesson_number: "016"
featured_media_id: 19904
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osetc-016-motor-starters-overload-relays-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=eHjppUsbk_g"
---

# OSETC.016: Motor Starters and Overload Relays Basics

A common magnetic motor starter combines a **contactor** with an **overload relay**. The contactor switches power to the motor; the overload relay helps protect the motor from damaging sustained overcurrent.

## The Contactor

The contactor is the switching portion of the starter. Energizing its coil changes the main contacts so the designed power circuit can supply the motor.

## The Overload Relay

The overload relay monitors motor current. If excessive current continues long enough to risk overheating the motor, it can interrupt the control circuit so the contactor drops out and the motor stops.

## Overload vs. Short Circuit

Overload protection addresses sustained excessive motor current. Short-circuit and ground-fault protection are separate functions normally provided by appropriately selected circuit-protection devices.

## Video

https://www.youtube.com/watch?v=eHjppUsbk_g

## Start/Stop Example

START can energize the contactor coil so the motor runs. STOP opens the control path so the coil de-energizes and the motor stops.

## What Happens During an Overload?

A sustained overload can trip the overload relay, open the control path, and cause the contactor to disconnect the motor. The cause should be identified before reset and return to service.

## Common Causes

- Jammed or excessive mechanical load.
- Motor or driven-equipment problem.
- Abnormal supply or phase condition.
- Incorrect starter/overload configuration relative to the approved design.

## Data Center Example

Cooling systems use fan and pump motors. Motor starters let facility controls command those motors while overload protection helps protect against sustained excessive current.

## Bitcoin Mining Example

Mining sites may use starters on cooling pumps and fans. Repeated overload trips should be investigated rather than repeatedly reset without finding the cause.

## Safety Boundary

Motor starters can contain hazardous voltage even when the motor is stopped. Follow equipment documentation, lockout/tagout, PPE requirements, qualified-person boundaries, and site electrical-safety procedures. Do not bypass overloads or interlocks.

## Practice

1. Name the two main components of a common magnetic motor starter.
2. State the contactor's job.
3. State the overload relay's job.
4. Explain overload protection vs. short-circuit protection.
5. Describe what happens when an overload relay trips.
6. Name two motor loads found in a data center or mining facility.

## Key Takeaway

A motor starter commonly combines a contactor for switching with an overload relay for motor overload protection. Technician fundamentals are recognizing each component, understanding its separate job, and safely investigating overload trips.
