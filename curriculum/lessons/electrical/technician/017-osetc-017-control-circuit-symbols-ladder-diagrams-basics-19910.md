---
title: "OSETC.017: Control Circuit Symbols and Ladder Diagrams Basics"
wordpress_post_id: 19910
source: BitcoinVersus.tech
published: 2026-10-01T15:14:16
modified: 2026-10-01T15:14:41
live_url: https://bitcoinversus.tech/2026/10/01/osetc-017-control-circuit-symbols-ladder-diagrams-basics/
track: electrical/technician
lesson_number: 17
raw_source: 017-osetc-017-control-circuit-symbols-ladder-diagrams-basics-19910.gutenberg.html
---

<!-- wp:paragraph --><p>A <strong>ladder diagram</strong> is a simple way to draw and understand an electrical control circuit. It gets its name because the drawing resembles a ladder: two vertical rails with horizontal lines, called <strong>rungs</strong>, between them.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>This lesson builds directly on OSETC.015 and OSETC.016. You already learned about relay and contactor coils, normally open and normally closed contacts, motor starters, and overload relays. Now the goal is to recognize those same parts when they appear as symbols on a control diagram.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">The Two Rails</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A basic ladder drawing has a left rail and a right rail. The control logic is drawn on horizontal rungs between them. For beginner reading, follow each rung from <strong>left to right</strong>, then move down to the next rung.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Normally Open Contact Symbol</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A normally open, or <strong>NO</strong>, contact is shown as two separated contact lines. In its normal state, the path is open. When the associated device operates, the logical or electrical condition can close that path.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Normally Closed Contact Symbol</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A normally closed, or <strong>NC</strong>, contact is shown with a slash or other standard marking through the contact symbol. In its normal state, the path is closed. When the associated device operates, the path opens.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Coil Symbol</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The coil symbol represents an output such as a relay or contactor coil. When the conditions to the left of the coil are satisfied, the coil can energize and its associated contacts change state.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video: Reading Ladder Logic</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>This RealPars beginner lesson uses a classic motor START/STOP circuit to show how relay-style schematics became ladder logic and how contacts and coils are read.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=MK2-LD0q0kY","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=MK2-LD0q0kY
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Simple Motor START/STOP Rung</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A common beginner control rung places a normally closed STOP contact, a normally open START contact, an overload contact, and a contactor coil in the control path. Pressing START can complete the path and energize the contactor coil. Pressing STOP opens the control path and de-energizes the coil.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">The Seal-In Contact</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A contact associated with the energized contactor can be placed in parallel with the START control. This is often called a <strong>seal-in</strong> or holding contact. It lets the contactor remain energized after the momentary START button is released, until another condition such as STOP or overload opens the control path.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Read the Diagram, Not the Physical Location</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Symbols that appear next to each other on a ladder diagram are not necessarily mounted next to each other in the real equipment. The diagram shows the electrical or logical relationship. Use wire numbers, terminal labels, equipment tags, and the approved drawing to locate the actual components.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Data Center Example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A cooling fan or pump starter may have a ladder-style control diagram showing permissives, START/STOP controls, overload contacts, and a contactor coil. Recognizing these symbols helps a technician follow the intended sequence without guessing.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Bitcoin Mining Example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Mining-site cooling and facility equipment may use similar motor-control diagrams. If a pump does not start, the ladder diagram can help an authorized technician identify which control condition must be satisfied before the starter coil can energize.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Safety Boundary</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A diagram is a troubleshooting map, not permission to work energized. Follow the current approved drawing, equipment documentation, lockout/tagout procedure, PPE requirements, and qualified-person boundaries. Never bypass a STOP, overload, interlock, or safety device merely to make a rung appear complete.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Identify the two rails on a basic ladder diagram.</li><li>Identify a normally open contact.</li><li>Identify a normally closed contact.</li><li>Identify a coil.</li><li>Explain what a seal-in contact does in a basic START/STOP circuit.</li><li>Trace a simple rung from left to right and state which conditions must be true for the output coil to energize.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Ladder diagrams turn control circuits into an easy-to-follow set of rails and rungs. Technician fundamentals are recognizing NO and NC contacts, coils, overload contacts, and simple START/STOP logic, then tracing the drawing systematically instead of guessing.</p><!-- /wp:paragraph -->