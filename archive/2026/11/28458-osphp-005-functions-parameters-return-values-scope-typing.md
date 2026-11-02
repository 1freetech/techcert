---
lesson_id: "OSPHP.005"
track: "Open Source PHP Programming"
level: "Super-Fundamentals"
wordpress_post_id: 28458
title: "OSPHP.005: PHP Functions — Parameters, Return Values, Scope, and Type Declarations"
permalink: "https://bitcoinversus.tech/2026/11/01/osphp-005-functions-parameters-return-values-scope-type-declarations/"
published_date: "2026-11-01"
wordpress_categories: [2509703, 44329, 5812, 6]
featured_media_id: 28452
featured_dimensions: "1200x630"
featured_style: "photo/anime technical blend"
featured_subject: "No-human PHP server-side function diagram with parameters, localized scope and typed return values; no text overlay"
in_story_media_count: 3
in_story_media:
  - "YouTube jiTI33oeKzU — Dani Krossing: User-Defined Functions in PHP (2023)"
  - "YouTube zZ6vybT1HQs — Bro Code: PHP Full Course; functions chapter at 2:27:40 (2023)"
  - "YouTube 0Q9Gt7D5h7g — Dr. Moonther: PHP Functions Explained: Parameters, Return, Variadics and Strict Types"
conceptual_in_body_images_count: 0
video_embed_qa: "Three distinct iframe players in WordPress published rendered HTML, and each has a caption directly following. Independent reader-device playback not tested."
code_examples_count: 9
code_layout: "Transparent borderless Gutenberg core/html pre/code, no decorative boxes"
code_validation: "Complete typed data-center functions script passed php -l syntax and produced expected 4-line output with PHP CLI 8.4.24; smaller snippets structurally reviewed."
internal_links_count: 7
primary_sources: ["https://www.php.net/manual/en/functions.user-defined.php", "https://www.php.net/manual/en/functions.arguments.php", "https://www.php.net/manual/en/functions.returning-values.php", "https://www.php.net/manual/en/language.types.declarations.php", "https://www.php.net/manual/en/language.variables.scope.php"]
footer_status: "Approved italicized Editor Note, original QR #24043, 5000 sat address, and disclaimer present; retired X promo absent"
qa_status: "Published WordPress edit/view readback verifies 3 real rendered YouTube iframes, immediate captions, 9 plain code blocks, 7 internal links, no conceptual in-body images or decorative text boxes, 1200x630 featured cover and original footer. Independent reader-device playback and mobile/desktop screenshots unavailable; full cover anatomy not an issue (no humans), cover pixel-level QA unperformed."
next_main_subject: "solidity"
---

<!-- wp:paragraph --><p>A <strong>PHP function</strong> is a named, reusable block of instructions that runs when called. It accepts zero or more inputs called <strong>arguments</strong>, processes them through corresponding <strong>parameters</strong>, and may send a value back with <code>return</code>. Functions make server-side PHP programs easier to read, test and maintain. In this lesson, we build small typed functions that validate data and compute hypothetical data-center measurements without mixing the calculation with the user interface.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>OSPHP.005 follows <a href="https://bitcoinversus.tech/2026/10/15/osphp-004-arrays-indexed-associative-nested-access-update-iteration/">OSPHP.004: Arrays</a>, <a href="https://bitcoinversus.tech/2026/10/10/osphp-003-variables-prefix-assignment-naming-reassignment-dynamic-types/">OSPHP.003: Variables</a> and <a href="https://bitcoinversus.tech/2026/10/09/osphp-002-syntax-php-tags-statements-semicolons-comments-html/">OSPHP.002: Syntax</a>. A function can consume one value, an array or multiple arguments; you should understand those foundations before adding parameters and type declarations.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Declare and call a user-defined PHP function.</li><li>Distinguish a parameter in a declaration from an argument supplied at the call site.</li><li>Use defaults, named arguments, variadic parameters and return values.</li><li>Explain parameter and return type declarations and the caller-side meaning of <code>strict_types</code>.</li><li>Recognize local function scope and explicit pass-by-reference mutation.</li><li>Run and test a practical program on a recent PHP 8 runtime.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Creating and calling a function</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>PHP declares a regular user-defined function using <code>function</code>, followed by its name, parentheses and a body inside braces. Defining a function does not run its instructions immediately; calling its name with parentheses invokes it. Functions can be organized into small units that each do one job, such as formatting a numeric value or checking whether an input is acceptable. The official <a href="https://www.php.net/manual/en/functions.user-defined.php">PHP user-defined functions</a> guide describes the syntax.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="PHP code or program output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">&lt;?php
function greet(): string {
    return "Hello from PHP!";
}

