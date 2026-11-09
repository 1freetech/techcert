# OSLTC.006 — Technical Incident Command Tabletop Worksheet

**Status:** Educational simulation, not a record of an actual incident.
**Precondition:** Never run real production or electrical operations as part of this exercise.

## Incident objectives
Coordinate authorized diagnosis, evidence-based communication, verification of recovery, shift handoff and improvement.

## Roles (enter names)
- Incident Commander:
- Operations Lead:
- Communications Lead:
- Planning / Scribe:
- Change approver (if different):
- Safety / Security escalation contact:

## Initial alert — disclosed at 14:03
A dashboard shows **12 failing probes out of 48 configured monitoring endpoints**. Customer impact and cause are **unknown**. No live equipment change is authorized in this exercise.

1. What do we know and what do we not know?
2. Who declares an incident and when?
3. Who may authorize a rollback, and what would stop the change?
4. What safety or cybersecurity evidence would trigger specialized escalation?
5. What will stakeholders receive, and when?

## Timeline — reveal one event at a time
14:03 Monitoring alerts: 12 of 48 endpoints failing
14:07 Incident declared; scope uncertain
14:08 Command and operational roles assigned
14:11 First stakeholder update
14:14 Operations compares telemetry and recent changes
14:20 Controlled rollback begins after fictional approval
14:25 Probe health improves, recovery not yet confirmed
14:31 All 48 probes healthy; confirm end-to-end checks
14:40 Command transferred to follow-up owner

**Do not assume 25% failed probes equals 25% customers or service traffic.**

## Working state document
- Incident ID:
- Local time zone:
- Service / scope:
- Verified symptoms:
- Hypotheses (not established fact):
- Unknowns:
- Immediate safety or security limits:
- Named IC and role owners:
- Decision and approver:
- Last verified action / timestamp:
- Evidence pointers:
- Next stakeholder update time:
- Full recovery verification:
- Handoff recipient and explicit acknowledgment:

## Computed results
- Failed monitoring fraction: 12 ÷ 48 = 25% of configured endpoints
- Alert to verified checks: 14:31 − 14:03 = 28 minutes
- Declaration to verified checks: 14:31 − 14:07 = 24 minutes
- These are fictional exercise measurements, not observed site metrics or fleet MTTR.

## Example first update
Incident: INC-2026-TRAINING-006 [SIMULATION]
As of 14:11 local | Next update: 14:21 local
Observed: 12/48 monitoring endpoints failing
Actual user impact: unknown; being investigated
Actions: freeze unrelated changes; compare recent deploys and telemetry
Command: named IC; Ops Lead owns diagnostics
Safety: no production or physical changes are authorized

## Recovery acceptance
- Monitor the agreed probes and verify representative user paths
- Confirm dependent services and data integrity as appropriate
- Record exact measurement timestamps and affected population
- State remaining unknowns and follow-up owner
- Announce clear command handoff

## Corrective action template
- Finding and source evidence:
- Proposed corrective change:
- Owner:
- Due date:
- Acceptance test:
- Status and verification evidence:

## Seven-criterion scoring (0, 1, or 2 points each)
- Incident declared with scope and uncertainty
- Named command, operations, communications
- Authority boundaries and safety stop rules
- Timestamped state and decision log
- Evidence-based update and next check-in
- Verified recovery and explicit command handoff
- Blameless review and owned follow-up
**Maximum:** 14 points. Scores are training observations, not a validated certification.

## Sources
- Google SRE Book: https://sre.google/sre-book/managing-incidents/
- Google SRE Workbook: https://sre.google/workbook/incident-response/
- Google SRE postmortems: https://sre.google/workbook/postmortem-culture/
- NIST SP 800-61r3 (cybersecurity-specific): https://csrc.nist.gov/pubs/sp/800/61/r3/final
