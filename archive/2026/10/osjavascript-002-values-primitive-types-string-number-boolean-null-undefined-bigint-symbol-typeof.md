---
title: "OSJavaScript.002: Values and Primitive Types — String, Number, Boolean, null, undefined, BigInt, Symbol, and typeof"
status: published
wordpress_post_id: 23199
wordpress_status: publish
published: "2026-10-10T09:44:34"
modified: "2026-10-10T09:44:34"
live_url: "https://bitcoinversus.tech/2026/10/10/osjavascript-002-values-primitive-types-string-number-boolean-null-undefined-bigint-symbol-typeof/"
series: "Open Source JavaScript"
certification: OSJavaScript
pathway: javascript
lesson_number: "002"
lesson_topic: "Values and Primitive Types"
featured_media_id: 23197
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osjavascript002-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 23198
body_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/javascript-code-wikimedia-cc0.png"
youtube:
  - "https://www.youtube.com/watch?v=tY3EYcQJdY4"
  - "https://www.youtube.com/watch?v=XC-Mdb6KMBM"
social:
  - "https://www.reddit.com/r/learnjavascript/comments/v9qgaa/everything_in_javascript_is_an_objectwhat_about/"
seo_title: "OSJavaScript.002: Values and Primitive Types | Open Source JavaScript"
seo_description: "Learn JavaScript primitive types: String, Number, Boolean, null, undefined, BigInt, Symbol, typeof, immutability, and dynamic typing."
seo_schema_type: article
excerpt: "Learn JavaScript’s seven primitive types—String, Number, BigInt, Boolean, undefined, Symbol, and null—plus typeof, immutability, dynamic typing, and the famous typeof null quirk."
no_text_boxes: true
top_section_heading: "Key Takeaways"
top_bullet_count: 3
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>JavaScript values have types, but variables are not permanently locked to one type.</strong></li><li><strong>JavaScript has seven primitive types:</strong> string, number, bigint, boolean, undefined, symbol, and null.</li><li><strong><code>typeof</code> is useful, but it has one famous historical surprise:</strong> <code>typeof null</code> returns <code>"object"</code>.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>In <a href="https://bitcoinversus.tech/2026/10/08/osjavascript-001-what-is-javascript-where-it-runs-what-it-does-first-console-log/"><strong>OSJavaScript.001</strong></a>, we established that JavaScript is the language, a JavaScript engine executes it, and a host environment such as a browser or Node.js supplies extra APIs. This lesson moves one level deeper: <strong>what kinds of values can JavaScript actually represent?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Unlike the Java lesson immediately before this one, where a variable declaration such as <code>int age = 25;</code> fixes the variable to an integer type, JavaScript is dynamically typed. A binding can hold a number now and a string later. That contrast is useful if you just read <a href="https://bitcoinversus.tech/2026/10/10/osjava-002-primitive-types-variables-byte-short-int-long-float-double-boolean-char-literals-local-variables/"><strong>OSJava.002: Primitive Types and Variables</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=tY3EYcQJdY4","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=tY3EYcQJdY4
</div><figcaption class="wp-element-caption"><em>LearnAwesome introduces JavaScript variables, data types, value-versus-reference ideas, and the typeof operator.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Values Have Types</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A JavaScript program manipulates values. Every value belongs to a type. The official <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Data_structures"><strong>MDN data-types guide</strong></a> divides JavaScript values into primitives and objects. The primitive values are the simplest immutable values defined by the language.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const name = "Amina";
const count = 42;
const ready = true;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here, <code>"Amina"</code> is a string value, <code>42</code> is a number value, and <code>true</code> is a boolean value. <code>const</code> prevents the binding from being reassigned; it does not create a special new data type.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":23198,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/javascript-code-wikimedia-cc0.png?w=882" alt="JavaScript source code showing const declarations, numeric values, arrays, maps, loops, and object creation" class="wp-image-23198" /><figcaption class="wp-element-caption"><em>Real JavaScript source code by Lionel Rowe via Wikimedia Commons, released under CC0 1.0.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Seven Primitive Types</h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Primitive</th><th>Example</th><th>Typical meaning</th><th><code>typeof</code></th></tr></thead><tbody><tr><td>string</td><td><code>"hello"</code></td><td>Text</td><td><code>"string"</code></td></tr><tr><td>number</td><td><code>42</code>, <code>3.14</code></td><td>Ordinary numeric values</td><td><code>"number"</code></td></tr><tr><td>bigint</td><td><code>9007199254740993n</code></td><td>Arbitrarily large integers</td><td><code>"bigint"</code></td></tr><tr><td>boolean</td><td><code>true</code></td><td>Logical true/false state</td><td><code>"boolean"</code></td></tr><tr><td>undefined</td><td><code>undefined</code></td><td>Value not assigned / absent by default</td><td><code>"undefined"</code></td></tr><tr><td>symbol</td><td><code>Symbol("id")</code></td><td>Unique identifier-like primitive</td><td><code>"symbol"</code></td></tr><tr><td>null</td><td><code>null</code></td><td>Intentional absence of a value/object reference</td><td><code>"object"</code> — historical quirk</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>Everything that is not a primitive value is an object. Arrays, ordinary objects, dates, maps, regular expressions, and functions all live on the object side of JavaScript’s type system, although <code>typeof</code> reports callable functions as <code>"function"</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">String: Text Data</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Strings represent text. JavaScript supports single quotes, double quotes, and template literals with backticks.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const first = "Bitcoin";
const second = 'JavaScript';
const message = `Learning ${second}`;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Strings are immutable: operations that appear to modify a string actually produce a new string value. If your editor visually separates strings, keywords, numbers, and identifiers, that is the same <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>syntax highlighting</strong></a> covered in our earlier coding explainer.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Number: Integers and Decimals Share One Main Type</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>JavaScript’s ordinary <code>number</code> type uses IEEE 754 double-precision floating-point representation. That means ordinary integers and decimals normally share the same type.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>typeof 42;      // "number"
typeof 3.14;    // "number"
typeof NaN;     // "number"
typeof Infinity;// "number"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>NaN</code> means “Not-a-Number,” but it is still a value in the Number type. That odd-looking detail makes more sense once you distinguish a value’s name from its underlying type.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">BigInt: Integers Beyond Number’s Safe Integer Range</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For integers larger than JavaScript can represent exactly with ordinary Number values, JavaScript provides <code>BigInt</code>. A BigInt literal ends with <code>n</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const huge = 9007199254740993n;
console.log(typeof huge); // "bigint"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>BigInt is not simply “a more precise Number.” It is a distinct primitive type for integers. You generally cannot mix BigInt and Number directly in arithmetic without an explicit conversion.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Boolean: true or false</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A boolean has exactly two values: <code>true</code> and <code>false</code>. Booleans become especially important when we reach comparisons, conditionals, loops, and application state.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const connected = true;
const maintenanceMode = false;</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">undefined and null Are Not the Same</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>undefined</code> often means JavaScript has no value there yet. For example, a <code>let</code> declaration without an initializer receives <code>undefined</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>let result;
console.log(result);        // undefined
console.log(typeof result); // "undefined"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>null</code>, by contrast, is normally written deliberately by the programmer to represent an intentional empty or missing value. The exact semantics are application-specific, but treating <code>null</code> and <code>undefined</code> as identical concepts is a common beginner mistake.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=XC-Mdb6KMBM","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=XC-Mdb6KMBM
</div><figcaption class="wp-element-caption"><em>Desarrollo Útil walks through let, const, JavaScript primitive types, null, undefined, and typeof.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Symbol: Unique Primitive Values</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A Symbol is a unique primitive value commonly used for unique property keys. Two symbols created with the same description are still different values.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const firstId = Symbol("id");
const secondId = Symbol("id");

