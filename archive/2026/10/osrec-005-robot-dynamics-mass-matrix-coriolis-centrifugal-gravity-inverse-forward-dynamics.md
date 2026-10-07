---
post_id: 21571
lesson_code: "OSREC.005"
certification: "Open-Source Robotics Engineer"
track: "Robotics Engineer"
lesson_number: 5
title: "OSREC.005: Robot Dynamics — Mass Matrix, Coriolis/Centrifugal Terms, Gravity, Inverse Dynamics, and Forward Dynamics"
live_url: "https://bitcoinversus.tech/2026/10/07/osrec-005-robot-dynamics-mass-matrix-coriolis-centrifugal-gravity-inverse-forward-dynamics/"
featured_media_id: 21570
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osrec005-robot-dynamics-1200x630-1.jpg"
status: publish
---
<!-- wp:paragraph -->
<p><strong>Open-Source Robotics Engineer — Lesson 005.</strong> Robot kinematics describes where a robot is and how its joints relate to end-effector motion. <a href="https://bitcoinversus.tech/2026/10/06/osrec-004-robot-trajectory-planning-joint-space-cartesian-paths-time-scaling-velocity-acceleration-jerk/"><strong>Trajectory planning</strong></a> adds desired position, velocity, and acceleration over time. <strong>Dynamics</strong> adds the missing physical question: what joint forces or torques are required to create that motion, and what motion results when forces or torques are applied?</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson develops the standard open-chain robot equation of motion, explains the mass matrix, Coriolis and centrifugal terms, gravity, external wrench terms, inverse dynamics, and forward dynamics, and then turns those equations into practical engineering calculations and simulation code.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Write and interpret the manipulator equation of motion.</li><li>Explain why the mass matrix changes with robot configuration.</li><li>Distinguish Coriolis, centrifugal, gravity, and external-force terms.</li><li>Use inverse dynamics to calculate required joint torque for a prescribed motion.</li><li>Use forward dynamics to calculate joint acceleration from applied torque.</li><li>Implement a small numerical dynamics calculation in Python.</li><li>Recognize modeling errors involving units, inertia, friction, gravity, and coordinate conventions.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">From Kinematics to Dynamics</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The earlier Robotics Engineer lessons established the geometric foundation: <a href="https://bitcoinversus.tech/2026/10/02/osrec-001-robot-arm-kinematics-frames-homogeneous-transforms-dh-parameters-forward-kinematics/"><strong>forward kinematics and coordinate frames</strong></a>, <a href="https://bitcoinversus.tech/2026/10/05/osrec-002-robot-jacobians-velocity-kinematics-singularities-force-torque-duality/"><strong>Jacobians and velocity kinematics</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/06/osrec-003-inverse-kinematics-numerical-solvers-convergence-limits-redundancy/"><strong>inverse kinematics</strong></a>. Those tools map joint variables into pose and velocity. Dynamics introduces mass, inertia, gravity, acceleration, and force.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For an n-joint rigid-link manipulator, a common joint-space model is:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">τ = M(q) q̈ + C(q, q̇) q̇ + g(q) + J(q)ᵀ Fext + τf</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>Here, <strong>q</strong> is the joint-position vector, <strong>q̇</strong> is joint velocity, <strong>q̈</strong> is joint acceleration, <strong>τ</strong> is commanded joint force or torque, <strong>M(q)</strong> is the mass or inertia matrix, <strong>C(q,q̇)q̇</strong> contains velocity-dependent Coriolis and centrifugal effects, <strong>g(q)</strong> is gravity compensation, <strong>J(q)ᵀFext</strong> maps an external end-effector wrench into joint space, and <strong>τf</strong> represents friction or other modeled losses.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=1U6y_68CjeY","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=1U6y_68CjeY
</div><figcaption class="wp-element-caption"><em>Northwestern Robotics — Modern Robotics, Chapter 8.1: Lagrangian Formulation of Dynamics, Part 1.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">The Mass Matrix M(q)</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The mass matrix is the joint-space equivalent of mass in the familiar equation F = ma. For a multi-link robot, however, apparent inertia is not a single constant. Moving one joint accelerates several links, and changing joint configuration changes how those link masses and rotational inertias project into joint coordinates. Therefore M depends on q.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a physically valid rigid-body model, M(q) is symmetric and positive definite away from pathological model errors. Its diagonal terms represent direct joint inertia contributions; off-diagonal terms describe inertial coupling between joints. A large off-diagonal term means acceleration at one joint can require substantial torque at another.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The robot's kinetic energy can be written as:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">T = 1/2 q̇ᵀ M(q) q̇</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>This relationship is useful for checking a model: with a valid positive-definite M, nonzero joint velocity produces positive kinetic energy.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Coriolis and Centrifugal Terms</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The velocity-product term C(q,q̇)q̇ captures forces that appear because the robot's coordinate system and link geometry move while the robot is already in motion. Coriolis effects couple motion between coordinates; centrifugal effects grow with rotational speed and tend to appear as squared-velocity terms. These terms disappear when q̇ = 0 but can become substantial on fast manipulators.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Engineers sometimes denote the combined velocity-dependent vector as c(q,q̇) instead of writing C(q,q̇)q̇. Both conventions are common. The important point is to keep the convention internally consistent when comparing equations, software libraries, or papers.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Gravity Compensation g(q)</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Gravity torque depends on configuration. A horizontal arm generally requires more holding torque than the same arm hanging near vertical because the gravitational moment arm changes. The vector g(q) gives the joint torques required to balance gravity at a given configuration when acceleration and velocity effects are zero.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A simple one-link rotary arm illustrates the idea. For a link with mass m, center-of-mass distance l<sub>c</sub>, joint angle q, and gravitational acceleration g, one common planar term is proportional to m g l<sub>c</sub> cos(q), although the exact sine/cosine form depends on how the joint angle is defined. A sign error in the coordinate convention can make gravity compensation push with gravity instead of against it.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">External Wrenches and the Jacobian Transpose</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An end-effector force and moment can be represented by a wrench F<sub>ext</sub>. The Jacobian transpose maps that wrench into equivalent joint torques:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">τext = J(q)ᵀ Fext</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>This is the dynamic continuation of the force/torque duality introduced in OSREC.002. It matters in machining, force-controlled assembly, tool contact, payload handling, and any operation in which the environment pushes back on the robot.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Inverse Dynamics</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Inverse dynamics</strong> asks: given q, q̇, q̈, gravity, and external load, what joint torques are required? This is the natural calculation after trajectory planning because the trajectory already specifies desired position, velocity, and acceleration as functions of time.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For an open chain, the recursive Newton–Euler algorithm computes inverse dynamics efficiently. A forward recursion propagates link positions, velocities, and accelerations from the base toward the end effector. A backward recursion propagates forces and moments from the end effector toward the base, producing the required joint forces or torques.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ZASVKAlegfQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ZASVKAlegfQ
</div><figcaption class="wp-element-caption"><em>Northwestern Robotics — Modern Robotics, Chapter 8.3: Newton–Euler Inverse Dynamics.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Forward Dynamics</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Forward dynamics</strong> asks the opposite question: given q, q̇, and applied torque τ, what acceleration q̈ results? Rearranging the manipulator equation gives:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">q̈ = M(q)⁻¹ [τ - C(q,q̇)q̇ - g(q) - J(q)ᵀFext - τf]</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>In numerical software, engineers normally avoid explicitly forming M<sup>-1</sup>. Instead, solve the linear system M q̈ = b using a stable matrix solver. Forward dynamics is the basis of physics simulation, controller testing, digital twins, and predicting how a manipulator responds to applied torque.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=L8zpJOxDbh4","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=L8zpJOxDbh4
</div><figcaption class="wp-element-caption"><em>Northwestern Robotics — Modern Robotics, Chapter 8.5: Forward Dynamics of Open Chains.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Numerical Example</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Assume a simplified two-joint robot at one instant has the following dynamic terms:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">M = [[4.0, 1.0],
     [1.0, 2.0]] kg·m²

