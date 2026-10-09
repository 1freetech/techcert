---
title: "OSPHP.001: PHP Runtime — CLI, php -v, Running Scripts, and the Built-In Development Server"
status: published
wordpress_post_id: 22748
published: "2026-10-09T15:39:38"
modified: "2026-10-09T15:39:38"
live_url: "https://bitcoinversus.tech/2026/10/09/osphp-001-php-runtime-cli-php-v-running-scripts-built-in-development-server/"
series: "Open Source PHP"
subject: php
lesson_number: "001"
featured_media_id: 22746
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osphp-001-php-runtime-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22747
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osphp-001-php-runtime-body.jpg"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=a7_WFUlFS94"
youtube_2: "https://www.youtube.com/watch?v=BUCiSSyIGGU"
youtube_3: "https://www.youtube.com/watch?v=OK_JCtrrv-c"
social_1: "https://www.reddit.com/r/PHP/comments/tpe3t3/"
seo_title: "OSPHP.001: PHP Runtime — CLI, php -v, Scripts & Dev Server"
seo_description: "Learn the PHP runtime from the beginning: PHP CLI, php -v, running PHP files, php -r, configuration, SAPIs, and the built-in development server."
no_text_boxes: true
image_style: "realistic color-pencil cover; photorealistic body; no words/text; no diagrams"
youtube_minimum_met: 3
archive_format: "final Gutenberg source"
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>PHP code needs a PHP runtime before it can execute.</strong> At the beginner level, the runtime is the PHP program installed on your computer or server. It reads PHP source code, prepares it for execution through the PHP engine, and runs it. You can use PHP from the command line for scripts, or connect it to a web-server environment so PHP code can generate responses for a browser.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This first PHP lesson stays deliberately focused on the runtime itself. You will verify PHP with <code>php -v</code>, run a file with <code>php hello.php</code>, execute a tiny command directly with <code>php -r</code>, inspect configuration with <code>php --ini</code>, and start PHP's built-in development server with <code>php -S localhost:8000</code>. Later lessons will separately cover PHP syntax, variables, arrays, control flow, functions, forms, GET and POST, sessions, cookies, files, classes, namespaces, exceptions, Composer, PDO, databases, authentication, APIs, JSON, security, Laravel, and testing.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What people mean by the PHP runtime.</li><li>How to confirm PHP is installed with <code>php -v</code>.</li><li>What the PHP CLI is and why it is useful.</li><li>How to run a PHP file from a terminal.</li><li>What a PHP SAPI is at a beginner level.</li><li>How CLI execution differs from serving PHP through HTTP.</li><li>How to start PHP's built-in development server.</li><li>Why that built-in server is for development rather than production.</li><li>How to inspect the active PHP configuration.</li><li>How to troubleshoot the first common PHP runtime failures.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What The PHP Runtime Does</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PHP is a server-side programming language with a runtime that can be used in more than one environment. When you run PHP at a terminal, the <strong>CLI SAPI</strong> handles command-line execution. When PHP participates in a web stack, another server-facing interface may be involved. PHP uses the term <strong>SAPI</strong> for Server Application Programming Interface: the layer that connects the PHP engine to the environment that invoked it.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The important beginner idea is that the same language can run in different contexts. A PHP file can behave like a command-line program, or PHP can generate output for an HTTP request. Understanding the runtime first makes later web concepts easier because you know that PHP itself is doing the code execution while the surrounding environment determines how input arrives and where output goes.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=a7_WFUlFS94","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=a7_WFUlFS94
</div><figcaption class="wp-element-caption"><em>Fireship — “PHP in 100 Seconds.” A compact overview of PHP, server-side execution, syntax, frameworks, and where the language fits in modern web development.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22747,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osphp-001-php-runtime-body.jpg" alt="Two developers collaborating at laptops beside server racks in a bright modern tech workspace." class="wp-image-22747" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech lesson image for OSPHP.001.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Verify The Runtime With php -v</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After installing PHP, open a new terminal and begin with:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>php -v</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>-v</code> option prints version information. PHP's command-line documentation notes that this output also helps you see whether the executable is running as the CLI build. If your shell reports that <code>php</code> is not found, the problem is not yet your source code. First verify that PHP is installed and that the executable can be found through your environment.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That command-discovery step is the same general idea covered in <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/"><strong>What Is the PATH Environment Variable?</strong></a> and <a href="https://bitcoinversus.tech/2026/10/09/osbash-001-shell-script-basics-bash-shebang-chmod-first-script/"><strong>OSBash.001: Shell and Script Basics</strong></a>. Before debugging a language, prove that the operating system can launch its runtime.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Create A First PHP File</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Create a plain-text file named <code>hello.php</code>:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;?php

