---
lesson_id: "OSJavaScript.004"
wordpress_post_id: 28365
title: "OSJavaScript.004: Operators, Expressions, and Type Coercion"
permalink: "https://bitcoinversus.tech/2026/11/01/osjavascript-004-operators-expressions-type-coercion-strict-equality/"
published_date: "2026-11-01"
track: "Open Source JavaScript Programming"
featured_media_id: 28361
featured_dimensions: "1200x630"
featured_style: "anime editorial artwork"
featured_subject: "Fictional adult woman JavaScript developer comparing two typed values in browser development tools"
in_story_media_count: 3
in_story_media:
  - "YouTube GKJh3vdat8A Web Dev Simplified Type Coercion (2022)"
  - "YouTube C5ZVC4HHgIg Web Dev Simplified JS equality (2019)"
  - "YouTube IQoBAaxR3Ng Java Brains Type Coercion and Strict Equality (2016)"
conceptual_in_body_images_count: 0
video_embed_validation: "WordPress published view verified 3 distinct YouTube iframe players and immediate captions; actual device playback untested."
plain_unboxed_code_examples_count: 8
internal_links_count: 5
code_validation: "Main console example and parseReading telemetry example ran under Node.js v22.16.0 with expected output."
primary_sources: ["https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators", "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality", "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Equality", "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence"]
qa_limitations: "Independent public-page screenshots and reader-device YouTube playback unverified."
---

<!-- wp:paragraph --><p><strong>OSJavaScript.004</strong> introduces expressions, operators and the type conversions that occur while JavaScript evaluates them. Operators combine values, compare data and control short-circuit evaluation. Because JavaScript can convert types automatically in some operations but not others, a program that appears mathematically simple can produce a string or a surprising Boolean instead of the intended number.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/15/osjavascript-003-variables-constants-let-const-var-reassignment-scope-temporal-dead-zone/">OSJavaScript.003: Variables and Constants</a> and the earlier <a href="https://bitcoinversus.tech/2026/10/10/osjavascript-002-values-primitive-types-string-number-boolean-null-undefined-bigint-symbol-typeof/">primitive-types lesson</a>. It develops language-specific concepts that you will use in conditions, loops, validation and data-processing code, without duplicating the Go, Java or C tracks.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Distinguish an <strong>expression</strong> from a declaration or statement.</li><li>Predict arithmetic, concatenation, comparison and logical operator results.</li><li>Explain <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">==</code> versus <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">===</code>, including the treatment of <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">null</code>, <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">undefined</code> and objects.</li><li>Use explicit <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">Number()</code> conversion and recognize unexpected <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">NaN</code> or <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">TypeError</code> results.</li><li>Explain precedence, associativity, short-circuit evaluation and nullish coalescing.</li><li>Write, test and diagnose small JavaScript examples without decorative callout boxes.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">What counts as an expression?</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>An <strong>expression</strong> is a piece of JavaScript code that evaluates to a value: <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">2 + 3</code>, <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">price &gt; 10</code>, <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">user.name</code> and <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">isReady ? "go" : "stop"</code> are examples. A <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">const</code> declaration is a statement that introduces a binding. An assignment expression such as <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">x = 4</code> produces the assigned value as well as modifying state, which is why chained assignments are possible—although they can reduce readability.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The MDN <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators">Expressions and Operators guide</a> groups operators by purpose. Learn the meaning and operand types before relying on a symbol; the <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">+</code> operator is particularly important because it may perform numeric addition or string concatenation.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Arithmetic and the special behavior of +</h2><!-- /wp:heading -->

<!-- wp:html -->
<p aria-label="JavaScript code or console output" tabindex="0" style="background:transparent!important;background-color:transparent!important;border:0!important;border-width:0!important;box-shadow:none!important;padding:0!important;margin:1.2em 0!important;border-radius:0!important;line-height:1.55!important;color:inherit!important"><span style="white-space:pre-wrap!important;display:inline!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important;font-size:0.95em!important;line-height:1.55!important;background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important">console.log(8 + 4);      // 12
console.log(8 - 4);      // 4
console.log(8 * 4);      // 32
console.log(8 / 4);      // 2
console.log(8 % 3);      // 2
console.log(2 ** 4);     // 16

console.log("8" + 4);    // "84" (concatenation)
console.log("8" - 4);    // 4 (numeric coercion)
console.log(Number("8") + 4); // 12</span></p>
<!-- /wp:html -->

