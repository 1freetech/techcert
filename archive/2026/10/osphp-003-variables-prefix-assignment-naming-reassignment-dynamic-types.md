---
title: "OSPHP.003: Variables — $ Prefix, Assignment, Naming, Reassignment, and Dynamic Types"
status: published
wordpress_post_id: 23245
wordpress_status: publish
published: "2026-10-10T10:43:10"
modified: "2026-10-10T10:43:10"
live_url: "https://bitcoinversus.tech/2026/10/10/osphp-003-variables-prefix-assignment-naming-reassignment-dynamic-types/"
series: "Open Source PHP"
certification: OSPHP
pathway: php
lesson_number: "003"
lesson_topic: "Variables"
featured_media_id: 23242
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osphp003-variables-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 23243
body_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/php-code-wikimedia-cc0.jpg"
youtube:
  - "https://www.youtube.com/watch?v=FLs6rAVQWs0"
  - "https://www.youtube.com/watch?v=BUCiSSyIGGU"
social:
  - "https://www.reddit.com/r/PHP/comments/1spvhzm/when_your_first_learn_php_what_confuse_the_most/"
seo_title: "OSPHP.003: PHP Variables, Assignment, Naming and Dynamic Types"
seo_description: "Learn PHP variables: the $ prefix, assignment, naming rules, case sensitivity, reassignment, dynamic typing, var_dump(), and practical examples."
seo_schema_type: article
excerpt: "Learn PHP variables: the $ prefix, assignment, naming rules, case sensitivity, reassignment, dynamic typing, var_dump(), and clear beginner-friendly variable habits."
no_text_boxes: true
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>PHP variable names begin with <code>$</code>.</strong> The dollar sign marks the identifier as a variable.</li><li><strong><code>=</code> assigns a value.</strong> The variable name goes on the left and the value or expression goes on the right.</li><li><strong>PHP is dynamically typed.</strong> A variable can hold a string at one moment and a different type later.</li><li><strong>Variable names are case-sensitive.</strong> <code>$name</code> and <code>$Name</code> are different variables.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/2026/10/09/osphp-002-syntax-php-tags-statements-semicolons-comments-html/"><strong>OSPHP.002</strong></a> established the basic grammar of PHP source: PHP tags, statements, semicolons, comments, and output. The next step is learning how a PHP program gives names to values while it runs.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A <strong>variable</strong> is a named place your program can use to refer to a value. That value might be a person's name, a count, a price, a true/false state, an array, an object, or another kind of data. The official <a href="https://www.php.net/manual/en/language.variables.basics.php"><strong>PHP variables documentation</strong></a> defines the basic naming and assignment rules used throughout the language.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=FLs6rAVQWs0","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=FLs6rAVQWs0
</div><figcaption class="wp-element-caption"><em>Dani Krossing focuses specifically on PHP variables and data types, including variable creation, naming, and basic value assignment.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Every Normal PHP Variable Starts With $</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PHP marks ordinary variables with a leading dollar sign. The dollar sign is part of the variable syntax, while the characters after it form the variable name.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;?php
$name = "Amina";
$count = 42;
$active = true;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In those statements, <code>$name</code>, <code>$count</code>, and <code>$active</code> are variables. The values on the right side are assigned to those names.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If the <code>$</code> feels unusual, that is normal for developers coming from languages such as Java, C, Go, or JavaScript. It is simply part of PHP's variable syntax. The PHP community still sees beginners ask about this exact convention, including in a recent <a href="https://www.reddit.com/r/PHP/comments/1spvhzm/when_your_first_learn_php_what_confuse_the_most/"><strong>discussion about learning PHP after Go</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/PHP/comments/1spvhzm/when_your_first_learn_php_what_confuse_the_most/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/PHP/comments/1spvhzm/when_your_first_learn_php_what_confuse_the_most/
</div><figcaption class="wp-element-caption"><em>A recent r/PHP discussion shows how the dollar-sign variable syntax can initially surprise programmers coming from other languages.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Assignment Uses =</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The assignment operator <code>=</code> stores the value produced on its right side in the variable on its left side.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$site = "North Campus";
$miners = 10000;
$online = true;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Read these from right to left conceptually: produce the value, then assign it to the variable name. Assignment is not the same as mathematical equality. Later lessons will introduce comparison operators such as <code>==</code> and <code>===</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Variables Can Be Reassigned</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A variable can receive a new value later in the script.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$temperature = 70;
$temperature = 72;

