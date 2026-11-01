---
lesson_id: "OSC.005"
subject: "c"
track: "Open Source C Programming"
level: "Super-Fundamentals"
wordpress_post_id: 28202
title: "OSC.005: C Loops — for, while, do-while, break, and continue"
url: "https://bitcoinversus.tech/2026/11/01/osc-005-c-loops-for-while-do-while-break-continue/"
published_date: "2026-11-01"
wordpress_category_ids: [44329, 5812, 2509703, 6]
featured_media_id: 28193
featured_dimensions: "1200x630"
featured_style: "photo/anime blend"
featured_person: "Fictional adult multiracial woman C programmer aged 35–45"
in_story_media_count: 4
in_story_media:
  - "YouTube Bz4MxDeEM6k: source-verified tutorial, rendered in published WordPress HTML"
  - "YouTube KJgsSFOSQv0: source-verified tutorial, rendered in published WordPress HTML"
  - "YouTube 8TZE6FedtTw: source-verified tutorial, rendered in published WordPress HTML"
  - "YouTube 87SH2Cn0s9A: source-verified tutorial, rendered in published WordPress HTML"
video_embed_method: "WordPress native YouTube shortcode blocks with canonical watch URLs"
video_embed_qa: "Updated 2026-11-01, 4 distinct iframe players verified in published WordPress HTML; reader-device playback untested."
code_qa: "The complete standalone example compiled with gcc -std=c11 -Wall -Wextra -Wpedantic; stdout exactly matched lesson's expected output. Additional snippets structurally reviewed; not all independently compiled."
internal_link_count: 9
original_sources: ["https://en.cppreference.com/w/c/language/for", "https://en.cppreference.com/w/c/language/while", "https://en.cppreference.com/w/c/language/do", "https://en.cppreference.com/w/c/language/break", "https://en.cppreference.com/w/c/language/continue", "https://learn.microsoft.com/en-us/cpp/c-language/statements-c"]
qa_status: "Media correction on 2026-11-01: 4 distinct video iframes confirmed, all concept images removed, featured cover and donation QR retained. Public browser screenshots and playback not independently tested."
next_main_subject: "rust"
plain_unboxed_code_examples_count: 8
november_1_2026_layout_repair: "Converted 8 previously boxed Gutenberg code blocks into transparent borderless no-shadow semantic preformatted code blocks, preserving all code text, videos, diagrams, source citations and approved footer; WordPress published view readback passed."
conceptual_in_body_images_count: 0
november_2026_concept_image_replacement: "Removed original concept images 28191, 28192 and replaced with relevant YouTube tutorials Bz4MxDeEM6k, KJgsSFOSQv0, 8TZE6FedtTw, 87SH2Cn0s9A. New player rendering and captions verified."
---