console.log(firstId === secondId); // false</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You will not need Symbol constantly in beginner programs, but it belongs in the complete primitive-type model and should not be omitted just because it is less common than strings or numbers.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">typeof Lets You Inspect a Value’s Type</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The unary <code>typeof</code> operator returns a string describing the operand’s type category. MDN’s <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof"><strong>typeof reference</strong></a> documents the exact return strings.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>console.log(typeof "hello");   // "string"
console.log(typeof 42);        // "number"
console.log(typeof 42n);       // "bigint"
console.log(typeof true);      // "boolean"
console.log(typeof undefined); // "undefined"
console.log(typeof Symbol());  // "symbol"</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Famous typeof null Surprise</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>console.log(typeof null); // "object"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This does <strong>not</strong> mean <code>null</code> is an object. <code>null</code> is a primitive value. The <code>"object"</code> result is a long-standing historical behavior preserved for web compatibility. To test specifically for null, use a strict comparison such as <code>value === null</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/learnjavascript/comments/v9qgaa/everything_in_javascript_is_an_objectwhat_about/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/learnjavascript/comments/v9qgaa/everything_in_javascript_is_an_objectwhat_about/
</div><figcaption class="wp-element-caption"><em>A learnjavascript discussion tackles a classic beginner misconception: primitive values are not objects even though JavaScript can expose wrapper-provided methods on them.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primitive Values Are Immutable</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Primitive values themselves cannot be mutated. A variable can be reassigned to a different primitive, but that does not modify the old primitive value.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>let word = "cat";
word = "dog";</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The string <code>"cat"</code> was not changed into <code>"dog"</code>. The binding named <code>word</code> was reassigned to a different string value. This distinction becomes important when you later compare primitives with objects and arrays.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">JavaScript Is Dynamically Typed</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A JavaScript binding does not permanently declare one value type. The value can change type at runtime.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>let value = 42;
value = "forty-two";
value = true;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This flexibility is one reason TypeScript exists: it adds static type checking around JavaScript development. BitcoinVersus.Tech has followed that tooling layer in stories such as <a href="https://bitcoinversus.tech/2026/10/08/ts-rust-typescript-7-compiler-rust-181711-tests-ai-agents/"><strong>ts-rust Ports TypeScript 7’s Compiler to Rust</strong></a> and the earlier <a href="https://bitcoinversus.tech/2026/10/02/coding-github-copilot-typescript-runtime-rust-ai-agents/"><strong>GitHub Copilot TypeScript Runtime rewrite</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Small Type-Inspection Program</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>const values = [
  "hello",
  42,
  42n,
  true,
  undefined,
  null,
  Symbol("id")
];