<!-- wp:paragraph --><p>For binary <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">+</code>, primitive conversion occurs, then if either primitive operand is a string, JavaScript concatenates string representations. Other ordinary arithmetic operators generally request numeric conversion. This means <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">"8" + 4</code> and <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">"8" - 4</code> behave differently. Explicitly convert user input when you intend arithmetic, and validate the result rather than assuming every string contains a useful number.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video demonstration: type coercion pitfalls</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Web Dev Simplified explains implicit conversion and why truthiness-based shortcuts can misinterpret values. Its examples are a useful complement to the standard operator definitions: a real debugging demonstration is more useful here than an invented conceptual image.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=GKJh3vdat8A","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=GKJh3vdat8A
</div><figcaption class="wp-element-caption"><em>Video: <a href="https://www.youtube.com/watch?v=GKJh3vdat8A">Web Dev Simplified — Watch This If You Don't Understand Type Coercion</a> (2022). English demonstration of implicit and explicit conversions.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Equality, identity and relational comparisons</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">===</code> and <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">!==</code> compare without converting different operand types to match. By contrast, <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">==</code> and <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">!=</code> use JavaScript's abstract equality rules, which may convert values first. The reliable default for application comparisons is strict equality unless loose equality is a deliberate, documented choice. See MDN's <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality">Strict Equality</a> and <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Equality">Equality</a> references.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<p aria-label="JavaScript code or console output" tabindex="0" style="background:transparent!important;background-color:transparent!important;border:0!important;border-width:0!important;box-shadow:none!important;padding:0!important;margin:1.2em 0!important;border-radius:0!important;line-height:1.55!important;color:inherit!important"><span style="white-space:pre-wrap!important;display:inline!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important;font-size:0.95em!important;line-height:1.55!important;background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important">console.log(10 === "10");  // false
console.log(10 == "10");   // true
console.log(false == 0);   // true
console.log(false === 0);  // false
console.log(null == undefined);  // true
console.log(null === undefined); // false

const one = {reading: 3};
const two = {reading: 3};
console.log(one === two);  // false: distinct objects
console.log(one === one);  // true: same reference</span></p>
<!-- /wp:html -->

<!-- wp:paragraph --><p>Two different objects are not strictly equal just because their properties match. In addition, <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">NaN === NaN</code> is false; use <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">Number.isNaN()</code> when detecting it. <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">Object.is()</code> has related but different semantics around <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">NaN</code> and signed zero. JavaScript's equality rules are not identical to those of <a href="https://bitcoinversus.tech/2026/11/01/osjava-005-java-strings-literals-immutability-equals-length-substring/">Java Strings</a> or <a href="https://bitcoinversus.tech/2026/11/01/osc-005-c-loops-for-while-do-while-break-continue/">C</a>, so comparisons must be learned in their own language context.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video demonstration: == versus ===</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The second demonstration compares loose and strict equality with concrete values. Pause before the explanation and predict whether each comparison returns true or false, then check the console result.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=C5ZVC4HHgIg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=C5ZVC4HHgIg
</div><figcaption class="wp-element-caption"><em>Video: <a href="https://www.youtube.com/watch?v=C5ZVC4HHgIg">Web Dev Simplified — JavaScript == VS ===</a> (2019). Distinct focused tutorial on equality and type conversion.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Relational comparison and explicit conversion</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">&lt;</code>, <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">&gt;</code>, <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">&lt;=</code> and <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">&gt;=</code> operators compare order. When both operands are strings, comparison is lexicographic by UTF-16 code units; when numeric comparison applies, relevant coercion occurs. For example, <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">"20" &lt; "3"</code> is true as a string comparison, whereas <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">20 &lt; 3</code> is false. Always distinguish a text identifier from a numeric quantity.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<p aria-label="JavaScript code or console output" tabindex="0" style="background:transparent!important;background-color:transparent!important;border:0!important;border-width:0!important;box-shadow:none!important;padding:0!important;margin:1.2em 0!important;border-radius:0!important;line-height:1.55!important;color:inherit!important"><span style="white-space:pre-wrap!important;display:inline!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important;font-size:0.95em!important;line-height:1.55!important;background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important">console.log("20" &lt; "3"); // true: string comparison
console.log(20 &lt; 3);     // false
console.log(Number("20") &lt; Number("3")); // false
console.log(Number("N/A")); // NaN
console.log(Number.isNaN(Number("N/A"))); // true
console.log(1n + 2n); // 3n
// 1n + 2 would throw TypeError; BigInt and Number cannot mix in +.</span></p>
<!-- /wp:html -->

