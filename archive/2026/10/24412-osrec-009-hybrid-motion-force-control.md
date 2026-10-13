<!-- wp:paragraph -->
<p><strong>Hybrid motion-force control lets a robot control motion in directions where the end effector is free to move while simultaneously controlling force in directions constrained by the environment.</strong> A robot erasing a whiteboard, for example, can command x-y motion along the board while regulating normal force into the surface.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/12/osrec-008-impedance-admittance-control/"><strong>OSREC.008: Impedance and Admittance Control</strong></a>. Impedance control shapes the relationship between motion and force; hybrid motion-force control instead partitions task space so different directions receive different control objectives.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=mGuDXlZEoSc","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=mGuDXlZEoSc
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Northwestern Robotics introduces motion control, force control, hybrid motion-force control, and impedance control as distinct robot-control objectives.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Imagine pressing a marker against a whiteboard. The marker should move left and right wherever commanded, but it must also push into the board with enough force to keep writing. Motion matters along the board; force matters into the board. Hybrid motion-force control tells the robot which directions belong to each job.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Explain why contact constraints divide task space into motion and force subspaces.</li><li>Express rigid contact as a velocity constraint.</li><li>Relate allowable motion to the null space of the constraint matrix.</li><li>Relate controllable contact force to the complementary constrained wrench space.</li><li>Explain motion and force projection using P and I − P.</li><li>Connect end-effector wrench commands to joint torque using the Jacobian transpose.</li><li>Distinguish hybrid motion-force control from pure force, impedance, and admittance control.</li><li>Identify practical failures caused by incorrect frames, friction, sensor bias, contact loss, saturation, and environment uncertainty.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Rigid Constraints Create Different Control Directions</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When a robot end effector contacts a rigid environment, not every Cartesian velocity is physically possible. Modern Robotics expresses idealized end-effector velocity constraints in Pfaffian form as <strong>A(θ)V<sub>b</sub> = 0</strong>, where V<sub>b</sub> is the body twist and the rows of A describe constrained motion directions. The allowable end-effector motions lie in the null space of A.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=E6Yp6DwJh24","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=E6Yp6DwJh24
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Northwestern Robotics derives constrained robot dynamics and shows how projection methods separate motion-producing torques from forces that act against constraints.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Motion and Force Are Complementary</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A rigid constraint removes one or more motion freedoms while creating directions in which the robot can push against the environment. In the ideal frictionless model, a direction blocked by the environment is a natural force-control direction, while a direction left free is a natural motion-control direction. This duality is the foundation of hybrid control.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=PPl0yuFJCVM","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=PPl0yuFJCVM
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Modern Robotics explains the duality between force constraints and motion freedoms at rigid-body contacts.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Projection Matrices Separate the Objectives</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Let <strong>P</strong> represent a projection onto the wrench components that create allowable motion. Its complement, <strong>I − P</strong>, selects wrench components that act against the constraints. A hybrid controller can therefore combine a motion-control wrench and a force-control wrench without asking both controllers to dominate the same task-space direction.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A conceptual command can be written as <strong>F<sub>cmd</sub> = P F<sub>motion</sub> + (I − P)F<sub>force</sub></strong>. The exact projector depends on the constraint model and dynamics. The important engineering principle is orthogonality of objectives: motion commands are retained only in allowable motion directions, while force commands are retained only in constrained directions.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=UR0GpaaBVKk","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=UR0GpaaBVKk
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Northwestern Robotics presents the hybrid motion-force controller and shows how P and I − P project motion and force commands into complementary subspaces.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Whiteboard Example</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Consider an eraser held against a vertical whiteboard. The desired task may control x and y motion across the surface while controlling force along z into the board. Depending on orientation constraints, the controller may also regulate rotational motion about the board normal while controlling moments about axes that the surface constrains. The exact partition depends on the physical contact model.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If the robot tries to position-control the normal direction rigidly while also force-controlling that same direction, the objectives can fight each other. A millimeter of geometric error in the board location can then produce a large force. Hybrid control avoids this conflict by assigning the normal direction to the force objective and the tangential directions to motion.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=oxf8FECNs14","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=oxf8FECNs14
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Engineering Educator Academy gives a second treatment of simultaneous motion control in selected directions and force control in others.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">From End-Effector Wrench to Joint Torque</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Once the controller computes an end-effector wrench, the robot still needs joint commands. As introduced in <a href="https://bitcoinversus.tech/2026/10/04/osrec-002-robot-jacobians-velocity-kinematics-singularities-differential-motion/"><strong>OSREC.002: Robot Jacobians</strong></a>, the Jacobian transpose maps an end-effector wrench into joint torque through the familiar relationship <strong>τ = J<sup>T</sup>F</strong>, with additional dynamic compensation and limits applied according to the controller architecture.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=M1U629sREiY","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=M1U629sREiY
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Modern Robotics reviews Jacobian-transpose-based force control with and without end-effector force/torque feedback.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Selector Matrices in an Aligned Task Frame</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In practical applications where the contact directions align cleanly with a chosen task frame, engineers often describe the partition with a selector matrix. A diagonal selector can mark which Cartesian coordinates are motion-controlled, while its complement marks the force-controlled coordinates. This is intuitive for a flat surface but only works correctly when the task frame truly matches the physical constraint directions.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A frame error can therefore become a control error. If the software believes the surface normal points along robot z but the actual surface is tilted, the commanded “normal” force contains unintended tangential components. Always verify the contact frame, TCP, work object, and sensor frame before tuning gains.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hybrid Control Is Not the Same as Impedance Control</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Pure motion control:</strong> tracks position or velocity objectives.</li><li><strong>Pure force control:</strong> regulates a desired contact wrench.</li><li><strong>Hybrid motion-force control:</strong> assigns different task-space directions to motion and force objectives.</li><li><strong>Impedance control:</strong> shapes the dynamic relationship between motion and force.</li><li><strong>Admittance control:</strong> converts measured wrench into a commanded motion response through a virtual mechanical model.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>These methods can also be combined. A hybrid architecture might use strict force regulation normal to a surface while using an impedance controller tangentially, or use admittance behavior in one subspace and trajectory tracking in another. The labels describe control structure, not mutually exclusive product features.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/robotics/comments/pjxq7m/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/robotics/comments/pjxq7m/
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>A robotics discussion illustrates a common engineering question: how force objectives and displacement control are combined in a real manipulator rather than treated as isolated ideas.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Real Contacts Are More Complicated Than Equality Constraints</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The clean mathematical model usually begins with rigid, frictionless equality constraints. Real contact is often unilateral: the robot can push into a surface but cannot pull on it unless physically attached. Friction can permit sticking, cause sliding, or change direction with velocity. Contact can also break and re-form. These effects mean that the correct force/motion subspaces can change during the task.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Advanced manipulation therefore uses contact-state estimation, friction-cone reasoning, inequality constraints, complementarity models, or optimization-based control when simple fixed projections are insufficient. Hybrid motion-force control remains the conceptual foundation: determine which freedoms are available and which wrenches the environment can support.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Force Sensor Bias and Frame Errors</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A six-axis force/torque sensor reports wrench in its own coordinate frame and also senses tool weight, inertial effects, cable forces, and bias. Gravity compensation requires the tool mass, center of mass, robot orientation, and transforms to be correct. Zeroing the sensor under the wrong load condition can make a correct controller regulate the wrong physical force.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Log the raw sensor wrench, compensated wrench, commanded wrench, task frame, joint torque, pose, and contact state together. If the force vector changes unexpectedly when the robot changes orientation without touching anything, investigate gravity compensation or frame transforms before retuning the force loop.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Contact Transition Is a Control Event</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A controller may track free-space motion until contact is detected, then switch to hybrid control. That transition can create force spikes if velocity is too high, detection is delayed, the target surface is misplaced, or integrators contain accumulated error. Contact acquisition should therefore be treated as its own state with conservative approach velocity, bounded force, and explicit transition logic.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Likewise, unexpected contact loss matters. If a force controller continues integrating error after the tool leaves the surface, the robot can accelerate into the environment when contact returns. Anti-windup, contact-state checks, force limits, and state-machine logic are essential practical safeguards.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Stability Depends on the Environment</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>As with OSREC.008, the environment is part of the closed loop. Rigid surfaces, sensor filtering, time delay, actuator saturation, structural compliance, communication jitter, and aggressive gains can make contact control oscillatory. A controller stable on foam may chatter on steel.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Test with conservative force gains and low approach speeds first. Validate multiple surface stiffnesses and geometry errors. Do not declare the controller stable based only on free-space behavior or one ideal simulation.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Example: Surface Polishing</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For polishing a flat workpiece, the robot can trajectory-control tangential x-y motion while force-controlling the surface-normal z direction. The desired normal force maintains tool engagement as small surface-height errors occur. Orientation may be position-controlled or partially force/moment-controlled depending on tool geometry and process requirements.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Useful logs include tangential tracking error, normal force error, end-effector velocity, F/T measurements, joint torque, tool spindle state, surface location estimate, and controller saturation. A finish-quality defect can come from force regulation, path speed, abrasive condition, tool compliance, or geometry—not just one controller gain.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Engineering Workflow</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Define the physical contact and identify constrained versus free motion directions.</li><li>Choose and verify the task frame so its axes match the intended contact geometry.</li><li>Verify robot mastering, TCP, payload, work object, and force/torque sensor calibration.</li><li>Write the constraint model and verify the expected null-space motion.</li><li>Choose the motion and force projectors or selector matrices.</li><li>Test the motion controller without contact.</li><li>Test force regulation at low speed and low force on a compliant test surface.</li><li>Add contact-state logic and conservative transition thresholds.</li><li>Increase force and trajectory bandwidth gradually while monitoring saturation and oscillation.</li><li>Validate against geometry error, different environment stiffnesses, friction changes, and sensor noise.</li><li>Test contact loss and re-contact behavior.</li><li>Archive gains, task frames, sensor calibration, software version, payload, tool, and validation data together.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Engineering Exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Model a planar polishing task with free x-y motion and a rigid constraint in z. Define a 6D task vector and create a simple selector representation that assigns x and y to motion control and z to force control. Explain what happens if the actual surface normal is rotated 5° away from the assumed z axis.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Next, assume the desired normal force is 20 N and the measured compensated force is 14 N. Describe the sign and purpose of the force-control correction. Then repeat the reasoning after contact is lost and explain why an unconstrained force integrator could become dangerous.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What does hybrid motion-force control regulate simultaneously?</li><li>What does A(θ)V = 0 represent?</li><li>Where do allowable motions lie relative to the constraint matrix?</li><li>What is the conceptual role of P?</li><li>What is the conceptual role of I − P?</li><li>How is an end-effector wrench mapped into joint torque?</li><li>Why can task-frame error create unwanted tangential force?</li><li>Why is real unilateral contact more complicated than an equality constraint?</li><li>Why should contact acquisition be treated as a separate control state?</li><li>How does hybrid control differ from impedance control?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Motion in selected unconstrained directions and force in selected constrained directions.</li><li>A velocity constraint imposed by the environment on the end effector.</li><li>In the null space of the constraint matrix.</li><li>It projects commands into the subspace associated with allowable motion.</li><li>It selects the complementary constrained-force subspace.</li><li>Through the Jacobian transpose, τ = J<sup>T</sup>F, with the complete controller also respecting dynamics and limits.</li><li>The assumed normal direction no longer matches the physical normal, so projected force contains components along the real surface.</li><li>Real contacts can separate, slide, stick, and obey friction and inequality limits rather than remaining permanently constrained.</li><li>Impact, delay, integrator state, and surface-position error can produce force spikes during the transition from free motion to contact.</li><li>Hybrid control assigns different directions to motion and force objectives; impedance control shapes the dynamic relationship between force and motion.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Hybrid motion-force control is easiest to remember as <strong>move where movement is free; push where movement is blocked.</strong> The mathematics identifies those directions, projects each controller into the correct subspace, and combines the results. The engineering challenge is making sure the robot’s model of the contact, coordinate frames, force sensor, and environment matches the real workcell closely enough for that clean mathematical split to remain useful.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Previous Related Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/12/osrec-008-impedance-admittance-control/"><strong>OSREC.008: Impedance and Admittance Control</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/11/osrec-007-robot-force-control/"><strong>OSREC.007: Robot Force Control</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/osrec-006-robot-feedback-control-p-pi-pid-feedforward-trajectory-tracking-gain-tuning/"><strong>OSREC.006: Robot Feedback Control</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/07/osrec-005-robot-dynamics-mass-matrix-coriolis-centrifugal-gravity-inverse-forward-dynamics/"><strong>OSREC.005: Robot Dynamics</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/04/osrec-002-robot-jacobians-velocity-kinematics-singularities-differential-motion/"><strong>OSREC.002: Robot Jacobians</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://modernrobotics.northwestern.edu/nu-gm-book-resource/11-6-hybrid-motion-force-control/">Modern Robotics — 11.6 Hybrid Motion-Force Control</a></li><li><a href="https://modernrobotics.northwestern.edu/nu-gm-book-resource/8-7-constrained-dynamics/">Modern Robotics — 8.7 Constrained Dynamics</a></li><li><a href="https://modernrobotics.northwestern.edu/nu-gm-book-resource/11-1-control-system-overview/">Modern Robotics — 11.1 Control System Overview</a></li><li><a href="https://modernrobotics.northwestern.edu/chapters/chapter11/">Modern Robotics — Chapter 11 Robot Control</a></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><em><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech provides technical education and analysis for informational purposes only.</em></p>
<!-- /wp:paragraph -->