<!-- wp:paragraph --><p><strong>A loop</strong> is a C-language control structure that repeats a statement or compound block while a condition allows execution. The standard C constructs are <code>for</code>, <code>while</code> and <code>do-while</code>. Each can express repetition, but they differ in initialization placement, test timing, update behavior and what happens when a loop body must be interrupted.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This main-rotation lesson follows <a href="https://bitcoinversus.tech/2026/10/14/osc-004-c-control-flow-if-else-switch-ternary/">OSC.004: C Control Flow</a> and complements the earlier lessons on the <a href="https://bitcoinversus.tech/2026/10/14/osc-003-c-operators-and-expressions/">operators and expressions</a> used in loop conditions and <a href="https://bitcoinversus.tech/2026/10/10/osc-002-c-variables-and-fundamental-types-declarations-initialization-integers-floating-point-char-const-and-sizeof/">variable types</a> used for loop counters. The goal is not simply to memorize syntax but to predict exactly when each block runs and how it terminates.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Define <em>iteration</em>, <em>initialization</em>, <em>condition</em>, <em>update expression</em> and <em>termination</em>.</li><li>Distinguish pre-test <code>for</code> and <code>while</code> loops from the post-test <code>do-while</code> construct.</li><li>Trace the effect of <code>break</code> and <code>continue</code> on loop control, including nested loops.</li><li>Write and compile small, conforming C examples using GCC or Clang, with C99-or-newer syntax.</li><li>Identify off-by-one errors, counter-update mistakes and arithmetic-overflow hazards.</li><li>Use a bounded loop to process example equipment telemetry without treating a demonstration as a safety controller.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Definitions and the execution model</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Iteration</strong> is one execution of the loop body. A <strong>condition</strong> is an expression evaluated for truth; in C, a scalar expression comparing equal to zero is false and a nonzero value is true. <strong>Initialization</strong> establishes the initial state. An <strong>update expression</strong> changes the state between iterations. A loop <strong>terminates</strong> when its condition becomes false or control explicitly leaves it, such as through <code>break</code> or <code>return</code>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A useful diagnostic question is: “What changes between the current iteration and the next test?” If nothing relevant changes, a loop may continue indefinitely. The C language also permits intentionally unbounded forms such as <code>for (;;)</code>, but production programs should have an explicit, reviewable exit path when waiting, polling or retrying.</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Construct</th><th>When the condition is tested</th><th>Minimum body executions</th><th>Typical use</th></tr></thead><tbody><tr><td><code>for</code></td><td>Before each iteration, after one-time initialization</td><td>0</td><td>Counted or index-based repetition</td></tr><tr><td><code>while</code></td><td>Before each iteration</td><td>0</td><td>Repeat while a state or input condition remains valid</td></tr><tr><td><code>do-while</code></td><td>After each body execution</td><td>1</td><td>Perform an action before deciding whether to repeat</td></tr></tbody></table><figcaption class="wp-element-caption"><em>The C-language distinction concerns the initial execution path; early <code>return</code> and similar control transfers can still end an enclosing function.</em></figcaption></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">The for loop: initialization, test, body, update</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <code>for</code> statement groups three expressions or clauses: <code>for (initialization; condition; update)</code>. Initialization runs once, the condition is checked before each body execution, and the update expression runs after the body. A <code>continue</code> within a <code>for</code> loop proceeds to the update expression before the next condition test. <a href="https://en.cppreference.com/w/c/language/for">The C reference for <code>for</code></a> specifies this sequence.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">for (int i = 0; i &lt; 5; ++i) {
    printf("%d\n", i);
}
/* Prints 0, 1, 2, 3, 4 — NOT 5. */</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>The loop executes exactly five times because it starts at zero and stops once <code>i &lt; 5</code> is false. The declaration <code>int i = 0</code> inside the initialization clause requires C99 or later; in that form, the name <code>i</code> has the loop's scope rather than leaking into subsequent statements. This is an example of an <strong>exclusive upper bound</strong>. To produce 1 through 5 inclusive, start at one and compare <code>i &lt;= 5</code>.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=Bz4MxDeEM6k]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>Video: Caleb Curry — C Programming All-in-One Tutorial Series (2019). For loops begin at 6:58:22; the video also covers while, do-while, break and continue.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For a known collection length, use a counter and a bounds condition rather than a sentinel that might never appear. Large indexes may be represented with <code>size_t</code>, which is designed for object sizes, but even that type is not immune to wraparound if incremented beyond its maximum. Prefer conditions that respect the actual array length and avoid unbounded arithmetic.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video study: for loops and while loops</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The independent freeCodeCamp C tutorial includes a section about <code>while</code> loops at approximately 2:29:43 and <code>for</code> loops at 2:50:11. It demonstrates the fundamental distinction between repetition while a condition holds and a loop with a visible counter. The course is for C, not C++ or C#.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=KJgsSFOSQv0]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=KJgsSFOSQv0">freeCodeCamp.org — “C Programming Tutorial for Beginners”</a> (Mike Dane, 2018). Loop chapters begin at 2:29:43 (<code>while</code>) and 2:50:11 (<code>for</code>). A long-form English tutorial; captions and exact chapter times are supplied for targeted study.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The while loop: test before work</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <code>while</code> loop evaluates its condition before the first iteration and before every subsequent iteration. If the condition is initially false, the body is skipped entirely. The change that can end the loop is usually written inside the body, unlike the explicit update clause of a common <code>for</code> loop.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">int remaining = 3;
while (remaining &gt; 0) {
    printf("%d\n", remaining);
    --remaining;
}
/* Prints 3, 2, 1. */</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>In this example the decrement is essential. Omitting <code>--remaining</code> causes the controlling expression to stay true. A <code>while</code> loop is often appropriate when the number of iterations is not known in advance, such as reading valid input until it ends: <code>while (scanf("%d", &amp;value) == 1)</code>. That condition stops if the next conversion fails or input reaches end-of-file; it does not magically fix malformed input. The <a href="https://en.cppreference.com/w/c/language/while">C <code>while</code> reference</a> documents the pre-test behavior.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The do-while loop: run, then test</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>do { statement; } while (condition);</code> executes its body before the condition is tested. It therefore performs one iteration even when the condition evaluates false at the first test. Notice the required semicolon after <code>while (condition)</code>. This form suits an interaction that must happen once before a decision about repetition, such as displaying a menu or requesting an initial sample.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">int attempts = 0;
do {
    ++attempts;
    printf("Attempt %d\n", attempts);
} while (attempts &lt; 2);
/* Prints Attempt 1, then Attempt 2. */</code></pre>
<!-- /wp:html -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=8TZE6FedtTw]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>Video: ProgrammingKnowledge — C Loops: for, while and do-while (2021). Distinct visual demonstration of pre-test and post-test loops.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Choose <code>do-while</code> only when executing the body once is legitimate and safe. It is not a shortcut for checking whether an array contains data; a do-while body that indexes an empty array could access invalid memory before the condition can prevent it. See <a href="https://learn.microsoft.com/en-us/cpp/c-language/do-while-statement-c">Microsoft's C-specific do-while documentation</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">break and continue: leaving versus skipping</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>break</code> immediately terminates the nearest enclosing <code>for</code>, <code>while</code>, <code>do-while</code> or <code>switch</code>; execution continues after that construct. <code>continue</code> does <em>not</em> exit the loop: it skips the rest of the current loop body and proceeds to the next iteration. In a <code>for</code> loop, it evaluates the update expression; in a <code>while</code> or <code>do-while</code> loop, it proceeds toward the controlling condition. Neither automatically exits multiple enclosing loops. See the C reference for <a href="https://en.cppreference.com/w/c/language/break"><code>break</code></a> and <a href="https://learn.microsoft.com/en-us/cpp/c-language/continue-statement-c"><code>continue</code></a>.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">for (int i = 0; i &lt; 8; ++i) {
    if (i == 3) {
        continue;  /* Skip just 3; the ++i update still runs. */
    }
    if (i == 6) {
        break;     /* Stop before printing 6. */
    }
    printf("%d\n", i);
}
/* Prints 0, 1, 2, 4, 5. */</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>Beware the common bug <code>while (i &lt; limit) { if (skip) continue; ++i; }</code>: when <code>skip</code> stays true, the increment never happens and the loop can become infinite. In a <code>while</code> loop, update any required state before <code>continue</code>, or restructure the loop so the update cannot be bypassed.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video study: do-while, nested loops and control transfers</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Bro Code's C course contains distinct chapters on <code>for</code> loops at approximately 1:51:00, <code>while</code> at 1:54:22, <code>do-while</code> at 1:58:12, nested loops at 2:01:35 and <code>break</code> versus <code>continue</code> at 2:06:53. The demonstrations are useful for tracing the printed output, but their examples should be compiled with the target platform's supported C language version.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=87SH2Cn0s9A]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=87SH2Cn0s9A">Bro Code — “C Programming Full Course for Free”</a> (2021). Distinct English demonstration with <code>for</code>, <code>while</code>, <code>do-while</code>, nesting, <code>break</code> and <code>continue</code> at the chapter times listed above.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Compile and run a complete example</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The following standalone example combines the basic constructions without accessing external hardware, allocating memory dynamically or requiring network access. It should compile with a conforming C11 compiler. Start with the <a href="https://bitcoinversus.tech/2026/10/09/osc-001-c-compiler-toolchain-gcc-preprocessing-compilation-assembly-linking-first-build/">OSC.001 C compiler and toolchain lesson</a> if you need help installing GCC or Clang.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">#include &lt;stdio.h&gt;