<!-- wp:paragraph --><p>A numeric input is not safe solely because it passed <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">Number()</code>. Check <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">Number.isFinite(value)</code> when a finite quantity is required and apply domain-specific range validation. <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">NaN</code> may propagate through calculations; mixing <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">BigInt</code> with <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">Number</code> in arithmetic throws instead of silently converting. This matters when transforming text measurements into telemetry, pricing or computer-resource statistics.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Precedence, grouping and associativity</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Multiplication binds more tightly than addition, so <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">2 + 3 * 4</code> evaluates to 14 rather than 20. Parentheses override this grouping. Operators of the same precedence can associate left-to-right or right-to-left; assignment is right-associative. MDN's <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence">operator-precedence table</a> provides the authoritative reference. Prefer parentheses when the intended grouping would otherwise surprise a reader.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<p aria-label="JavaScript code or console output" tabindex="0" style="background:transparent!important;background-color:transparent!important;border:0!important;border-width:0!important;box-shadow:none!important;padding:0!important;margin:1.2em 0!important;border-radius:0!important;line-height:1.55!important;color:inherit!important"><span style="white-space:pre-wrap!important;display:inline!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important;font-size:0.95em!important;line-height:1.55!important;background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important">console.log(2 + 3 * 4);       // 14
console.log((2 + 3) * 4);     // 20
console.log(2 ** 3 ** 2);    // 512 (2 ** (3 ** 2))

let a, b;
a = b = 5;
console.log(a, b);          // 5 5</span></p>
<!-- /wp:html -->

<!-- wp:heading --><h2 class="wp-block-heading">Logical short-circuiting and nullish coalescing</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">&amp;&amp;</code> returns the first falsy operand or the last operand; <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">||</code> returns the first truthy operand or the last operand. These operators can therefore return <em>non-Boolean values</em>. <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">??</code> is narrower: it chooses the fallback only for <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">null</code> or <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">undefined</code>, preserving ordinary values such as 0 and the empty string.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<p aria-label="JavaScript code or console output" tabindex="0" style="background:transparent!important;background-color:transparent!important;border:0!important;border-width:0!important;box-shadow:none!important;padding:0!important;margin:1.2em 0!important;border-radius:0!important;line-height:1.55!important;color:inherit!important"><span style="white-space:pre-wrap!important;display:inline!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important;font-size:0.95em!important;line-height:1.55!important;background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important">console.log(0 || 99);        // 99
console.log(0 ?? 99);        // 0
console.log("" || "fallback");// "fallback"
console.log("" ?? "fallback");// ""
console.log(false &amp;&amp; "run"); // false
console.log("ready" &amp;&amp; 7);   // 7

// Mixing ?? with || or &amp;&amp; without parentheses is SyntaxError:
const result = (0 || 5) ?? 9;
console.log(result); // 5</span></p>
<!-- /wp:html -->

<!-- wp:paragraph --><p>A skipped operand is not evaluated, so short-circuiting can guard work that should run only under a condition. Avoid mixing <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">??</code> directly with <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">&amp;&amp;</code> or <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">||</code> without explicit parentheses: JavaScript rejects that ungrouped syntax. When a variable's initial value is meaningful even if falsy, prefer <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">??</code> over <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">||</code> for the default.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video demonstration: coercion and strict comparison</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Java Brains supplies a third independent teaching perspective with a detailed comparison of type coercion and the strict-equality operator. It reinforces the rule that the same inputs can produce different results depending on which operator is selected.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IQoBAaxR3Ng","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=IQoBAaxR3Ng
</div><figcaption class="wp-element-caption"><em>Video: <a href="https://www.youtube.com/watch?v=IQoBAaxR3Ng">Java Brains — Type Coercion and the === Operator</a> (2016). JavaScript-focused demonstration with concrete comparisons.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Complete runnable JavaScript example</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Run the following example in a JavaScript console, or save it as <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">operators.js</code> and execute with a recent Node.js runtime. The output depends on standard JavaScript operator semantics and does not require a browser DOM, network requests or external packages.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<p aria-label="JavaScript code or console output" tabindex="0" style="background:transparent!important;background-color:transparent!important;border:0!important;border-width:0!important;box-shadow:none!important;padding:0!important;margin:1.2em 0!important;border-radius:0!important;line-height:1.55!important;color:inherit!important"><span style="white-space:pre-wrap!important;display:inline!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important;font-size:0.95em!important;line-height:1.55!important;background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important">"use strict";
const price = 12;
const tax = 3;
const label = "12";

console.log(price + tax);        // 15
console.log(price + label);      // "1212"
console.log(Number(label) + tax);// 15
console.log(label === price);    // false
console.log(label == price);     // true
console.log(null == undefined);  // true
console.log(null === undefined); // false
console.log(2 + 3 * 4);          // 14
console.log((2 + 3) * 4);        // 20
console.log(0 || 99);            // 99
console.log(0 ?? 99);            // 0</span></p>
<!-- /wp:html -->