echo $temperature; // 72</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The second assignment replaces the value referred to by <code>$temperature</code>. This is one reason good variable names matter: the name should still make sense as the stored value changes.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":23243,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/php-code-wikimedia-cc0.jpg?w=1024" alt="Close-up screenshot of PHP source code displayed in a code editor" class="wp-image-23243" /><figcaption class="wp-element-caption"><em>Real PHP source code displayed in an editor. Source: Wikimedia Commons; image released under CC0.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">PHP Variable Names Are Case-Sensitive</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$name = "Amina";
$Name = "Burton";

echo $name; // Amina
echo $Name; // Burton</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Those are two different variables. Treat capitalization consistently so you do not create hard-to-see bugs.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Basic Variable Naming Rules</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>The name begins after the <code>$</code>.</li><li>The first character of the name must be a letter or underscore under the normal beginner-safe naming convention.</li><li>Later characters may contain letters, numbers, or underscores.</li><li>The name cannot begin with a number.</li><li>Variable names are case-sensitive.</li></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$userName = "Amina";   // valid
$_count = 10;           // valid
$miner2 = "S21";       // valid

// $2miners = 10;       // invalid: starts with a digit</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>PHP technically permits a wider range of bytes in variable names than beginners normally need. In practical application code, simple readable names made from letters, numbers, and underscores are far easier to maintain.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Choose Names That Explain the Value</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A variable name should tell the next reader what the value represents. <code>$userName</code>, <code>$purchaseTotal</code>, and <code>$isOnline</code> communicate more than <code>$x</code>, <code>$a</code>, or <code>$thing</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$mwCapacity = 10;
$minerCount = 2500;
$isOnline = true;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>PHP projects do not all use one universal variable naming style. Some prefer <code>camelCase</code>; others use <code>snake_case</code>. Consistency inside a project matters more than switching styles from line to line.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">PHP Is Dynamically Typed</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PHP does not require a variable declaration such as Java's <code>int count</code>. The type belongs to the value at runtime, and a variable may later refer to a value of another type. The official <a href="https://www.php.net/manual/en/language.types.php"><strong>PHP type system documentation</strong></a> describes this dynamic type model.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$value = 42;
$value = "forty-two";
$value = true;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>All three assignments are valid. This differs from the static variable declarations introduced in <a href="https://bitcoinversus.tech/2026/10/10/osjava-002-primitive-types-variables-byte-short-int-long-float-double-boolean-char-literals-local-variables/"><strong>OSJava.002</strong></a>, while it is conceptually closer to the dynamic binding behavior shown in <a href="https://bitcoinversus.tech/2026/10/10/osjavascript-002-values-primitive-types-string-number-boolean-null-undefined-bigint-symbol-typeof/"><strong>OSJavaScript.002</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=BUCiSSyIGGU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=BUCiSSyIGGU
</div><figcaption class="wp-element-caption"><em>Traversy Media's PHP beginner course reaches variables and data types around the 26-minute mark and shows them inside a working PHP environment.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Inspect a Variable With var_dump()</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>While learning, <code>var_dump()</code> is useful because it displays both type and value.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$name = "Amina";
$count = 42;
$active = true;

