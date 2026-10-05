---
title: "OSEEC.005: AC Fundamentals"
wordpress_post_id: 18145
source: BitcoinVersus.tech
published: 2026-10-01T11:30:09
modified: 2026-10-01T11:31:20
live_url: https://bitcoinversus.tech/2026/10/01/oseec-005-ac-fundamentals/
track: electrical/engineer
lesson_number: 5
raw_source: 005-oseec-005-ac-fundamentals-18145.gutenberg.html
---

<!-- wp:paragraph -->
<p>AC can be easier to understand if you separate two questions: how quickly does the waveform repeat, and how large is it? Frequency answers the first question. Voltage answers the second, but you must specify whether you mean peak voltage or RMS voltage.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What is alternating current?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Definition:</strong> <strong>alternating current (AC)</strong> is electric current that periodically reverses direction. An AC voltage changes polarity. <strong>Direct current (DC)</strong> flows in one direction; its magnitude can still vary.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Plain English:</strong> imagine a push that switches direction in a repeating rhythm. AC has that back-and-forth character. The charge does not have to travel from a power station to your appliance and back during every cycle for energy to be transferred.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This OSEEC engineer lesson introduces sine waves, frequency, period, RMS, and phase. Review <a href="https://bitcoinversus.tech/2026/09/24/open-source-electrical-engineering-training-article-2-voltage-current-resistance-power/">OSEEC.002: Voltage, Current, Resistance, and Power</a> if those basic quantities are unfamiliar.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read one cycle</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>waveform</strong> shows how a quantity changes with time. A sine wave is a smooth, repeating waveform commonly used to model AC power. Real waveforms can be distorted, so AC does not always mean a perfect sine wave.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Starting at a zero crossing while rising, one complete sine-wave cycle passes through a positive peak, crosses zero while falling, reaches a negative peak, and returns to zero while rising. The final point matches the starting position and direction. A single positive half-wave is only half a cycle.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Frequency and period</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Frequency, f,</strong> counts complete cycles per second. Its unit is hertz (Hz). A 60 Hz waveform completes 60 cycles each second; a 50 Hz waveform completes 50. Frequency is not the same quantity as voltage.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Period, T,</strong> is the time for one complete cycle. Use <strong>T = 1 / f</strong>, with f in hertz and T in seconds.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>At 60 Hz: <strong>T = 1 / 60 = 0.0167 s ≈ 16.7 ms.</strong> At 50 Hz: <strong>T = 1 / 50 = 0.020 s = 20 ms.</strong> More cycles per second means less time per cycle.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Watch AC and DC explained</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The Engineering Mindset’s short animation connects the terminology to familiar power supplies. Watch the alternating movement, then return to distinguish effective voltage from the waveform’s highest value.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=2jqJZxxX6gQ","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=2jqJZxxX6gQ
</div><figcaption class="wp-element-caption"><em>The Engineering Mindset — AC and DC Electricity basics.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Peak voltage and RMS voltage</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Peak voltage</strong> is the largest magnitude reached by the waveform. <strong>RMS</strong> means root mean square. It gives an effective value: across the same fixed resistor, an AC voltage of a given RMS value produces the same average heating power as DC of that value.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a pure sine wave with no DC offset: <strong>V<sub>RMS</sub> = V<sub>peak</sub> / √2</strong>, or <strong>V<sub>peak</sub> = V<sub>RMS</sub> × √2</strong>. The factor is approximately 1.414. Do not apply that factor blindly to other waveform shapes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A hypothetical <strong>12 V RMS</strong> sine wave reaches approximately <strong>+17 V and −17 V</strong>. Its peak-to-peak span is about 34 V. A nominal 120 V RMS sine wave similarly peaks near 170 V, rather than 120 V.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a fixed <strong>24 Ω resistor</strong> supplied with 12 V RMS, average power is <strong>P = V<sub>RMS</sub>² / R = 144 / 24 = 6 W</strong>. That is the same average power as 12 V DC across the same resistor. These are calculation examples, not instructions to assemble or energize a circuit.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Phase means relative timing</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Phase difference</strong> describes the timing offset between repeating waveforms of the same frequency. One cycle is 360°. A quarter-cycle offset is 90°; a half-cycle offset is 180°.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>At 60 Hz, a quarter cycle lasts about <strong>16.7 / 4 = 4.17 ms</strong>. Two waves with matching zero crossings and peaks are in phase. In an ideal purely resistive AC circuit, voltage and current are in phase. Reactive components can shift their relationship.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Balanced three-phase sinusoidal voltages are separated by 120 electrical degrees. That is a third of a cycle between corresponding points. Three-phase systems will receive their own lesson; keep the focus here on reading the quantities correctly.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Paper exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An imaginary source is labeled <strong>12 V RMS, 50 Hz, sine wave</strong>. Find: <strong>1.</strong> cycles per second; <strong>2.</strong> cycle duration; <strong>3.</strong> peak voltage; <strong>4.</strong> average power in a 24 Ω resistor.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Answers:</strong> 1. 50 cycles/s. 2. 20 ms. 3. Approximately 17 V. 4. 6 W. Each answer describes a different property of the same source.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Use the concepts carefully</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An equipment nameplate’s voltage and frequency are separate requirements. A voltage reading alone does not establish correct frequency, waveform quality, or supply behavior under load, and it does not prove the whole circuit is healthy.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Keep this lesson to calculations, simulation, and interpreting labels. Do not connect a bench oscilloscope to mains or probe live electrical equipment as a beginner exercise. Live testing requires qualified personnel, suitable equipment, and an appropriate safety procedure.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Continue from <a href="https://bitcoinversus.tech/2026/09/30/oseec-004-kirchhoffs-laws-kvl-kcl/">OSEEC.004: Kirchhoff’s Laws</a>: conservation rules still apply, while AC adds variation over time. The next engineer lesson will build on these foundations with capacitance, inductance, and reactance.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Takeaway:</strong> Frequency tells you how often; period tells you how long; RMS tells you effective magnitude; phase tells you relative timing.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>References:</strong> OpenStax <a href="https://openstax.org/books/university-physics-volume-2/pages/15-1-ac-sources">AC Sources</a> and <a href="https://openstax.org/books/university-physics-volume-2/pages/15-2-simple-ac-circuits">Simple AC Circuits</a>. Examples and review questions are original; arithmetic was independently checked.</p>
<!-- /wp:paragraph -->