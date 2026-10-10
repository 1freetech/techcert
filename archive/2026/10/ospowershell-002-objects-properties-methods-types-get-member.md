---
title: "OSPowerShell.002: Objects — Properties, Methods, Types, and Get-Member"
status: published
wordpress_post_id: 23300
wordpress_status: publish
published: "2026-10-10T15:12:28"
modified: "2026-10-10T15:12:28"
live_url: "https://bitcoinversus.tech/2026/10/10/ospowershell-002-objects-properties-methods-types-get-member/"
featured_media_id: 23293
featured_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospowershell002-objects-cover-1200x630-1.jpg"
body_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/powershell-7-5-windows-terminal-wikimedia.png"
youtube:
  - "https://www.youtube.com/watch?v=ONK4OTnyj5o"
  - "https://www.youtube.com/watch?v=SQwY4f1a1VM"
social:
  - "https://www.reddit.com/r/PowerShell/comments/1f1yeuh/"
seo_title: "OSPowerShell.002: Objects, Properties, Methods and Get-Member"
seo_description: "Learn PowerShell objects, properties, methods, types, Get-Member, Select-Object, dot notation, collections, and why PowerShell passes structured data."
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>PowerShell passes objects, not just displayed text.</strong></li><li><strong>An object has a type and members.</strong> Members include properties that describe the object and methods that can act on it.</li><li><strong><code>Get-Member</code> shows the type, properties, and methods available on objects.</strong></li><li><strong><code>Select-Object</code> chooses properties from objects.</strong></li><li><strong>The formatted table you see is only a view of the object.</strong> More properties can exist than PowerShell displays by default.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/2026/10/09/ospowershell-001-cmdlets-verb-noun-get-command-get-help-first-workflow/"><strong>OSPowerShell.001</strong></a> introduced cmdlets, Verb-Noun command names, <code>Get-Command</code>, and <code>Get-Help</code>. It also introduced an important idea that separates PowerShell from many traditional shells: cmdlets commonly return <strong>objects</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson focuses on that one idea. If objects make sense, the PowerShell pipeline becomes much easier to understand later because you stop thinking of commands as merely printing lines of text and start thinking of them as producing structured values that other commands can inspect and use.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ONK4OTnyj5o","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ONK4OTnyj5o
</div><figcaption class="wp-element-caption"><em>CodeLucky demonstrates <code>Get-Member</code> and how PowerShell exposes object properties and methods.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What Is an Object?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An object is a structured value that represents something. A process object can represent a running program. A service object can represent a system service. A file object can represent a file. Each object carries information about itself in a predictable structure.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The official <a href="https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/03-discovering-objects"><strong>Microsoft Learn object-discovery material</strong></a> teaches this through <code>Get-Member</code>: run a command, pass its output to <code>Get-Member</code>, then inspect the object's type and members.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process | Get-Member</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The output begins with a type name such as <code>System.Diagnostics.Process</code>. That tells you what kind of objects <code>Get-Process</code> produced.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":23294,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/powershell-7-5-windows-terminal-wikimedia.png?w=1024" alt="PowerShell 7.5 Core running in Windows Terminal on Windows 11" class="wp-image-23294" /><figcaption class="wp-element-caption"><em>PowerShell 7.5 Core running in Windows Terminal on Windows 11. Source: Refresh100 / Wikimedia Commons, MIT/Expat license.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Properties Describe an Object</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A property stores information about an object. A process object can expose properties such as its name, ID, CPU time, start time, and working-set memory.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process | Get-Member -MemberType Property</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You can then request selected properties:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process | Select-Object Name, Id, CPU</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>Select-Object</code> does not merely hide text columns. It creates output objects containing the properties you selected. That distinction matters later when those objects continue through a pipeline.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Methods Describe Actions Available on an Object</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A method represents an operation associated with an object. Use <code>Get-Member</code> to list methods separately:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process | Get-Member -MemberType Method</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Methods are called with parentheses. A simple safe example is a string object:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$message = "PowerShell"
$message.ToUpper()</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The string is an object. <code>ToUpper()</code> is one of its methods. You can inspect the same object directly:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$message | Get-Member</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Screen Shows a View, Not the Whole Object</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When you run <code>Get-Process</code>, PowerShell usually displays a table with only a handful of properties. That does not mean those are the only properties on the object.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process | Select-Object -First 1 | Format-List *</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This exposes many properties for one process. The formatted table from the original command was simply PowerShell choosing a convenient default view.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This idea prevents a common beginner mistake: assuming that because a property is not visible on the screen, the property does not exist.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=SQwY4f1a1VM","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=SQwY4f1a1VM
</div><figcaption class="wp-element-caption"><em>David Dalton explains PowerShell object types, properties, methods, collections, and exploring them with <code>Get-Member</code>.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Get-Member Is Your Object Inspection Tool</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Whenever you are unsure what a command returned, pipe one of its objects to <code>Get-Member</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Service | Get-Member
Get-ChildItem | Get-Member
Get-Date | Get-Member</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Each command can return a different object type. That is why the same property name cannot be assumed to exist everywhere.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A useful habit is:</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Run the command.</li><li>Pipe the output to <code>Get-Member</code>.</li><li>Read the type name.</li><li>Find the properties you need.</li><li>Use <code>Select-Object</code> to display or pass only the useful properties.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Select-Object Works With Properties</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Suppose you only care about service names and status:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Service | Select-Object Name, Status</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You can also select only the first few objects:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process | Select-Object -First 5</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Or expand one property so the result is the property values themselves:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process | Select-Object -ExpandProperty Name</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>That last form is useful when another command needs plain property values instead of the larger process objects.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Dot Notation Accesses a Member Directly</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If a variable contains an object, use a dot followed by a property or method name.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$process = Get-Process | Select-Object -First 1
$process.Name
$process.Id
$process.GetType()</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The first two lines after assignment read properties. The method call <code>GetType()</code> asks the object for its runtime type.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Collections Contain Multiple Objects</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Commands often return more than one object. <code>Get-Process</code> may return dozens of process objects, while <code>Get-Service</code> may return hundreds of service objects. PowerShell treats these as a stream or collection of objects depending on context.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>$processes = Get-Process
$processes.Count
$processes[0]</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Understanding the distinction between one object and a collection becomes important when you start using loops and the pipeline.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/PowerShell/comments/1f1yeuh/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/PowerShell/comments/1f1yeuh/
</div><figcaption class="wp-element-caption"><em>A PowerShell beginner discussion focuses on understanding objects and properties, with community examples using <code>Get-Member</code>, <code>Select-Object</code>, and pipeline input.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">PowerShell Objects Are Why the Pipeline Is Powerful</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Traditional command-line pipelines often pass text. PowerShell's pipeline can pass objects. That means the next command can receive structured properties instead of reparsing columns from formatted text.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process | Select-Object Name, Id, CPU</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The next canonical PowerShell lesson can build directly on this idea by studying the pipeline itself. For now, remember that formatting is usually the last presentation step, not the data model underneath the command.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This also connects to the broader IT troubleshooting habit used throughout BitcoinVersus.Tech. For example, <a href="https://bitcoinversus.tech/2026/10/08/ositc-003-windows-process-troubleshooting-task-manager-pid-process-explorer/"><strong>OSITC.003: Windows Process Troubleshooting</strong></a> treats process IDs, CPU use, and memory as structured system facts. PowerShell gives you programmatic access to many of those same facts through objects.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Thinking PowerShell output is only text:</strong> the screen is often a formatted view of structured objects.</li><li><strong>Guessing property names:</strong> use <code>Get-Member</code> instead.</li><li><strong>Assuming every object has the same properties:</strong> properties depend on the object's type.</li><li><strong>Confusing a property with a method:</strong> properties describe state; methods represent actions and are called with parentheses.</li><li><strong>Formatting too early:</strong> commands such as <code>Format-Table</code> are meant for presentation, usually near the end of a pipeline.</li><li><strong>Forgetting that a command may return many objects:</strong> collections behave differently from a single object in some expressions.</li><li><strong>Using a property that is not in the default table:</strong> a hidden property can still exist and be selected.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Run <code>Get-Process | Get-Member</code> and write down the type name.</li><li>List only process properties with <code>Get-Member -MemberType Property</code>.</li><li>Run <code>Get-Process | Select-Object Name, Id, CPU</code>.</li><li>Select the first process, store it in <code>$process</code>, and read <code>$process.Name</code>.</li><li>Call <code>$process.GetType()</code>.</li><li>Run <code>Get-Service | Get-Member</code> and compare the type with the process type.</li><li>Run <code>Get-ChildItem | Get-Member</code> in a directory containing files.</li><li>Use <code>Select-Object -ExpandProperty Name</code> on process output.</li><li>Use <code>Format-List *</code> on one object and compare the properties with the default display.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is a PowerShell object?</strong> A structured value with a type and members.</li><li><strong>What is a property?</strong> Information describing an object.</li><li><strong>What is a method?</strong> An operation associated with an object.</li><li><strong>Which cmdlet reveals an object's members?</strong> <code>Get-Member</code>.</li><li><strong>How do you see only properties with Get-Member?</strong> Use <code>-MemberType Property</code>.</li><li><strong>Which cmdlet selects properties from objects?</strong> <code>Select-Object</code>.</li><li><strong>Does the default table show every property?</strong> Usually not.</li><li><strong>How do you access a property stored in a variable?</strong> Use dot notation, such as <code>$process.Name</code>.</li><li><strong>Why are objects important to the PowerShell pipeline?</strong> They let commands exchange structured data rather than relying only on formatted text.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>PowerShell commands commonly return structured objects.</strong> Learn to inspect them with <code>Get-Member</code>, recognize properties and methods, select useful properties with <code>Select-Object</code>, and remember that the table on the screen is only a formatted view of the underlying object.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next PowerShell Lesson</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>OSPowerShell.003: The Pipeline</strong> will show how PowerShell passes objects from one command to another and how pipeline input changes command workflows.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured artwork is a unique 1200×630 wordless graphic-novel illustration created specifically for OSPowerShell.002 and is not reused in the body. The separate body image is a real PowerShell 7.5 screenshot from Wikimedia Commons under the MIT/Expat license.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->