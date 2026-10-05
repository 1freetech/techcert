---
title: "OSPython.005: While Loops, Break, and Continue"
wordpress_post_id: 19191
source: BitcoinVersus.tech
published: 2026-09-27T15:57:47
modified: 2026-09-30T20:08:22
live_url: https://bitcoinversus.tech/2026/09/27/python-5-while-loops-break-continue/
track: python
lesson_number: 5
raw_source: 005-python-5-while-loops-break-continue-19191.gutenberg.html
---

<!-- wp:paragraph --><p>Python #5 builds on Python #4 by introducing <code>while</code> loops and condition-controlled repetition. A <code>while</code> loop keeps running while its condition remains true, making it useful when the number of repetitions is not known in advance.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Bitcoin Mining Example: Cooldown Monitor</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>temperature_c = 92

while temperature_c &gt; 80:
    print("Cooling ASIC:", temperature_c, "C")
    temperature_c -= 3

print("Temperature back in range")</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The loop continues until the simulated ASIC temperature falls to 80°C or below. Real monitoring software would read telemetry rather than subtracting a fixed value, but the control-flow principle is the same.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Gaming Example: Keep Playing Until Health Reaches Zero</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>health = 30

while health &gt; 0:
    print("Player health:", health)
    health -= 10

print("Game over")</code></pre><!-- /wp:code -->
<!-- wp:heading --><h2 class="wp-block-heading">Use break</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>attempt = 1

while True:
    print("Checking miner connection:", attempt)

    if attempt == 3:
        print("Miner connected")
        break

    attempt += 1</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>while True</code> would otherwise run indefinitely. <code>break</code> immediately exits the nearest loop when the connection condition is met.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Use continue</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>player_number = 0

while player_number &lt; 5:
    player_number += 1

    if player_number == 3:
        continue

    print("Process player", player_number)</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>continue</code> skips the rest of the current iteration. Here player 3 is skipped, while the loop continues with players 4 and 5.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Sports Example: Overtime</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>home_score = 24
away_score = 24
overtime = 1

while home_score == away_score:
    print("Overtime period:", overtime)

    home_score += 3
    overtime += 1

print("Final:", home_score, "-", away_score)</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>This simplified example repeats while the score remains tied. Condition-driven repetition is useful for simulations where the stopping point depends on events rather than a predetermined count.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Avoid Accidental Infinite Loops</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Always identify what can eventually make a <code>while</code> condition false, or provide an intentional exit such as <code>break</code>. Otherwise the loop can continue indefinitely.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video Lesson</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Real Python’s lesson focuses specifically on using <code>break</code> and <code>continue</code> with Python <code>while</code> loops and demonstrates the control flow through practical examples.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=BTaPo33TBIM","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=BTaPo33TBIM
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Write an ASIC-temperature loop that stops when temperature reaches a safe threshold.</li><li>Create a game-health loop that ends at zero.</li><li>Use <code>break</code> to exit a simulated connection retry loop.</li><li>Use <code>continue</code> to skip one player number.</li><li>Explain when you would choose <code>while</code> instead of <code>for</code>.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Use <code>for</code> when iterating through an iterable or known sequence. Use <code>while</code> when repetition should continue according to a condition. <code>break</code> exits a loop and <code>continue</code> advances to its next iteration.</p><!-- /wp:paragraph -->