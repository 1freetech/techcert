---
title: "OSRust.002: Variables — let, mut, Constants, Shadowing, Scope, and Type Inference"
status: published
wordpress_post_id: 22663
published: "2026-10-09T11:15:24"
modified: "2026-10-09T12:53:36"
live_url: "https://bitcoinversus.tech/2026/10/09/osrust-002-variables-let-mut-constants-shadowing-scope-type-inference/"
series: "Open Source Rust"
subject: rust
lesson_number: "002"
featured_media_id: 22672
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osrust-002-variables-cover-1200x630-1.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22673
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osrust-002-variables-body-1200x675-1.jpg"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=bfEMiPjEUVk"
youtube_2: "https://www.youtube.com/watch?v=6Ag0MZUlvBE"
youtube_3: "https://www.youtube.com/watch?v=xYgfW8cIbMA"
social_1: "https://www.reddit.com/r/rust/comments/1se1f2j/using_mut_vs_shadowing_when_to_use_which/"
seo_title: "OSRust.002: Rust Variables, mut, Constants, Shadowing & Scope"
seo_description: "Learn Rust variables from the ground up: let, mut, constants, shadowing, scope, type inference, examples, exercises, and compiler-guided troubleshooting."
no_text_boxes: true
diagram_artwork: false
youtube_minimum_met: 3
---

