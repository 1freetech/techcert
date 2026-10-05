---
title: "OSRTC.002: Teach Pendant Basics — Jogging, Coordinate Frames, Speed, and Safe Manual Positioning"
wordpress_post_id: 20798
source: BitcoinVersus.tech
published: 2026-10-04T21:43:17
modified: 2026-10-04T21:43:17
live_url: https://bitcoinversus.tech/2026/10/04/osrtc-002-teach-pendant-jogging-coordinate-frames-speed-safe-manual-positioning/
track: robotics/technician
lesson_number: 2
raw_source: 002-osrtc-002-teach-pendant-jogging-coordinate-frames-speed-safe-manual-positioning-20798.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Teach-pendant operation is the technician’s primary method for controlled manual robot positioning during setup, verification, recovery, and basic programming. Correct pendant use depends on understanding operating mode, jog type, coordinate frame, speed override, enabling controls, and the robot’s current mechanical state.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>OSRTC.002 continues the robotics-technician sequence established in <a href="https://bitcoinversus.tech/2026/10/04/osrtc-001-industrial-robot-safety-e-stops-safeguarding-safe-workcell-entry/">OSRTC.001: Industrial Robot Safety — E-Stops, Safeguarding, and Safe Workcell Entry</a>. The safety controls from OSRTC.001 remain active requirements during all manual motion.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Teach pendant: control interface for manual robot operation</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A teach pendant is a handheld or portable operator interface used to command and monitor an industrial robot. Depending on the manufacturer, it can provide robot jogging, coordinate-frame selection, speed control, program editing, I/O monitoring, alarm review, position display, and manual execution functions.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Manual motion controls</strong> position the robot during setup and recovery.</li><li><strong>Mode and status information</strong> show whether the controller is prepared for manual or automatic operation.</li><li><strong>Position displays</strong> report joint angles and Cartesian pose values.</li><li><strong>Program controls</strong> allow stepping, editing, testing, and controlled execution.</li><li><strong>Diagnostics</strong> expose alarms, I/O state, safety status, and controller messages.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Manufacturer interfaces differ, but the underlying motion concepts remain similar. ABB training material identifies teach-pendant operation, joystick jogging, axis motion, linear motion, tool reorientation, and coordinate systems as core manual-operation skills. <a href="https://library.e.abb.com/public/4f2f78f4b9593103c12577660031660d/S4%20Programming%20and%20Operation%20.pdf">ABB Programming and Operation reference material</a> documents those concepts in a structured operator workflow.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">1. Manual mode must be intentional</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Manual or teach mode changes how the robot is controlled. It does not remove the hazards identified in OSRTC.001. Robot mass, payload, fixtures, stored energy, pinch points, and adjacent machinery remain physically present.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>Verify the correct operating mode before commanding motion.</li><li>Confirm the robot expected to move is the robot actually selected.</li><li>Confirm the correct mechanical unit when external axes are present.</li><li>Verify the safeguarded-space entry procedure and enabling-device requirement.</li><li>Use the lowest practical speed during initial manual positioning.</li><li>Maintain visibility of the robot, tool, payload, and surrounding fixtures whenever practical.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Jogging means commanded manual motion</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Jogging</strong> is manual robot movement commanded from the pendant or approved manual-control interface. Jogging is used to position the robot for teaching points, tool setup, inspection, recovery, alignment, or maintenance tasks.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Two fundamental jogging families are used across industrial robots:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Joint or axis jogging:</strong> individual robot joints rotate independently.</li><li><strong>Cartesian jogging:</strong> the tool center point moves along or rotates about X, Y, and Z directions in a selected coordinate frame.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Joint jogging from a FANUC teach pendant</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=fTYUtNtldi0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=fTYUtNtldi0
</div><figcaption class="wp-element-caption"><em>Shane Welcher SR — Using a FANUC Robot Teach Pendant to Jog a Robot Joint. Demonstrates pendant speed controls, joint jogging, stepping through a program, and basic position operations.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">3. Joint jogging: understand the mechanism</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Joint jogging commands one axis at a time. On a typical six-axis articulated robot, joints are commonly numbered J1 through J6.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>J1</strong> commonly rotates the robot about the base.</li><li><strong>J2 and J3</strong> largely control arm reach and elevation.</li><li><strong>J4, J5, and J6</strong> largely control wrist orientation.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The exact mechanism depends on robot architecture. Axis direction should be learned from the specific manufacturer model rather than assumed from another robot.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Joint jogging is especially useful when clearing an interference condition, observing a single axis, inspecting mechanical motion, or moving away from a singular or awkward Cartesian configuration.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Cartesian jogging: move the tool through space</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Cartesian jogging commands movement of the tool center point rather than a single motor axis. The controller calculates the coordinated joint motion required to produce the requested X, Y, Z translation or orientation change.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Cartesian jogging is often easier for tasks such as:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>moving directly toward or away from a fixture;</li><li>raising or lowering a tool;</li><li>approaching a part along a known direction;</li><li>aligning an end effector with a surface;</li><li>fine-positioning a TCP near a taught point.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Coordinate frames determine what X, Y, and Z mean</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A Cartesian jog command is incomplete without a coordinate frame. The same positive-X command can produce different physical robot motion depending on the selected frame.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>World frame:</strong> a fixed reference for the overall robot system or installation.</li><li><strong>Base frame:</strong> a frame attached to the robot base or configured robot base reference.</li><li><strong>Tool frame:</strong> a frame attached to the end effector and normally defined around the tool center point.</li><li><strong>User/work-object frame:</strong> a frame attached conceptually to a fixture, machine, pallet, workpiece, or process reference.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>FANUC’s current CRX manual-operation training explicitly distinguishes Cartesian and joint jogging and uses X, Y, and Z controls for Cartesian positioning. <a href="https://crx.fanucamerica.com/training/programming-part-2-manual-operation">FANUC CRX Programming Part 2 — Manual Operation</a> describes these manual positioning modes and the enabling-device requirement.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: WORLD, TOOL, and JOINT jogging</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=TxOmoFZATO4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=TxOmoFZATO4
</div><figcaption class="wp-element-caption"><em>Shane Welcher SR — Jogging a FANUC Robot in WORLD Using a Teach Pendant. Compares WORLD, TOOL, and JOINT jogging and demonstrates how frame selection changes commanded motion.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">6. World or base frame</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>World or base coordinates are useful when motion should follow fixed plant or robot-cell directions. A vertical or horizontal movement can be easier to visualize when the selected frame aligns with the cell layout.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Frame alignment must still be verified. A robot mounted on a wall, ceiling, pedestal, rail, or angled fixture can have a base orientation that differs from visual expectations.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">7. Tool frame</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Tool coordinates move relative to the current orientation of the end effector. Positive tool-Z, for example, may move directly outward from a gripper, welding torch, probe, screwdriver, or suction tool if the TCP and tool frame are defined correctly.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Tool-frame jogging is especially useful for controlled approach and retreat motions. An incorrect TCP or tool orientation can make these motions misleading, so tool data must be verified before relying on tool-relative jogging.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">8. User or work-object frame</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A user or work-object frame represents the coordinate system of the task rather than the robot. A pallet, machine table, fixture, part nest, or conveyor reference can be assigned a local frame so manual motion and programmed positions follow that geometry.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This matters because a technician can reason in process directions rather than robot-base directions. A fixture may be rotated relative to the robot, yet its local X direction can still represent the part-loading direction.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">9. Tool Center Point</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <strong>Tool Center Point</strong>, or TCP, is the reference point the controller uses to represent the working point of the end effector.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>A welding torch TCP may be at the wire tip.</li><li>A gripper TCP may be centered between jaws.</li><li>A vacuum tool TCP may be at the pickup surface.</li><li>A screwdriver TCP may be at the driver tip.</li><li>A probe TCP may be at the sensing point.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>An incorrect TCP can cause unexpected tool-frame motion, inaccurate taught positions, poor path following, and collision risk near fixtures.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">10. Speed override is a risk-control tool during manual setup</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Manual jog speed should be selected deliberately. High speed increases stopping distance and reduces the time available to detect an incorrect frame, wrong axis, bad TCP, fixture interference, or unintended direction.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>Start slow after changing coordinate frame.</li><li>Start slow after changing selected mechanical unit.</li><li>Start slow near fixtures, tooling, people, or cell boundaries.</li><li>Use incremental or fine jogging when available for precision positioning.</li><li>Increase manual speed only after the intended direction is verified.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">11. Incremental jogging</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Incremental jogging moves the robot by a defined small amount for each control input. This is useful when continuous jogging is too coarse for precise alignment.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>ABB documentation describes configurable incremental linear jogging and fine positioning as standard manual-operation capabilities. Incremental jogging should still be treated as commanded robot motion; small motion can still create pinch or contact hazards.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: ABB FlexPendant axis, linear, and reorientation jogging</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=rClc2d2RUZw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=rClc2d2RUZw
</div><figcaption class="wp-element-caption"><em>Aleksandar Haber PhD — How to Move-Jog ABB Robot Using FlexPendant. Demonstrates axis, linear, and reorientation motion modes with an ABB teach pendant.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">12. Reorientation changes tool angle without intentionally translating the TCP</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Many controllers provide a reorientation mode that rotates the tool about the TCP or another selected reference. This allows orientation adjustment while attempting to keep the tool center point fixed in space.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Reorientation can produce large wrist and elbow motion even when the TCP remains nearly stationary. Clearance must therefore be checked across the entire arm, not only at the tool tip.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">13. Singularities and awkward configurations</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A singularity is a robot configuration where the mathematical relationship between Cartesian tool motion and joint motion becomes poorly conditioned or loses a degree of freedom. Near a singularity, a small requested Cartesian movement can require very large joint-speed changes.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Practical technician indicators can include:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>unexpectedly rapid wrist motion during Cartesian jogging;</li><li>difficulty maintaining a requested Cartesian direction;</li><li>controller singularity warnings;</li><li>motion slowing or refusing to continue;</li><li>large axis movement for a small TCP adjustment.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>When a singularity or awkward arm configuration is suspected, joint jogging may provide a safer method to move the robot to a better configuration before resuming Cartesian motion.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">14. Home position, mastering, and calibration are different concepts</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Technicians should distinguish several commonly confused terms:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Home position:</strong> a defined robot pose used by the application or site.</li><li><strong>Reference position:</strong> a controller or application position used for verification or sequencing.</li><li><strong>Mastering:</strong> establishing the relationship between physical joint position and controller joint-position reference.</li><li><strong>Calibration:</strong> verifying or correcting geometric or positional relationships according to the manufacturer procedure.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>A robot can be jogged to a programmed home pose while still being incorrectly mastered. Conversely, correctly mastered joints do not guarantee that tool or work-object calibration is correct.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">15. Position display: joint values versus Cartesian pose</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A pendant commonly displays robot position in more than one representation.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Joint representation</strong> shows the angular or linear position of each controlled axis.</li><li><strong>Cartesian representation</strong> shows TCP position and orientation in a selected frame.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Both views are valuable during troubleshooting. A Cartesian position that appears wrong may be caused by frame or TCP data even when joint positions are physically repeatable.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">16. Manual-motion pre-check</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Confirm authorization and the approved task procedure.</li><li>Confirm the selected robot or mechanical unit.</li><li>Confirm manual/teach mode and the required enabling-device state.</li><li>Verify the intended coordinate frame.</li><li>Verify TCP and tool selection.</li><li>Verify the jog speed or override.</li><li>Check robot, tool, payload, cables, fixtures, and nearby equipment for clearance.</li><li>Command a small movement first to confirm direction.</li><li>Continue only after motion matches the intended frame and direction.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">17. Common technician mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Jogging before checking which coordinate frame is active.</li><li>Assuming positive X or Z means the same physical direction in every frame.</li><li>Using high jog speed near a fixture before verifying direction.</li><li>Forgetting that a changed TCP changes tool-frame behavior.</li><li>Watching only the tool tip while another robot link approaches a collision.</li><li>Using Cartesian jogging near a singularity without recognizing unstable joint motion.</li><li>Confusing a programmed home position with mastering or calibration.</li><li>Changing mastering, TCP, or frame data merely to make a position display “look right.”</li><li>Resetting a fault and immediately jogging without identifying the current mechanical state.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">18. Recovery example: robot stopped near a fixture</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A robot stops close to a fixture after a process fault. The correct recovery is not to select an arbitrary axis and move quickly away.</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Establish why the robot stopped.</li><li>Identify the current tool, payload, joint configuration, and fixture clearance.</li><li>Confirm the required safe manual state from <a href="https://bitcoinversus.tech/2026/10/04/osrtc-001-industrial-robot-safety-e-stops-safeguarding-safe-workcell-entry/">OSRTC.001</a>.</li><li>Determine whether joint or Cartesian motion provides the clearest escape path.</li><li>Select a low jog speed.</li><li>Command a small movement and verify direction.</li><li>Move only far enough to create safe clearance.</li><li>Inspect the tool, payload, fixture, and robot for damage before returning to automatic operation.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Describe the difference between joint jogging and Cartesian jogging.</li><li>Explain how the same positive-X jog command can create different physical motion in WORLD and TOOL frames.</li><li>Identify a situation where TOOL-frame jogging is preferable to WORLD-frame jogging.</li><li>Explain why a correct TCP matters during tool-relative motion.</li><li>List five checks required before a manual jog near a fixture.</li><li>Explain why reorientation can create large robot-arm motion while the TCP remains nearly fixed.</li><li>Describe the difference between a home position and mastering.</li><li>Write a recovery sequence for a robot stopped close to a machine door or clamp.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What is joint jogging?</strong><br>Manual movement of individual robot axes or joints.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. What is Cartesian jogging?</strong><br>Manual movement of the tool center point along or about X, Y, and Z directions in a selected coordinate frame.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. Why must the active coordinate frame be checked before jogging?</strong><br>Because the physical direction represented by X, Y, and Z depends on the selected frame.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. What is the TCP?</strong><br>The Tool Center Point used by the controller as the working reference point of the end effector.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. Why should manual jog speed be reduced near fixtures?</strong><br>Lower speed increases reaction time and reduces the consequence of a wrong frame, wrong direction, or unexpected interference.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>6. What does incremental jogging provide?</strong><br>Small defined motion increments for precise manual positioning.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>7. What is a robot singularity?</strong><br>A configuration where Cartesian motion mapping becomes poorly conditioned or loses a degree of freedom, potentially requiring large joint motion for small TCP changes.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>8. Does reaching a programmed home pose prove the robot is correctly mastered?</strong><br>No. Home position and mastering are different concepts.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Safe manual robot positioning depends on selecting the correct motion model before commanding motion. Joint jogging controls individual axes; Cartesian jogging controls the TCP in a selected frame. Coordinate frames define what X, Y, and Z mean, TCP data defines the tool reference, and speed control determines how aggressively the robot responds. A competent technician verifies mode, frame, tool, speed, clearance, and direction before every critical manual move.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Safety note: This lesson is general technical education and does not authorize work on any robot. Manufacturer instructions, site risk assessments, validated safety functions, and site-specific procedures control actual operation.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Display note: this lesson uses standard Gutenberg paragraphs, headings, lists, and media embeds only. No decorative text-box or callout-box layout is used.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->