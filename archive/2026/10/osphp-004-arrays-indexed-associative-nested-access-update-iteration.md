---
title: "OSPHP.004: Arrays — Indexed Arrays, Associative Arrays, Nested Arrays, Access, Update, and Iteration"
status: published
wordpress_post_id: 25689
wordpress_status: publish
published: "2026-10-15T21:18:43"
modified: "2026-10-15T21:18:43"
live_url: "https://bitcoinversus.tech/2026/10/15/osphp-004-arrays-indexed-associative-nested-access-update-iteration/"
series: "Open Source PHP"
certification: OSPHP
pathway: php
lesson_number: "004"
lesson_topic: "Arrays"
featured_media_id: 25688
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osphp-004-arrays-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
youtube:
  - "https://www.youtube.com/watch?v=D7mqV-p1kEc"
  - "https://www.youtube.com/watch?v=IdB2z5yVVNI"
  - "https://www.youtube.com/watch?v=YZk0BajPkwM"
  - "https://www.youtube.com/watch?v=BUCiSSyIGGU"
seo_title: "OSPHP.004: Arrays — Indexed, Associative, and Nested Arrays"
seo_description: "Learn PHP arrays with indexed and associative keys, nested arrays, access and updates, foreach iteration, count(), append syntax, and practical examples."
excerpt: "Learn PHP arrays: indexed and associative keys, nested arrays, access and updates, foreach iteration, count(), append syntax, and safe beginner patterns."
no_text_boxes: true
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>PHP arrays store multiple values in one variable.</strong></li><li><strong>Keys can be integers or strings.</strong> That lets one PHP array act like a list, a key-value map, or a mixture of both.</li><li><strong>Square brackets <code>[]</code> are the modern array syntax.</strong></li><li><strong><code>foreach</code> is the normal beginner-friendly way to iterate through array values or key/value pairs.</strong></li><li><strong>Arrays can contain other arrays.</strong> Those are nested or multidimensional arrays.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/2026/10/10/osphp-003-variables-prefix-assignment-naming-reassignment-dynamic-types/"><strong>OSPHP.003</strong></a> introduced variables: named references to values that can change while a script runs. Arrays build on that idea by letting one variable hold a collection of related values. PHP’s official <a href="https://www.php.net/manual/en/language.types.array.php"><strong>array documentation</strong></a> describes a PHP array as an ordered map whose keys may be integers or strings. That design is more flexible than the fixed, purely numeric arrays beginners may know from some other languages.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=D7mqV-p1kEc","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=D7mqV-p1kEc
</div><figcaption class="wp-element-caption"><em>Dani Krossing introduces indexed, associative, and multidimensional arrays in modern PHP.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Create an Indexed Array</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;?php
$miners = ["S21", "S19", "A15"];

var_dump($miners);</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><li><code>$miners[0]</code> is <code>"S21"</code>.</li><li><code>$miners[1]</code> is <code>"S19"</code>.</li><li><code>$miners[2]</code> is <code>"A15"</code>.</li><li>If you omit explicit keys, PHP generates integer keys starting at <code>0</code>.</li></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code>echo $miners[0]; // S21
$miners[1] = "S19 XP";
$miners[] = "M60";</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Associative Arrays Use Named Keys</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An associative array uses meaningful string keys instead of relying only on numeric positions. The <code>=&gt;</code> operator connects each key to its value. This is useful when the key itself explains what the data represents, such as <code>"model"</code>, <code>"hashrate"</code>, or <code>"online"</code>. Access works with the key in square brackets, and assigning to an existing key replaces that value. PHP does not treat indexed and associative arrays as two unrelated data types; both are the same underlying array type.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IdB2z5yVVNI","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=IdB2z5yVVNI
</div><figcaption class="wp-element-caption"><em>Dani Krossing demonstrates associative arrays and named key/value access in PHP.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$miner = [
    "model" =&gt; "S21",
    "hashrate" =&gt; 200,
    "online" =&gt; true,
];

echo $miner["model"];
$miner["hashrate"] = 205;
$miner["efficiency"] = 17.5;</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Nested Arrays Store Structured Data</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An array element can itself be another array. That makes nested arrays useful for rows of records, configuration data, API responses, shopping carts, inventory lists, and other structured information. To reach a nested value, add another pair of square brackets for each level. A beginner should read the expression from left to right: choose the outer record first, then the key inside that record.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=YZk0BajPkwM","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=YZk0BajPkwM
</div><figcaption class="wp-element-caption"><em>Dani Krossing explains multidimensional arrays—arrays stored inside other arrays.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$fleet = [
    ["model" =&gt; "S21", "hashrate" =&gt; 200],
    ["model" =&gt; "S19 XP", "hashrate" =&gt; 140],
    ["model" =&gt; "M60", "hashrate" =&gt; 172],
];

