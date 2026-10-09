---
title: "OSJavaScript.001: What Is JavaScript? — Where It Runs, What It Does, and Your First console.log()"
status: published
wordpress_post_id: 22368
wordpress_status: publish
published: "2026-10-08T22:42:34"
live_url: "https://bitcoinversus.tech/2026/10/08/osjavascript-001-what-is-javascript-where-it-runs-what-it-does-first-console-log/"
series: "Open Source JavaScript"
certification: OSJavaScript
pathway: javascript
lesson_number: "001"
lesson_topic: "What Is JavaScript? — Where It Runs, What It Does, and Your First console.log()"
featured_media_id: 22356
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osjavascript001-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 22358
body_media_dimensions: "1200x700"
seo_title: "OSJavaScript.001: What Is JavaScript?"
seo_description: "Learn what JavaScript is, how ECMAScript relates to JavaScript, where JavaScript runs, what browsers and Node.js add, and how to run your first console.log()."
---

<!-- wp:paragraph -->
<p><strong>Elementary overview:</strong> JavaScript is a programming language used heavily on the web, but it is not limited to webpages. A JavaScript engine executes the language, while a <strong>host environment</strong>—such as a web browser or Node.js—provides extra capabilities around it.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is the first lesson in the Open Source JavaScript track. The goal is intentionally narrow: understand <strong>what JavaScript is, where it runs, and what happens when you execute one tiny JavaScript program</strong>. Syntax details, variables, functions, objects, the DOM, and asynchronous programming will get their own lessons later.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What You Should Learn</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What JavaScript is.</li><li>What ECMAScript means.</li><li>The difference between the language, the engine, and the host environment.</li><li>Why JavaScript runs in browsers and also outside browsers.</li><li>How to execute <code>console.log("Hello, JavaScript!")</code>.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":22358,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osjavascript001-runtime-body-1200x700-1.jpg?w=1024" alt="Diagram showing JavaScript source code executed by a JavaScript engine inside browser and server host environments" class="wp-image-22358" /><figcaption class="wp-element-caption"><em>JavaScript is the language. The host environment supplies additional APIs such as the DOM in browsers or file-system and process APIs in server runtimes.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What Is JavaScript?</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>JavaScript is a general-purpose scripting and programming language. It became famous because browsers use it to make webpages interactive, but the same language can also run in servers, command-line tools, desktop applications, embedded systems, and other environments.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>On a webpage, JavaScript commonly works alongside <a href="https://bitcoinversus.tech/2026/04/14/html-history-and-overview-fullstack-u/">HTML</a>. HTML describes the structure of the page; JavaScript can react to clicks, change page content, request data, validate input, and perform calculations. If you want a broader picture of what happens around a browser before JavaScript even runs, see <a href="https://bitcoinversus.tech/2026/10/06/easy-tech-read-what-happens-when-you-type-a-website-into-your-browser/">What Happens When You Type a Website Into Your Browser?</a></p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=DHjqpvDnNGE","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=DHjqpvDnNGE</div><figcaption class="wp-element-caption"><em>Fireship’s concise JavaScript overview covers the language’s role in browsers, servers, and modern application development.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>JavaScript and ECMAScript</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>ECMAScript</strong> is the standardized language specification that defines JavaScript’s core syntax and behavior. The specification defines language features such as values, objects, operators, statements, functions, and classes. JavaScript is the name developers normally use for the language and its implementations.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This distinction matters because the ECMAScript specification does not define every feature you use while programming in JavaScript. A browser, Node.js, or another host supplies additional <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-an-api-application-programming-interface/">APIs</a> around the core language.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Language, Engine, and Host</strong></h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Part</th><th>Job</th><th>Example</th></tr></thead><tbody><tr><td>JavaScript / ECMAScript</td><td>Defines the language</td><td>Variables, operators, functions, objects</td></tr><tr><td>JavaScript engine</td><td>Parses and executes JavaScript</td><td>V8, SpiderMonkey, JavaScriptCore</td></tr><tr><td>Host environment</td><td>Provides extra APIs around the engine</td><td>Browser, Node.js</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>Modern JavaScript engines do more than simply interpret code one line at a time. Engines parse the source and may use just-in-time compilation and other optimization techniques to execute it efficiently. The engine is therefore different from the browser itself: a browser contains a JavaScript engine plus many other systems such as rendering, networking, storage, and user-interface components.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Where JavaScript Runs</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The most familiar JavaScript host is a web browser. Browsers supply web APIs such as the Document Object Model (DOM), events, timers, networking interfaces such as <code>fetch()</code>, storage APIs, and the browser console. These APIs let JavaScript interact with the page and with the outside world.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>JavaScript also runs outside the browser. <strong>Node.js</strong> is an open-source, cross-platform JavaScript runtime built on the V8 engine. Node supplies server-oriented capabilities such as file-system access, process information, networking, and command-line execution.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/Cloudflare/status/1971209410715303986","type":"rich","providerNameSlug":"twitter","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-twitter wp-block-embed-twitter"><div class="wp-block-embed__wrapper">https://twitter.com/Cloudflare/status/1971209410715303986</div><figcaption class="wp-element-caption"><em>Cloudflare’s Node.js compatibility update is a real-world example of JavaScript runtime APIs being supported outside a traditional browser.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Your First JavaScript Program</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The quickest way to run JavaScript is the developer console built into a modern browser. Open the browser’s developer tools, choose the Console tab, and enter:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>console.log("Hello, JavaScript!");</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You should see:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Hello, JavaScript!</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>That single line already contains several useful ideas. <code>console</code> is an object supplied by the host environment, <code>log</code> is a method on that object, and <code>"Hello, JavaScript!"</code> is a string value passed to the method.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The important subtlety is that <code>console.log()</code> is not part of the core ECMAScript language specification. It is provided by the host. Browsers provide a Console API, and environments such as Node.js provide their own console implementation.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Run the Same Idea with Node.js</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If Node.js is installed, put the same line in a file named <code>hello.js</code>:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>console.log("Hello, JavaScript!");</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Then run the file from a terminal:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>node hello.js</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The JavaScript statement is the same, but the host is different. The browser and Node.js both execute JavaScript, yet they expose different surrounding APIs. That is why browser code can use objects such as <code>document</code>, while Node.js code can work with server-side facilities that a normal webpage does not receive.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>JavaScript Is Not Java</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>JavaScript and Java are different programming languages. Their similar names are historical, not evidence that one is a version of the other. They have different language designs, runtimes, ecosystems, and typical development workflows.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What JavaScript Can Do in a Browser</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>React to mouse, keyboard, touch, and form events.</li><li>Read and change elements in the DOM.</li><li>Request data from servers through web APIs.</li><li>Store data through browser-provided storage APIs.</li><li>Draw graphics, control media, and update interfaces without reloading the whole page.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Those abilities come from JavaScript working with host APIs. The same general idea appears throughout software engineering: a language gives you computation, while surrounding APIs connect that computation to files, networks, displays, devices, or other software.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>JavaScript and TypeScript</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/2026/10/08/ts-rust-typescript-7-compiler-rust-181711-tests-ai-agents/">TypeScript</a> builds on JavaScript by adding a static type system and additional tooling. TypeScript code is normally transformed into JavaScript that JavaScript runtimes can execute. Learning JavaScript first therefore makes later TypeScript concepts much easier to understand.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Common Beginner Mistakes</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Thinking JavaScript only runs in browsers:</strong> Node.js and other runtimes execute JavaScript outside the browser.</li><li><strong>Thinking every browser API is part of JavaScript:</strong> objects such as <code>document</code> come from the host environment.</li><li><strong>Confusing JavaScript with Java:</strong> they are separate languages.</li><li><strong>Copying code without checking the host:</strong> code written for a browser may depend on APIs that do not exist in Node.js, and vice versa.</li><li><strong>Skipping the console:</strong> the developer console is one of the fastest ways to experiment with small pieces of JavaScript.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Practice</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Open your browser developer console.</li><li>Run <code>console.log("Hello, JavaScript!");</code>.</li><li>Change the text inside the quotation marks and run it again.</li><li>Run <code>2 + 3</code> and observe the result.</li><li>Explain, in one sentence each, what the language, engine, and host environment do.</li><li>If Node.js is installed, save the <code>console.log()</code> example as <code>hello.js</code> and run <code>node hello.js</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is JavaScript?</strong> A general-purpose programming language widely used on the web and in many other environments.</li><li><strong>What is ECMAScript?</strong> The standardized specification that defines the core JavaScript language.</li><li><strong>What does a JavaScript engine do?</strong> It parses and executes JavaScript code, often using optimization and JIT compilation.</li><li><strong>What is a host environment?</strong> The environment that contains the JavaScript engine and supplies additional APIs.</li><li><strong>Name two JavaScript hosts.</strong> A web browser and Node.js.</li><li><strong>Is the DOM part of core ECMAScript?</strong> No. Browsers supply the DOM as a web API.</li><li><strong>Is console.log() part of core ECMAScript?</strong> No. The host environment supplies the console API or equivalent console implementation.</li><li><strong>Are JavaScript and Java the same language?</strong> No.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Primary Technical References</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Introduction">MDN — JavaScript Guide: Introduction</a></li><li><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Language_overview">MDN — JavaScript Language Overview</a></li><li><a href="https://developer.mozilla.org/en-US/docs/Web/API/console/log_static">MDN — console.log()</a></li><li><a href="https://tc39.es/ecma262/">TC39 — ECMAScript Language Specification</a></li><li><a href="https://nodejs.org/learn/getting-started/introduction-to-nodejs">Node.js — Introduction to Node.js</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Elementary Review</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>JavaScript is the language. An engine executes it. A host gives it access to the outside world.</strong> In a browser, the host provides web APIs such as the DOM. In Node.js, the host provides server-oriented APIs. The tiny program <code>console.log("Hello, JavaScript!")</code> is enough to prove the basic model.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Next JavaScript Lesson</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>OSJavaScript.002: Values and Primitive Types</strong> will introduce strings, numbers, booleans, <code>null</code>, <code>undefined</code>, <code>bigint</code>, and <code>symbol</code> without jumping ahead into larger program structure.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured artwork is a unique 1200×630 technical editorial cover created specifically for OSJavaScript.001 and is not reused inside the lesson. Neon green is limited to the small <code>bitcoinversus.tech</code> tag at bottom-left. The separate body diagram illustrates the distinction between JavaScript, its execution engine, and host-provided APIs.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->