var_dump($name);
var_dump($count);
var_dump($active);</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This is especially helpful in a dynamically typed language because it lets you confirm what a variable currently contains instead of assuming.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Variables Can Be Printed With echo</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/2026/10/09/osphp-002-syntax-php-tags-statements-semicolons-comments-html/"><strong>OSPHP.002</strong></a> introduced <code>echo</code>. Once a value is stored in a variable, that variable can be sent to output.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$status = "Online";
echo $status;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Inside double-quoted strings, PHP can also interpolate many variable values directly:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$name = "Amina";
echo "Hello, $name";</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Single-quoted strings behave differently, so string syntax deserves its own focused treatment later. For now, recognize that a variable can be used as part of output rather than rewriting the literal value everywhere.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Variable Is Not a Constant</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Variables are designed to hold values that may change. Constants are different: once defined, they represent a fixed name/value binding for the life of the request. Constants do not use the normal leading <code>$</code> variable syntax. This lesson stays with variables; constants will be treated separately.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Small Working Example</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;?php
$siteName = "North Campus";
$minerCount = 2500;
$powerMW = 10.5;
$isOnline = true;

echo $siteName;
echo "\n";
echo $minerCount;
echo "\n";
var_dump($powerMW);
var_dump($isOnline);</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Save this as <code>variables.php</code> and run it using the command-line workflow from <a href="https://bitcoinversus.tech/2026/10/09/osphp-001-php-runtime-cli-php-v-running-scripts-built-in-development-server/"><strong>OSPHP.001: PHP Runtime</strong></a>:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>php variables.php</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If your editor colors variable names, strings, numbers, and keywords differently, that is the same <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>syntax highlighting</strong></a> used across other programming languages.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Forgetting the dollar sign:</strong> <code>name</code> is not the same syntax as <code>$name</code>.</li><li><strong>Starting a variable name with a digit:</strong> <code>$2miners</code> is invalid.</li><li><strong>Changing capitalization accidentally:</strong> <code>$name</code> and <code>$Name</code> are separate variables.</li><li><strong>Confusing assignment with comparison:</strong> <code>=</code> assigns; comparison operators are different.</li><li><strong>Using vague names:</strong> readable names make later debugging much easier.</li><li><strong>Assuming a variable keeps one type forever:</strong> PHP variables can be reassigned to values of different types.</li><li><strong>Expecting a variable reference to print by itself inside PHP code:</strong> use output such as <code>echo $name;</code> when you want to send the value to the response or terminal.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create <code>variables.php</code>.</li><li>Create variables named <code>$name</code>, <code>$age</code>, <code>$temperature</code>, and <code>$isOnline</code>.</li><li>Assign each one a sensible value.</li><li>Print each variable with <code>echo</code> or inspect it with <code>var_dump()</code>.</li><li>Reassign <code>$temperature</code> to a new value and confirm the output changes.</li><li>Create both <code>$name</code> and <code>$Name</code> and prove that PHP treats them separately.</li><li>Assign an integer to <code>$value</code>, then reassign a string to the same variable and inspect both states with <code>var_dump()</code>.</li><li>Rename one vague variable such as <code>$x</code> to something that clearly explains what it stores.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What symbol begins a normal PHP variable?</strong> <code>$</code>.</li><li><strong>What operator assigns a value?</strong> <code>=</code>.</li><li><strong>Are PHP variable names case-sensitive?</strong> Yes.</li><li><strong>Can a PHP variable begin with a number?</strong> No.</li><li><strong>Can a PHP variable hold a number and later hold a string?</strong> Yes. PHP is dynamically typed.</li><li><strong>What does var_dump() help you inspect?</strong> A value's type and value.</li><li><strong>What is the difference between $name and $Name?</strong> They are two different variables.</li><li><strong>Why use descriptive variable names?</strong> They make code easier to understand, maintain, and debug.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>PHP variables start with <code>$</code>, receive values with <code>=</code>, are case-sensitive, and can be reassigned.</strong> Because PHP is dynamically typed, the type comes from the value currently stored rather than from a fixed variable declaration.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next PHP Lesson</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The next PHP lesson will build directly on variables by examining PHP's core data types in more detail.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is a unique 1200×630 anime-style PHP variables cover created specifically for OSPHP.003 and is not reused inside the lesson. The separate body image is real PHP source code from Wikimedia Commons under CC0.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->