echo $fleet[1]["model"]; // S19 XP</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Iterate With foreach</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <a href="https://www.php.net/manual/en/control-structures.foreach.php"><strong>PHP <code>foreach</code> documentation</strong></a> defines two common forms: one gives you each value, and the other gives you both the key and value. This is usually clearer than manually managing an index when you simply need to visit every array element. PHP also supports iterating through nested arrays by placing one loop inside another or by destructuring the inner records.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=BUCiSSyIGGU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=BUCiSSyIGGU
</div><figcaption class="wp-element-caption"><em>Traversy Media’s PHP beginner course covers arrays, array functions, loops, and <code>foreach</code> in a working PHP environment.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$models = ["S21", "S19 XP", "M60"];

foreach ($models as $model) {
    echo $model . "\n";
}</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$miner = [
    "model" =&gt; "S21",
    "hashrate" =&gt; 200,
    "online" =&gt; true,
];

foreach ($miner as $key =&gt; $value) {
    echo $key . ": ";
    var_dump($value);
}</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Useful Beginner Operations</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Read:</strong> <code>$array[$key]</code></li><li><strong>Update:</strong> <code>$array[$key] = $newValue;</code></li><li><strong>Append:</strong> <code>$array[] = $newValue;</code></li><li><strong>Count:</strong> <code>count($array)</code></li><li><strong>Remove:</strong> <code>unset($array[$key]);</code></li><li><strong>Check a key:</strong> <code>array_key_exists($key, $array)</code></li><li><strong>Check a value:</strong> <code>in_array($value, $array, true)</code></li></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$models = ["S21", "S19 XP"];
$models[] = "M60";

echo count($models); // 3

unset($models[1]);</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Integer Keys Do Not Automatically Renumber</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$models = ["S21", "S19 XP", "M60"];
unset($models[1]);

var_dump($models);</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Key <code>0</code> still exists.</li><li>Key <code>1</code> has been removed.</li><li>Key <code>2</code> still exists.</li><li>Use <code>array_values($models)</code> if you specifically want new sequential integer keys.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mixed Keys Are Legal</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$data = [
    0 =&gt; "first",
    "status" =&gt; "online",
    7 =&gt; "seventh-key",
];</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><li>PHP arrays may contain integer and string keys at the same time.</li><li>This flexibility is powerful, but predictable structures are usually easier to read and maintain.</li><li>For record-like data, consistently named string keys are normally clearer.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Assuming the first numeric index is 1:</strong> automatically generated integer keys normally begin at <code>0</code>.</li><li><strong>Using an undefined key:</strong> read only keys you know exist, or check first.</li><li><strong>Mixing up <code>=</code> and <code>=&gt;</code>:</strong> <code>=</code> assigns a variable or array element; <code>=&gt;</code> associates a key with a value inside array syntax and some iteration syntax.</li><li><strong>Expecting <code>unset()</code> to renumber keys:</strong> it removes the chosen element but preserves the other keys.</li><li><strong>Building deeply nested arrays without clear names:</strong> use readable keys and consistent structure.</li><li><strong>Changing an array while iterating by reference without understanding references:</strong> leave reference-based iteration for a later lesson.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create <code>arrays.php</code>.</li><li>Create an indexed array with four technology names.</li><li>Print the first and third elements.</li><li>Replace the second element.</li><li>Append a fifth element with <code>[]</code>.</li><li>Create an associative array representing one server with <code>hostname</code>, <code>ip</code>, and <code>online</code> keys.</li><li>Update the IP address.</li><li>Use <code>foreach</code> to print every key and value.</li><li>Create an array containing three server arrays and print the hostname of the second server.</li><li>Remove one indexed element and inspect the remaining integer keys with <code>var_dump()</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What can a PHP array key be?</strong> An integer or string.</li><li><strong>What key does the first automatically indexed value normally receive?</strong> <code>0</code>.</li><li><strong>What operator connects a key to a value in array syntax?</strong> <code>=&gt;</code>.</li><li><strong>How do you append a value using modern array syntax?</strong> <code>$array[] = $value;</code>.</li><li><strong>How do you get the number of elements?</strong> <code>count($array)</code>.</li><li><strong>What loop is designed to traverse array values and key/value pairs?</strong> <code>foreach</code>.</li><li><strong>What is a nested array?</strong> An array stored as a value inside another array.</li><li><strong>Does unset() automatically renumber numeric keys?</strong> No.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Previous PHP Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/10/osphp-003-variables-prefix-assignment-naming-reassignment-dynamic-types/"><strong>OSPHP.003: Variables</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/09/osphp-002-syntax-php-tags-statements-semicolons-comments-html/"><strong>OSPHP.002: Syntax</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/09/osphp-001-php-runtime-cli-php-v-running-scripts-built-in-development-server/"><strong>OSPHP.001: PHP Runtime</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next PHP Lesson</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>OSPHP.005: Control Flow</strong> — <code>if</code>, <code>elseif</code>, <code>else</code>, comparisons, and choosing which code path runs.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><em><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech content is provided for informational and educational purposes.</em></p>
<!-- /wp:paragraph -->