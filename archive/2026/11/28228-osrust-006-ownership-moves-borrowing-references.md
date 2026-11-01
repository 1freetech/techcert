---
lesson_id: "OSRust.006"
track: "Open Source Rust Programming"
level: "Super-Fundamentals"
wordpress_post_id: 28228
title: "OSRust.006: Ownership, Moves, and Borrowing — References and Memory Safety"
permalink: "https://bitcoinversus.tech/2026/11/01/osrust-006-ownership-moves-borrowing-references-memory-safety/"
published_date: "2026-11-01"
wordpress_category_ids: [44329]
featured_media_id: 28304
featured_dimensions: "1200x630"
featured_style: "split-screen diptych"
featured_person: "Fictional adult East Asian male systems programmer aged 30s-40s"
in_story_media_count: 4
in_story_media:
  - "WordPress 28219: original Rust String ownership move conceptual diagram"
  - "YouTube VFIOSWy93H0: Let's Get Rusty, Understanding Ownership in Rust (2021)"
  - "WordPress 28220: original shared/mutable borrowing conceptual diagram"
  - "YouTube 79phqVpE7cU: Gary Explains, Rust What is Ownership and Borrowing? (2020)"
youtube_embed_qa: "WordPress published rendered HTML contains two actual YouTube iframe players with immediate following video captions. Actual reader-device playback not separately verified."
code_blocks_count: 0
code_qa: "Examples structurally reviewed against official Rust Book semantics. rustc toolchain unavailable in execution environment; do NOT claim compiled/runnable test completed."
internal_link_count: 5
decorative_text_box_blocks: 0
primary_sources:
  - "https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html"
  - "https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html"
  - "https://doc.rust-lang.org/error_codes/E0382.html"
  - "https://doc.rust-lang.org/error_codes/E0502.html"
  - "https://doc.rust-lang.org/error_codes/E0515.html"
qa_status: "Published WordPress raw/rendered readback confirms both YouTube iframes, two technical figures, title/SEO curriculum ID, 1200x630 cover, 5 internal links, no decorative text boxes, original editor note QR and disclaimer. Independent mobile/desktop page screenshots, device playback, visual anatomy check and Rust compiler execution unavailable."
next_rust_lesson_id: "OSRust.007"
plain_unboxed_code_examples_count: 10
november_1_2026_layout_repair: "Replaced former Gutenberg code boxes with 10 plain transparent no-border preformatted HTML examples, retaining code content, media, source links and footer; published WordPress readback verified."
november_1_2026_cover_repair: "Featured image changed from WordPress media 28222 to 28304; refreshed story-specific Rust ownership/borrowing concept; new cover 1200x630, alt text present. Actual independent image-anatomy and browser screenshot review not available."
---

