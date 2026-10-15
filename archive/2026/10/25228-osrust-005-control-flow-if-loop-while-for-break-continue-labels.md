# OSRust.005: Control Flow — if, loop, while, for, break, continue, and Labels

- WordPress post ID: 25228
- Canonical URL: https://bitcoinversus.tech/2026/10/14/osrust-005-control-flow-if-loop-while-for-break-continue-labels/
- Featured media ID: 25219
- Featured image: 1200×630
- Archive format: final Gutenberg source

## Final Gutenberg Source

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Control flow decides which code runs and how many times it runs.</strong> Rust provides conditional expressions with <code>if</code>, an unconditional <code>loop</code>, condition-controlled <code>while</code> loops, iterator-driven <code>for</code> loops, and explicit flow controls such as <code>break</code> and <code>continue</code>. Rust also adds two particularly useful features: loops can be labeled, and a <code>loop</code> can return a value through <code>break value;</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson continues directly from <a href="https://bitcoinversus.tech/2026/10/14/osrust-004-functions-parameters-expressions-return-values/"><strong>OSRust.004: Functions, Parameters, Expressions, and Return Values</strong></a>. It also relies on the type system introduced in <a href="https://bitcoinversus.tech/2026/10/10/osrust-003-scalar-and-compound-data-types-integers-floats-bool-char-tuples-arrays-and-type-annotations/"><strong>OSRust.003: Scalar and Compound Data Types</strong></a> and the mutable bindings introduced in <a href="https://bitcoinversus.tech/2026/10/09/osrust-002-variables-let-mut-constants-shadowing-scope-type-inference/"><strong>OSRust.002: Variables</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=2w_FTiD74JI","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=2w_FTiD74JI
</div><figcaption class="wp-element-caption"><em>Francesco Ciulla demonstrates Rust control flow with if, match, loop, while, for, and a FizzBuzz exercise.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">if Is an Expression</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In Rust, <code>if</code> is an expression rather than only a statement. That means it can choose a value that becomes part of a larger expression. Its condition must evaluate to <code>bool</code>; Rust does not automatically convert integers or pointers into Boolean truth values.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let temperature = 78;

    if temperature &gt; 85 {
        println!("hot");
    } else if temperature &gt; 70 {
        println!("normal");
    } else {
        println!("cool");
    }
}
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The official <a href="https://doc.rust-lang.org/book/ch03-05-control-flow.html">Rust Programming Language control-flow chapter</a> emphasizes that every branch of an <code>if</code> expression used to produce a value must have compatible types.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>let online = true;
let status = if online { "ready" } else { "offline" };

