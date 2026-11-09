# OSNTC.040 — Ethernet Storm Control Technician Worksheet

**Education-only simulation:** Do not generate a network storm or modify production switches to perform the exercise.

## Outcomes
Distinguish broadcast, multicast and unknown-unicast flooding; interpret percent/bps/pps thresholds; review read-only port and STP evidence; propose an authorized change only after establishing safety and business requirements.

## Preflight
- Device make/model and software build:
- Authorized read-only access method:
- Affected interface / VLAN / link speed:
- VLAN topology and STP state:
- Broadcast / multicast / unknown-unicast measured rates:
- Units and sampling interval:
- Confirmed configured thresholds and actions:
- Counter, event and capture evidence references:

## Fictional Observation Set
12:00:00 Link is Up, nominal 10 Gb/s, STP forwarding
12:00:02 Broadcast 40 Mb/s
12:00:03 Broadcast 160 Mb/s
12:00:04 Broadcast 220 Mb/s
12:00:05 Broadcast 45 Mb/s

Hypothetical broadcast limit = 1% of nominal link rate.
Calculated limit: 10,000 Mb/s × 0.01 = 100 Mb/s.

**Training conclusions:** 12:00:03 and 12:00:04 exceed the simplified limit; peak 220 Mb/s. That does not establish actual hardware drop behavior or root cause because sampling intervals, bucket thresholds, device actions and counter semantics are unmodeled.

## Rate conversions
- Nominal 10 Gb/s × 1% = 100 Mb/s
- Nominal 10 Gb/s × 2% = 200 Mb/s
- 5,000 frames/s × 800 counted bytes/frame × 8 = 32 Mb/s before omitted Ethernet wire overhead.
- A PPS threshold is not a bandwidth limit unless frame size and accounting conventions are specified.

## Diagnostic reasoning
1. Classify the flood as broadcast, multicast or unknown unicast.
2. Identify whether the frame destination is learned; avoid confusing unknown unicast with all unicast.
3. Compare event timestamps with STP changes, MAC flaps, topology changes and interface counters.
4. Identify what evidence supports a loop and what evidence points to an endpoint flood.
5. State what normal legitimate traffic could be damaged by too-aggressive suppression.
6. Document approved operator, change owner, approver, stop conditions and rollback.
7. Validate production service and supported protocols before announcing recovery.

## Vendor documentation
- Cisco: https://www.cisco.com/c/en/us/td/docs/switches/lan/c9000/lyr2-fwd/flowcontrol-stormcontrol/flow-control-and-storm-control-configuration-guide/m-storm-control.html
- Arista: https://www.arista.com/en/um-eos/eos-data-transfer
- Juniper: https://www.juniper.net/documentation/us/en/software/junos/cli-reference/topics/ref/statement/storm-control-edit-interfaces.html
- Juniper read-only output: https://www.juniper.net/documentation/us/en/software/junos/cli-reference/topics/ref/command/show-ethernet-switching-interfaces-qfx-series.html

## Evidence-based handoff
Incident | Time zone | Interface | VLAN | Link rate | Measured category | Units | Sample window | Configured policy | Counter snapshots | STP/MAC evidence | Known limitations | Owner | Approver | Next step | Expected check | Rollback | Handoff recipient

## Assessment
1. Can a traffic storm occur without an STP loop?
2. Can storm control eliminate a cabling loop?
3. Why does a 1% threshold not translate into one fixed PPS value?
4. What are the operational risks of shutdown actions compared with frame drop actions?
5. Which measurements distinguish user impact from port utilization?

This worksheet is a fictional training template; no real network commands, drops, outages, recovery, or playback were tested.