echo greet() . PHP_EOL;
// Hello from PHP!</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>The <code>: string</code> after the parentheses is a <strong>return type declaration</strong>. The word <code>return</code> ends the function execution and supplies a result to the caller. When no <code>return</code> value is provided, an ordinary function returns <code>null</code> unless it terminates abnormally. <code>echo</code> writes output; it is not the same as returning a value.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Parameters, arguments and defaults</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <strong>parameter</strong> is a named variable in a function signature. An <strong>argument</strong> is the value or expression provided by a caller. PHP normally passes argument values by value; changing an ordinary parameter variable in the function does not directly rewrite the caller's variable. Argument expressions are evaluated before the function body runs. See <a href="https://www.php.net/manual/en/functions.arguments.php">PHP: Function parameters and arguments</a>.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="PHP code or program output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">&lt;?php
declare(strict_types=1);

function multiply(int $a, int $b = 2): int {
    return $a * $b;
}

echo multiply(6) . PHP_EOL;       // 12: default b = 2
echo multiply(6, 4) . PHP_EOL;    // 24: explicit b = 4
echo multiply(b: 5, a: 3) . PHP_EOL; // 15: named arguments</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>The default <code>$b = 2</code> makes the second argument optional. PHP 8 introduced named arguments such as <code>multiply(b: 5, a: 3)</code>; the names must match the declared parameter names. Prefer required parameters before optional parameters and avoid relying on defaults that silently change critical application behavior. Renaming public parameter names can break callers using named arguments.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video demonstration: build reusable PHP functions</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Dani Krossing demonstrates user-defined functions in PHP rather than merely listing syntax. Watch for the difference between a function definition and the moment the caller invokes it, then pause to rewrite an example with typed parameters and an explicit return value.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=jiTI33oeKzU]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=jiTI33oeKzU">Dani Krossing — User-Defined Functions in PHP</a> (April 2023). English tutorial on declaring and calling functions; published examples should still be checked against the current PHP manual.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Return values and typed contracts</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A function can return a scalar, array, object or other supported PHP value. A return type declaration such as <code>: float</code> documents and enforces the expected result. <code>?float</code> permits either a float or <code>null</code>, which is useful when a calculation cannot safely produce a value. If a caller provides an incompatible argument, or a function returns an incompatible type, PHP may raise a <code>TypeError</code>. The details depend on type coercion and strictness settings.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="PHP code or program output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">&lt;?php
declare(strict_types=1);

function utilization(float $usedMw, float $availableMw): ?float {
    if ($availableMw &lt;= 0) {
        return null; // No valid denominator.
    }
    return ($usedMw / $availableMw) * 100;
}

var_dump(utilization(80.0, 100.0)); // float(80)
var_dump(utilization(80.0, 0.0));   // NULL</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>The calculation assumes both inputs refer to the same electrical-capacity basis. It is illustrative only and is <strong>not</strong> proof that a site has 80 MW of operational IT equipment. For a technical comparison of utility service and projected IT capacity, see our <a href="https://bitcoinversus.tech/2026/11/01/z-squared-arkansas-data-center-8mw-150mw-site-engineering-2026/">Arkansas data-center capacity report</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Strict typing and what it actually changes</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Add <code>declare(strict_types=1);</code> near the beginning of a PHP source file to require strict scalar argument typing for calls made <em>from that file</em>. The strictness used at a call site is determined by the calling file, not necessarily the file where the target function was declared. For strict return-type checking, the relevant declaration is governed by the file defining the function. An integer is permitted for a <code>float</code> parameter in the usual widening case. The official <a href="https://www.php.net/manual/en/language.types.declarations.php">PHP type declarations</a> manual describes the exact constraints and exceptions.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="PHP code or program output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">&lt;?php
declare(strict_types=1);

function addTwo(int $value): int {
    return $value + 2;
}