for (const value of values) {
  console.log(value, typeof value);
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Run this in the browser console introduced in OSJavaScript.001. Pay special attention to the line for <code>null</code>. The experiment is more useful than memorizing a list because it lets you observe the language directly.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Saying JavaScript has only six primitive types:</strong> modern JavaScript has seven; BigInt and Symbol count.</li><li><strong>Calling null an object because typeof says object:</strong> null is a primitive.</li><li><strong>Treating null and undefined as identical:</strong> they often represent different kinds of absence.</li><li><strong>Assuming integers have a separate int type:</strong> ordinary integers and decimals normally use Number.</li><li><strong>Mixing BigInt and Number arithmetic casually:</strong> they are distinct numeric types.</li><li><strong>Thinking const makes an object immutable:</strong> const prevents rebinding; object mutation is a separate concept.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Open a browser developer console.</li><li>Create one value for each of JavaScript’s seven primitive types.</li><li>Run <code>typeof</code> on each value.</li><li>Confirm that <code>typeof null</code> returns <code>"object"</code>.</li><li>Compare two separately created symbols with the same description.</li><li>Create a BigInt literal and inspect it with <code>typeof</code>.</li><li>Declare a <code>let</code> binding, assign it a number, then a string, and observe that JavaScript permits the type to change.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>How many primitive types does JavaScript have?</strong> Seven.</li><li><strong>Name them.</strong> String, Number, BigInt, Boolean, Undefined, Symbol, and Null.</li><li><strong>Is null an object?</strong> No. It is a primitive value.</li><li><strong>What does typeof null return?</strong> <code>"object"</code>, for historical compatibility reasons.</li><li><strong>What does typeof 42n return?</strong> <code>"bigint"</code>.</li><li><strong>What is the difference between undefined and null at a beginner level?</strong> Undefined commonly represents a value that has not been supplied or assigned; null is commonly written deliberately to represent an intentional empty value.</li><li><strong>Can a let binding hold a number and later a string?</strong> Yes.</li><li><strong>Are primitive values mutable?</strong> No.</li><li><strong>What is Symbol useful for?</strong> Creating unique primitive values, often for unique object property keys.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>JavaScript values have types even though variables are dynamically typed.</strong> Learn the seven primitives first: string, number, bigint, boolean, undefined, symbol, and null. Use <code>typeof</code> to inspect values, but remember the special <code>null</code> result.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next JavaScript Lesson</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>OSJavaScript.003: Variables and Constants — let, const, var, Reassignment, Scope, and the Temporal Dead Zone</strong> will build on these values by focusing on how JavaScript creates and manages bindings.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured artwork is a unique 1200×630 realistic color-pencil illustration created specifically for this lesson and is not reused in the body. The separate body image is real JavaScript source code by Lionel Rowe from Wikimedia Commons, released under CC0 1.0.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->