<!-- wp:paragraph --><p>Rust's <strong>ownership system</strong> governs who is responsible for a value and how other parts of a program may access it. It is a foundation for memory safety without a mandatory tracing garbage collector. The compiler checks how ownership moves, how references borrow data, and whether accesses can overlap safely; it rejects many programs that could otherwise use invalid pointers or cause unsynchronized mutations.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/14/osrust-005-control-flow-if-loop-while-for-break-continue/">OSRust.005: Control Flow</a>, the earlier <a href="https://bitcoinversus.tech/2026/10/14/osrust-004-functions-parameters-expressions-return-values/">functions and return values</a> lesson, and <a href="https://bitcoinversus.tech/2026/10/09/osrust-002-variables-let-mut-constants-shadowing-scope-type-inference/">variables, scope and mutability</a>. The two previously published OSRust.005 articles share an identifier and both cover control flow; this new lesson takes the next distinct topic instead of repeating those articles.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>State Rust's three ownership rules and distinguish the lifetime of a value from the scope of a named binding.</li><li>Explain the difference between a move, a <code>Copy</code> operation and an explicit <code>clone()</code>.</li><li>Use <code>&amp;T</code>, <code>&amp;mut T</code> and <code>&amp;str</code> references when passing values to functions.</li><li>Explain why overlapping shared and mutable access is restricted and how a borrow may end after its last use.</li><li>Recognize common compiler diagnostics such as <code>E0382</code>, <code>E0499</code>, <code>E0502</code> and <code>E0515</code>.</li><li>Read and construct a small data-processing example without cloning values unnecessarily.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">What ownership means in Rust</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The official <a href="https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html">Rust Book: What Is Ownership?</a> presents three central rules: <strong>each value has an owner; one owner controls a value at a time; and when the owner goes out of scope, the value is dropped</strong>. A drop may release heap allocation or another managed resource. Ownership is not an instruction to manually free every piece of memory; the compiler checks the rules and generates the appropriate cleanup behavior.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The rules apply to values and are not merely an assertion about where bytes physically reside. An integer usually has an inexpensive value representation; an owned <code>String</code> manages a buffer that can be allocated on the heap. Multiple <em>references</em> can view one owned value without becoming owners themselves. Advanced abstractions such as <code>Rc</code> and <code>Arc</code> express shared ownership of a separate allocation, but do not invalidate the basic ownership model.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Stack and heap are useful mental models, not a guarantee of every physical placement in optimized machine code. The stack commonly stores fixed-size local values, while the heap supports allocations with runtime-determined sizes. A <code>String</code> value contains metadata including a pointer, length and capacity; its character buffer is allocated separately as required. Rust controls who is responsible for releasing that allocation.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Moves versus copies</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Consider <code>let first = String::from("node"); let second = first;</code>. Because <code>String</code> is not <code>Copy</code>, the assignment <strong>moves</strong> the value to <code>second</code>. The heap buffer is not automatically duplicated, and the binding <code>first</code> can no longer be used to access that moved value. Trying <code>println!("{first}");</code> afterward causes a compiler error described by <a href="https://doc.rust-lang.org/error_codes/E0382.html">E0382: use of a moved value</a>.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">fn main() {
    let first = String::from("node");
    let second = first;
    println!("{second}"); // Works: second now owns the String.

    // println!("{first}"); // E0382 if uncommented.
}</code></pre>
<!-- /wp:html -->

<!-- wp:image {"id":28219,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/rust-string-move-and-ownership-transfer-e28094-diagram.png" alt="Original conceptual diagram showing one owner transferring ownership of a String's heap allocation to a new binding without copying the allocation" class="wp-image-28219" /><figcaption class="wp-element-caption"><em>Original wordless conceptual diagram: a <code>String</code> move transfers control of the existing allocation. It is not a memory dump or an exact compiler implementation diagram.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><code>u32</code>, <code>bool</code> and many other simple types implement the <code>Copy</code> trait. An assignment of a <code>Copy</code> value makes a separate copy and leaves the source usable. Rust does not permit types requiring custom <code>Drop</code> behavior to also implement <code>Copy</code>. Whether an operation is copying or moving is determined by the type's traits, not just by a variable's visual spelling.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">fn main() {
    let count: u32 = 7;
    let another_count = count; // Copy, not move.
    println!("{count} and {another_count}");
}</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>Use <code>clone()</code> when a type supports explicit cloning and a separate value is genuinely needed. For a <code>String</code>, cloning copies the string content into separately owned storage; it can therefore consume additional time and memory. For other types, the cost and semantics of <code>Clone</code> depend on the implementation. Cloning simply to silence a borrow-checker error can hide an inefficient API design.</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Operation</th><th>Example</th><th>Effect</th></tr></thead><tbody><tr><td>Move</td><td><code>let b = a;</code> for <code>String</code></td><td><code>a</code> becomes unusable; <code>b</code> owns the value</td></tr><tr><td>Copy</td><td><code>let b = a;</code> for <code>u32</code></td><td>Both bindings remain usable and have their own copied value</td></tr><tr><td>Clone</td><td><code>let b = a.clone();</code></td><td>Explicit operation whose cost depends on the type; separate <code>String</code> storage</td></tr><tr><td>Shared borrow</td><td><code>let r = &amp;a;</code></td><td>Temporary read-only access; ownership remains with <code>a</code></td></tr><tr><td>Mutable borrow</td><td><code>let r = &amp;mut a;</code></td><td>Temporary exclusive mutable access; requires appropriate mutable binding</td></tr></tbody></table><figcaption class="wp-element-caption"><em>Conceptual reference: actual trait behavior depends on the type involved. Based on the official Rust Book, Chapter 4.</em></figcaption></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">Video study: ownership, scope and moves</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Let's Get Rusty's ownership walkthrough follows the Rust Book and covers stack/heap at approximately 4:30, the three ownership rules at 6:53, memory and allocation at 8:22, function ownership at 10:32, and references and borrowing around 12:23. This is an English-language instructional video, not a benchmark or compiler specification; the linked official documentation governs language behavior.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=VFIOSWy93H0]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=VFIOSWy93H0">Let's Get Rusty — Understanding Ownership in Rust</a> (2021). Chapters cover moves, allocation, function boundaries and borrowing. This is the first distinct player in the lesson.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">References let functions use a value without owning it</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A reference borrows access to an existing value. In <code>fn inspect(text: &amp;str)</code>, the parameter points to borrowed string data without receiving ownership of the original <code>String</code>. Calling <code>inspect(&amp;status)</code> leaves <code>status</code> usable afterward. A function can usually accept <code>&amp;str</code> rather than <code>&amp;String</code> when it only needs string content, allowing callers to pass either string literals or borrowed string data. See the Rust Book's <a href="https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html">References and Borrowing</a> chapter.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">fn inspect(text: &amp;str) {
    println!("Status: {text}");
}

