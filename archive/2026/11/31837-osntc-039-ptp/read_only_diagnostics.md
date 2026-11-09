# OSNTC.039 — Read-only PTP diagnostics worksheet

Educational exercise only. Do not configure timing devices, reset clocks or disable security controls.

## Evidence record
- Change/ticket owner:
- Device and interface (avoid secrets):
- Local time zone and collection timestamp:
- Intended IEEE 1588/gPTP profile:
- Transport (UDPv4 / UDPv6 / Layer 2):
- PTP domain number:
- E2E or P2P delay mechanism:
- Current grandmaster identity:
- Current timing port role and status:
- Source reference and traceability:
- NIC hardware timestamp capabilities:
- PHC device name, if present:
- Is CLOCK_REALTIME synchronized separately? Evidence:
- Offset measurement period and unit:
- Mean path delay:
- Safety/security stop condition:
- Authorized next diagnostic and approver:

## Observation-only shell commands
```sh
ip -br link show
ethtool -T eno1
ps -eo pid,args | grep '[p]tp4l'
ps -eo pid,args | grep '[p]hc2sys'
pmc -u -b 0 'GET DEFAULT_DATA_SET' 'GET PARENT_DATA_SET'
pmc -u -b 0 'GET CURRENT_DATA_SET' 'GET PORT_DATA_SET'
```

Substitute actual interface and socket access details. All commands observe; GET does not issue a timing change. No result is guaranteed if ptp4l is not running.

## Fictional four-timestamp calculation
t1 = 1,000,000,000 ns (grandmaster)
t2 = 1,000,001,600 ns (client)
t3 = 1,000,020,000 ns (client)
t4 = 1,000,021,400 ns (grandmaster)

forward = 1600 ns; reverse = 1400 ns
offset = (1600 - 1400)/2 = +100 ns
mean delay = (1600 + 1400)/2 = 1500 ns

The formula assumes symmetric path delays. Values are invented, not real PTP measurements.

## Mismatch scenario
A/B: domain 24, UDPv4, E2E, hardware timestamps
C: domain 0, Layer 2, P2P, software timestamps
List every difference; consult approved timing profile and owner before suggesting a change.

## Acceptance criteria
- Distinguishes PHC and OS time
- Distinguishes timing domain and delay mechanism
- Uses unit-labeled evidence
- No edits to live clocks, NICs or switch security
- Identifies authority and independent validation procedure

## Sources
- IEEE 1588-2019 https://standards.ieee.org/ieee/1588/6825/
- IEEE 802.1AS-2025 https://standards.ieee.org/ieee/802.1AS/11968/
- ptp4l https://www.linuxptp.org/documentation/ptp4l/
- pmc https://www.linuxptp.org/documentation/pmc/
- phc2sys https://www.linuxptp.org/documentation/phc2sys/