<!-- wp:paragraph -->
<p>Rust variables look simple at first: give a value a name, then use that name later. But Rust adds an important rule immediately: <strong>bindings are immutable by default</strong>. That single choice shapes how Rust code communicates intent. A value that should stay stable stays stable unless you explicitly say otherwise.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/09/osrust-001-what-is-rust-rustup-rustc-cargo-ownership-first-program/"><strong>OSRust.001</strong></a>, where you installed the Rust toolchain, used Cargo, compiled a first program, and saw an early ownership example. Here the focus is narrower: <code>let</code>, <code>mut</code>, constants, shadowing, scope, and just enough type inference to understand what the compiler is doing. The deeper Rust type system belongs to the next lesson.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">1. What A Rust Variable Really Is</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In beginner Rust, you normally introduce a named value with <code>let</code>. Programmers often call this a variable declaration, but Rust documentation frequently describes it as a <strong>binding</strong>: the name is bound to a value.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let miners = 12;
    println!("Miners online: {miners}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The compiler sees the integer literal <code>12</code>, infers a suitable integer type, binds the name <code>miners</code> to that value, and then allows the name to be used later in the same scope. You do not have to write the type every time because Rust performs <strong>type inference</strong> when the intended type is clear.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If terminal commands such as <code>cargo run</code> are still unfamiliar, revisit the Cargo workflow in <a href="https://bitcoinversus.tech/2026/10/09/osrust-001-what-is-rust-rustup-rustc-cargo-ownership-first-program/">OSRust.001</a>. If a command works in one terminal but not another, the earlier <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/">PATH environment variable explainer</a> is also useful background.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">2. Variables Are Immutable By Default</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust deliberately makes ordinary <code>let</code> bindings immutable. Once a value is bound, you cannot assign a different value to that same binding unless you explicitly opt into mutability.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let power_mw = 10;
    println!("Site power: {power_mw} MW");

    power_mw = 12;
    println!("Site power: {power_mw} MW");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This does not compile. The Rust compiler reports that you cannot assign twice to the immutable variable. The error is useful: the code told Rust that <code>power_mw</code> should not change, then contradicted that promise.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Immutability by default is not the same thing as saying Rust programs can never change state. It means a programmer must make changing state visible. That makes a later reader less likely to wonder whether any ordinary binding might be modified somewhere else in the function.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=bfEMiPjEUVk","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=bfEMiPjEUVk
</div><figcaption class="wp-element-caption"><em>Piyush Garg walks through Rust Book Chapter 3.1, including variables, mutability, and shadowing.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">3. Use mut When The Same Binding Must Change</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Add <code>mut</code> after <code>let</code> when the same binding is expected to receive new values. The keyword is short, but its meaning is important: this value is intentionally allowed to change.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let mut temperature_c = 24;
    println!("Start: {temperature_c} C");

    temperature_c = 27;
    println!("Later: {temperature_c} C");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here both assignments belong to the same mutable binding. This is appropriate when a value represents changing state: a retry counter, an accumulated total, a position updated in a loop, or a measurement that is intentionally replaced during a procedure.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not add <code>mut</code> automatically. If the value never needs reassignment, leave it immutable. Rust will even warn when a binding is marked mutable but never actually changes.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">4. Constants Are Different From Immutable Variables</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A Rust <code>const</code> is always immutable, requires an explicit type annotation, and is intended for values that can be determined as a constant expression. Constants are declared with <code>const</code>, not <code>let</code>, and the normal naming convention is uppercase letters with underscores.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const SECONDS_PER_HOUR: u32 = 60 * 60;
const MAX_RETRIES: u8 = 5;

fn main() {
    println!("One hour is {SECONDS_PER_HOUR} seconds");
    println!("Maximum retries: {MAX_RETRIES}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>An immutable <code>let</code> binding and a constant can both resist reassignment, but they communicate different ideas. Use a normal binding for a value created as part of program execution. Use a constant for a fixed value that conceptually belongs to the program or module and meets Rust's constant-expression rules.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">5. Shadowing Creates A New Binding</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust allows a later <code>let</code> statement to reuse a name. This is called <strong>shadowing</strong>. Shadowing is not mutation. Instead of changing the original binding, Rust creates a new binding that uses the same name.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let hashrate = 100;
    let hashrate = hashrate + 25;
    let hashrate = hashrate * 2;

    println!("Hashrate index: {hashrate}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The final value is <code>250</code>, but each <code>let hashrate = ...</code> creates a new binding. This matters because the newer binding can even have a different type.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let spaces = "   ";
    let spaces = spaces.len();

    println!("Number of spaces: {spaces}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The first <code>spaces</code> is text. The second <code>spaces</code> is a number. Shadowing makes this legal because the second line introduces a new binding. A mutable binding cannot simply change from one unrelated type to another while remaining the same binding.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/rust/comments/1se1f2j/using_mut_vs_shadowing_when_to_use_which/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/rust/comments/1se1f2j/using_mut_vs_shadowing_when_to_use_which/
</div><figcaption class="wp-element-caption"><em>Rust developers discuss the practical distinction between changing a mutable binding and creating a new binding through shadowing.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">6. mut Versus Shadowing</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use <code>mut</code> when you truly have one piece of state whose value changes over time. Use shadowing when you have reached a new stage of processing and no longer need to refer to the old form by its old name.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Use <code>mut</code>:</strong> a counter increases repeatedly inside a loop.</li><li><strong>Use <code>mut</code>:</strong> a buffer is filled or edited in several steps.</li><li><strong>Use shadowing:</strong> raw input is parsed into a more useful representation.</li><li><strong>Use shadowing:</strong> a value is normalized or transformed once and the old form is no longer needed.</li><li><strong>Use shadowing:</strong> the transformed value should keep the same meaningful name even if its type changes.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>The difference is semantic, not merely stylistic. Mutation says, “this binding changes.” Shadowing says, “this is a new binding, and from this point forward this name refers to the new value.”</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22673,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osrust-002-variables-body-1200x675-1.jpg?w=1024" alt="A diverse software team examining source code together on a large monitor during a programming lab." class="wp-image-22673" /><figcaption class="wp-element-caption"><em>A Rust variables lab is easier to debug when the compiler output and the exact binding being changed are examined together.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">7. Scope Controls Where A Binding Exists</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A variable is only available where its scope allows it to exist. Curly braces create blocks, and an inner block can introduce its own binding with the same name as one outside the block.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let mode = "normal";

    {
        let mode = "diagnostic";
        println!("Inside block: {mode}");
    }

    println!("Outside block: {mode}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Inside the braces, <code>mode</code> refers to the inner binding. After the block ends, that inner binding is no longer in scope, so <code>mode</code> again refers to the outer value. This is a basic form of lexical scope, and you will see the same idea repeatedly when Rust functions, loops, ownership, and borrowing become more complex.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">8. Type Inference Keeps Simple Bindings Concise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust is statically typed, meaning the compiler needs to know the type of every value before the program runs. That does not mean you must manually write every type. The compiler often infers it from the value and how the value is used.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let rack_count = 8;
    let efficiency = 14.5;
    let online = true;
    let site_name = "North Campus";

    println!("{rack_count} {efficiency} {online} {site_name}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Rust can infer useful types for all four bindings. When inference would be ambiguous, or when you want to document the expected type, add an annotation.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let rack_count: u32 = 8;
    let efficiency: f64 = 14.5;
    let online: bool = true;

    println!("{rack_count} {efficiency} {online}");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For now, read the annotation syntax as <code>name: type</code>. The next Rust lesson will slow down and study Rust's core data types directly rather than trying to teach the entire type system here.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=xYgfW8cIbMA","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=xYgfW8cIbMA
</div><figcaption class="wp-element-caption"><em>Tech With Tim — “Rust Tutorial #3: Variables, Constants and Shadowing.” A focused walkthrough of immutable and mutable bindings, constants, scope, and shadowing.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">9. Multiple Bindings And Destructuring</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>let</code> can bind more than one name at once when the value has a matching structure. A simple tuple example is useful because it shows that bindings are connected to patterns, not merely single names.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>fn main() {
    let (voltage, current) = (240, 30);

    println!("Voltage: {voltage} V");
    println!("Current: {current} A");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The tuple contains two values, and the pattern <code>(voltage, current)</code> creates two bindings. Pattern matching becomes much more powerful later in Rust, but this basic destructuring form is already practical.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=6Ag0MZUlvBE","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=6Ag0MZUlvBE
</div><figcaption class="wp-element-caption"><em>Francesco Ciulla demonstrates Rust variables, mutability, shadowing, and constants with runnable examples.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">10. Build A Variables Lab</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Create a fresh Cargo project so every compiler message comes from a small, controlled program.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>cargo new variables_lab
cd variables_lab
cargo run</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Replace <code>src/main.rs</code> with this program:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const TARGET_TEMP_C: i32 = 25;

fn main() {
    let site = "Lab A";
    let mut temperature_c = 22;

    println!("{site}: {temperature_c} C");

    temperature_c = 24;
    println!("Updated: {temperature_c} C");

    let temperature_c = temperature_c + 1;
    println!("Adjusted: {temperature_c} C");

    {
        let site = "Sensor Cabinet";
        println!("Inner scope: {site}");
    }

    println!("Target: {TARGET_TEMP_C} C");
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Run it with <code>cargo run</code>. Then make one deliberate mistake: remove <code>mut</code> but keep the reassignment. Read the compiler error before restoring the keyword. Compiler-guided practice is one of the fastest ways to learn what Rust's rules actually mean.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">11. Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Trying to reassign an immutable binding:</strong> add <code>mut</code> only if reassignment is truly intended.</li><li><strong>Thinking shadowing is mutation:</strong> another <code>let</code> creates a new binding.</li><li><strong>Trying to mark a constant with <code>mut</code>:</strong> constants cannot be mutable.</li><li><strong>Forgetting a constant's type:</strong> <code>const</code> declarations require an explicit type.</li><li><strong>Expecting an inner binding to exist after its block ends:</strong> scope controls name visibility and lifetime.</li><li><strong>Over-annotating obvious values:</strong> let inference work when the type is clear; annotate when clarity or ambiguity requires it.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">12. Exercises</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create an immutable binding named <code>facility</code> containing a short site name and print it.</li><li>Create <code>let mut fan_speed = 40;</code>, change it to <code>55</code>, and print both stages.</li><li>Remove <code>mut</code> from the previous exercise and record the compiler error.</li><li>Create a constant named <code>SECONDS_PER_MINUTE</code> with type <code>u32</code>.</li><li>Shadow a text binding with its character or byte length and print the new value.</li><li>Create an outer variable named <code>status</code>, shadow it inside a block, then print it again after the block to prove the outer binding still exists.</li><li>Create a tuple containing a voltage and current value and destructure it into two bindings.</li><li>Write one example where <code>mut</code> is clearer than shadowing and one where shadowing is clearer than <code>mut</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">13. Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What keyword normally creates a Rust binding?</li><li>Are ordinary Rust bindings mutable or immutable by default?</li><li>What keyword allows reassignment of the same binding?</li><li>Can a Rust <code>const</code> be mutable?</li><li>Why does a constant declaration include an explicit type?</li><li>Does shadowing mutate the old binding?</li><li>Can shadowing create a new binding with a different type?</li><li>What happens to a binding declared inside a block after the block ends?</li><li>What does type inference mean?</li><li>When is <code>mut</code> usually clearer than shadowing?</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">14. Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><code>let</code>.</li><li>Immutable by default.</li><li><code>mut</code>.</li><li>No.</li><li>Rust requires the type to be written for constants, which also makes the constant's intended representation explicit.</li><li>No. A new <code>let</code> binding is created with the same name.</li><li>Yes.</li><li>It goes out of scope and can no longer be accessed through that block-local binding.</li><li>The compiler determines a value's type from available context without requiring you to write the type manually.</li><li>When one logical piece of state is intentionally updated repeatedly over time.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">15. Official Reference And Prior Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://doc.rust-lang.org/book/ch03-01-variables-and-mutability.html">The Rust Programming Language — Variables and Mutability</a></li><li><a href="https://bitcoinversus.tech/2026/10/09/osrust-001-what-is-rust-rustup-rustc-cargo-ownership-first-program/">OSRust.001 — What Is Rust? rustup, rustc, Cargo, Ownership, and Your First Program</a></li><li><a href="https://bitcoinversus.tech/2026/10/08/what-is-git-github-version-control-commits-branches/">What Is Git and GitHub? Version Control, Commits, and Branches</a></li><li><a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/">What Is Syntax Highlighting? Why Code Editors Use Different Colors</a></li><li><a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/">IT: What Is the PATH Environment Variable?</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">16. What You Should Remember</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Rust starts variables from a conservative position. <code>let</code> creates an immutable binding unless you explicitly add <code>mut</code>. Constants use <code>const</code> and require a type. Shadowing creates a new binding rather than modifying the old one. Blocks create scope boundaries. Type inference keeps ordinary code concise while still allowing the compiler to know every type before execution.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Next in the canonical Rust sequence is <strong>OSRust.003: Types</strong>, where integer sizes, floating-point types, booleans, characters, tuples, arrays, and explicit annotations can be studied without overloading this variables lesson.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">BitcoinVersus.Tech</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Advertisement</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><a href="https://bitcoinversus.tech/">BitcoinVersus.Tech</a></strong> publishes open technical education across programming, semiconductors, electronics, networking, robotics, data centers, operating systems, firmware, and infrastructure.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Editor's Note</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><em>Compiler behavior can evolve across Rust releases. When a local compiler message differs from a lesson example, read the complete diagnostic and confirm current syntax against the official Rust documentation.</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong><em>We volunteer daily to help keep the information on this platform verifiably accurate. Support our independent research through the support options available on BitcoinVersus.Tech.</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.tech is not a financial advisor. Content is provided for informational purposes.</p>
<!-- /wp:paragraph -->