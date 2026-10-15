---
title: "OSJavaScript.003: Variables and Constants — let, const, var, Reassignment, Scope, and the Temporal Dead Zone"
status: published
wordpress_post_id: 25637
wordpress_status: publish
published: "2026-10-15T16:36:00"
live_url: "https://bitcoinversus.tech/2026/10/15/osjavascript-003-variables-constants-let-const-var-reassignment-scope-temporal-dead-zone/"
series: "Open Source JavaScript"
certification: OSJavaScript
pathway: javascript
lesson_number: "003"
lesson_topic: "Variables and Constants"
featured_media_id: 25636
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osjavascript-003-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
youtube:
  - "https://www.youtube.com/watch?v=KWUcTt15fQs"
  - "https://www.youtube.com/watch?v=9WIJQDvt4Us"
  - "https://www.youtube.com/watch?v=_E96W6ivHng"
seo_title: "OSJavaScript.003: Variables and Constants | Open Source JavaScript"
seo_description: "Learn JavaScript let, const, and var declarations, reassignment, block and function scope, hoisting behavior, const object mutation, and the Temporal Dead Zone."
seo_schema_type: article
no_text_boxes: true
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>JavaScript gives you three main declaration keywords: <code>let</code>, <code>const</code>, and <code>var</code>.</strong> They all create bindings between names and values, but they do not behave the same way. Modern JavaScript normally favors <code>const</code> for bindings that will not be reassigned and <code>let</code> for bindings that must change. <code>var</code> still matters because older codebases use it and because its function-scoped behavior helps explain several classic JavaScript bugs.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/10/osjavascript-002-values-primitive-types-string-number-boolean-null-undefined-bigint-symbol-typeof/"><strong>OSJavaScript.002: Values and Primitive Types</strong></a>. That lesson explained what kinds of values JavaScript stores. OSJavaScript.003 focuses on how names are created, reassigned, scoped, and initialized.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=KWUcTt15fQs","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=KWUcTt15fQs
</div><figcaption class="wp-element-caption"><em>Traversy Media introduces let and const declarations and shows why modern JavaScript added them alongside var.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Declare bindings with <code>let</code>, <code>const</code>, and <code>var</code>.</li><li>Explain the difference between declaration, initialization, assignment, and reassignment.</li><li>Explain why <code>const</code> prevents rebinding but does not automatically freeze objects.</li><li>Distinguish block scope from function scope.</li><li>Recognize the Temporal Dead Zone for <code>let</code> and <code>const</code>.</li><li>Explain why reading a <code>var</code> binding before its declaration often produces <code>undefined</code>.</li><li>Choose a sensible declaration keyword in new code.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Declaration, Initialization, Assignment, and Reassignment</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A declaration introduces a binding name into a scope. Initialization gives that binding its first value. Assignment stores a value in a binding, and reassignment changes the value later.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>let temperature;      // declaration

temperature = 72;    // assignment after declaration

temperature = 75;    // reassignment

const siteName = "Mesa"; // declaration + required initialization</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>let</code> can be declared without an initializer, in which case the binding receives <code>undefined</code> when execution reaches the declaration. A <code>const</code> declaration must include an initializer because the binding cannot later be reassigned.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">let: Block-Scoped and Reassignable</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>let</code> creates a block-scoped binding. A block is commonly delimited by braces in structures such as <code>if</code>, <code>for</code>, <code>while</code>, <code>switch</code>, and ordinary nested blocks. MDN’s <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let"><strong>let reference</strong></a> documents that <code>let</code> is scoped to its nearest enclosing block, function body, module, or global script scope.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>let count = 1;

if (true) {
  let count = 2;
  console.log(count); // 2
}

console.log(count);   // 1</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The inner <code>count</code> is a different binding from the outer <code>count</code>. This is called shadowing. The braces create a separate block scope, so changing the inner binding does not change the outer one.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">const: A Binding That Cannot Be Reassigned</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>const</code> also uses block scope, but its binding cannot be reassigned after initialization. This makes <code>const</code> useful when a name should continue to refer to the same value or object for the lifetime of that scope.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const voltage = 480;

voltage = 208; // TypeError: assignment to a constant variable</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A critical beginner point is that <code>const</code> does <strong>not</strong> make an object immutable. It prevents the variable from being rebound to a different object. The object itself can still be changed unless other techniques such as <code>Object.freeze()</code> are used.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const miner = {
  model: "S21",
  online: true
};

miner.online = false; // allowed

// miner = {};        // not allowed</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=9WIJQDvt4Us","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=9WIJQDvt4Us
</div><figcaption class="wp-element-caption"><em>Web Dev Simplified compares var, let, and const, including reassignment and the practical reasons to choose one declaration form over another.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">var: Function-Scoped Legacy Behavior</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>var</code> predates <code>let</code> and <code>const</code>. Its most important beginner-level difference is scope: <code>var</code> is function-scoped rather than block-scoped. An <code>if</code> block or <code>for</code> loop does not create a new <code>var</code> scope by itself.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>function demo() {
  if (true) {
    var status = "online";
  }

  console.log(status); // "online"
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The same pattern with <code>let</code> would fail outside the <code>if</code> block because the binding would be block-scoped. This difference is one reason modern JavaScript style generally avoids introducing new <code>var</code> declarations.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Scope: Global, Function, and Block</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Scope answers a simple question: <strong>where can this name be used?</strong> A global binding is visible broadly within the script or module environment. A function-scoped binding is available inside its function. A block-scoped binding is limited to the nearest enclosing block.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=_E96W6ivHng","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=_E96W6ivHng
</div><figcaption class="wp-element-caption"><em>Dave Gray demonstrates global, function, local, and block scope while comparing var, let, and const.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const company = "HashWorks";

