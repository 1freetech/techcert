# OSRust.005: Control Flow — if, loop, while, for, break, and continue

- WordPress post ID: 25249
- Canonical URL: https://bitcoinversus.tech/2026/10/14/osrust-005-control-flow-if-loop-while-for-break-continue/
- Featured media ID: 25241
- Featured image: 1200×630
- Archive format: final Gutenberg source

## Final Gutenberg Source

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Control flow decides which code runs, how many times it runs, and when execution leaves a repeated block.</strong> Rust provides <code>if</code> expressions for decisions and three primary loop forms: <code>loop</code>, <code>while</code>, and <code>for</code>. Rust also makes several of these constructs expressions, so they can produce values rather than merely controlling execution.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/14/osrust-004-functions-parameters-expressions-return-values/"><strong>OSRust.004: Functions, Parameters, Expressions, and Return Values</strong></a>. That lesson established Rust’s expression-oriented model. Control flow extends that model: an <code>if</code> block can produce a value, and a <code>loop</code> can return a value through <code>break</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=2w_FTiD74JI","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=2w_FTiD74JI
</div><figcaption class="wp-element-caption"><em>Francesco Ciulla walks through Rust if expressions, loop, while, for, and basic control-flow exercises.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Use <code>if</code>, <code>else if</code>, and <code>else</code>.</li><li>Explain why Rust requires an <code>if</code> condition to evaluate to <code>bool</code>.</li><li>Use an <code>if</code> expression to assign a value.</li><li>Create unconditional repetition with <code>loop</code>.</li><li>Return a value from <code>loop</code> using <code>break value</code>.</li><li>Repeat while a Boolean condition is true with <code>while</code>.</li><li>Iterate safely through collections and ranges with <code>for</code>.</li><li>Skip an iteration with <code>continue</code>.</li><li>Exit nested loops using labels.</li><li>Choose the clearest loop form for a given problem.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">if Is an Expression</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust begins a conditional branch with <code>if</code>. The condition must evaluate to a Boolean value. Rust does not automatically reinterpret integers such as <code>0</code> or <code>1</code> as false or true, so comparisons must be explicit.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let temperature = 78;

    if temperature &gt; 85 {
        println!("Cooling alert");
    } else if temperature &gt; 75 {
        println!("Warm");
    } else {
        println!("Normal");
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The first true branch runs and the remaining branches are skipped. Conditions can combine comparisons with Boolean operators such as <code>&amp;&amp;</code>, <code>||</code>, and <code>!</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Assigning a Value with if</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Because <code>if</code> is an expression, its result can be assigned directly to a variable. Every branch that can produce the result must have a compatible type.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let online = true;

    let status = if online {
        "running"
    } else {
        "offline"
    };

    println!("{status}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If one branch returned a string slice and the other returned an integer, the compiler would reject the assignment because one expression cannot have two incompatible result types. This builds directly on the type system introduced in <a href="https://bitcoinversus.tech/2026/10/10/osrust-003-scalar-and-compound-data-types-integers-floats-bool-char-tuples-arrays-and-type-annotations/"><strong>OSRust.003: Scalar and Compound Data Types</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ugrXgIZSYkU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ugrXgIZSYkU
</div><figcaption class="wp-element-caption"><em>A focused Rust tutorial demonstrates if, loop, while, and for control flow.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Unconditional Repetition with loop</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>loop</code> keyword repeats a block indefinitely until execution reaches a <code>break</code>, a function returns, the process exits, or another diverging operation occurs. It communicates intentional indefinite repetition more clearly than writing an artificial always-true condition.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let mut attempts = 0;

    loop {
        attempts += 1;
        println!("Attempt {attempts}");

        if attempts == 3 {
            break;
        }
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Returning a Value from loop</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust’s <code>loop</code> is an expression and can return a value. Supply that value after <code>break</code>, then assign the loop expression to a variable.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    println!("{result}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This prints <code>20</code>. The value after <code>break</code> becomes the value of the entire <code>loop</code> expression. That pattern is useful when repetition searches for, computes, or waits for a value before continuing.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/rust/comments/obnlv8/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/rust/comments/obnlv8/
</div><figcaption class="wp-element-caption"><em>Rust developers discuss the useful combination of loop, break values, match, and continue in real programs.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Conditional Repetition with while</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <code>while</code> loop repeats only while its condition evaluates to <code>true</code>. It is appropriate when the number of iterations is not fixed in advance but the continuation condition is easy to state.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let mut countdown = 3;

    while countdown != 0 {
        println!("{countdown}!");
        countdown -= 1;
    }

    println!("LIFTOFF");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Compared with manually combining <code>loop</code>, <code>if</code>, and <code>break</code>, <code>while</code> makes the controlling condition visible at the top of the loop.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Iterating with for</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>for</code> is usually the clearest choice for traversing a collection or known range. It avoids manual indexing and lets Rust’s iterator system drive each iteration.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let temperatures = [68, 71, 74, 79];

    for reading in temperatures {
        println!("{reading} F");
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This approach is safer and clearer than maintaining a separate integer index for a simple traversal. The loop receives each item from the collection in sequence.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Ranges</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Ranges work naturally with <code>for</code>. The expression <code>1..5</code> produces 1 through 4, while <code>1..=5</code> includes 5.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    for rack in 1..=5 {
        println!("Checking rack {rack}");
    }

    for number in (1..=3).rev() {
        println!("{number}!");
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=x9EPnbIQgvM","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=x9EPnbIQgvM
</div><figcaption class="wp-element-caption"><em>Code of the Future demonstrates Rust conditions, while loops, for ranges, and collection iteration.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Skipping Work with continue</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>continue</code> immediately ends the current iteration and returns control to the loop head. In a <code>for</code> loop, iteration proceeds to the next item.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    for port in 1..=8 {
        if port == 4 {
            continue;
        }

        println!("Testing port {port}");
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Port 4 is skipped, while the remaining ports continue normally. Use <code>continue</code> when the current item should be ignored without terminating the entire loop.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Breaking and Continuing Nested Loops with Labels</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>By default, <code>break</code> and <code>continue</code> affect the innermost enclosing loop. Rust lets you label loops with a leading apostrophe so nested control flow can target a specific outer loop.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    'rack_scan: for rack in 1..=3 {
        for port in 1..=4 {
            println!("rack {rack}, port {port}");

            if rack == 2 &amp;&amp; port == 3 {
                break 'rack_scan;
            }
        }
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The labeled <code>break</code> exits the outer <code>rack_scan</code> loop immediately. A labeled <code>continue</code> can similarly skip directly to the next iteration of a selected outer loop.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Choosing the Right Loop</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Use <code>for</code> when iterating through a collection, iterator, or known range.</li><li>Use <code>while</code> when repetition is governed by a Boolean condition.</li><li>Use <code>loop</code> when repetition is intentionally open-ended and exit conditions occur inside the body.</li><li>Use <code>break value</code> when a <code>loop</code> is computing or searching for a value.</li><li>Use <code>continue</code> when one iteration should be skipped but repetition should continue.</li><li>Use labels sparingly when nested loops require explicit control of an outer loop.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a project with <code>cargo new control_flow_lab</code>.</li><li>Use an <code>if</code> expression to classify a temperature as <code>"normal"</code>, <code>"warm"</code>, or <code>"hot"</code>.</li><li>Use <code>loop</code> with <code>break value</code> to calculate a result after five iterations.</li><li>Create a countdown with <code>while</code>.</li><li>Create an array of five device names and iterate through it with <code>for</code>.</li><li>Use a range from 1 through 10 and skip even values with <code>continue</code>.</li><li>Create nested rack-and-port loops and exit the outer loop with a label when a target rack and port are found.</li><li>Run <code>cargo fmt</code>, <code>cargo check</code>, and <code>cargo run</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What type must an <code>if</code> condition evaluate to?</li><li>Can an <code>if</code> expression produce a value?</li><li>What does <code>loop</code> do by default?</li><li>How can a <code>loop</code> return a value?</li><li>When is <code>while</code> appropriate?</li><li>Why is <code>for</code> usually preferable to manual indexing for simple collection traversal?</li><li>What does <code>continue</code> do?</li><li>Which loop does an unlabeled <code>break</code> exit?</li><li>What problem do loop labels solve?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><code>bool</code>.</li><li>Yes. All result-producing branches must have compatible types.</li><li>It repeats indefinitely.</li><li>Use <code>break value</code> and assign the loop expression.</li><li>When repetition should continue while a Boolean condition remains true.</li><li>It expresses iteration directly and avoids unnecessary manual index management.</li><li>It skips the remainder of the current iteration and starts the next one.</li><li>The innermost enclosing loop.</li><li>They let <code>break</code> or <code>continue</code> target a specific loop in nested control flow.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Previous Related Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/14/osrust-004-functions-parameters-expressions-return-values/"><strong>OSRust.004: Functions, Parameters, Expressions, and Return Values</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/10/osrust-003-scalar-and-compound-data-types-integers-floats-bool-char-tuples-arrays-and-type-annotations/"><strong>OSRust.003: Scalar and Compound Data Types</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/09/osrust-002-variables-let-mut-constants-shadowing-scope-type-inference/"><strong>OSRust.002: Variables</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://doc.rust-lang.org/book/ch03-05-control-flow.html"><strong>The Rust Programming Language — Control Flow</strong></a></li><li><a href="https://doc.rust-lang.org/reference/expressions/loop-expr.html"><strong>The Rust Reference — Loop Expressions</strong></a></li><li><a href="https://doc.rust-lang.org/rust-by-example/flow_control/while.html"><strong>Rust By Example — while</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust control flow is structured around explicit Boolean decisions and expressive loops. Use <code>if</code> to choose a path, <code>for</code> to traverse data, <code>while</code> to repeat under a condition, and <code>loop</code> when exit logic belongs inside the body. Once <code>break</code>, <code>continue</code>, values, ranges, and labels are understood, these constructs become the foundation for larger Rust programs.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full" style="text-align:center"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" style="width:72vw;max-width:1170px;height:auto;display:block;margin-left:auto;margin-right:auto"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->