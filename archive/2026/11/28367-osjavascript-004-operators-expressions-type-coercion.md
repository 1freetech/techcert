---
lesson_id: "OSJavaScript.004"
track: "Open Source JavaScript Programming"
level: "Super-Fundamentals"
wordpress_post_id: 28367
title: "OSJavaScript.004: Operators, Expressions, and Type Coercion — ==, ===, ??, and ?."
permalink: "https://bitcoinversus.tech/2026/11/01/osjavascript-004-operators-expressions-type-coercion-strict-equality-nullish-optional-chaining/"
published_date: "2026-11-01"
categories: [44329, 5812, 6]
featured_media_id: 28379
featured_image_dimensions: "1200x630"
featured_style: "anime technical editorial artwork"
featured_image_source: "Original subject-only editorial art; technical concept illustrated directly; no human figures."
in_story_media_count: 3
youtube_embeds:
  - "GKJh3vdat8A: Web Dev Simplified — JavaScript type coercion"
  - "O7aUm0AuUy4: Bro Code — strict equality"
  - "v2tJ3nzXh8I: Web Dev Simplified — nullish coalescing and optional chaining"
embed_qa: "Fresh WordPress published view HTML contains three distinct youtube.com/embed iframes; source includes three canonical Gutenberg core/embed blocks with wrapper line breaks and captions immediately following video."
in_browser_video_playback_verified: false
mobile_render_verified: false
code_examples_count: 7
code_format: "Transparent, unboxed and line-wrapping pre/code Gutenberg HTML blocks; verified in published WordPress render"
code_qa: "Full main.js tested with node --check, executed under Node.js v22.16.0, expected output verified"
internal_link_count: 6
primary_sources:
  - "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators"
  - "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness"
  - "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing"
  - "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining"
next_javascript_lesson_id: "OSJavaScript.005"
next_main_rotation_subject: "html"
next_main_rotation_lesson_number: 4
qa_status: "Published WordPress readback: three distinct videos rendered as iframes, seven code examples transparent unboxed and wrapping, six internal links, 1200×630 cover, correct editorial footer. Public page cannot be independently fetched; actual player playback and responsive browser layout unverified."
featured_subject: "JavaScript numeric and string operands, expression evaluation and equality logic, no people"
cover_revision_2026_11_01_subject_only: "Supersedes featured media 28363 with 28379; 1200×630 WordPress published attachment verified. Renaissance category and people imagery removed per explicit user edit; visual pixel inspection and public responsive screenshot access remain unverified."
---

