---
title: "OSRust.004: Functions, Parameters, Expressions, and Return Values"
status: published
wordpress_post_id: 24789
live_url: "https://bitcoinversus.tech/2026/10/14/osrust-004-functions-parameters-expressions-return-values/"
published: "2026-10-14T13:28:16"
modified: "2026-10-14T13:28:16"
featured_media_id: 24787
youtube:
  - "https://www.youtube.com/watch?v=APrANyLHCtQ"
  - "https://www.youtube.com/watch?v=lvwa9yV5oSM"
  - "https://www.youtube.com/watch?v=c5j2K3WVhf4"
social:
  - "https://www.reddit.com/r/rust/comments/14ony3g/"
seo_title: "OSRust.004: Functions, Parameters, Expressions, and Return Values"
seo_description: "Learn Rust functions, parameters, statements, expressions, tail expressions, return values, unit type, and how semicolons change function results."
seo_schema_type: "article"
excerpt: "Learn Rust functions, parameters, arguments, statements, expressions, tail expressions, return values, the unit type, and how semicolons affect function results."
no_text_boxes: true
art_style: "colored pencil"
programming_video_minimum: 3
programming_video_language: "English-speaking"
---

<!-- wp:paragraph -->
<p><strong>Rust functions package behavior into named, reusable units with explicit inputs and outputs.</strong> The syntax is compact, but Rust adds an important idea that beginners must understand early: blocks and function bodies are expression-oriented, so the final expression can become the returned value without writing <code>return</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/10/osrust-003-scalar-and-compound-data-types-integers-floats-bool-char-tuples-arrays-and-type-annotations/"><strong>OSRust.003: Scalar and Compound Data Types</strong></a>. OSRust.003 established the types functions will accept and return; OSRust.004 turns those types into reusable program structure.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=APrANyLHCtQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=APrANyLHCtQ
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Tech With Tim demonstrates Rust function definitions, parameters, statements, expressions, and return values.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A function is a named piece of code that performs a job. A function can receive values, work with them, and give a value back. Instead of rewriting the same logic in many places, a program can call the function whenever that job is needed.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Define and call Rust functions with <code>fn</code>.</li><li>Distinguish parameters from arguments.</li><li>Explain why Rust function parameters require explicit types.</li><li>Distinguish statements from expressions.</li><li>Use tail expressions to return values.</li><li>Explain the effect of adding a semicolon to a tail expression.</li><li>Use explicit <code>return</code> for early exits.</li><li>Recognize the unit type <code>()</code> when no useful value is returned.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Defining and Calling Functions</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust defines a function with the <code>fn</code> keyword, followed by the function name, parentheses, and a body in braces. Function names conventionally use <code>snake_case</code>. A function can be defined before or after the code that calls it, as long as the definition is visible in the relevant scope.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn greet() {
    println!("System online");
}

