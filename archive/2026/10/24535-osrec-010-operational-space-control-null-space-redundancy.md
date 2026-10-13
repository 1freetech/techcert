---
post_id: 24535
title: "OSREC.010: Operational Space Control and Null-Space Redundancy"
live_url: "https://bitcoinversus.tech/2026/10/13/osrec-010-operational-space-control-null-space-redundancy/"
slug: "osrec-010-operational-space-control-null-space-redundancy"
featured_media_id: 24536
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osrec-010-operational-space-null-space-control-cover-1200x630-1.png"
status: publish
---

<!-- wp:paragraph -->
<p><strong>Operational space control lets a robot be controlled in the coordinates where the task actually exists—such as end-effector position, orientation, velocity, or contact force—while null-space control uses any remaining degrees of freedom for secondary goals without disturbing the primary task.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/13/osrec-009-hybrid-motion-force-control/"><strong>OSREC.009: Hybrid Motion-Force Control</strong></a>, <a href="https://bitcoinversus.tech/2026/10/12/osrec-008-impedance-admittance-control/"><strong>OSREC.008: Impedance and Admittance Control</strong></a>, <a href="https://bitcoinversus.tech/2026/10/11/osrec-007-robot-force-control/"><strong>OSREC.007: Robot Force Control</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/04/osrec-002-robot-jacobians-velocity-kinematics-singularities-differential-motion/"><strong>OSREC.002: Robot Jacobians</strong></a>. Those lessons provide the Jacobian, force-control, and interaction foundations needed here.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=Q5UiPnXsFZA&amp;w=900&amp;h=506]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>This operational-space-control demonstration from the Intelligent Autonomous Systems group shows task-space control behavior on a redundant manipulator.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You’ll Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Explain the difference between joint-space and operational-space control.</li><li>Define task coordinates and task Jacobians.</li><li>Understand operational-space inertia and why Cartesian axes do not all feel dynamically identical.</li><li>Explain dynamically consistent inverse mappings.</li><li>Define kinematic redundancy.</li><li>Use null-space projection conceptually to add secondary objectives without disturbing a primary task.</li><li>Explain joint-limit avoidance, posture control, manipulability optimization, and collision-margin objectives.</li><li>Recognize singularity and model-error problems.</li><li>Understand why task hierarchies need priorities rather than simple command summation.</li><li>Troubleshoot unexpected motion in redundant manipulators.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why Joint Control Is Not Always the Best Task Description</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A joint-space controller thinks in variables such as shoulder angle, elbow angle, wrist angle, joint velocity, and joint torque. That is useful because motors act at joints. But many real tasks are specified somewhere else: keep a tool tip at a Cartesian position, hold a camera orientation, move along a surface normal, maintain a contact force, or keep a gripper aligned with a workpiece.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Operational-space control moves the control problem into that task description. Stanford’s robotics curriculum describes operational-space control as a method for controlling motion and interaction directly in the task space rather than controlling each joint independently. Oussama Khatib’s operational-space formulation was developed specifically to coordinate articulated robots around task variables. <a href="https://khatib.stanford.edu/projects/controlandsimulation.html"><strong>Stanford Robotics</strong></a> notes that the formulation was introduced to avoid treating highly articulated robots as independent joint problems and instead coordinate them in the space where the task is specified.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Task Coordinates and the Jacobian</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Let the robot joint configuration be <code>q</code>. A task variable can be written conceptually as <code>x = φ(q)</code>. The task could contain three-dimensional position, full six-dimensional pose, one orientation axis, a center-of-mass coordinate, or another quantity derived from the joint configuration.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The Jacobian connects joint motion to task motion. In compact form, <code>ẋ = J(q) q̇</code>. The same geometric relationship is also what lets joint torques and task-space forces be related through the transpose mapping. This Jacobian is therefore the bridge between the robot’s actuators and the coordinates that matter to the task.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The University of Illinois <a href="https://motion.cs.illinois.edu/RoboticSystems/RobotControl.html"><strong>Robotic Systems control notes</strong></a> describe operational space as the task space defined by a mapping from joint coordinates and emphasize that controlling task-space force or motion requires transforming both kinematics and dynamics between those spaces.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Operational-Space Dynamics</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Moving the end effector one centimeter in one Cartesian direction may require a different joint-motion pattern and different torque than moving it one centimeter in another direction. The effective inertia seen at the end effector therefore depends on robot configuration.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Operational-space control accounts for that configuration-dependent dynamics. Conceptually, the controller transforms the robot’s joint-space mass matrix into a task-space inertia matrix often denoted by <code>Λ</code>. That matrix tells the controller how the robot dynamically responds in the task coordinates.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is what separates classical operational-space dynamics from a simple Cartesian position target followed by inverse kinematics. Both can command an end effector, but operational-space control explicitly models the dynamic relationship between task accelerations or forces and the actuator torques required to produce them.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Dynamically Consistent Mapping</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A plain Moore-Penrose pseudoinverse gives one useful way to map a task-space velocity into joint velocity. Dynamic control introduces an additional requirement: the mapping should respect the robot’s inertia so that secondary motions do not inject unwanted task-space forces into the primary task.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The operational-space framework therefore uses a dynamically consistent generalized inverse rather than treating all joint motion as equally costly. The exact expression depends on notation, but the engineering idea is simple: choose joint actions that realize the task while respecting how mass and inertia are distributed through the mechanism.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[embed]https://www.reddit.com/r/robotics/comments/1abvh2e/[/embed]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>A robotics discussion explains why null-space projection is useful on redundant arms: secondary joint motion can be added while preserving the commanded end-effector motion.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What Redundancy Means</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A manipulator is redundant relative to a task when it has more controllable degrees of freedom than the task consumes. A seven-joint arm controlling a full six-degree-of-freedom tool pose has one extra degree of freedom in many configurations. If the task controls only Cartesian position, an even larger portion of the robot’s joint motion may remain free.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Redundancy means there can be many joint configurations that produce the same end-effector pose. That freedom is not a defect. It becomes a design resource when the controller uses it deliberately.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Null Space</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The null space of the task Jacobian contains joint motions that produce no instantaneous motion in the selected primary task. If a joint-velocity vector lies in that null space, the joints can move while the controlled end-effector coordinate remains unchanged to first order.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A null-space projector is commonly written conceptually as <code>N = I − J#J</code>, where <code>J#</code> is an appropriate generalized inverse. Multiplying a secondary joint command by <code>N</code> removes the part of that command that would interfere with the primary task.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The resulting joint command can be viewed as the sum of two pieces: one part that achieves the primary task and another part that lives in the null space. This lets the end effector continue its job while the elbow, shoulder, or other joints reorganize themselves for a secondary objective.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=sZYBC8Lrmdo&amp;w=900&amp;h=506]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>This seven-degree-of-freedom arm demonstration shows visible posture change while the primary end-effector objective is preserved through redundancy.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Secondary Objective: Joint-Limit Avoidance</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>One of the most useful secondary objectives is keeping joints away from their mechanical limits. The controller can define a cost that becomes larger as a joint approaches a limit, then create a joint-space gradient that pushes the robot toward a safer posture.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Projecting that gradient into the null space lets the robot improve its joint margin without changing the commanded end-effector task. This does not eliminate every joint-limit problem, especially near singularities or hard constraints, but it gives the controller a continuous preference for safer configurations.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Secondary Objective: Posture Control</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A redundant robot can also be given a preferred posture. For example, the controller may favor a particular elbow height, keep the shoulder away from a fixture, or bias the robot toward a neutral joint configuration. The primary task says where the tool must go; the posture objective says how the rest of the robot should arrange itself while doing it.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is particularly important for human-like and whole-body robots. Stanford’s <a href="https://khatib.stanford.edu/teaching/cs327a/index.html"><strong>Advanced Robotic Manipulation course</strong></a> treats operational-space control, redundancy, multiple contacts, posture, and whole-body coordination as one unified control problem.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Secondary Objective: Manipulability</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A robot may be able to reach the current task point but be poorly positioned for the next motion. Near a singularity, one or more task directions can become difficult or impossible to produce without extreme joint motion.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A manipulability objective can bias the robot toward configurations where the Jacobian has better directional authority. In practice, this can improve numerical conditioning, increase motion margin, and reduce the risk that the controller drives toward a posture where tiny Cartesian commands demand very large joint velocities or torques.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Secondary Objective: Collision and Self-Collision Margin</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Null-space freedom can also be used to move links away from obstacles or from other robot links while preserving the primary end-effector task. This requires additional geometric information, such as collision points, distances, surface normals, or potential functions.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Collision avoidance is more difficult than a simple posture preference because secondary avoidance goals can conflict with each other or consume the remaining redundancy. If the primary task itself becomes infeasible under the constraints, a null-space term cannot create missing degrees of freedom. The controller must then modify task priority, slow down, replan, or declare the task infeasible.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[embed]https://www.reddit.com/r/robotics/comments/gt7d84/[/embed]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>A robotics discussion shows how null-space projection is used for joint constraints and secondary tasks such as joint-limit avoidance on redundant manipulators.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Task Priorities Matter</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Multiple robot objectives should not always be added with equal authority. A tool-position task, collision-avoidance task, posture preference, and manipulability objective can conflict. If they are merely summed, a low-importance posture term may accidentally degrade a high-importance task.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Hierarchical control solves this by assigning priorities. The highest-priority task is solved first. Lower-priority objectives are then projected into the null space of the tasks above them. Each lower layer receives only the freedom that remains after the higher-priority requirements are protected.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Singularities Change the Available Null Space</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The rank of the Jacobian determines how many independent task directions can be controlled. Near a singularity, the Jacobian loses conditioning and may lose rank. This changes both the primary task mapping and the structure of the null space.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Damped pseudoinverses, singular-value thresholds, task scaling, and trajectory modification are common tools for keeping the controller numerically stable. A null-space controller should therefore never be designed in isolation from singularity handling.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Model Error Can Break the Ideal Separation</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The mathematics may say that a secondary command lies perfectly in the null space, but a real robot has model error, friction, compliance, sensor noise, actuator dynamics, time delay, and finite control bandwidth. A joint motion that is theoretically invisible to the primary task can still create small end-effector disturbances.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is one reason Stanford’s advanced robotics courses pair operational-space theory with simulation, model validation, and compliant control. The controller should be tested first in simulation, then introduced to hardware with conservative gains, bounded commands, and clear stop criteria.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Practical Troubleshooting Workflow</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li><strong>Verify the task definition.</strong> Confirm which Cartesian coordinates, orientations, forces, or other variables are actually controlled.</li><li><strong>Verify frames.</strong> A wrong base, tool, sensor, or world frame can look like a controller failure.</li><li><strong>Check the Jacobian.</strong> Confirm dimensions, ordering, reference frame, and sign conventions.</li><li><strong>Inspect singular values.</strong> Determine whether the robot is approaching a singular or poorly conditioned configuration.</li><li><strong>Disable secondary objectives.</strong> Run the primary task alone to prove that the base operational-space controller behaves correctly.</li><li><strong>Add one null-space objective at a time.</strong> This isolates posture, limit, or collision terms that are producing unexpected motion.</li><li><strong>Check priorities.</strong> Confirm lower-priority objectives are projected through the null spaces of higher-priority tasks.</li><li><strong>Limit gains and velocities.</strong> An aggressive null-space posture controller can create large joint motion even when the end effector appears stable.</li><li><strong>Compare model and measured behavior.</strong> Look for friction, payload, inertia, calibration, or compliance errors.</li><li><strong>Test transitions.</strong> Watch what happens when task rank changes, a secondary constraint activates, or the robot crosses a configuration boundary.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Engineering Exercise</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>Choose a seven-degree-of-freedom arm model controlling a six-degree-of-freedom end-effector pose.</li><li>Identify the primary task coordinates and the corresponding Jacobian dimensions.</li><li>Explain why one degree of kinematic redundancy remains in a full-rank configuration.</li><li>Define a secondary posture objective that prefers the elbow to remain above a chosen height.</li><li>Explain how a null-space projector prevents that posture objective from changing the primary end-effector motion to first order.</li><li>Add a joint-limit cost and describe what should happen as one joint approaches its soft limit.</li><li>Describe what changes if the robot approaches a singularity and the Jacobian loses conditioning.</li><li>List three real-world model errors that could cause secondary motion to leak into the primary task.</li><li>Propose a test sequence that starts with the primary task only and progressively enables redundancy objectives.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>What is operational space?</li><li>What mathematical object maps joint velocity to task-space velocity?</li><li>How is classical operational-space control different from merely sending a Cartesian target to an inverse-kinematics solver?</li><li>What makes a robot redundant relative to a task?</li><li>What is the null space of a task Jacobian?</li><li>Why is null-space projection useful?</li><li>Name three secondary objectives that can use redundancy.</li><li>Why should lower-priority tasks be projected through higher-priority null spaces?</li><li>What happens to the controller near a singularity?</li><li>Why can a theoretically correct null-space controller still disturb the end effector on real hardware?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>The coordinate space in which the robot task is defined, such as end-effector pose, force, or another task variable.</li><li>The Jacobian.</li><li>Operational-space control explicitly incorporates task-space dynamics and inertia, not just geometric inverse kinematics.</li><li>The robot has more controllable degrees of freedom than the task consumes.</li><li>The set of joint motions that produce no instantaneous motion in the selected task coordinates.</li><li>It lets secondary joint motion be added while protecting the primary task.</li><li>Joint-limit avoidance, posture optimization, manipulability improvement, and collision avoidance are examples.</li><li>So lower-priority objectives use only the freedom left after higher-priority tasks are satisfied.</li><li>The Jacobian becomes poorly conditioned or loses rank, changing the available task directions and null space.</li><li>Real robots contain model error, friction, compliance, sensor noise, delay, and finite bandwidth.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Operational-space control tells the robot what to do where the task exists; null-space control tells the remaining joints how to behave without disturbing that task.</strong> Together, they provide a powerful framework for redundant manipulators, whole-body robots, interaction control, joint-limit avoidance, posture shaping, and multi-task coordination.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">References</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Primary learning references: <a href="https://khatib.stanford.edu/teaching/cs225a/index.html">Stanford CS225A — Experimental Robotics</a>, <a href="https://khatib.stanford.edu/teaching/cs223a/">Stanford CS223A — Introduction to Robotics</a>, <a href="https://khatib.stanford.edu/projects/controlandsimulation.html">Stanford Robotics — Operational Space Formulation</a>, and <a href="https://motion.cs.illinois.edu/RoboticSystems/RobotControl.html">University of Illinois — Robot Control</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Next:</strong> OSREC.011 will continue the advanced manipulation sequence with another multi-objective robot-control topic.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>Safety: advanced robot-control experiments can command unexpected high-speed joint motion even when the end effector appears nearly stationary. Validate controllers in simulation first, enforce joint/velocity/torque limits, maintain approved safeguarding, and use qualified procedures before testing on physical hardware.</em></p>
<!-- /wp:paragraph -->