<!-- wp:heading --><h2 class="wp-block-heading">JavaScript Operators: What a Value Actually Means</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>JavaScript expressions combine values, variables, and operators to produce results. But similar-looking expressions can behave differently because JavaScript sometimes converts types automatically. <strong>OSJavaScript.004</strong> teaches arithmetic, comparison, strict equality, truthy/falsy values, nullish defaults, and optional chaining. Every example uses modern JavaScript syntax.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/15/osjavascript-003-variables-constants-let-const-var-reassignment-scope-temporal-dead-zone/">OSJavaScript.003: Variables and Constants</a>. If you need a refresher on the seven primitive types, review <a href="https://bitcoinversus.tech/2026/10/10/osjavascript-002-values-primitive-types-string-number-boolean-null-undefined-bigint-symbol-typeof/">OSJavaScript.002: Primitive Values</a> or the <a href="https://bitcoinversus.tech/2026/10/08/osjavascript-001-what-is-javascript-where-it-runs-what-it-does-first-console-log/">first JavaScript lesson</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Distinguish numeric addition from string concatenation with <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">+</code>.</li><li>Compare <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">===</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">!==</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">==</code>, and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">Object.is()</code>.</li><li>Explain <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">truthy</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">falsy</code>, and short-circuit evaluation.</li><li>Choose <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">??</code> instead of <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">||</code> when zero or an empty string is valid.</li><li>Read nested properties using <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">?.</code> without hiding other programming mistakes.</li><li>Use parentheses to make operator precedence clear.</li><li>Run and interpret a complete monitoring example with Node.js.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">1. Arithmetic and type coercion</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The common numeric operators are <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">+</code> (addition), <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">-</code> (subtraction), <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">*</code> (multiplication), <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">/</code> (division), <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">%</code> (remainder), and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">**</code> (exponentiation). Most numeric operators convert string operands when appropriate. The <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">+</code> operator has an additional use: if a primitive operand is a string, it concatenates text.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre tabindex="0" aria-label="JavaScript code or program output example" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.1em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.93em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">console.log(10 + 5 * 2);  // 20
console.log((10 + 5) * 2); // 30
console.log("5" + 2);     // "52"
console.log("5" - 2);     // 3
console.log(Number("5") + 2); // 7</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Because <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">+</code> is also string concatenation, input from web forms and APIs must be interpreted deliberately. A text value like <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">"120"</code> should be checked and converted before numeric processing. <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">Number("unknown")</code> produces <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">NaN</code>; validate with <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">Number.isFinite()</code> when building systems that rely on measurement data.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>See the <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators">MDN operators reference</a> for the full operator list and precedence rules.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=GKJh3vdat8A","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=GKJh3vdat8A
</div><figcaption class="wp-element-caption"><em>Web Dev Simplified explains implicit and explicit type coercion, including why automatic conversions can produce unexpected behavior. English-language video.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Strict equality versus loose equality</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">===</code> compares values without converting between different types; <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">!==</code> negates that result. By contrast, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">==</code> may coerce operands before comparing, which can be surprising. Prefer strict equality unless you have a deliberate reason to use loose equality.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre tabindex="0" aria-label="JavaScript code or program output example" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.1em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.93em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">console.log("120" === 120);  // false
console.log("120" == 120);   // true (coercion)
console.log(0 === false);    // false
console.log(0 == false);     // true (coercion)
console.log(null == undefined);  // true
console.log(null === undefined); // false</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Separate object values are compared by reference, not by matching object properties: <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">{x: 1} === {x: 1}</code> is false. <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">Object.is(NaN, NaN)</code> is true even though <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">NaN === NaN</code> is false. For detailed behavior, see <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness">MDN’s equality comparison guide</a>.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=O7aUm0AuUy4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=O7aUm0AuUy4
</div><figcaption class="wp-element-caption"><em>Bro Code demonstrates JavaScript strict and loose equality using concrete values. English-language comparison tutorial.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">3. Truthiness, logical operators, and short-circuiting</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>JavaScript treats <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">false</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">0</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">-0</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">0n</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">""</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">null</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">undefined</code>, and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">NaN</code> as falsy. Other values, including empty arrays and empty objects, are truthy. Logical operators <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">&amp;&amp;</code> and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">||</code> can return operands rather than necessarily producing a Boolean.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre tabindex="0" aria-label="JavaScript code or program output example" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.1em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.93em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">console.log(Boolean([]));  // true
console.log(0 || 5);       // 5
console.log("" || "N/A");  // "N/A"
console.log(0 &amp;&amp; "done");  // 0
console.log(true &amp;&amp; "ok"); // "ok"</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Both <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">&amp;&amp;</code> and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">||</code> short-circuit: if the left operand determines the answer, the right operand is not evaluated. The right side of <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">??</code> is evaluated only if its left operand is <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">null</code> or <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">undefined</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Defaults: || is not the same as ??</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>If <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">0</code> and the empty string are meaningful values, use <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">??</code> for missing-data defaults. <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">||</code> instead substitutes its right side for <em>any</em> falsy value, potentially turning a legitimate zero into the wrong result.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre tabindex="0" aria-label="JavaScript code or program output example" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.1em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.93em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">const count = 0;
console.log(count || 100);  // 100
console.log(count ?? 100);  // 0

const label = "";
console.log(label || "unknown"); // "unknown"
console.log(label ?? "unknown"); // ""</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>The <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing">MDN nullish-coalescing guide</a> explains this distinction. Remember: mixing <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">??</code> directly with <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">||</code> or <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">&amp;&amp;</code> without parentheses causes a syntax error.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Optional chaining: ?. reads safely from missing data</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">?.</code> operator returns <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">undefined</code> rather than throwing a property-access error when the value on its left is <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">null</code> or <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">undefined</code>. It does not make every programming error harmless: calling a non-function through <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">?.()</code> can still fail, and an undeclared root identifier still causes a reference error.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre tabindex="0" aria-label="JavaScript code or program output example" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.1em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.93em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">const device = { sensor: { temp: 72 } };
console.log(device?.sensor?.temp);     // 72
console.log(device?.gps?.latitude);   // undefined
console.log(device?.gps?.latitude ?? "N/A"); // "N/A"</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>When several nested properties are optional, apply the guard at each uncertain step. See <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining">MDN’s optional-chaining documentation</a>.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=v2tJ3nzXh8I","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=v2tJ3nzXh8I
</div><figcaption class="wp-element-caption"><em>Web Dev Simplified demonstrates nullish coalescing beginning around 00:41 and optional chaining around 06:19, alongside other modern JavaScript features.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">6. Practice lab: validate an equipment API reading</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Suppose an API returns voltage as a string, current as a number, and an optional warning threshold. Use explicit numeric conversion, strict equality, and nullish coalescing to process that data. An API is a software interface; see <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-an-api-application-programming-interface/">What Is an API?</a> for background.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Create <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">main.js</code> and paste the complete program. This sample was syntax-checked and executed successfully with <strong>Node.js 22.16.0</strong>. The readings are simulated, not real electrical measurements or safety limits.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre tabindex="0" aria-label="JavaScript code or program output example" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.1em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.93em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">"use strict";
const reading = {
  volts: "120",       // text from a sample API
  amps: 8,
  warningLimit: null,
  sensor: { temperature: 72 },
};