fn main() {
    let status = String::from("ASIC online");
    inspect(&amp;status);
    println!("Still owned here: {status}");
}</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>A reference is not the same thing as a second owner. A shared reference <code>&amp;T</code> normally permits reading; a mutable reference <code>&amp;mut T</code> permits modification while satisfying Rust's exclusivity requirements. Use the narrowest permission a function needs. For instance, a validator accepting <code>&amp;str</code> should not require <code>&amp;mut String</code> when no mutation is necessary.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Shared borrowing and mutable borrowing</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The central safe-Rust aliasing rule is commonly summarized as <strong>either multiple shared references or one active mutable reference</strong> to the same value, but not overlapping shared and mutable accesses that violate the borrowing rules. A mutable borrow helps prevent mutation while another active reference expects a stable view. This is relevant to data races, iterator invalidation and the lifetime of references into resizable data structures.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Rust uses <em>non-lexical lifetimes</em> to determine that an immutable borrow can end after its last use, even if the surrounding brace-enclosed scope has not ended. In the next valid example, the two shared references are last used in <code>println!</code> before the exclusive mutable reference is created.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">fn main() {
    let mut s = String::from("online");
    let first = &amp;s;
    let second = &amp;s;
    println!("{first}, {second}");

    let exclusive = &amp;mut s; // Shared borrows no longer active.
    exclusive.push_str(" | checked");
    println!("{exclusive}");
}</code></pre>
<!-- /wp:html -->

<!-- wp:image {"id":28220,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/rust-shared-and-mutable-borrowing-rules-e28094-diagram.png" alt="Wordless educational diagram showing multiple shared Rust borrows, one exclusive mutable borrow and conflicting borrows being rejected" class="wp-image-28220" /><figcaption class="wp-element-caption"><em>Original conceptual illustration of safe borrowing rules: multiple shared readers or an exclusive mutable borrow, without conflicting overlap. The drawing is explanatory, not an official borrow-checker trace.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p>A conflicting program like the one below is rejected when the immutable borrow remains active across a mutable borrow. It is intentionally invalid: <code>E0502</code> reports borrowing as mutable while already borrowed as immutable. Separately, creating two simultaneously active mutable borrows can produce <code>E0499</code>. The point is to reorganize accesses into safe phases, not automatically clone every string.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">fn main() {
    let mut s = String::from("online");
    let read = &amp;s;
    let write = &amp;mut s;     // E0502: conflict while read remains active.
    println!("{read}");
    write.push_str(" now");
}
// Intentionally DOES NOT COMPILE.</code></pre>
<!-- /wp:html -->

<!-- wp:heading --><h2 class="wp-block-heading">Video study: explaining why the borrow checker matters</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Gary Explains' separate English walkthrough examines ownership and borrowing and gives a practical way to reason about when a value is moved and when a function can temporarily refer to it. Watch the two videos comparatively: the same core restrictions should lead to the same predictions even when the instructors use different analogies.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=79phqVpE7cU]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=79phqVpE7cU">Gary Explains — Rust: What is Ownership and Borrowing?</a> (2020). Second distinct English tutorial, focused on the relationship between memory safety, moved values and references.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Dangling references and valid lifetimes</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A dangling reference is a pointer-like reference to data that no longer exists. Rust's borrow checking rejects safe code that attempts to return a reference to a local value dropped at the end of a function. An example can fail with <a href="https://doc.rust-lang.org/error_codes/E0515.html">E0515: a reference to a local variable was returned</a>. A function may instead return an owned <code>String</code> when the caller must retain the result, or borrow data from an input whose lifetime supports the returned reference.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">fn make_status() -&gt; String {
    String::from("ready") // Ownership moves to the caller.
}