echo addTwo(4); // 6
// addTwo("4"); // TypeError in this strict calling file.</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>Strict types are not automatic business-data validation. An integer can still be negative or outside an acceptable operational range. Check units, ranges, missing readings and domain rules explicitly. Likewise, even a function that returns a correctly typed string can contain inaccurate or unsafe content.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Scope: what stays inside a function</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A variable declared within a function is local to that function unless a special mechanism is used. An outer variable is not implicitly imported into normal function scope. The <code>global</code> keyword can make global variables available, but unnecessary global state makes a function harder to test. Passing needed values as parameters and returning a result is usually clearer. See <a href="https://www.php.net/manual/en/language.variables.scope.php">PHP variable scope</a>.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="PHP code or program output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">&lt;?php
$unit = 'TH/s';

function formatRate(float $value, string $unit): string {
    $formatted = number_format($value, 1);
    return $formatted . ' ' . $unit;
}

echo formatRate(200.0, $unit) . PHP_EOL;
// formatted exists only within the function.</code></pre>
<!-- /wp:html -->

<!-- wp:heading --><h2 class="wp-block-heading">Video demonstration: functions in a complete PHP course</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Bro Code's PHP course has a dedicated functions chapter beginning at approximately <strong>2:27:40</strong>, after arrays, radio controls and checkboxes. It demonstrates actual PHP output and is a distinct second source for learning how to move repeated logic into functions. Use the chapter marker rather than starting at the beginning of its four-hour course.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=zZ6vybT1HQs]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=zZ6vybT1HQs">Bro Code — PHP Full Course for Free</a> (March 2023); functions chapter begins at 2:27:40. English demonstrations include practical function calls and reusable code.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Pass by reference, variadic arguments and safe defaults</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>PHP passes function arguments by value by default. You can allow a function to change a caller's variable by putting <code>&amp;</code> before the parameter name. This is an explicit <strong>pass-by-reference</strong> operation, not a normal function parameter behavior. Reserve it for cases where updating the caller's variable is part of the documented contract.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="PHP code or program output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">&lt;?php
declare(strict_types=1);

function increment(int &amp;$counter): void {
    ++$counter;
}

$checks = 2;
increment($checks);
echo $checks; // 3</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>A <strong>variadic</strong> parameter using <code>...</code> accepts multiple arguments as an array. It is useful for functions that naturally operate on a variable set of values, but callers should still validate the expected count and size of inputs. PHP also supports unpacking an array of arguments into a call. These features are documented in <a href="https://www.php.net/manual/en/functions.arguments.php">the official arguments reference</a>.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="PHP code or program output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">&lt;?php
declare(strict_types=1);

function sumLoads(float ...$mw): float {
    return array_sum($mw);
}

echo sumLoads(1.5, 2.0, 2.5) . PHP_EOL; // 6
echo sumLoads(...[1.0, 2.0]) . PHP_EOL; // 3</code></pre>
<!-- /wp:html -->

<!-- wp:heading --><h2 class="wp-block-heading">Video demonstration: parameters, return types and references</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A third English tutorial by Dr. Moonther covers function parameters, explicit return types, reference arguments, variadic parameters and strict mode together. It is relevant to the advanced examples in this beginner lesson; use it to reinforce the distinction between data copied into an ordinary parameter and deliberately changed through a reference.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=0Q9Gt7D5h7g]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=0Q9Gt7D5h7g">Dr. Moonther — PHP Functions Explained</a>. Focuses on parameters, return values, passing by reference, variadic functions and strict typing.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Complete worked example: process hypothetical infrastructure readings</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The following complete PHP script combines typed arguments, defaults, array iteration, nullable returns and variadic arguments. The measurements are fictional and provided solely to exercise the language; 200 TH/s, 80 MW and other numbers are not actual current site statistics. The <code>countValid()</code> function rejects negative and non-integer sample values by design. This is a software demonstration, not a telemetry safety controller.</p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="PHP code or program output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">&lt;?php
declare(strict_types=1);

function formatRate(float $hashrate, string $unit = 'TH/s'): string {
    return number_format($hashrate, 1) . ' ' . $unit;
}

function utilization(float $usedMw, float $capacityMw): ?float {
    if ($capacityMw &lt;= 0) {
        return null;
    }
    return ($usedMw / $capacityMw) * 100;
}

