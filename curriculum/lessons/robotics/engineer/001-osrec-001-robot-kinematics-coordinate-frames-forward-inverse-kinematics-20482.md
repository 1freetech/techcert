---
title: "OSREC.001: Robot Kinematics and Coordinate Frames — Forward and Inverse Kinematics"
wordpress_post_id: 20482
source: BitcoinVersus.tech
published: 2026-10-04T01:07:59
modified: 2026-10-04T01:12:52
live_url: https://bitcoinversus.tech/2026/10/04/osrec-001-robot-kinematics-coordinate-frames-forward-inverse-kinematics/
track: robotics/engineer
lesson_number: 1
raw_source: 001-osrec-001-robot-kinematics-coordinate-frames-forward-inverse-kinematics-20482.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Robotics engineering begins when “move the arm there” becomes a precise mathematical question: where is “there,” relative to which frame, and what joint values place the tool at that pose?</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is <strong>OSREC.001</strong>, the first lesson in the Open Source Robotics Engineer Certification track. It builds from the technician view of robot hardware into the mathematical structure engineers use to describe and command motion.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For a shorter introduction to the topic, revisit our earlier <a href="https://bitcoinversus.tech/2025/12/23/robot-kinematics/"><strong>Robot Kinematics</strong></a> article. This lesson goes deeper into coordinate frames, transformations, forward kinematics, inverse kinematics, and the engineering mistakes that appear when those ideas are implemented incorrectly.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The whole lesson in one flow</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>joint positions define robot configuration<br>↓<br>coordinate frames define where bodies are measured from<br>↓<br>transformations relate one frame to another<br>↓<br>forward kinematics maps joints → tool pose<br>↓<br>inverse kinematics maps desired tool pose → joint solution(s)<br>↓<br>trajectory generation connects poses over time<br>↓<br>control drives motors so the physical robot follows the mathematical command</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">1. Configuration and degrees of freedom</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A robot's <strong>configuration</strong> is the set of variables needed to describe its mechanical state. For a simple six-axis articulated arm, the configuration can usually be represented by six joint variables:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>q = [q<sub>1</sub>, q<sub>2</sub>, q<sub>3</sub>, q<sub>4</sub>, q<sub>5</sub>, q<sub>6</sub>]</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Each independent variable corresponds to one degree of freedom. Different <a href="https://bitcoinversus.tech/2025/12/21/robotics-industrial-robot-types/"><strong>industrial robot types</strong></a> arrange those degrees of freedom differently: articulated arms use rotary joints, Cartesian robots rely heavily on linear axes, SCARA robots combine planar rotary motion with vertical translation, and parallel robots use closed mechanical chains.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The geometry matters because the same desired tool motion can require very different joint motion depending on the mechanism.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Reference: <a href="https://modernrobotics.northwestern.edu/nu-gm-book-resource/foundations-of-robot-motion/">Northwestern Modern Robotics — Foundations of Robot Motion</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Coordinate frames: every pose needs a reference</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A position such as “X = 400 mm” is incomplete unless the engineer states the reference frame. Robotics uses coordinate frames to define both position and orientation.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>World frame:</strong> a fixed global reference for the workcell.</li><li><strong>Base frame:</strong> attached to the robot base.</li><li><strong>Joint/link frames:</strong> attached to robot links or joints for kinematic calculations.</li><li><strong>Tool frame:</strong> attached to the end effector.</li><li><strong>TCP frame:</strong> centered at the tool center point that matters to the task.</li><li><strong>Work/object frame:</strong> attached to a fixture, part, conveyor, pallet, or workpiece.</li><li><strong>Camera frame:</strong> attached to a vision sensor.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Two engineers can describe the same physical point with different numbers if they use different frames. The numbers differ; the physical point does not.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Coordinate transformations</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=XOg1KT6xD04","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=XOg1KT6xD04
</div><figcaption class="wp-element-caption"><em>NPTEL — Kinematics: Coordinate Transformations.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">3. Position and orientation are different quantities</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A robot tool pose contains both:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Position:</strong> where the origin of the tool frame is located.</li><li><strong>Orientation:</strong> how the tool frame is rotated relative to the reference frame.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>In three dimensions, position is commonly represented by a vector <strong>p = [x, y, z]</strong>. Orientation may be represented by a rotation matrix, Euler angles, axis-angle coordinates, or a quaternion. Each representation has advantages and failure modes.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For industrial work, orientation errors can be just as damaging as position errors. A welding torch can arrive at the correct XYZ location but still be unusable if its approach angle is wrong.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Homogeneous transformations</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <strong>homogeneous transformation</strong> combines rotation and translation into one mathematical object. In compact block form:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>T = [ R&nbsp;&nbsp;p ; 0&nbsp;&nbsp;1 ]</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Here <strong>R</strong> describes orientation and <strong>p</strong> describes translation. Transformations can be multiplied to chain frames together.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For example:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>world → robot base<br>robot base → wrist<br>wrist → tool<br>tool → TCP</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Multiplying the appropriate transforms lets the engineer express the TCP pose in the world frame.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>MathWorks documents the same family of robotics representations through rotation matrices, quaternions, and SE(3) homogeneous transformations: <a href="https://www.mathworks.com/help/robotics/coordinate-system-transformations.html">Coordinate Transformations — MATLAB &amp; Simulink</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Forward kinematics: joints to tool pose</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Forward kinematics</strong> answers:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Given the joint values, where is the end effector?</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Mathematically, the relationship can be written as:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>x = f(q)</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>where <strong>q</strong> is the joint configuration and <strong>x</strong> is the resulting tool pose.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Forward kinematics is usually deterministic: for a given valid joint configuration, the robot has one physical pose. Different formulations can be used to derive it, including Denavit–Hartenberg parameters or product-of-exponentials methods.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Northwestern's Modern Robotics Chapter 4 treats forward kinematics explicitly in the space and end-effector frames: <a href="https://modernrobotics.northwestern.edu/chapters/chapter4/">Modern Robotics — Chapter 4</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Forward kinematics</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=J87P0OjqAsU","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=J87P0OjqAsU
</div><figcaption class="wp-element-caption"><em>NPTEL — Forward Kinematics, Introduction to Robotics.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">6. Inverse kinematics: desired pose to joints</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Inverse kinematics</strong> asks the reverse question:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>What joint values place the end effector at this desired pose?</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Conceptually:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>q = f<sup>−1</sup>(x)</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>But unlike simple scalar inversion, robot inverse kinematics may have:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>no solution because the pose is outside the workspace;</li><li>one solution;</li><li>multiple valid joint solutions;</li><li>infinitely many solutions in redundant robots;</li><li>numerically unstable behavior near a singularity.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>For a six-axis arm, the same TCP pose may be reachable with different shoulder, elbow, or wrist configurations. Engineers must choose the solution that respects limits, collision constraints, cable routing, cycle time, and process requirements.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Reference: <a href="https://modernrobotics.northwestern.edu/chapters/chapter6/">Modern Robotics — Chapter 6: Inverse Kinematics</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Inverse kinematics</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=nin2TbMuhR0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=nin2TbMuhR0
</div><figcaption class="wp-element-caption"><em>Northwestern Robotics — Inverse Kinematics of Open Chains.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">7. Joint space and task space</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Joint space</strong> describes motion using joint variables. <strong>Task space</strong> describes motion using the end-effector pose or task variables.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A straight line in joint space generally does <strong>not</strong> produce a straight-line TCP path. Likewise, a straight Cartesian tool path usually requires nonlinear coordinated motion across several joints.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This distinction matters in welding, dispensing, machining, inspection, and any process where the path of the tool—not merely the final pose—must be controlled.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">8. The tool center point</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <strong>tool center point (TCP)</strong> is the task-relevant point attached to the end effector. It may be the center of a gripper, welding wire tip, screwdriver bit, camera optical reference, or dispensing nozzle.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A robot can have perfectly healthy <a href="https://bitcoinversus.tech/2025/12/22/robotics-drive-systems/"><strong>drive systems</strong></a> and still miss the part if the TCP definition is wrong.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Common causes of TCP error include:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>tool replaced without recalibration;</li><li>tool bent after a collision;</li><li>incorrect tool length entered;</li><li>wrong active tool frame;</li><li>end-effector fixture shifted;</li><li>payload or center-of-gravity data entered incorrectly.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">9. Kinematic models assume real mechanics behave</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The mathematical model assumes the physical joints and links match the modeled geometry. Real mechanisms introduce error through compliance, backlash, bearing play, calibration offsets, thermal expansion, and reducer error.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is where robot math meets mechanical design. Earlier BitcoinVersus lessons on <a href="https://bitcoinversus.tech/2025/12/24/gear-types-in-modern-robotics-systems/"><strong>gear trains and reducers</strong></a> and <a href="https://bitcoinversus.tech/2025/12/26/industrial-robotics-displacement-measuring-systems/"><strong>displacement measurement</strong></a> matter directly to robotics engineering because the control model is only as good as the mechanical transmission and feedback data.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">10. Singularities</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <strong>kinematic singularity</strong> is a robot configuration where the mapping between joint motion and Cartesian motion loses rank. Practically, the robot can lose the ability to move the tool freely in one or more directions, or a small desired Cartesian velocity may require very large joint velocities.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Symptoms can include:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>unexpected wrist speed near certain poses;</li><li>motion planner refusing a path;</li><li>joint velocities increasing sharply;</li><li>orientation flipping to another inverse-kinematics branch;</li><li>poor numerical convergence.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Singularities are not simply software bugs. They arise from robot geometry.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">11. Coordinate frames in robotics software</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Modern <a href="https://bitcoinversus.tech/2026/09/29/googles-intrinsic-open-sources-core-industrial-robotics-stack/"><strong>industrial robotics software stacks</strong></a> maintain relationships among many moving frames: world, base, links, cameras, tools, parts, and targets. The math is the same whether the transform comes from a hand-derived model, a robot controller, a simulation environment, or middleware.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>MathWorks' Robotics System Toolbox similarly treats manipulators through rigid-body-tree models and includes forward/inverse kinematics, collision checking, path planning, trajectory generation, and dynamics: <a href="https://www.mathworks.com/help/robotics/robot-modeling.html">MathWorks — Robot Modeling</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">12. Engineering troubleshooting: pose error</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Suppose the robot reaches the correct general area but the tool is consistently 8 mm too high.</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>Confirm the active coordinate frame.</strong> Is the program using world, base, work-object, or tool coordinates?</li><li><strong>Confirm the TCP.</strong> Was the tool changed or bent?</li><li><strong>Check calibration.</strong> Are joint zero offsets valid?</li><li><strong>Check fixture coordinates.</strong> Did the workpiece move?</li><li><strong>Check feedback.</strong> Are joint encoders and external measurement systems consistent?</li><li><strong>Check mechanics.</strong> Is there backlash, looseness, or reducer damage?</li><li><strong>Check the model.</strong> Are link lengths, offsets, and frame transforms correct?</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p>Do not immediately retouch every programmed point. If one frame or TCP is wrong, changing dozens of points can hide the root cause and make the system harder to restore.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">13. Engineering troubleshooting: wrong inverse-kinematics branch</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Suppose the tool reaches the same target pose but the elbow swings to the opposite side of the machine.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The target may have multiple valid IK solutions. The engineering task is to apply constraints or choose a seed/configuration that selects the intended shoulder, elbow, and wrist branch.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>respect joint limits;</li><li>avoid collisions;</li><li>avoid singularities;</li><li>minimize unnecessary joint travel;</li><li>keep cables and hoses within safe routing;</li><li>preserve process orientation.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">14. Practice exercise</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A six-axis robot has a camera mounted above the workcell. The camera reports a part position in the camera frame, but the robot controller commands motion in the base frame.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Think through the chain:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>camera measurement<br>↓<br>camera-to-world calibration<br>↓<br>world-to-base transform<br>↓<br>desired TCP pose in base coordinates<br>↓<br>inverse kinematics<br>↓<br>joint target</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>If the camera calibration is wrong by 5 mm, the inverse kinematics may be mathematically perfect and the robot can still miss the part by about 5 mm. Good mathematics cannot correct bad frame calibration.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What does forward kinematics compute?</strong><br>The end-effector pose from known joint values.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. What does inverse kinematics compute?</strong><br>One or more joint configurations that can produce a desired end-effector pose.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. Why are coordinate frames necessary?</strong><br>Because position and orientation only have meaning relative to a defined reference.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. What is a TCP?</strong><br>The task-relevant point and frame attached to the robot's tool.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. Why can inverse kinematics have multiple answers?</strong><br>Because different joint configurations can place the same end effector at the same pose.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>6. What is a singularity?</strong><br>A configuration where the robot loses independent Cartesian motion capability because the joint-to-task-space mapping becomes rank deficient.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>7. Why can a robot with healthy motors still miss a target?</strong><br>Because frame calibration, TCP data, fixture coordinates, mechanical geometry, or feedback can be wrong even when the actuators work correctly.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Robot motion is geometry expressed through coordinate frames.</strong> Forward kinematics tells an engineer where the tool goes when the joints move. Inverse kinematics tells the engineer which joints can produce a desired tool pose. Transformations connect frames. Calibration connects the mathematics to the real machine. Once those foundations are solid, trajectory planning, dynamics, control, perception, and autonomous manipulation become much easier to reason about.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Display note: all formulas and motion flows in this lesson are educational text, not terminal simulations. No Windows, Linux, or VS Code terminal colors are represented or invented.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->