int main(void)
{
    for (int i = 0; i &lt; 5; ++i) {
        printf("Iteration %d\n", i);
    }

    int remaining = 3;
    while (remaining &gt; 0) {
        printf("Countdown %d\n", remaining);
        --remaining;
    }

    int attempts = 0;
    do {
        ++attempts;
        printf("Attempt %d\n", attempts);
    } while (attempts &lt; 2);

    for (int i = 0; i &lt; 8; ++i) {
        if (i == 3) {
            continue;
        }
        if (i == 6) {
            break;
        }
        printf("Value %d\n", i);
    }

    return 0;
}</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>Expected standard output, with the values printed in order:</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">Iteration 0
Iteration 1
Iteration 2
Iteration 3
Iteration 4
Countdown 3
Countdown 2
Countdown 1
Attempt 1
Attempt 2
Value 0
Value 1
Value 2
Value 4
Value 5</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>Save as <code>loops.c</code>, then compile with <code>gcc -std=c11 -Wall -Wextra -Wpedantic -O0 -g loops.c -o loops</code> and run <code>./loops</code> on a Unix-like environment (or <code>loops.exe</code> from a suitable Windows shell). Compiler flags request C11 syntax and common warnings; they do not prove a program is free of all bugs. The logic is portable, but compiler invocation and terminal commands vary.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Applied example: scan equipment readings safely</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A technician might receive a <em>fixed-length</em> list of nonnegative sensor readings, with <code>-1</code> indicating missing data. The following C program ignores missing values using <code>continue</code> and stops at the first hypothetical alert threshold using <code>break</code>. It illustrates bounded array iteration only: it is <strong>not</strong> a real thermal safety controller, and 60 is a made-up teaching threshold, not an acceptable temperature for any ASIC or device.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">#include &lt;stdio.h&gt;
#include &lt;stddef.h&gt;