fn main() {
    greet();
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The function call <code>greet()</code> is an expression. In this example, the function performs an action but does not return a useful data value to the caller, so its return type is the unit type <code>()</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Parameters and Arguments</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>parameter</strong> is a named input in the function definition. An <strong>argument</strong> is the concrete value passed when the function is called. Rust requires the type of every function parameter to be written explicitly, which makes function interfaces predictable and improves compiler diagnostics.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn print_power(watts: u32, rack: u8) {
    println!("Rack {rack}: {watts} W");
}

fn main() {
    print_power(3200, 7);
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here <code>watts</code> and <code>rack</code> are parameters. The values <code>3200</code> and <code>7</code> are arguments supplied by the caller.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=lvwa9yV5oSM","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=lvwa9yV5oSM
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Piyush Garg follows Rust Book Chapter 3.3 and covers function definitions, parameters, expressions, statements, and returned values.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Return Types</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A function that returns a value declares the output type after <code>-&gt;</code>. The returned value must match that type.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn add(a: i32, b: i32) -&gt; i32 {
    a + b
}

fn main() {
    let total = add(20, 22);
    println!("{total}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The final line <code>a + b</code> has no semicolon. It is a <strong>tail expression</strong>, and its value becomes the function result. This is the normal concise Rust style for returning the final value of a function.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Statements and Expressions</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust distinguishes statements from expressions. A statement performs an action but does not itself produce a value that can be used as the result of the surrounding block. An expression evaluates to a value. Literals, arithmetic, function calls, blocks, and many control-flow constructs are expressions.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let result = {
        let base = 10;
        base * 2
    };

    println!("{result}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The block assigned to <code>result</code> evaluates to <code>20</code> because its final expression is <code>base * 2</code>. The outer <code>let</code> statement then binds that value to <code>result</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=c5j2K3WVhf4","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=c5j2K3WVhf4
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>This Rust By Example walkthrough focuses on expressions, blocks, and the semicolon rule that determines whether a block yields a useful value or <code>()</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Semicolon Changes the Result</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The semicolon is one of the most important details in early Rust. Adding a semicolon to the final value-producing expression discards that value and makes the expression evaluate to the unit type <code>()</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn plus_one(x: i32) -&gt; i32 {
    x + 1
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This compiles because <code>x + 1</code> evaluates to an <code>i32</code>. The version below does not satisfy the declared return type:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn plus_one(x: i32) -&gt; i32 {
    x + 1;
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The semicolon turns the final expression into a statement, leaving the function body with the value <code>()</code> instead of <code>i32</code>. Rust reports a type mismatch and commonly suggests removing the semicolon.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/rust/comments/14ony3g/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/rust/comments/14ony3g/
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>A Rust community discussion examines why idiomatic Rust usually uses a final expression rather than writing <code>return</code> at the end of every function.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Explicit return Is Still Useful</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>return</code> keyword exits the function immediately. It is especially useful for early-exit validation paths, errors, guard clauses, or branches where execution should stop before reaching the tail expression.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn efficiency_class(j_per_th: f64) -&gt; &amp;'static str {
    if j_per_th &lt;= 10.0 {
        return "high efficiency";
    }

    "standard efficiency"
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The early <code>return</code> handles one path. The final string literal is the tail expression for the remaining path. Both produce the declared <code>&amp;'static str</code> return type.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Functions Without a Useful Return Value</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If no return type is written, the function returns <code>()</code>, called the <strong>unit type</strong>. It is Rust’s way of representing a successful computation that does not produce a meaningful data value.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn log_alarm(message: &amp;str) {
    println!("ALARM: {message}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The omitted return type is equivalent to writing <code>-&gt; ()</code>. Functions that print, mutate state through permitted references, write to a device, or trigger other side effects commonly return unit.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical Exercise</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a project with <code>cargo new rust_functions_lab</code>.</li><li>Write <code>fn watts(volts: f64, amps: f64) -&gt; f64</code> using a tail expression.</li><li>Call it from <code>main</code> and print the result.</li><li>Add a second function that accepts a device name and a Boolean online/offline state but returns <code>()</code>.</li><li>Create a block expression that calculates a value and assign that block to a variable.</li><li>Add a semicolon to the final expression and observe the compiler error or changed type.</li><li>Write a function with an early <code>return</code> when an input is invalid.</li><li>Run <code>cargo check</code> after each change, then run the finished program with <code>cargo run</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Which keyword defines a function in Rust?</li><li>What is the difference between a parameter and an argument?</li><li>Are function parameter types normally written explicitly in Rust?</li><li>How is a function return type declared?</li><li>What is a tail expression?</li><li>What happens when a semicolon is added to a value-producing tail expression?</li><li>What type does a function return when no useful return value is declared?</li><li>When is explicit <code>return</code> especially useful?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><code>fn</code>.</li><li>A parameter is a named input in the function definition; an argument is the concrete value supplied in a call.</li><li>Yes. Function parameters require explicit type annotations.</li><li>With <code>-&gt; Type</code> after the parameter list.</li><li>The final expression in a block whose value becomes the value of that block or function.</li><li>Its value is discarded and the expression evaluates to <code>()</code>.</li><li>The unit type <code>()</code>.</li><li>For early exits, guard clauses, validation failures, and paths that must leave the function before the tail expression.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A Rust function has a name, optional inputs, and an optional output. Parameters tell the function what information it receives. The return type tells callers what comes back. Rust’s unusual but powerful rule is that the final expression can become the answer automatically, so one small semicolon can change whether a value is returned.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Previous Related Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/10/osrust-003-scalar-and-compound-data-types-integers-floats-bool-char-tuples-arrays-and-type-annotations/"><strong>OSRust.003: Scalar and Compound Data Types</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/09/osrust-002-variables-let-mut-constants-shadowing-scope-type-inference/"><strong>OSRust.002: Variables</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/09/osrust-001-what-is-rust-rustup-rustc-cargo-ownership-first-program/"><strong>OSRust.001: What Is Rust?</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://doc.rust-lang.org/book/ch03-03-how-functions-work.html"><strong>The Rust Programming Language — Functions</strong></a></li><li><a href="https://doc.rust-lang.org/stable/rust-by-example/fn.html"><strong>Rust By Example — Functions</strong></a></li><li><a href="https://doc.rust-lang.org/reference/items/functions.html"><strong>The Rust Reference — Functions</strong></a></li><li><a href="https://doc.rust-lang.org/stable/core/keyword.return.html"><strong>Rust Core Documentation — return</strong></a></li></ul>
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