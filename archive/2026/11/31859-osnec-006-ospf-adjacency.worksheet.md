# OSNEC.006 — OSPF Neighbor Adjacency Troubleshooting Lab

**Training only.** Scenarios are fictional. Do not run interface shutdowns, OSPF reset/clear, MTU changes, authentication changes, routing reconfiguration, or high-volume debug commands in production.

## Objectives
- Interpret Down, Init, 2-Way, ExStart, Exchange, Loading and Full (with NBMA Attempt).
- Explain why 2-Way can be correct among DROTHER routers on multiaccess segments.
- Compare Hello and Dead timers, area, network type, subnet mask, authentication and router IDs.
- Diagnose where database-description processing may fail without treating an MTU mismatch as proven packet loss.
- Record evidence, owner, change controls, rollback and recovery checks.

## Scenario A — Hello timer mismatch
| Field | R1 | R2 |
| --- | --- | --- |
| Hello | 10 seconds | 5 seconds |
| Dead | 40 seconds | 20 seconds |
| Area | 0.0.0.0 | 0.0.0.0 |

Both Hello and Dead intervals differ. RFC 2328 Section 10.5 normally rejects incompatible received Hello parameters. The absolute values must agree; a shared 4:1 ratio does not make the settings compatible. Check mask exception for point-to-point and virtual links.

## Scenario B — ExStart/Exchange with MTU discrepancy
| Field | R1 | R2 |
| --- | --- | --- |
| Interface state | Up | Up |
| OSPF area | 0.0.0.0 | 0.0.0.0 |
| Router ID | 10.255.0.1 | 10.255.0.2 |
| Network type | point-to-point | point-to-point |
| Hello/Dead | 10/40 seconds | 10/40 seconds |
| Interface IP MTU | 1500 bytes | 9000 bytes |
| Neighbor state | EXSTART | EXCHANGE |
| DBD retries | present | present |

Observed facts in the fictional dataset: an MTU difference of 7,500 bytes and DBD retries. A path MTU or DBD packet rejection is plausible, not proven by the table. Obtain permitted logs, DBD counters or a bounded capture.

## Read-only review commands
Cisco IOS/IOS XE:
- `show ip ospf neighbor`
- `show ip ospf neighbor detail`
- `show ip ospf interface`
- `show interfaces`
- `show logging`

Arista EOS:
- `show ip ospf neighbor`
- `show ip ospf interface`
- `show interfaces`

Juniper Junos:
- `show ospf neighbor`
- `show ospf interface`
- `show interfaces terse`

Check release, routing instance, scope and permissions before running a command.

## Evidence handoff
- Incident ID / timestamp / time zone:
- Device, interface, software release, VRF and VLAN:
- Neighbor Router ID and IP:
- Expected neighbor state, based on network type and DR role:
- Actual state and duration:
- Interface / path MTU and error counters:
- Area and security state (no keys):
- Hello and Dead intervals (seconds):
- What is confirmed:
- Hypotheses not yet established:
- Next permitted read-only check:
- Approval owner, risk, rollback, stop criteria:
- Verification: adjacency, LSDB, routes, forwarding, stability:
- Next owner and update time:

## Questions and suggested answers
1. Is 2-Way always a fault? No: two DROTHER peers on eligible multiaccess networks may remain 2-Way.
2. Is OSPF TCP port 89? No: it uses IP protocol 89.
3. Why does an MTU difference matter? DBD exchange can fail when the peer cannot accept advertised/actual packet sizes. Confirm packet evidence before changing a link.
4. Does Full prove the desired route is installed? No.
5. Should `ip ospf mtu-ignore` be the default repair? No: verify and correct effective MTU design with an approved plan.

## Sources
- IETF RFC 2328: https://www.rfc-editor.org/rfc/rfc2328
- Cisco OSPF neighbor troubleshooting: https://www.cisco.com/c/en/us/support/docs/ip/open-shortest-path-first-ospf/13699-29.html
- Cisco ExStart/Exchange: https://www.cisco.com/c/en/us/support/docs/ip/open-shortest-path-first-ospf/13684-12.html
- Arista OSPF: https://www.arista.com/en/um-eos/eos-open-shortest-path-first-version-2
- Juniper OSPF monitoring: https://www.juniper.net/documentation/us/en/software/junos/ospf/topics/topic-map/verifying-and-monitoring-ospf-configuration.html