fn main() {
    let status = make_status();
    println!("{status}");
}</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>The lifetime system reasons about the validity of references. It is not a guarantee that any arbitrary integer or FFI raw pointer can be safely dereferenced. Rust's <code>unsafe</code> features and external C interfaces permit operations that require additional developer-established invariants. Ownership and borrowing prevent major classes of mistakes in safe Rust; they do not remove the need for tests, input validation or resource management.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Complete compiling example: ownership through a function</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The following complete program demonstrates borrowing a string to print it, changing it through an exclusive mutable reference, cloning it, moving the original into a new binding, and copying a small integer. These are distinct operations: a successful call accepting <code>&amp;str</code> should not invalidate the original string, while a move of the <code>String</code> does.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">fn inspect(s: &amp;str) {
    println!("Inspect: {s}");
}

fn append_note(s: &amp;mut String) {
    s.push_str(" | inspected");
}

fn main() {
    let mut status = String::from("ASIC online");
    inspect(&amp;status);        // Borrow shared, no ownership transfer.
    append_note(&amp;mut status); // Borrow mutably after shared use ends.
    println!("Updated: {status}");

    let first = status.clone(); // Deliberate separate String.
    println!("Cloned: {first}");

    let moved = status;  // Ownership transfers to moved.
    println!("New owner: {moved}");

    let count = 3_u32;
    let copy = count;    // u32 implements Copy.
    println!("Counters: {count}, {copy}");
}</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>Expected standard output:</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">Inspect: ASIC online
Updated: ASIC online | inspected
Cloned: ASIC online | inspected
New owner: ASIC online | inspected
Counters: 3, 3</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>Save this as <code>main.rs</code>. With Rust installed, run <code>rustc --edition 2021 main.rs &amp;&amp; ./main</code> in a compatible Unix-like shell, or use <code>cargo run</code> inside a Cargo binary project. Rust's <a href="https://doc.rust-lang.org/book/ch01-03-hello-cargo.html">Cargo introduction</a> explains the normal project workflow. The example is written for stable Rust; its output has been logically checked against the language rules, but execution has not been performed in this environment.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Applied example: borrowing a telemetry sample collection</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Consider a fixed list of sample temperatures or diagnostic values received from an ASIC monitoring service. The function <code>count_valid</code> borrows a slice of readings instead of taking ownership of the collection, whereas <code>record</code> borrows a vector mutably to append a new reading. A negative value is simply a teaching sentinel for missing data; the code does not implement real miner thermal protection or any safety-critical device control.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">fn count_valid(readings: &amp;[i16]) -&gt; usize {
    readings.iter().filter(|&amp;&amp;v| v &gt;= 0).count()
}

fn record(readings: &amp;mut Vec&lt;i16&gt;, new_value: i16) {
    readings.push(new_value);
}