<!-- wp:paragraph --><p><strong>Expected output, in order:</strong></p><!-- /wp:paragraph -->

<!-- wp:html -->
<p aria-label="JavaScript code or console output" tabindex="0" style="background:transparent!important;background-color:transparent!important;border:0!important;border-width:0!important;box-shadow:none!important;padding:0!important;margin:1.2em 0!important;border-radius:0!important;line-height:1.55!important;color:inherit!important"><span style="white-space:pre-wrap!important;display:inline!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important;font-size:0.95em!important;line-height:1.55!important;background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important">15
1212
15
false
true
true
false
14
20
99
0</span></p>
<!-- /wp:html -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical exercise: parse a data-center temperature reading</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Imagine a monitoring application receives the string <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">"42"</code> from a telemetry API, alongside <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">"N/A"</code> for missing readings. The following program explicitly converts and validates values. Its threshold is purely instructional, not a miner, server or electrical safety limit. Compare this with our <a href="https://bitcoinversus.tech/2026/11/01/oshre-004-hashboard-temperature-sensors-thermal-protection-lm75a-i2c/">hashboard sensor lesson</a>, where fault handling requires proper hardware validation.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<p aria-label="JavaScript code or console output" tabindex="0" style="background:transparent!important;background-color:transparent!important;border:0!important;border-width:0!important;box-shadow:none!important;padding:0!important;margin:1.2em 0!important;border-radius:0!important;line-height:1.55!important;color:inherit!important"><span style="white-space:pre-wrap!important;display:inline!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important;font-size:0.95em!important;line-height:1.55!important;background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important">function parseReading(raw) {
  const numeric = Number(raw);
  if (!Number.isFinite(numeric)) {
    return null;
  }
  return numeric;
}

const samples = ["42", "N/A", "0"];
for (const raw of samples) {
  const value = parseReading(raw);
  if (value === null) {
    console.log("Invalid");
  } else {
    console.log(value &gt;= 40 ? "High" : "Normal");
  }
}
// High
// Invalid
// Normal</span></p>
<!-- /wp:html -->

<!-- wp:paragraph --><p>This exercise uses an explicit validity check instead of relying on the truthiness of a measured value, because zero can be a real number. Production validation must additionally consider allowed ranges, unexpected object inputs, units, authentication and how to handle a missing or malfunctioning sensor.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common mistakes and corrections</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Using <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">+</code> on a string and number when numerical addition was intended. Convert and validate explicitly.</li><li>Using <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">==</code> when implicit conversion would introduce unwanted matches. Prefer <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">===</code> by default.</li><li>Assuming <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">||</code> preserves zero or an empty string. Choose <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">??</code> when only nullish values should trigger fallback.</li><li>Assuming object properties determine equality. Ordinary strict object equality compares identity, not deep content.</li><li>Forgetting operator precedence. Use parentheses to communicate the intended grouping.</li><li>Assuming <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">Number("N/A")</code> throws. It normally produces <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">NaN</code>, which requires validation.</li><li>Attempting <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">1n + 2</code>. BigInt and Number arithmetic require intentional type handling.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Predict <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">"5" + 2</code> and <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">"5" - 2</code>. Why are they different?</li><li>What do <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">null == undefined</code> and <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">null === undefined</code> return?</li><li>Why is <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">0 ?? 100</code> different from <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">0 || 100</code>?</li><li>Why is <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">{} === {}</code> false for two independently created object literals?</li><li>Which evaluates first in <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">4 + 6 * 3</code>, and how would parentheses change it?</li><li>Why is a parsed telemetry value of zero not automatically missing data?</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answer guide:</strong> the first yields <code style="background:transparent!important;background-color:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;border-radius:0!important;color:inherit!important;font-family:ui-monospace,SFMono-Regular,Consolas,monospace!important">"52"</code> and the second 3; loose equality of null and undefined is true, strict equality false; nullish coalescing preserves zero while OR selects the fallback; distinct objects have distinct identities; multiplication precedes addition unless grouped otherwise; zero can be a valid measurement and must not be discarded solely for being falsy.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Sources and next lesson</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Core references: <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators">MDN Expressions and Operators</a>; <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality">Strict Equality</a>; <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Equality">Loose Equality</a>; <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence">Operator Precedence</a>; and <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing">Nullish Coalescing</a>. The next JavaScript lesson can expand into conditional branching and repeated execution, after this operator foundation.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Original BitcoinVersus.Tech donation QR for 5,000 satoshis" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open this lesson on a laptop or larger display and scan the original code with a compatible Bitcoin wallet. Confirm the destination before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->