println!("{status}");</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">loop Repeats Until You Stop It</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>loop</code> keyword starts an unconditional loop. Unlike <code>while</code>, there is no condition at the top. Execution repeats until code inside the loop exits with <code>break</code>, returns from the function, panics, or otherwise terminates execution.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let mut count = 0;

    loop {
        count += 1;
        println!("count = {count}");

        if count == 3 {
            break;
        }
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=3XpxkJXggHA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=3XpxkJXggHA
</div><figcaption class="wp-element-caption"><em>Trevor Sullivan walks through Rust conditionals and loop forms in a practical terminal-driven tutorial.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A loop Can Return a Value</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust lets <code>break</code> carry a value out of a <code>loop</code>. This makes a loop useful when the program must repeat work until it computes a final result.</p>
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

    println!("result = {result}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This works because <code>loop</code> itself is an expression. The value supplied to <code>break</code> becomes the value of that expression.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/rust/comments/kzi64z/unconditional_loops_are_unconditionally_awesome/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/rust/comments/kzi64z/unconditional_loops_are_unconditionally_awesome/
</div><figcaption class="wp-element-caption"><em>Rust community discussion highlights practical uses of unconditional loops, break values, and labeled loops.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">continue Skips to the Next Iteration</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>continue</code> stops the current iteration immediately and begins the next one. It is useful when some values should be ignored without ending the entire loop.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    for number in 1..=6 {
        if number == 3 {
            continue;
        }

        println!("{number}");
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">while Runs While a Condition Is True</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <code>while</code> loop is appropriate when repetition depends on a Boolean condition that can be checked before each iteration.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let mut number = 3;

    while number != 0 {
        println!("{number}!");
        number -= 1;
    }

    println!("LIFTOFF!");
}</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=OaEXxpELfvw","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=OaEXxpELfvw
</div><figcaption class="wp-element-caption"><em>dcode focuses specifically on Rust while loops and condition-controlled repetition.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">for Iterates Over Values</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>for</code> is usually the clearest loop when iterating through a collection or range. It works through Rust's iterator system, so the loop receives each item without requiring manual index bookkeeping.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let watts = [1200, 1250, 1300, 1275];

    for value in watts {
        println!("{value} W");
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Ranges make counted loops concise. <code>1..5</code> excludes 5, while <code>1..=5</code> includes it.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>for rack in 1..=4 {
    println!("checking rack {rack}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Labels Control Nested Loops</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Nested loops can be labeled with a leading apostrophe. A labeled <code>break</code> or <code>continue</code> can then target an outer loop directly instead of only the innermost loop.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    'outer: for rack in 1..=3 {
        for slot in 1..=4 {
            if rack == 2 &amp;&amp; slot == 3 {
                break 'outer;
            }

            println!("rack {rack}, slot {slot}");
        }
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Labels are especially useful when multiple nested control-flow levels would otherwise require extra state variables. Use them deliberately; clear loop names are easier to follow than deeply nested unlabeled exits.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Choosing the Right Loop</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Use <code>loop</code> when repetition is intentionally open-ended or the exit conditions occur inside the body.</li><li>Use <code>while</code> when a Boolean condition naturally controls whether another iteration should begin.</li><li>Use <code>for</code> when iterating through a collection, iterator, or numeric range.</li><li>Use <code>break</code> to exit and <code>continue</code> to skip the rest of the current iteration.</li><li>Use labels when nested loops need an explicit outer target.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Compile and Run</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>cargo new control_flow_lab
cd control_flow_lab
cargo run</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Replace <code>src/main.rs</code> with one example at a time. Compile after every change and observe how Rust's type checker responds when an <code>if</code> condition is not Boolean or when branch result types do not match.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a variable named <code>temperature</code> and classify it as cool, normal, or hot with <code>if</code>/<code>else if</code>/<code>else</code>.</li><li>Create a <code>loop</code> that increments a counter and returns the value <code>100</code> with <code>break 100;</code>.</li><li>Write a <code>while</code> countdown from 5 to 1.</li><li>Use <code>for</code> to iterate through an array of four power readings.</li><li>Use <code>continue</code> to skip one reading.</li><li>Create two nested loops and use a label to exit the outer loop.</li><li>Rewrite one <code>while</code> loop as a <code>for</code> loop where appropriate and explain which version is clearer.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What type must an <code>if</code> condition evaluate to?</li><li>Why can <code>if</code> be assigned directly to a variable?</li><li>What is the normal way to exit an unconditional <code>loop</code>?</li><li>What special feature allows a <code>loop</code> to produce a value?</li><li>When is <code>while</code> a good choice?</li><li>Why is <code>for</code> usually preferred when iterating a collection?</li><li>What does <code>continue</code> do?</li><li>What problem do loop labels solve?</li><li>What is the difference between <code>1..5</code> and <code>1..=5</code>?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><code>bool</code>.</li><li>Because <code>if</code> is an expression in Rust and can evaluate to a value.</li><li>Use <code>break</code>, return from the function, or otherwise terminate execution.</li><li><code>break value;</code> supplies the loop expression's result.</li><li>When a Boolean condition naturally determines whether another iteration should begin.</li><li>It uses the iterator system directly and avoids manual index management.</li><li>It skips the rest of the current iteration and starts the next one.</li><li>They let <code>break</code> or <code>continue</code> target a specific enclosing loop.</li><li><code>1..5</code> excludes 5; <code>1..=5</code> includes 5.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://doc.rust-lang.org/book/ch03-05-control-flow.html"><strong>The Rust Programming Language — Control Flow</strong></a></li><li><a href="https://doc.rust-lang.org/reference/expressions/loop-expr.html"><strong>The Rust Reference — Loop expressions</strong></a></li><li><a href="https://doc.rust-lang.org/rust-by-example/flow_control.html"><strong>Rust By Example — Flow of Control</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust control flow is built around expressions and explicit intent. <code>if</code> chooses paths, <code>loop</code> repeats until explicitly stopped, <code>while</code> repeats while a Boolean remains true, and <code>for</code> iterates through values. <code>break</code>, <code>continue</code>, return values from <code>loop</code>, and labels give precise control without resorting to unstructured jumps.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech Editor's Note:<br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full" style="text-align:center"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" style="width:72vw;max-width:1170px;height:auto;display:block;margin-left:auto;margin-right:auto"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->