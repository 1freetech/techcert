---
title: "OSETC.019: Time-Delay Relays Basics"
wordpress_post_id: 20007
source: BitcoinVersus.tech
published: 2026-10-02T10:20:23
modified: 2026-10-02T10:20:23
live_url: https://bitcoinversus.tech/2026/10/02/osetc-019-time-delay-relays-basics/
track: electrical/technician
lesson_number: 19
raw_source: 019-osetc-019-time-delay-relays-basics-20007.gutenberg.html
---

<!-- wp:paragraph -->
<p>A control circuit sometimes needs to wait. A second cooling fan may start a few seconds after the first, or a fan may continue running briefly after a normal shutdown command. A <strong>time-delay relay</strong> adds that timing behavior to the control sequence.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Definition:</strong> a time-delay relay is a control device whose output changes state according to a selected timing function and preset duration. <strong>Plain English:</strong> it adds “wait before switching on” or “wait before switching off.” It does not make equipment safe merely because time has passed.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This OSETC technician lesson builds on <a href="https://bitcoinversus.tech/2026/10/01/osetc-016-motor-starters-overload-relays-basics/">OSETC.016: Motor Starters and Overload Relays Basics</a>, <a href="https://bitcoinversus.tech/2026/10/01/osetc-017-control-circuit-symbols-ladder-diagrams-basics/">OSETC.017: Control Circuit Symbols and Ladder Diagrams Basics</a>, and <a href="https://bitcoinversus.tech/2026/10/01/osetc-018-interlocks-permissives-basics/">OSETC.018: Interlocks and Permissives Basics</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Four words to keep separate</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Supply</strong> powers the timer. <strong>Trigger</strong> starts or changes its timing sequence. <strong>Preset</strong> is the selected duration. <strong>Output</strong> is the contact or electronic signal used by the next control device. Some timers start when supply power is applied; others have a separate trigger. The product diagram decides which arrangement applies.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">On-delay: wait before turning on</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For a basic non-retentive on-delay, the initiating condition starts the count. The output stays inactive until the preset expires. If the condition disappears early, the timer resets according to its specified behavior. <a href="https://www.ia.omron.com/support/guide/13/classifications.html">OMRON’s timer guide</a> distinguishes power-start and signal-start operation, so do not assume every timer starts from the same terminal.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Paper example:</strong> a hypothetical cooling controller receives a start request at t = 0 s. Its on-delay preset is 5 s. At t = 3 s the timed output is still off; at t = 5 s it becomes active if the request has remained valid. If the request ends at t = 3 s, this basic non-retentive example never reaches its output-on point.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Staggering approved starts can reduce overlap between starting events. A delay does not prove a fan actually started or that airflow is adequate. A separate feedback condition may still be required.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 1: see the timer relay work</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Watch The Engineering Mindset’s overview, then identify the initiating event and the delayed output. Focus on the timing concept rather than copying a demonstration circuit.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=RwSga-zQy0I","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=RwSga-zQy0I
</div><figcaption class="wp-element-caption"><em>The Engineering Mindset — Time Delay Relays Explained.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Off-delay: wait before turning off</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In a signal-triggered off-delay example, the output becomes active with the trigger. When that trigger ends, the output remains active for the preset and then releases. <a href="https://www.se.com/us/en/faqs/FA124951/">Schneider Electric’s 9050JCK guidance</a> specifies continuous control power for this off-delay function. Removing the trigger and removing the supply are different events.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Paper example:</strong> a normal run request ends at t = 20 s. With a 5 s off-delay, the output remains active through the run-on interval and releases at t = 25 s. This assumes the required timer supply stays present. A power-off-delay model may behave differently; use that exact model’s timing chart.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>An off-delay can support an approved cooling run-on sequence. It must not be used to postpone a required emergency-stop response or defeat a protective function.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 2: follow the timed contacts</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This animation compares on-delay and off-delay contacts. Pause when the initiating condition changes and predict whether the output should switch immediately or after a delay.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=wNlhrKxFjL8","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=wNlhrKxFjL8
</div><figcaption class="wp-element-caption"><em>Engineering Technology Simulation Learning Videos — On-Delay, Off-Delay and Timed Contacts.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read the setting and the timing chart</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Read the mode selector, time unit, range, and dial together. A dial position of 5 does not automatically mean five seconds. It may represent another duration depending on the range. Power and output indicators also have different meanings; a power light alone does not confirm that the output contact switched.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Identify whether a contact is normally open or normally closed in the specified reference state, then check which transition is delayed. A timer can have timed and instantaneous contacts in the same assembly. Record the actual terminal labels from the approved diagram instead of borrowing numbers from another model.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 3: recognize an applied delay</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>AmbiVe discusses time-delay relays in a vehicle project. Use it to recognize delayed switching in another setting. Industrial equipment requires its own approved circuit, ratings, and protective design; this video is not an installation procedure for a facility.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=geiE9xVWLVw","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=geiE9xVWLVw
</div><figcaption class="wp-element-caption"><em>AmbiVe — Why you need time delay relays in your project.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A technician’s troubleshooting sequence</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Start with the approved drawing and the expected sequence. Identify supply, trigger, mode, preset, output, and reset conditions. Compare those with recorded observations. For example, if a five-second on-delay never finishes, determine whether its initiating condition remains present long enough before concluding that the timer is defective.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Check documented settings before replacing components. A wrong time unit, wrong mode, or unsatisfied permissive can imitate a failed relay. A switched output also does not prove the downstream contactor, motor, or fan is operating correctly.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Use drawing review, simulation, and authorized observation for this lesson. Opening panels, changing wiring, or taking electrical measurements requires the site’s qualified-person procedures and appropriate energy isolation. Never bypass a timer’s protective control chain merely to make a device start.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice and answers</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1.</strong> Which mode waits before making its output active? <strong>Answer:</strong> on-delay.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>2.</strong> A normal stop request occurs at 12 s with a 4 s off-delay. When does the output release in the stated example? <strong>Answer:</strong> 16 s, provided the required supply remains available.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>3.</strong> Does a five-second delay prove airflow? <strong>Answer:</strong> no. Elapsed time and verified airflow are different conditions.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>4.</strong> Why read the exact product timing chart? <strong>Answer:</strong> trigger, supply-loss, reset, and retrigger behavior vary by model.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Key takeaway:</strong> name the event that starts the timer, the transition being delayed, and the conditions required throughout the interval. Those three questions turn a confusing delay into a sequence you can trace.</p>
<!-- /wp:paragraph -->