const voltage = Number(reading.volts);
const powerWatts = voltage * reading.amps;
const limit = reading.warningLimit ?? 80;
const temperature = reading.sensor?.temperature ?? "missing";
const withinLimits = powerWatts &lt; 1100 &amp;&amp; temperature &lt; limit;

console.log("power:", powerWatts, "W");
console.log("string plus number:", reading.volts + reading.amps);
console.log("strict match:", reading.volts === 120);
console.log("loose match:", reading.volts == 120);
console.log("warning limit:", limit);
console.log("temperature:", temperature);
console.log("within limits:", withinLimits);
console.log("zero with OR:", 0 || 5);
console.log("zero with nullish:", 0 ?? 5);</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Run <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">node --check main.js</code> first, then <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">node main.js</code>. The output from the tested program is:</p><!-- /wp:paragraph -->

<!-- wp:html --><pre tabindex="0" aria-label="JavaScript code or program output example" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.1em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.93em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">power: 960 W
string plus number: 1208
strict match: false
loose match: true
warning limit: 80
temperature: 72
within limits: true
zero with OR: 5
zero with nullish: 0</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Notice that the power calculation uses the converted numeric voltage, while the deliberately unconverted string is concatenated with 8. This demonstrates why type validation matters when processing <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-json-javascript-object-notation-structured-data/">JSON-style data</a>. The 960-watt result is simply 120 × 8 for a hypothetical example.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">7. Common mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Using loose equality without intent:</strong> <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">"0" == 0</code> returns true. Strict equality is usually easier to reason about.</li><li><strong>Trusting implicit conversion:</strong> <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">"5" + 2</code> concatenates, while <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">"5" - 2</code> converts.</li><li><strong>Replacing a legitimate zero:</strong> <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">value || fallback</code> treats zero as missing. Prefer <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">value ?? fallback</code> if only nullish values should default.</li><li><strong>Ignoring NaN:</strong> invalid numeric input may not throw. Check <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">Number.isFinite()</code>.</li><li><strong>Assuming optional chaining catches all errors:</strong> it only short-circuits nullish property access in the guarded chain.</li><li><strong>Forgetting parentheses:</strong> precedence and mixing <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">??</code> with logical operators need careful grouping.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">8. Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>What does <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">"9" + 1</code> evaluate to, and why?</li><li>What is the result of <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">"9" === 9</code>? What about <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">"9" == 9</code>?</li><li>Why is <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">0 ?? 5</code> different from <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">0 || 5</code>?</li><li>What is the difference between <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">device?.gps?.latitude</code> and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">device.gps.latitude</code> when <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">gps</code> is missing?</li><li>How do you verify that <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">Number("bad")</code> produced a valid finite number?</li><li>Change the lab’s <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">volts</code> to <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">"110"</code>. Predict the new power output.</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answer guide:</strong> (1) <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">"91"</code> because one operand is a string; (2) false, then true; (3) nullish preserves zero but OR replaces any falsy value; (4) the optional chain returns undefined, the unguarded chain throws; (5) <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">Number.isFinite()</code> returns false; (6) 880 W.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Official references and next lesson</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use the <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators">MDN expressions/operators reference</a> and the <a href="https://tc39.es/ecma262/">ECMAScript language specification</a> for exact semantics. For a cross-language comparison, read <a href="https://bitcoinversus.tech/2026/10/14/osgo-003-operators-expressions-arithmetic-comparison-logic-assignment-bitwise/">OSGo.003: Operators and Expressions</a>, but remember Go and JavaScript have different conversion rules. The next JavaScript lesson, OSJavaScript.005, can introduce conditional branches and loops. The complete 43-subject rotation now advances to HTML.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="BitcoinVersus.Tech original Bitcoin donation QR for 5000 satoshis" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open the lesson on a larger screen and scan the QR code with a compatible Bitcoin wallet. Verify the destination address before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->
