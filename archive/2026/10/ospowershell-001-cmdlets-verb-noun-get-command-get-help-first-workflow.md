---
title: "OSPowerShell.001: Cmdlets — Verb-Noun Commands, Get-Command, Get-Help, and Your First PowerShell Workflow"
status: published
wordpress_post_id: 22744
published: "2026-10-09T14:40:31"
modified: "2026-10-09T14:40:31"
live_url: "https://bitcoinversus.tech/2026/10/09/ospowershell-001-cmdlets-verb-noun-get-command-get-help-first-workflow/"
series: "Open Source PowerShell"
subject: powershell
lesson_number: "001"
featured_media_id: 22742
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospowershell-001-cmdlets-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22743
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospowershell-001-cmdlets-body.jpg"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=dt8Bpk6Fhc4"
youtube_2: "https://www.youtube.com/watch?v=86isnpy9KNk"
youtube_3: "https://www.youtube.com/watch?v=U_8R1JXno-Y"
social_1: "https://www.reddit.com/r/PowerShell/comments/17m9auw/"
seo_title: "OSPowerShell.001: Cmdlets — Get-Command, Get-Help & Verb-Noun Basics"
seo_description: "Learn PowerShell cmdlets from the beginning: Verb-Noun naming, Get-Verb, Get-Command, Get-Help, Get-Process, command discovery, syntax, and troubleshooting."
no_text_boxes: true
image_style: "photorealistic, no words, no diagrams"
youtube_minimum_met: 3
archive_format: "final Gutenberg source"
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>PowerShell is built around commands called cmdlets.</strong> A cmdlet is a native PowerShell command designed to perform a focused task. Instead of memorizing hundreds of commands, beginners should first learn PowerShell's naming pattern and the tools PowerShell gives you to discover commands on your own.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This first PowerShell lesson focuses on four ideas: cmdlets use a predictable <strong>Verb-Noun</strong> naming convention, <code>Get-Command</code> discovers commands, <code>Get-Help</code> explains how to use them, and simple cmdlets such as <code>Get-Process</code> let you practice reading real PowerShell output. Later lessons will cover objects, the pipeline, variables, arrays, operators, conditionals, loops, functions, modules, files, services, remoting, APIs, error handling, and automation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you are new to command-line tools, review <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/"><strong>What Is PATH?</strong></a> and <a href="https://bitcoinversus.tech/2026/04/16/full-stack-u-what-is-a-script/"><strong>What Is a Script?</strong></a>. PowerShell can run its own commands as well as applications available on the operating system.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What a PowerShell cmdlet is.</li><li>Why cmdlet names usually follow the Verb-Noun pattern.</li><li>How to use <code>Get-Verb</code> to see approved PowerShell verbs.</li><li>How to use <code>Get-Command</code> to discover commands.</li><li>How to filter commands by verb, noun, module, or command type.</li><li>How to use <code>Get-Help</code> to inspect syntax, parameters, and examples.</li><li>How to run a simple cmdlet such as <code>Get-Process</code>.</li><li>Why aliases, functions, scripts, applications, and cmdlets are different command types.</li><li>How to troubleshoot the first common PowerShell command errors.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What A Cmdlet Is</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Microsoft defines a <strong>cmdlet</strong> as a native PowerShell command rather than a stand-alone executable. Cmdlets are commonly delivered through PowerShell modules and are designed to work naturally with PowerShell's object-based command system.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A cmdlet is only one kind of command PowerShell can run. PowerShell can also expose functions, aliases, scripts, and external applications. That distinction matters because <code>Get-Command</code> can show all of those command types, not only cmdlets.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Command
Get-Command -CommandType Cmdlet</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The first command lists commands PowerShell can discover. The second narrows the results to cmdlets. This is a better learning habit than trying to memorize a giant cheat sheet.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=dt8Bpk6Fhc4","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=dt8Bpk6Fhc4
</div><figcaption class="wp-element-caption"><em>CodeLucky — “PowerShell Cmdlets Explained.” A focused introduction to cmdlets and the Verb-Noun naming convention.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22743,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospowershell-001-cmdlets-body.jpg" alt="A developer working at a modern workstation with softly blurred monitors." class="wp-image-22743" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech lesson image for OSPowerShell.001.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Verb-Noun Naming Pattern</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PowerShell cmdlets normally use a <strong>Verb-Noun</strong> name. The verb describes the action. The noun describes the resource or concept being acted on.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process
Get-Service
Start-Service
Stop-Process
New-Item
Remove-Item</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>That consistency helps you predict command names. If you know PowerShell uses <code>Get</code> for retrieving information and the noun <code>Process</code> for operating-system processes, <code>Get-Process</code> becomes easier to understand before you have ever used it.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Use <code>Get-Verb</code> to inspect the approved PowerShell verbs:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Verb</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Approved verbs make command names more predictable across modules. Common beginner verbs include <code>Get</code>, <code>Set</code>, <code>New</code>, <code>Remove</code>, <code>Start</code>, <code>Stop</code>, <code>Test</code>, and <code>Invoke</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Discover Commands With Get-Command</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>Get-Command</code> is one of the most important cmdlets for a beginner because it lets PowerShell tell you what is available. Microsoft documents that <code>Get-Command</code> can return cmdlets, aliases, functions, filters, scripts, and applications.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Command
Get-Command -Name Get-Process
Get-Command -Name *-Process
Get-Command -Verb Get
Get-Command -Noun Process
Get-Command -CommandType Cmdlet</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The wildcard <code>*</code> is especially useful for discovery. If you remember that a command has something to do with processes but cannot remember the exact name, <code>Get-Command *Process*</code> can help you find likely candidates.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>You can also search a specific module:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Command -Module Microsoft.PowerShell.Management</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This matters because many PowerShell capabilities are organized into modules. You do not need to memorize every module today. Learn to ask PowerShell what commands a module provides.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/PowerShell/comments/17m9auw/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/PowerShell/comments/17m9auw/
</div><figcaption class="wp-element-caption"><em>r/PowerShell beginner discussion: experienced users recommend learning discovery tools such as <code>Get-Command</code>, <code>Get-Help</code>, and <code>Get-Member</code> instead of trying to memorize every command.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learn A Command With Get-Help</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After you discover a command, use <code>Get-Help</code> to learn how to use it. PowerShell help can show the command's description, syntax, parameters, and examples.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Help Get-Process
Get-Help Get-Process -Examples
Get-Help Get-Process -Detailed
Get-Help Get-Process -Full
Get-Help Get-Process -Online</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If local help files are missing or stale, PowerShell may show limited help. On systems where you have the required privileges and network access, <code>Update-Help</code> can refresh help content for supported modules.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Update-Help</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Do not treat <code>Get-Help</code> as something you use only when you are stuck. Make it part of the normal workflow: discover the command, inspect its help, read examples, then test it safely.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=86isnpy9KNk","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=86isnpy9KNk
</div><figcaption class="wp-element-caption"><em>CodeLucky — “PowerShell Get-Help Command Tutorial.” A practical walkthrough of basic help, examples, detailed help, full help, and online help.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read PowerShell Command Syntax</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PowerShell help often shows one or more syntax lines. At first they can look dense, but you only need a few beginner rules.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Text such as <code>-Name</code> is a parameter name.</li><li>Angle-bracketed type names in documentation describe the kind of value expected.</li><li>Square brackets in syntax diagrams usually indicate optional syntax.</li><li>Multiple syntax lines often represent different parameter sets: valid combinations of parameters for the same command.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>For a quick syntax-only view, try:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Command Get-Process -Syntax</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Then compare it with:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Help Get-Process</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Run Your First Useful Cmdlet</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>Get-Process</code> retrieves information about running processes. It is a good first cmdlet because it produces real system information without changing anything.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You can request a specific process by name when one exists:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process -Name pwsh</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>On Windows, you might inspect familiar processes such as Explorer or Notepad when they are running. The available process names depend on the system you are using.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you want more background on processes, PIDs, CPU, memory, and safe troubleshooting, review <a href="https://bitcoinversus.tech/2026/10/08/ositc-003-windows-process-troubleshooting-task-manager-pid-process-explorer/"><strong>OSITC.003: Windows Process Troubleshooting</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=U_8R1JXno-Y","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=U_8R1JXno-Y
</div><figcaption class="wp-element-caption"><em>CodeLucky — “Get-Process PowerShell Tutorial.” A beginner demonstration of retrieving running processes and narrowing the results.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Cmdlets Return Objects</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PowerShell is not only a text shell. Cmdlets commonly return <strong>objects</strong> with properties and methods. That is one of the biggest differences between PowerShell and many traditional command-line environments.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Process | Get-Member</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You do not need to master objects in this first lesson. For now, notice that PowerShell can pass structured information between commands. The next PowerShell lesson is <strong>OSPowerShell.002: Objects</strong>, where that idea will become the main topic.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Aliases Are Not New Cmdlets</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>PowerShell includes aliases that provide shorter names for some commands. An alias is not a separate implementation of the command. It is another name that resolves to another command.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-Alias
Get-Alias -Name gcm
Get-Command gcm</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Aliases can be convenient when working interactively, but full cmdlet names are usually easier to read in lessons, shared scripts, documentation, and team automation. <code>Get-Command</code> helps you see what an alias resolves to.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Beginner Discovery Workflow</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Describe the task.</strong> Example: “I need to inspect running processes.”</li><li><strong>Search for commands.</strong> Try <code>Get-Command *Process*</code>.</li><li><strong>Inspect the likely cmdlet.</strong> Run <code>Get-Command Get-Process</code>.</li><li><strong>Read help.</strong> Run <code>Get-Help Get-Process -Examples</code>.</li><li><strong>Run a read-only test.</strong> Start with <code>Get-Process</code>.</li><li><strong>Inspect the output type later.</strong> Use <code>Get-Process | Get-Member</code>.</li><li><strong>Only then move toward commands that change state.</strong> Read help carefully before using verbs such as <code>Remove</code>, <code>Stop</code>, <code>Set</code>, or <code>Restart</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Safety Before State-Changing Cmdlets</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Commands beginning with verbs such as <code>Get</code> are often used to retrieve information, while verbs such as <code>Set</code>, <code>Remove</code>, <code>Stop</code>, and <code>Restart</code> can change system state. Do not assume a command is harmless because its name looks familiar. Read the help, understand the target, and use a lab system when learning administrative commands.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you are studying Windows administration, <a href="https://bitcoinversus.tech/2026/09/10/windows-server-guide-for-it-technicians-and-administrators/"><strong>Windows Server Guide for IT Technicians and Administrators</strong></a> provides broader context for services, processes, networking, storage, security, and automation.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">First Troubleshooting Order</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Command not found:</strong> run <code>Get-Command</code> with the exact name and verify spelling.</li><li><strong>Wrong command type:</strong> inspect the <code>CommandType</code> returned by <code>Get-Command</code>.</li><li><strong>Unknown parameter:</strong> check <code>Get-Help CommandName -Full</code> or <code>Get-Command CommandName -Syntax</code>.</li><li><strong>Module-specific command missing:</strong> verify that the required module is installed and available.</li><li><strong>Access denied:</strong> determine whether the command requires elevated privileges or a different permission context.</li><li><strong>Works on one machine but not another:</strong> compare PowerShell version, operating system, installed modules, and available commands.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Open PowerShell.</li><li>Run <code>$PSVersionTable</code> and identify your PowerShell version.</li><li>Run <code>Get-Verb</code>.</li><li>Run <code>Get-Command -CommandType Cmdlet</code>.</li><li>Run <code>Get-Command -Noun Process</code>.</li><li>Run <code>Get-Help Get-Process -Examples</code>.</li><li>Run <code>Get-Command Get-Process -Syntax</code>.</li><li>Run <code>Get-Process</code>.</li><li>Run <code>Get-Process | Get-Member</code> and note that the output contains structured members.</li><li>Pick one unfamiliar read-only <code>Get-</code> cmdlet and use <code>Get-Help</code> before running it.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Trying to memorize every cmdlet:</strong> learn discovery first.</li><li><strong>Assuming every command is a cmdlet:</strong> PowerShell can run aliases, functions, scripts, and applications too.</li><li><strong>Ignoring Verb-Noun naming:</strong> the naming convention is one of the fastest ways to predict commands.</li><li><strong>Skipping Get-Help:</strong> help is part of the normal PowerShell workflow.</li><li><strong>Copying commands blindly:</strong> inspect the command and parameters before running state-changing examples.</li><li><strong>Relying only on aliases:</strong> full cmdlet names communicate intent more clearly in shared scripts.</li><li><strong>Assuming every cmdlet exists everywhere:</strong> command availability depends on PowerShell version, operating system, and installed modules.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is a cmdlet?</strong> A native PowerShell command designed to perform a focused task.</li><li><strong>What naming pattern do cmdlets normally use?</strong> Verb-Noun.</li><li><strong>Which cmdlet shows approved PowerShell verbs?</strong> <code>Get-Verb</code>.</li><li><strong>Which cmdlet discovers commands?</strong> <code>Get-Command</code>.</li><li><strong>Which cmdlet displays command documentation?</strong> <code>Get-Help</code>.</li><li><strong>How do you request examples for Get-Process?</strong> <code>Get-Help Get-Process -Examples</code>.</li><li><strong>Does Get-Command return only cmdlets?</strong> No. It can also discover aliases, functions, scripts, applications, and other command types.</li><li><strong>What does Get-Process do?</strong> Retrieves information about running processes.</li><li><strong>Why is Get-Member useful?</strong> It reveals the properties, methods, and other members available on PowerShell objects.</li><li><strong>What should you do before using a state-changing cmdlet?</strong> Read its help, understand the target and parameters, and test safely.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://learn.microsoft.com/en-us/powershell/scripting/powershell-commands"><strong>Microsoft Learn — What Is a PowerShell Command (Cmdlet)?</strong></a></li><li><a href="https://learn.microsoft.com/en-us/powershell/scripting/discover-powershell"><strong>Microsoft Learn — Discover PowerShell</strong></a></li><li><a href="https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-command"><strong>Microsoft Learn — Get-Command</strong></a></li><li><a href="https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-help"><strong>Microsoft Learn — Get-Help</strong></a></li><li><a href="https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_command_syntax"><strong>Microsoft Learn — about_Command_Syntax</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>The first PowerShell skill is discovery, not memorization.</strong> Learn the Verb-Noun pattern, use <code>Get-Command</code> to find commands, use <code>Get-Help</code> to understand them, and practice first with read-only cmdlets such as <code>Get-Process</code>. Once you understand that cmdlets return structured objects, the PowerShell pipeline begins to make much more sense.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The next canonical PowerShell lesson is <strong>OSPowerShell.002: Objects</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is an original 1200×630 BitcoinVersus.Tech photograph created specifically for OSPowerShell.001 and is not reused in the body. The lesson uses a separate original 1200×675 body photograph. The three YouTube videos use responsive native Gutenberg 16:9 embed blocks, and the social item uses a responsive native Gutenberg embed. Ordinary lesson prose is not placed inside bordered, shaded, card, callout, panel, or fixed-width text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->