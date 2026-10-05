---
title: "JavaScript Lesson 1: Variables, const, let, and Scope"
wordpress_post_id: 18526
source: BitcoinVersus.tech
published: 2026-09-25T14:49:57
modified: 2026-09-27T00:50:18
live_url: https://bitcoinversus.tech/2026/09/25/javascript-lesson-1-variables-const-let-and-scope/
track: javascript
lesson_number: null
raw_source: javascript-lesson-1-variables-const-let-and-scope-18526.gutenberg.html
---

<!-- wp:paragraph -->
<p><strong>JavaScript Lesson 1</strong> starts a numbered BitcoinVersus.Tech JavaScript training series with the most useful building block: variables. Modern JavaScript primarily uses <code>const</code> and <code>let</code> to give values clear names and control whether those bindings can be reassigned.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">const vs. let</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use <code>const</code> when the variable should not be reassigned. Use <code>let</code> when its value must change later. MDN recommends this same practical rule. Avoid <code>var</code> in new code unless you specifically need its older function-scoping behavior.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const minerModel = "S21";
let temperatureC = 62;

temperatureC = 64;

console.log(minerModel);
console.log(temperatureC);</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why scope matters</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>let</code> and <code>const</code> are block-scoped. A name declared inside an <code>if</code> statement, loop, or other block is not automatically available outside that block.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const online = true;

if (online) {
  const status = "Miner online";
  console.log(status);
}

// console.log(status); // ReferenceError</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Open your browser developer console. Create a constant named <code>siteName</code>, a variable named <code>activeMiners</code>, then increase <code>activeMiners</code> by one. Finally, print both values with <code>console.log()</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Reference and video</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>MDN JavaScript variables guide:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Scripting/Variables</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Video lesson on <code>var</code>, <code>let</code>, <code>const</code>, and scope:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>https://www.youtube.com/watch?v=_E96W6ivHng</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Next:</strong> JavaScript Lesson 2 will build on this foundation with data types, operators, and type checking.</p>
<!-- /wp:paragraph -->