function report() {
  var region = "West";

  if (true) {
    let rack = 12;
    const targetTemp = 25;
    console.log(company, region, rack, targetTemp);
  }

  // rack and targetTemp are not available here
}</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Temporal Dead Zone</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The Temporal Dead Zone, usually shortened to TDZ, is the period from the start of a block until execution reaches a <code>let</code> or <code>const</code> declaration. During that period, the binding exists conceptually but cannot be accessed. Attempting to read it throws a <code>ReferenceError</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>{
  console.log(power); // ReferenceError
  let power = 3500;
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>MDN explains that <code>let</code> and <code>const</code> remain inaccessible until control reaches their declaration and initialization. The word <em>temporal</em> matters because the restriction depends on execution order, not simply whether the declaration appears somewhere in the block.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why var Looks Different Before Its Declaration</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <code>var</code> binding is created and initialized to <code>undefined</code> when its function or global execution context is established. That means code can often read it before the declaration line without receiving a TDZ error.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>console.log(site); // undefined
var site = "Tacoma";

console.log(zone); // ReferenceError
let zone = "A";</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This behavior is often described as hoisting. The safest beginner mental model is not that JavaScript literally moves source-code lines. Instead, the engine establishes declarations during environment setup, and the initialization rules differ by declaration type.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Redeclaration Rules</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>var</code> allows the same name to be declared again in the same function scope. <code>let</code> and <code>const</code> do not allow another lexical declaration with the same name in the same scope. This stricter behavior catches accidental duplicate declarations earlier.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>var mode = "auto";
var mode = "manual"; // allowed

let speed = 10;
// let speed = 20;    // SyntaxError</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Practical Rule for New Code</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Use <code>const</code> by default</strong> when the binding will not be reassigned.</li><li><strong>Use <code>let</code></strong> when reassignment is part of the program’s logic.</li><li><strong>Understand <code>var</code></strong> so you can read older code and recognize function-scope and initialization behavior.</li><li><strong>Do not assume const means immutable object.</strong></li><li><strong>Declare names before use</strong> so TDZ behavior is predictable and code remains easy to read.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Open the browser console introduced in <a href="https://bitcoinversus.tech/2026/10/08/osjavascript-001-what-is-javascript-where-it-runs-what-it-does-first-console-log/"><strong>OSJavaScript.001</strong></a>.</li><li>Create a <code>const</code> binding named <code>siteName</code>.</li><li>Create a <code>let</code> binding named <code>activeMiners</code>, then reassign it.</li><li>Create an <code>if</code> block containing a new <code>let</code> binding and confirm that the name is unavailable outside the block.</li><li>Repeat the experiment with <code>var</code> and observe the difference.</li><li>Try reading a <code>let</code> binding before its declaration and observe the <code>ReferenceError</code>.</li><li>Try reading a <code>var</code> binding before its declaration and observe <code>undefined</code>.</li><li>Create a <code>const</code> object, change one property, then try to reassign the entire binding.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Which declaration keyword is normally the best default when no reassignment is needed?</li><li>Which modern keyword allows reassignment?</li><li>Is <code>var</code> block-scoped?</li><li>What does the Temporal Dead Zone describe?</li><li>What happens if code reads a <code>let</code> binding inside its TDZ?</li><li>What value is a <code>var</code> binding initialized with before its declaration line executes?</li><li>Does <code>const</code> automatically freeze an object?</li><li>Can <code>let</code> be redeclared with the same name in the same scope?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><code>const</code>.</li><li><code>let</code>.</li><li>No. <code>var</code> is function-scoped or global/script-scoped.</li><li>The period from entering the relevant scope until a <code>let</code> or <code>const</code> declaration has been reached and initialized.</li><li>A <code>ReferenceError</code> is thrown.</li><li><code>undefined</code>.</li><li>No. The binding cannot be reassigned, but the referenced object can still be mutated.</li><li>No, not in the same scope.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let"><strong>MDN — let</strong></a></li><li><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/const"><strong>MDN — const</strong></a></li><li><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/var"><strong>MDN — var</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>JavaScript variables are not all declared the same way. <code>const</code> creates a non-reassignable block-scoped binding, <code>let</code> creates a reassignable block-scoped binding, and <code>var</code> creates a function-scoped binding with older initialization behavior. Scope determines where names are visible, while the Temporal Dead Zone explains why <code>let</code> and <code>const</code> cannot be read before initialization. These rules are foundational for conditions, loops, functions, closures, modules, and larger JavaScript programs.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->