echo "Hello from PHP!\n";</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The opening <code>&lt;?php</code> tag tells PHP where PHP code begins. The <code>echo</code> construct writes output. You do not need to understand PHP's complete syntax yet; the purpose of this file is simply to verify that source code can travel through the runtime and produce visible output.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you are using a code editor, <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>syntax highlighting</strong></a> can make the file easier to read, but the runtime executes source code rather than editor colors or formatting.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Run PHP From The Command Line</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>From the directory containing the file, run:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>php hello.php</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>PHP's official command-line documentation also allows the explicit <code>-f</code> form:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>php -f hello.php</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Both forms tell the CLI runtime to execute the file. This is important because PHP is not limited to web pages. It can also power command-line utilities, maintenance tasks, queue workers, deployment scripts, data-processing jobs, and other programs that never render a browser page.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=BUCiSSyIGGU","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=BUCiSSyIGGU
</div><figcaption class="wp-element-caption"><em>Traversy Media — “PHP For Beginners.” The course begins with setup, opening PHP files, output, variables, arrays, forms, sessions, file handling, databases, and a small project.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Run A Tiny Command With php -r</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PHP can execute a short fragment without creating a file:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>php -r 'echo "PHP is running\n";'</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>-r</code> option executes code supplied directly on the command line. PHP's documentation notes that you do not include opening or closing PHP tags with <code>-r</code>. Shell quoting rules differ between environments, so treat this as a quick runtime check rather than your primary way to write real programs.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Inspect PHP Configuration</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PHP behavior can be influenced by configuration files. A useful first diagnostic is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>php --ini</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This reports configuration-file locations associated with the runtime. If two computers behave differently even though the source code matches, the difference may come from PHP versions, installed extensions, configuration files, environment variables, or the SAPI being used.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>You can also inspect broad runtime information with:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>php -i</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The output is large, so use it as a diagnostic reference rather than something to memorize. Early on, the useful habit is simply knowing that runtime configuration exists and knowing where to look when behavior differs.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/PHP/comments/tpe3t3/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/PHP/comments/tpe3t3/
</div><figcaption class="wp-element-caption"><em>r/PHP discussion: a beginner-oriented guide to using PHP on the command line, including PHP as a general scripting runtime rather than only a web-page language.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Start PHP's Built-In Development Server</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PHP's CLI runtime includes a small built-in web server intended for local development, testing, and demonstrations. From a project directory, you can start it with:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>php -S localhost:8000</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Then create or keep <code>hello.php</code> in that directory and visit:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>http://localhost:8000/hello.php</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The browser sends an HTTP request to the development server. PHP executes the requested script and the response is sent back to the browser. This is a useful bridge between command-line PHP and later web development. It also connects to the broader idea of software interfaces described in <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-an-api-application-programming-interface/"><strong>What Is an API?</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Do not treat the built-in server as a production web server.</strong> PHP's own manual explicitly describes it as a development aid and warns against exposing it as a full production server on a public network. Production PHP deployments normally use a hardened web stack, process management, logging, TLS, access controls, resource limits, monitoring, and other operational protections that are outside this first lesson.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=OK_JCtrrv-c","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=OK_JCtrrv-c
</div><figcaption class="wp-element-caption"><em>freeCodeCamp.org — “PHP Programming Language Tutorial.” This full beginner course starts with installation and Hello World before moving through the language's core features.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">CLI PHP And Web PHP Are The Same Language In Different Contexts</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A common beginner misconception is that “PHP in the terminal” and “PHP on a website” are different languages. They are not. The language is PHP in both cases. What changes is the execution environment: command-line input and output versus an HTTP-oriented server context.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This distinction becomes important later. Web PHP receives request information, may work with browser <a href="https://bitcoinversus.tech/2026/10/09/what-are-browser-cookies-why-websites-use-them/"><strong>cookies</strong></a>, often talks to a <a href="https://bitcoinversus.tech/2026/10/09/ossql-001-relational-databases-and-tables/"><strong>relational database</strong></a>, and may return HTML or JSON. CLI PHP can perform maintenance, data processing, scheduled tasks, and automation without an HTTP request at all.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The First Troubleshooting Order</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Can the shell find PHP?</strong> Run <code>php -v</code>.</li><li><strong>Are you in the correct directory?</strong> Confirm the PHP file is actually present.</li><li><strong>Does the filename match?</strong> Watch capitalization on case-sensitive systems.</li><li><strong>Does the file parse?</strong> Read the first useful PHP error instead of only the final line.</li><li><strong>Which configuration is active?</strong> Run <code>php --ini</code>.</li><li><strong>Which PHP build are you using?</strong> Compare <code>php -v</code> across terminals, containers, servers, or development machines.</li><li><strong>Does CLI work but the browser fail?</strong> Separate runtime problems from web-server routing, ports, document roots, firewalls, and HTTP configuration.</li><li><strong>Does the built-in server bind successfully?</strong> If port 8000 is already in use, stop the competing process or choose another local port.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Run <code>php -v</code> and record the PHP version.</li><li>Run <code>php --ini</code> and identify the configuration-file locations.</li><li>Create <code>hello.php</code> with one <code>echo</code> statement.</li><li>Run it with <code>php hello.php</code>.</li><li>Run a tiny one-line test with <code>php -r</code>.</li><li>Start the development server with <code>php -S localhost:8000</code>.</li><li>Open <code>hello.php</code> through the local server in a browser.</li><li>Stop the server with Ctrl+C.</li><li>Introduce one deliberate syntax error, run the file, read the diagnostic, and fix it.</li><li>Commit the working example if you are practicing <a href="https://bitcoinversus.tech/2026/10/08/what-is-git-github-version-control-commits-branches/"><strong>Git and GitHub</strong></a>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Assuming PHP only runs inside a browser:</strong> PHP also has a command-line runtime.</li><li><strong>Debugging source before verifying the runtime:</strong> first prove <code>php -v</code> works.</li><li><strong>Confusing the PHP runtime with the web server:</strong> they are related pieces of a web stack, not the same thing.</li><li><strong>Using the built-in PHP server as production infrastructure:</strong> it is intended for development and testing.</li><li><strong>Ignoring configuration differences:</strong> two PHP installations can load different configuration files or extensions.</li><li><strong>Mixing CLI and web assumptions:</strong> request data available in a browser-driven execution may not exist in the same form in CLI execution.</li><li><strong>Changing multiple settings after one error:</strong> isolate the runtime, file, configuration, server, and network layers one at a time.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Exercises</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Explain the PHP runtime in one sentence.</li><li>Explain the difference between PHP CLI execution and HTTP-based execution.</li><li>Create a PHP file that prints two separate lines.</li><li>Use <code>php -r</code> to print a short message without creating a file.</li><li>Use <code>php --ini</code> and identify the loaded configuration path.</li><li>Start the built-in development server on port 8080 instead of 8000.</li><li>Explain why the built-in server should not be used as a public production server.</li><li>Describe one situation where CLI PHP would be useful without a browser.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What does <code>php -v</code> do?</strong> It prints PHP version information and helps confirm that the command-line runtime is available.</li><li><strong>What is PHP CLI?</strong> The command-line interface SAPI used to run PHP from a terminal or shell.</li><li><strong>How do you run a file named <code>hello.php</code>?</strong> <code>php hello.php</code>.</li><li><strong>What does <code>php -r</code> do?</strong> It executes a short PHP code fragment supplied directly on the command line.</li><li><strong>What does <code>php --ini</code> help you inspect?</strong> PHP configuration-file locations.</li><li><strong>What does <code>php -S localhost:8000</code> do?</strong> It starts PHP's built-in development web server on local port 8000.</li><li><strong>Should the built-in server be used as a public production server?</strong> No. PHP documents it as a development and testing tool rather than a full production server.</li><li><strong>Is command-line PHP a different language from web PHP?</strong> No. It is the same PHP language running in a different execution context.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.php.net/commandline"><strong>PHP Manual — Using PHP from the Command Line</strong></a></li><li><a href="https://www.php.net/commandline.options"><strong>PHP Manual — Command-Line Options</strong></a></li><li><a href="https://www.php.net/manual/en/features.commandline.usage.php"><strong>PHP Manual — Executing PHP Files</strong></a></li><li><a href="https://www.php.net/commandline.webserver"><strong>PHP Manual — Built-In Web Server</strong></a></li><li><a href="https://www.php.net/manual/en/tutorial.firstpage.php"><strong>PHP Manual — Your First PHP-Enabled Page</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Before learning PHP syntax, prove that the PHP runtime works.</strong> Use <code>php -v</code> to verify the executable, <code>php hello.php</code> to run a source file, <code>php --ini</code> to locate configuration, and <code>php -S localhost:8000</code> to test a PHP page through a local development server. Once that loop is reliable, the language itself becomes much easier to learn and troubleshoot.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The next canonical PHP lesson is <strong>OSPHP.002: Syntax</strong>, where the track will focus on PHP tags, statements, semicolons, comments, expressions, output, and the basic shape of a PHP program.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is an original 1200×630 BitcoinVersus.Tech color-pencil illustration created specifically for OSPHP.001 and is not reused in the body. The lesson uses a separate original 1200×675 photograph. The three YouTube videos use responsive native Gutenberg 16:9 embed blocks, and the social item uses a responsive native Gutenberg embed. Ordinary lesson prose is not placed inside bordered, shaded, card, callout, panel, or fixed-width text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->