function countValid(array $readings): int {
    $total = 0;
    foreach ($readings as $reading) {
        if (is_int($reading) &amp;&amp; $reading &gt;= 0) {
            ++$total;
        }
    }
    return $total;
}

function addLoad(float ...$loads): float {
    return array_sum($loads);
}

echo 'Rate: ' . formatRate(200.0) . PHP_EOL;
echo 'Utilization: ' . number_format(utilization(80.0, 100.0) ?? 0.0, 1) . '%' . PHP_EOL;
echo 'Valid readings: ' . countValid([42, -1, 47, 60]) . PHP_EOL;
echo 'Total load: ' . number_format(addLoad(2.5, 3.0, 1.5), 1) . ' MW' . PHP_EOL;</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p><strong>Expected command-line output:</strong></p><!-- /wp:paragraph -->

<!-- wp:html -->
<pre aria-label="PHP code or program output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;color:inherit">Rate: 200.0 TH/s
Utilization: 80.0%
Valid readings: 3
Total load: 7.0 MW</code></pre>
<!-- /wp:html -->

<!-- wp:paragraph --><p>Save the script as <code>functions.php</code> and run <code>php -l functions.php</code> to check syntax, followed by <code>php functions.php</code> to execute it. This example was run against <strong>PHP 8.4.24</strong> with no syntax errors and produced the four output lines shown. To review the command-line environment first, revisit <a href="https://bitcoinversus.tech/2026/10/09/osphp-001-php-runtime-cli-php-v-running-scripts-built-in-development-server/">OSPHP.001: CLI and Runtime</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common mistakes and how to avoid them</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Confusing <code>echo</code> with <code>return</code>: an echo outputs bytes; a return hands a value back to the caller.</li><li>Calling a required parameter without an argument: PHP can throw <code>ArgumentCountError</code>.</li><li>Relying on implicit conversion where a typed contract is expected: decide whether the caller should use strict types and validate business values separately.</li><li>Placing optional parameters before required parameters: avoid confusing or deprecated parameter arrangements.</li><li>Assuming a local function variable changes a global: pass and return values explicitly.</li><li>Using <code>&amp;</code> without understanding its side effects: prefer ordinary parameters unless mutation of the caller's variable is intended.</li><li>Returning an empty string instead of an explicit error or nullable type: design the contract to distinguish missing data from real values.</li><li>Ignoring denominator validation: the <code>utilization()</code> example checks zero or negative capacity before dividing.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>What is the difference between a function's parameter and its caller's argument?</li><li>Why is <code>return $value</code> different from <code>echo $value</code>?</li><li>How does <code>strict_types=1</code> affect an incompatible scalar argument?</li><li>What does <code>?float</code> allow that <code>float</code> alone does not?</li><li>What happens to <code>$checks</code> when passed to <code>increment(int &amp;$counter)</code>?</li><li>Why is a PHP function with only local variables easier to test than one that silently reads global state?</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answers:</strong> Parameters are names declared by a function; arguments are supplied expressions. <code>return</code> gives the caller a result, while <code>echo</code> writes output. In strict scalar calls incompatible values raise a type error, with documented exceptions. <code>?float</code> permits a float or null. A by-reference parameter can update its caller's variable. Explicit dependencies let tests supply inputs and inspect results without relying on hidden global state.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">References and related curriculum</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Primary references: <a href="https://www.php.net/manual/en/functions.user-defined.php">PHP user-defined functions</a>, <a href="https://www.php.net/manual/en/functions.arguments.php">parameters and arguments</a>, <a href="https://www.php.net/manual/en/functions.returning-values.php">returning values</a>, <a href="https://www.php.net/manual/en/language.types.declarations.php">type declarations</a> and <a href="https://www.php.net/manual/en/language.variables.scope.php">scope</a>. Related lessons include <a href="https://bitcoinversus.tech/2026/10/15/osphp-004-arrays-indexed-associative-nested-access-update-iteration/">PHP arrays</a> and <a href="https://bitcoinversus.tech/2026/11/01/oshtml-004-html-forms-labels-inputs-fieldsets-submission-validation/">HTML forms</a>, which can supply future PHP backend inputs once proper validation and security are introduced.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="BitcoinVersus.Tech original donation QR code for 5,000 sats" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open this lesson on a laptop or larger screen and scan the original QR image using a compatible Bitcoin wallet. Verify the receiving address before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->