int main(void)
{
    const int sensor_readings[] = {42, 47, -1, 64, 55};
    const size_t count = sizeof sensor_readings / sizeof sensor_readings[0];

    for (size_t i = 0; i &lt; count; ++i) {
        int value = sensor_readings[i];

        if (value &lt; 0) {
            continue;  /* Ignore missing-data marker. */
        }
        if (value &gt;= 60) {
            printf("Alert at sample %zu: %d\n", i, value);
            break;     /* Stop reading after an alert. */
        }

        printf("Sample %zu: %d\n", i, value);
    }
    return 0;
}</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>The output is <code>Sample 0: 42</code>, <code>Sample 1: 47</code> and <code>Alert at sample 3: 64</code>. Sample 2 is skipped, and sample 4 is never examined because the loop exits at sample 3. The <code>sizeof</code> expression computes the element count only because <code>sensor_readings</code> is an actual array in this scope; the same expression would not yield the array length after it decays to a pointer in a function parameter.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For physical equipment, sampling and trip logic also require independent fault handling, validated sensor specifications, fail-safe design and testing beyond this introductory example. Our <a href="https://bitcoinversus.tech/2026/11/01/oshre-004-hashboard-temperature-sensors-thermal-protection-lm75a-i2c/">hashboard thermal protection</a> lesson demonstrates why missing readings and genuine overheating must be handled separately.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Nested loops, complexity and termination</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <strong>nested loop</strong> runs one loop body that itself contains another loop. For example, a five-by-four grid can be traversed with an outer row loop and an inner column loop; the inner body executes 20 times if each outer row makes four complete inner iterations. With input-dependent loop bounds, the number of iterations grows as the product of those bounds. Nested loops can be correct but unnecessarily expensive when used over large datasets. A <code>break</code> inside the inner loop only exits that inner loop; the outer loop continues unless additional state or control logic ends it.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">for (int row = 0; row &lt; 2; ++row) {
    for (int col = 0; col &lt; 3; ++col) {
        printf("(%d,%d) ", row, col);
    }
    putchar('\n');
}
/* (0,0) (0,1) (0,2)
   (1,0) (1,1) (1,2) */</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>When diagnosing an apparent hang, inspect the condition, every relevant state update, early-continue paths and whether an external event is required for progress. A counter approaching its integer limits can also cause unwanted behavior: signed integer overflow is undefined in C, while unsigned arithmetic wraps modulo its range. Choose types and bounds deliberately and avoid increments that must overflow to reach a stopping condition.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common mistakes and corrective patterns</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Off-by-one boundary:</strong> <code>i &lt;= count</code> iterates one more time than <code>i &lt; count</code>. When indexing an array with <code>count</code> elements, the valid indexes are zero through <code>count - 1</code>.</li><li><strong>Missing state update:</strong> a condition relying on an unchanged counter may remain true indefinitely.</li><li><strong>Misplaced semicolon:</strong> <code>while (condition);</code> has an empty body. A following block is not the body of that loop.</li><li><strong>Wrong equality expression:</strong> using assignment instead of comparison can change the loop's state; revisit the earlier <a href="https://bitcoinversus.tech/2026/10/14/osc-003-c-operators-and-expressions/">operators</a> lesson.</li><li><strong>Skipping updates with continue:</strong> update required <code>while</code> or <code>do-while</code> state before bypassing the remaining body.</li><li><strong>Assuming break exits everything:</strong> it leaves only the nearest enclosing loop or switch.</li><li><strong>Testing after use:</strong> <code>do-while</code> guarantees a body execution, which is wrong if the body must first verify input or array bounds.</li><li><strong>Confusing demonstration and production:</strong> a loop that prints an alarm is not a validated industrial interlock or safety system.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Glossary and knowledge check</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Body:</strong> the statement or block repeated by a loop.</li><li><strong>Pre-test:</strong> the condition is evaluated before the body, as in <code>for</code> or <code>while</code>.</li><li><strong>Post-test:</strong> the condition is evaluated after the body, as in <code>do-while</code>.</li><li><strong>Sentinel:</strong> a special data value signaling a condition such as end-of-data or missing input; it must not collide with valid values.</li><li><strong>Termination condition:</strong> the expression or control transfer that stops repetition.</li><li><strong>Off-by-one error:</strong> a mistake producing one extra or missing iteration, often from choosing <code>&lt;=</code> instead of <code>&lt;</code>.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Check yourself:</strong> Why might <code>while (0)</code> run zero times while <code>do { ... } while (0);</code> runs once? If <code>continue</code> occurs in a <code>for</code> loop, is its update expression skipped? Why does the sample telemetry program ignore the third element? Which loop construct would you choose for a fixed 10-element array and why? What makes a runaway signed counter hazardous?</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Answer guide:</strong> <code>while</code> is pre-test, but <code>do-while</code> is post-test; a <code>for</code> update still executes after <code>continue</code>; the telemetry's third element is a missing-data sentinel; a bounded <code>for</code> loop is suitable for a known array length; signed overflow is undefined and should not serve as an exit mechanism.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">References and further learning</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Primary language references: <a href="https://en.cppreference.com/w/c/language/for">C for statement</a>; <a href="https://en.cppreference.com/w/c/language/while">C while statement</a>; <a href="https://en.cppreference.com/w/c/language/do">C do-while statement</a>; <a href="https://en.cppreference.com/w/c/language/break">C break</a>; <a href="https://en.cppreference.com/w/c/language/continue">C continue</a>; and <a href="https://learn.microsoft.com/en-us/cpp/c-language/statements-c">Microsoft's C statement reference</a>. Revisit <a href="https://bitcoinversus.tech/2026/10/14/osc-004-c-control-flow-if-else-switch-ternary/">conditional control flow</a>, <a href="https://bitcoinversus.tech/2026/10/10/osc-002-c-variables-and-fundamental-types-declarations-initialization-integers-floating-point-char-const-and-sizeof/">data types</a> and <a href="https://bitcoinversus.tech/2026/10/09/osc-001-c-compiler-toolchain-gcc-preprocessing-compilation-assembly-linking-first-build/">compilation workflow</a> before proceeding to the next distinct C curriculum topic.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Original BitcoinVersus.Tech QR code for a 5,000-satoshi Bitcoin donation" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>To scan from a phone, open this page on a laptop or larger screen and scan the QR with a compatible Bitcoin wallet. Verify the address before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->