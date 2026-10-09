---
title: "OSPHP.002: Syntax — PHP Tags, Statements, Semicolons, Comments, and Mixing PHP With HTML"
status: published
wordpress_post_id: 22794
published: "2026-10-09T18:19:19"
modified: "2026-10-09T18:19:19"
live_url: "https://bitcoinversus.tech/2026/10/09/osphp-002-syntax-php-tags-statements-semicolons-comments-html/"
series: "Open Source PHP"
subject: php
lesson_number: "002"
featured_media_id: 22789
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osphp-002-syntax-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22790
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osphp-002-syntax-body.jpg"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=U10yvfIStx8"
youtube_2: "https://www.youtube.com/watch?v=2eebptXfEvw"
youtube_3: "https://www.youtube.com/watch?v=7TC0K7aRmFs"
social_1: "https://www.reddit.com/r/PHP/comments/10gdxzv/"
seo_title: "OSPHP.002: Syntax — PHP Tags, Statements, Semicolons & Comments"
seo_description: "Learn PHP syntax fundamentals: PHP tags, statements, semicolons, echo, comments, whitespace, case sensitivity, short echo syntax, mixing PHP with HTML, and parse errors."
no_text_boxes: true
code_blocks: 0
image_style: "realistic color-pencil cover; photorealistic body; no words; no diagrams"
youtube_minimum_met: 3
archive_format: "final Gutenberg source"
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>PHP syntax is the set of rules that tells the PHP runtime how source code is written and where PHP code begins and ends.</strong> In this lesson, the goal is not to learn variables, arrays, loops, or functions yet. The goal is to become comfortable reading and writing the basic shape of PHP code so later lessons have a clean foundation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/09/osphp-001-php-runtime-cli-php-v-running-scripts-built-in-development-server/"><strong>OSPHP.001: PHP Runtime</strong></a>. That lesson proved the runtime works. OSPHP.002 now focuses on the grammar of the source itself: PHP tags, statements, semicolons, comments, whitespace, case sensitivity, short echo syntax, and the way PHP can enter and leave HTML mode inside one file.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>How <code>&lt;?php</code> starts a PHP code section.</li><li>When <code>?&gt;</code> is useful and when it is commonly omitted.</li><li>How statements are separated with semicolons.</li><li>How <code>echo</code> produces output.</li><li>How single-line and multi-line comments work.</li><li>Why whitespace usually improves readability without changing program meaning.</li><li>What PHP treats as case-sensitive and what it does not.</li><li>How <code>&lt;?=</code> provides a short form for output.</li><li>How PHP and HTML can coexist in one document.</li><li>How to recognize basic parse and syntax errors.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">PHP Code Begins With A PHP Tag</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The standard opening tag is <code>&lt;?php</code>. A simple file can begin with <code>&lt;?php</code>, followed by PHP statements. The official PHP manual recommends the normal <code>&lt;?php ... ?&gt;</code> form for maximum compatibility and also documents <code>&lt;?=</code> as the short echo form.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A first example can be written as <code>&lt;?php echo "Hello from PHP";</code>. In a PHP-only file, many projects intentionally omit the final <code>?&gt;</code> closing tag. The PHP manual notes that this helps prevent accidental whitespace or new lines from being sent after the closing tag.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=U10yvfIStx8","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=U10yvfIStx8
</div><figcaption class="wp-element-caption"><em>Dani Krossing — a focused beginner lesson on basic PHP syntax and the habits that help prevent common syntax errors.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22790,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osphp-002-syntax-body.jpg" alt="Two developers collaborating at laptops in a modern server workspace." class="wp-image-22790" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech lesson image for OSPHP.002.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Statements Usually End With Semicolons</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PHP programs are built from statements. The PHP manual describes a statement as something such as an assignment, function call, loop, conditional, or another executable instruction. In ordinary PHP syntax, statements are usually terminated with a semicolon.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For example: <code>echo "First line";</code> and <code>echo "Second line";</code> are two separate statements. The semicolon tells the parser where one instruction ends before the next instruction begins.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A missing semicolon is one of the easiest beginner errors to create. The parser may report the problem on the next line rather than exactly where the missing character belongs, so always inspect the statement immediately before the reported location as well.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Use echo To Produce Output</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>echo</code> is a PHP language construct used to send output. A simple statement such as <code>echo "Hello";</code> produces the text <code>Hello</code>. In a command-line program, that output appears in the terminal. In a web request, that output becomes part of the response returned to the client.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This connects syntax back to the runtime from OSPHP.001: syntax tells PHP how the statement is written, while the runtime actually executes it.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=2eebptXfEvw","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=2eebptXfEvw
</div><figcaption class="wp-element-caption"><em>Traversy Media — “PHP For Absolute Beginners.” The course reaches PHP syntax near the beginning and demonstrates how basic statements and output fit into a working PHP environment.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">PHP Can Enter And Leave HTML Mode</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>One of PHP's defining features is that PHP code can be embedded directly inside an HTML document. The PHP parser processes code inside PHP tags and treats content outside those tags as normal output. That means one file can contain both the document structure taught in <a href="https://bitcoinversus.tech/2026/10/09/oshtml-001-document-structure-doctype-html-head-body-metadata-first-page/"><strong>OSHTML.001: Document Structure</strong></a> and dynamic PHP output.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A simple mixed example can look like this in normal reading order: <code>&lt;h1&gt;Status&lt;/h1&gt;</code>, then <code>&lt;?php echo "Online"; ?&gt;</code>, then more HTML. The browser ultimately receives output; the PHP tags themselves are interpreted on the server side rather than being ordinary page markup.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This ability to move between HTML and PHP is powerful, but it also means you must pay attention to where PHP mode begins and ends. A misplaced opening or closing tag can make source appear as plain output or can trigger a parser error.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/PHP/comments/10gdxzv/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/PHP/comments/10gdxzv/
</div><figcaption class="wp-element-caption"><em>r/PHP discussion: developers compare the short echo form <code>&lt;?= ... ?&gt;</code> with normal PHP tags when mixing output and templates.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Short Echo Tag</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PHP provides <code>&lt;?=</code> as shorthand for <code>&lt;?php echo</code>. For example, <code>&lt;?= "Hello" ?&gt;</code> is a compact way to output a value while moving through a template.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not confuse <code>&lt;?=</code> with the older configurable short opening form <code>&lt;?</code>. The official PHP manual treats the short echo tag separately and recommends the normal <code>&lt;?php</code> form for ordinary PHP code.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Comments Explain Code Without Executing</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Comments let developers leave notes that PHP ignores during normal execution. PHP supports several comment styles. A line can begin with <code>//</code> or <code>#</code>, while a block comment begins with <code>/*</code> and ends with <code>*/</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Examples include <code>// explain this line</code>, <code># another one-line comment</code>, and <code>/* a longer explanation */</code>. Good comments explain intent, assumptions, or unusual behavior. A comment that merely repeats an obvious statement usually adds noise instead of clarity.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The PHP manual also warns that C-style block comments should not be nested. If you open one <code>/* ... */</code> comment inside another, the first closing marker can terminate the outer comment earlier than you intended.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=7TC0K7aRmFs","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=7TC0K7aRmFs
</div><figcaption class="wp-element-caption"><em>Giraffe Academy — “Hello World &amp; Setup | PHP | Tutorial 4.” A beginner walkthrough of the first working PHP source and the basic syntax used to produce output.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Whitespace Makes Source Easier To Read</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Spaces, blank lines, and indentation usually help humans read PHP without changing the meaning of ordinary statements. For example, <code>echo "Hello";</code> can sit on its own line, and related statements can be grouped with blank lines around them.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Formatting becomes more important as code grows. A consistent indentation style helps you see where blocks begin and end. The earlier explainer on <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>syntax highlighting</strong></a> covers another editor feature that makes language structure easier to scan.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Case Sensitivity Has Rules</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PHP is not uniformly case-sensitive in every part of the language. Variable names are case-sensitive, so later in the curriculum <code>$name</code> and <code>$Name</code> will be different variables. Language keywords and many built-in constructs do not depend on capitalization in the same way.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Even where the language technically accepts multiple capitalizations, consistent lowercase keywords and conventional formatting make code easier to read and easier for teams to review.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">PHP-Only Files Commonly Omit The Closing Tag</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If a file contains only PHP code, it is common to begin with <code>&lt;?php</code> and omit the final <code>?&gt;</code>. The official manual explicitly notes this pattern because it avoids accidental trailing whitespace or new lines being sent after PHP finishes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>When PHP is intentionally mixed with HTML, closing a PHP section is useful because it allows normal HTML to resume. The decision therefore depends on the kind of file you are writing.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read Parse Errors Methodically</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Read the first parser error.</strong> Later errors may be consequences of the first one.</li><li><strong>Inspect the line before the reported line.</strong> A missing semicolon or quote can make the parser complain after the real mistake.</li><li><strong>Check PHP tags.</strong> Make sure PHP mode begins where you expect.</li><li><strong>Check quotes.</strong> An unmatched quote can turn the rest of the file into an invalid string.</li><li><strong>Check delimiters.</strong> Parentheses, braces, and brackets need matching partners.</li><li><strong>Change one thing at a time.</strong> Re-run the file after each correction.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a file named <code>syntax.php</code>.</li><li>Start it with <code>&lt;?php</code>.</li><li>Add the statement <code>echo "PHP syntax lab\n";</code>.</li><li>Run it with <code>php syntax.php</code>.</li><li>Add one <code>//</code> comment and one <code>/* ... */</code> comment.</li><li>Remove one semicolon, run the file, and read the parse error.</li><li>Restore the semicolon.</li><li>Create a second file that contains simple HTML plus one PHP output section.</li><li>Replace <code>&lt;?php echo</code> in one simple output location with <code>&lt;?=</code> and compare the result.</li><li>For a PHP-only file, remove the final closing tag and verify the script still runs.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What starts a normal PHP code section?</strong> <code>&lt;?php</code>.</li><li><strong>What usually ends a PHP statement?</strong> A semicolon.</li><li><strong>What does <code>echo</code> do?</strong> It produces output.</li><li><strong>Name two one-line comment styles.</strong> <code>//</code> and <code>#</code>.</li><li><strong>How do block comments begin and end?</strong> They begin with <code>/*</code> and end with <code>*/</code>.</li><li><strong>What does <code>&lt;?=</code> mean?</strong> It is shorthand for PHP output using <code>echo</code>.</li><li><strong>Can PHP and HTML exist in the same file?</strong> Yes. PHP processes code inside PHP tags while content outside those tags passes through as normal output.</li><li><strong>Why is the closing tag often omitted in PHP-only files?</strong> To reduce the chance of accidental trailing output such as whitespace or new lines.</li><li><strong>Are PHP variable names case-sensitive?</strong> Yes.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.php.net/manual/en/language.basic-syntax.php"><strong>PHP Manual — Basic Syntax</strong></a></li><li><a href="https://www.php.net/manual/en/language.basic-syntax.phptags.php"><strong>PHP Manual — PHP Tags</strong></a></li><li><a href="https://www.php.net/manual/en/language.basic-syntax.instruction-separation.php"><strong>PHP Manual — Instruction Separation</strong></a></li><li><a href="https://www.php.net/manual/en/language.basic-syntax.comments.php"><strong>PHP Manual — Comments</strong></a></li><li><a href="https://www.php.net/manual/en/language.basic-syntax.phpmode.php"><strong>PHP Manual — Escaping From HTML</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>PHP syntax tells the runtime how to read your source.</strong> Start PHP code with <code>&lt;?php</code>, separate ordinary statements with semicolons, use comments to explain intent, use <code>&lt;?=</code> for concise output where appropriate, and remember that PHP can enter and leave HTML mode inside one file. When the parser reports an error, inspect tags, quotes, delimiters, and the previous statement before making unrelated changes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The next PHP curriculum lesson is <strong>OSPHP.003: Variables</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is original artwork created specifically for OSPHP.002 and is not reused in the body. The lesson uses a separate original body image and responsive native Gutenberg media embeds.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->