fn main() {
    let mut samples = vec![42, 44, -1];
    println!("Valid before: {}", count_valid(&amp;samples));
    record(&amp;mut samples, 46);
    println!("Valid after: {}", count_valid(&amp;samples));
    println!("All readings: {samples:?}");
}</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>Expected output:</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="Code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">Valid before: 2
Valid after: 3
All readings: [42, 44, -1, 46]</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>The two reads borrow <code>samples</code> immutably only while <code>count_valid</code> uses it. The middle function takes an exclusive mutable borrow for <code>push</code>; afterward the collection remains available for a later shared borrow and a final debug print. No unnecessary <code>Vec</code> cloning is required. This is an example of the same general principle discussed in our <a href="https://bitcoinversus.tech/2026/11/01/oshre-004-hashboard-temperature-sensors-thermal-protection-lm75a-i2c/">hashboard sensor diagnostics</a> and <a href="https://bitcoinversus.tech/2026/11/01/osc-005-c-loops-for-while-do-while-break-continue/">C iteration</a> lessons, although each language has its own memory rules.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common compiler mistakes and corrections</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Use after move:</strong> using a moved <code>String</code> triggers E0382. Borrow it, return ownership, or deliberately clone when you need another owned copy.</li><li><strong>Read/write overlap:</strong> if an immutable reference is used after a mutable borrow is created, restructure the phases so the first borrow is no longer active.</li><li><strong>Two mutable borrows:</strong> avoid simultaneously active exclusive references to the same value; split work into separate scopes or use an appropriate safe API.</li><li><strong>Borrowing a temporary too long:</strong> a reference cannot outlive the value it refers to. Return an owned value or borrow from an input with a suitable lifetime.</li><li><strong>Overcloning:</strong> using <code>clone()</code> reflexively may allocate and copy more than necessary; often a read-only reference is clearer.</li><li><strong>Mixing <code>String</code> and <code>&amp;str</code>:</strong> <code>String</code> owns growable text; <code>&amp;str</code> is a borrowed view into UTF-8 string data.</li><li><strong>Confusing a safe borrow with guaranteed concurrency:</strong> shared reading has rules, but actual multithreaded synchronization and <code>Send</code>/<code>Sync</code> belong to later topics.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Glossary</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Owner:</strong> the binding or value responsible for the lifetime and cleanup of an owned resource.</li><li><strong>Move:</strong> transfer of a non-<code>Copy</code> value that makes its previous binding unusable for that value.</li><li><strong>Copy:</strong> implicit duplication for types implementing the <code>Copy</code> trait.</li><li><strong>Clone:</strong> explicit creation of another value by the type's <code>Clone</code> implementation.</li><li><strong>Borrow:</strong> temporary access through a reference without transferring ownership.</li><li><strong>Mutable reference:</strong> a reference granting appropriately exclusive write access to data.</li><li><strong>Scope:</strong> a region where a name and various values are available; borrow liveness may end before the textual scope's final brace.</li><li><strong>Drop:</strong> cleanup performed when an owned value's lifetime ends.</li><li><strong>Dangling reference:</strong> a reference to data no longer valid; safe Rust forbids constructing one that escapes its lifetime.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Why does assigning one <code>String</code> to another variable generally invalidate the source binding, while assigning a <code>u32</code> does not?</li><li>Can two <code>&amp;String</code> references exist at once, and under what conditions can an <code>&amp;mut String</code> be used afterward?</li><li>Does passing <code>&amp;status</code> to a function accepting <code>&amp;str</code> transfer ownership?</li><li>What does <code>clone()</code> do for a <code>String</code>, and why might it cost memory?</li><li>Why would returning a reference to a newly created local <code>String</code> be invalid?</li><li>How does the telemetry example mutate a vector without transferring ownership to the helper function?</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answer guide:</strong> A <code>String</code> is non-<code>Copy</code> and moves, while <code>u32</code> is <code>Copy</code>. Shared references can coexist, followed by an exclusive borrow once those shared references are no longer in use. <code>&amp;str</code> access does not own the string. Cloning a <code>String</code> creates separately owned contents. A local's storage is destroyed before a returned reference could be used. A <code>&amp;mut Vec</code> temporarily borrows the vector, leaving it owned by the caller.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">References and next lesson</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Primary language references: <a href="https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html">Rust Book — What Is Ownership?</a>; <a href="https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html">Rust Book — References and Borrowing</a>; <a href="https://doc.rust-lang.org/error_codes/E0382.html">Rust compiler E0382</a>; <a href="https://doc.rust-lang.org/error_codes/E0502.html">Rust compiler E0502</a>; <a href="https://doc.rust-lang.org/error_codes/E0515.html">Rust compiler E0515</a>; <a href="https://doc.rust-lang.org/book/ch04-03-slices.html">Rust Book — The Slice Type</a>. The next Rust lesson can develop slices and UTF-8 borrowing in greater detail without repeating today's introductory ownership examples.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="BitcoinVersus.Tech original Bitcoin donation QR for 5000 satoshis" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open the lesson on a larger screen and scan the QR code with a compatible Bitcoin wallet. Verify the destination address before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->