c = [0.5, -0.2] N·m
g = [12.0, 3.0] N·m
τ = [30.0, 10.0] N·m</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>Ignoring external wrench and friction, the acceleration satisfies Mq̈ = τ - c - g. The right-hand side is [17.5, 7.2] N·m. Solving the 2×2 system gives approximately q̈ = [3.97, 1.62] rad/s². Notice that the off-diagonal inertia terms couple the joints; the accelerations are not simply torque divided by each diagonal element.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Python Example: Solve Forward Dynamics</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>import numpy as np

M = np.array([[4.0, 1.0],
              [1.0, 2.0]])

c = np.array([0.5, -0.2])
g = np.array([12.0, 3.0])
tau = np.array([30.0, 10.0])

rhs = tau - c - g
qdd = np.linalg.solve(M, rhs)

print("joint acceleration rad/s^2:", qdd)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For production robotics software, M, c, and g are computed from the robot model at the current state rather than typed by hand. Libraries may use URDF inertial parameters, spatial-vector algebra, recursive Newton–Euler methods, articulated-body algorithms, or automatically generated rigid-body dynamics code.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Model Parameters Must Be Physically Correct</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A dynamics model is only as good as its mass properties. Each link needs realistic mass, center-of-mass location, and inertia tensor. Motors, gearboxes, tooling, cables, payloads, and fixtures may also contribute meaningful reflected inertia or friction. A robot that looks geometrically correct in simulation can still have completely wrong torque predictions if its inertial parameters are placeholders.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Check units carefully: kilograms for mass, meters for dimensions, kg·m² for rotational inertia, newtons for force, newton-meters for torque, radians for angular position, radians per second for angular velocity, and radians per second squared for angular acceleration. Millimeters accidentally interpreted as meters can corrupt inertia by orders of magnitude.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Dynamics and Simulation</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A simulator repeatedly evaluates forward dynamics and numerically integrates acceleration to update velocity and position. A simple conceptual loop is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>while simulation_running:
    M = mass_matrix(q)
    bias = coriolis_and_centrifugal(q, qd) + gravity(q)
    qdd = solve(M, tau - bias)

    qd = qd + qdd * dt
    q = q + qd * dt</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This simple Euler integration is useful for understanding the signal flow but may be inaccurate or unstable for stiff systems or large time steps. Production simulators often use smaller time steps, higher-order integration, constraint solvers, contact models, and actuator models.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Engineering Checks and Troubleshooting</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Static gravity check:</strong> set q̇ = 0 and q̈ = 0. Required torque should reduce mainly to gravity plus external load and static friction.</li><li><strong>Zero-gravity check:</strong> disable gravity in simulation. A stationary robot with zero applied torque should not spontaneously accelerate because of a gravity term.</li><li><strong>Energy check:</strong> in an ideal frictionless, unforced simulation, total mechanical energy should remain approximately constant; significant drift can indicate integration or model problems.</li><li><strong>Symmetry check:</strong> M should be numerically symmetric within tolerance.</li><li><strong>Positive-definite check:</strong> physically valid inertia should not produce negative kinetic energy.</li><li><strong>Sign check:</strong> verify gravity direction, joint-axis direction, and wrench conventions.</li><li><strong>Payload check:</strong> repeat torque calculations with and without the tool payload and compare the difference.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Exercises</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>For a one-joint rotary link, explain why holding torque changes as the arm moves from vertical to horizontal.</li><li>Using the numerical two-joint example above, change τ to [20, 5] N·m and solve for q̈.</li><li>Modify the Python example to add an external-joint torque vector τext = [2, -1] N·m and subtract it from available actuator torque.</li><li>Write a diagnostic procedure for a simulated robot that falls upward when gravity is enabled.</li><li>Explain why directly computing <code>np.linalg.inv(M) @ rhs</code> is usually less desirable than <code>np.linalg.solve(M, rhs)</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What does M(q) represent?</li><li>Why does the mass matrix depend on robot configuration?</li><li>When do Coriolis and centrifugal terms vanish?</li><li>What does inverse dynamics calculate?</li><li>What does forward dynamics calculate?</li><li>How is an end-effector wrench mapped into joint torques?</li><li>What should a static gravity-compensation test set q̇ and q̈ to?</li><li>Why can an accurate geometric model still produce inaccurate torque predictions?</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Knowledge Check Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>M(q) is the configuration-dependent joint-space mass/inertia matrix.</li><li>Changing configuration changes how each link's mass and rotational inertia project into joint motion and how joints are inertially coupled.</li><li>They vanish when joint velocity q̇ is zero.</li><li>Inverse dynamics calculates the joint forces or torques required to produce a specified q, q̇, and q̈ under modeled loads.</li><li>Forward dynamics calculates q̈ from the current state and applied joint forces or torques.</li><li>Through the Jacobian transpose: τext = J(q)ᵀFext.</li><li>Set both q̇ and q̈ to zero.</li><li>Because dynamics also requires accurate masses, centers of mass, inertia tensors, payload properties, friction, gravity, and actuator parameters.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Continue the Robotics Engineer Track</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Review <a href="https://bitcoinversus.tech/2026/10/02/osrec-001-robot-arm-kinematics-frames-homogeneous-transforms-dh-parameters-forward-kinematics/"><strong>OSREC.001</strong></a> for kinematics and frames, <a href="https://bitcoinversus.tech/2026/10/05/osrec-002-robot-jacobians-velocity-kinematics-singularities-force-torque-duality/"><strong>OSREC.002</strong></a> for Jacobians and statics, <a href="https://bitcoinversus.tech/2026/10/06/osrec-003-inverse-kinematics-numerical-solvers-convergence-limits-redundancy/"><strong>OSREC.003</strong></a> for numerical inverse kinematics, and <a href="https://bitcoinversus.tech/2026/10/06/osrec-004-robot-trajectory-planning-joint-space-cartesian-paths-time-scaling-velocity-acceleration-jerk/"><strong>OSREC.004</strong></a> for trajectory generation. Together, those lessons provide the geometric and motion-planning inputs needed for the dynamic calculations developed here.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">BitcoinVersus.Tech</h3>
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This lesson follows standard rigid-body robotics notation. Textbooks and software libraries may group Coriolis and centrifugal effects differently or use alternate signs for external wrench terms; always verify the convention used by the specific model or library.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Support and donation options are available through BitcoinVersus.Tech.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.tech is not a financial advisor. Content is provided for informational purposes.</p>
<!-- /wp:paragraph -->