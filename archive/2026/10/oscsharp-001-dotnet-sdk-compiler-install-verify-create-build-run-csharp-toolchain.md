---
title: "OSC#.001: .NET SDK and Compiler — Install, Verify, Create, Build, Run, and Understand the C# Toolchain"
status: published
wordpress_post_id: 22626
published: "2026-10-09T10:39:14"
modified: "2026-10-09T11:03:21"
live_url: "https://bitcoinversus.tech/2026/10/09/oscsharp-001-dotnet-sdk-compiler-install-verify-create-build-run-csharp-toolchain/"
series: "Open Source C#"
subject: csharp
lesson_number: "001"
featured_media_id: 22621
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscsharp-001-dotnet-sdk-compiler-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22622
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscsharp-001-dotnet-sdk-compiler-body.png"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=Fn28yINqNfo"
youtube_2: "https://www.youtube.com/watch?v=HFLALzkcjLM"
youtube_3: "https://www.youtube.com/watch?v=98MizuB7i-w"
social_1: "https://www.reddit.com/r/dotnet/comments/10msnrd/"
seo_title: "OSC#.001: .NET SDK and Compiler — C# Toolchain Basics"
seo_description: "Learn the C# toolchain from the beginning: .NET SDK, dotnet CLI, project creation, dotnet build, dotnet run, Roslyn, IL, runtime execution, and troubleshooting."
no_text_boxes: true
youtube_minimum_met: 3
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>C# source code does not run by itself.</strong> You need a toolchain that can understand the source, build it into .NET output, and run the resulting application. For a modern C# developer, the center of that toolchain is the <strong>.NET SDK</strong>. The SDK gives you the <code>dotnet</code> command, project templates, the build system, the C# compiler, package tooling, and the pieces needed to create and run .NET applications.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This first C# lesson connects directly to <a href="https://bitcoinversus.tech/2026/10/08/osdotnet-001-what-is-dotnet-platform-runtime-sdk-libraries/"><strong>OSDotNet.001: What Is .NET?</strong></a> and <a href="https://bitcoinversus.tech/2026/10/08/osdotnet-002-what-common-language-runtime-does/"><strong>OSDotNet.002: What the Common Language Runtime Does</strong></a>. It also builds on the practical idea behind <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/"><strong>PATH</strong></a>: when you type <code>dotnet</code> in a terminal, the operating system must be able to find the installed executable.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What the .NET SDK contains and how it differs from the .NET runtime.</li><li>How to verify that the SDK is installed and visible on your PATH.</li><li>How to create a console project with <code>dotnet new</code>.</li><li>What <code>Program.cs</code> and the project file do at a beginner level.</li><li>How <code>dotnet build</code> invokes the C# compiler and produces build output.</li><li>How <code>dotnet run</code> builds and executes an application.</li><li>What Roslyn, IL, metadata, and the .NET runtime are doing in the simplified compilation pipeline.</li><li>How to diagnose the first common SDK and build failures.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Start With The .NET SDK</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <strong>.NET runtime</strong> is enough to run compatible applications, but the <strong>.NET SDK</strong> is what you normally install when you want to develop C# software. Microsoft describes the .NET CLI as a cross-platform toolchain included with the SDK for developing, building, running, and publishing .NET applications. Installing an SDK also installs its corresponding runtime.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>After installing the SDK for your operating system, open a new terminal and verify it before you start writing code.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>dotnet --info

dotnet --list-sdks

dotnet --version</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>dotnet --info</code> gives a broad environment report. <code>dotnet --list-sdks</code> shows the installed SDK versions. <code>dotnet --version</code> reports the SDK version selected for the current environment. If the shell says that <code>dotnet</code> is not found, verify the installation and your <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/"><strong>PATH configuration</strong></a> before troubleshooting C# source code.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Fn28yINqNfo","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Fn28yINqNfo
</div><figcaption class="wp-element-caption"><em>.NET — “Let’s Learn .NET: C#.” A beginner session that introduces C#, .NET, the tools used to get started, and the first development workflow.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Create Your First C# Project</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The .NET SDK includes a template engine. The command <code>dotnet new console</code> creates a console application from the installed console template. You can create the project in a new directory with:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>dotnet new console -n HelloCSharp
cd HelloCSharp</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A simple project normally includes <code>Program.cs</code>, which contains C# source code, and a <code>.csproj</code> project file, which tells the .NET build system important things such as the SDK style and target framework. As the project grows, the project file can also record package references and other build settings.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Modern console templates can be very small. You may see a one-line program such as:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Console.WriteLine("Hello, World!");</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>That is valid modern C#. Top-level statements let beginners write executable code without manually declaring a namespace, class, and <code>Main</code> method first. Later lessons will explain the syntax and program structure in detail. If you use an editor such as Visual Studio Code, <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>syntax highlighting</strong></a> and a <a href="https://bitcoinversus.tech/2026/10/08/what-is-a-monospace-font-why-terminals-and-code-editors-use-fixed-width-text/"><strong>monospace font</strong></a> can make source code easier to read, but the compiler does not care about those visual editor choices.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=HFLALzkcjLM","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=HFLALzkcjLM
</div><figcaption class="wp-element-caption"><em>.NET — “Hello World! | C# for Beginners.” Scott Hanselman and David Fowler create and run a first C# console application in Visual Studio Code.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22622,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscsharp-001-dotnet-sdk-compiler-body.png" alt="Original diagram showing Program.cs flowing through dotnet build, the .NET SDK, the Roslyn C# compiler, IL and metadata, and the .NET runtime, with common dotnet CLI commands below." class="wp-image-22622" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech diagram: a simplified first-lesson view of how C# source moves through the .NET SDK and compiler into a runnable application.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Build The Project</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Run:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>dotnet build</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>At a high level, the SDK coordinates restore and build work, MSBuild evaluates the project, and the C# compiler processes the source. Microsoft’s C# compiler platform is commonly called <strong>Roslyn</strong>. The compiler parses the code, checks syntax and meaning, and produces .NET output containing <strong>Intermediate Language</strong> (IL) and metadata when the build succeeds.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Microsoft’s <code>dotnet build</code> documentation notes that normal build output can include the main assembly, debugging symbols, dependency information, runtime configuration, and referenced libraries. For a beginner console project, you will commonly see generated folders such as <code>obj</code> for intermediate build data and <code>bin</code> for build output.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>dotnet build

# Example success pattern:
# Build succeeded.
#     0 Warning(s)
#     0 Error(s)</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Understand The Compiler Pipeline</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A useful beginner model is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>C# source (.cs)
      ↓
.NET SDK / build system
      ↓
Roslyn C# compiler
      ↓
IL + metadata in an assembly
      ↓
.NET runtime
      ↓
running program</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This model is intentionally simplified. The runtime may use just-in-time compilation, ahead-of-time compilation, or other execution strategies depending on how the application is built and deployed. For the first lesson, the key distinction is enough: <strong>the C# compiler translates your source into .NET program output, and the .NET runtime is responsible for executing that output.</strong> For a deeper runtime explanation, revisit <a href="https://bitcoinversus.tech/2026/10/08/osdotnet-002-what-common-language-runtime-does/"><strong>OSDotNet.002</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Run The Application</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For normal development, the simplest command is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>dotnet run</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>dotnet run</code> is designed for the development loop. It runs source code without requiring you to type a separate explicit compile and launch sequence. If the project needs to be built first, the command handles that work as part of the run process.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>You can also build first and then run the resulting application output separately. That distinction becomes more important later when you learn deployment, publishing, build configurations, and continuous integration.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=98MizuB7i-w","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=98MizuB7i-w
</div><figcaption class="wp-element-caption"><em>Microsoft Developer — “No projects just C# with dotnet run app.cs.” Damian Edwards demonstrates the modern .NET CLI and the newer file-based C# workflow, plus how it can grow into a normal project when project features are needed.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Project-Based And File-Based C#</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Modern .NET also supports <strong>file-based apps</strong> for small programs and experiments. In supported SDK versions, a single C# source file can be run directly, reducing project ceremony for quick work. Microsoft’s current beginner documentation shows a file-based workflow as well as project-based development.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>dotnet hello-world.cs</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Do not let that convenience blur the main lesson. Larger applications still benefit from project files because projects define framework targets, package references, build behavior, and other settings. Learn the project-based workflow first, then treat file-based apps as another tool in the same SDK.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/dotnet/comments/10msnrd/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/dotnet/comments/10msnrd/
</div><figcaption class="wp-element-caption"><em>r/dotnet discussion: a beginner asks how C# is compiled and run from the command line. The replies point directly to the .NET SDK, the CLI toolchain, and <code>dotnet run</code>.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The First Troubleshooting Order</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Can the shell find dotnet?</strong> Run <code>dotnet --info</code>.</li><li><strong>Is an SDK actually installed?</strong> Run <code>dotnet --list-sdks</code>.</li><li><strong>Are you in the project directory?</strong> Confirm that the <code>.csproj</code> file is present before running project commands.</li><li><strong>Does the project build?</strong> Run <code>dotnet build</code> and read the first useful compiler error rather than only the final error count.</li><li><strong>Did restore fail?</strong> Check network access, package sources, and package/version errors.</li><li><strong>Is the wrong SDK being selected?</strong> Compare <code>dotnet --info</code>, <code>dotnet --list-sdks</code>, target framework settings, and any <code>global.json</code> file.</li><li><strong>Did you change the source?</strong> Save the file, rebuild, and confirm you are running the intended project.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Run <code>dotnet --info</code> and identify the SDK version and operating system information.</li><li>Run <code>dotnet --list-sdks</code> and note whether more than one SDK is installed.</li><li>Create a project with <code>dotnet new console -n FirstCSharpLab</code>.</li><li>Enter the directory with <code>cd FirstCSharpLab</code>.</li><li>Open <code>Program.cs</code> and change the message.</li><li>Run <code>dotnet build</code>.</li><li>Run <code>dotnet run</code>.</li><li>Find the <code>bin</code> and <code>obj</code> directories created by the build.</li><li>Introduce one deliberate syntax error, build again, read the compiler diagnostic, then fix the error.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is the difference between the .NET SDK and the .NET runtime?</strong> The runtime executes .NET applications; the SDK adds the development tools needed to create, build, test, package, and run them.</li><li><strong>Which command gives a broad report about the installed .NET environment?</strong> <code>dotnet --info</code>.</li><li><strong>Which command creates a console project?</strong> <code>dotnet new console</code>.</li><li><strong>What does <code>dotnet build</code> do?</strong> It builds the project and its dependencies, invoking the .NET build system and compiler to produce application output.</li><li><strong>What is Roslyn?</strong> Microsoft’s open-source .NET compiler platform that includes the C# compiler and compiler APIs.</li><li><strong>What does the C# compiler produce in the normal managed build model?</strong> .NET assemblies containing IL and metadata, plus related build artifacts.</li><li><strong>What does <code>dotnet run</code> do?</strong> It builds as needed and runs the application from source during development.</li><li><strong>Why can a correct SDK installation still produce “dotnet not found”?</strong> The shell may not be able to find the executable because PATH or the terminal environment is wrong or stale.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://learn.microsoft.com/en-us/dotnet/core/tools/"><strong>Microsoft Learn — .NET CLI overview</strong></a></li><li><a href="https://learn.microsoft.com/en-us/dotnet/core/install/how-to-detect-installed-versions"><strong>Microsoft Learn — Check installed .NET versions</strong></a></li><li><a href="https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-new"><strong>Microsoft Learn — dotnet new</strong></a></li><li><a href="https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-build"><strong>Microsoft Learn — dotnet build</strong></a></li><li><a href="https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-run"><strong>Microsoft Learn — dotnet run</strong></a></li><li><a href="https://learn.microsoft.com/en-us/dotnet/csharp/roslyn-sdk/"><strong>Microsoft Learn — .NET Compiler Platform SDK</strong></a></li><li><a href="https://learn.microsoft.com/en-us/dotnet/core/get-started"><strong>Microsoft Learn — Get started with .NET</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Your first C# skill is not memorizing syntax. It is proving that the toolchain works.</strong> Install the .NET SDK, verify it with <code>dotnet --info</code>, create a project with <code>dotnet new</code>, build it with <code>dotnet build</code>, and run it with <code>dotnet run</code>. Once that loop works, every later C# lesson has a reliable place to start.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is an original 1200×630 BitcoinVersus.Tech cover created specifically for OSC#.001 and is not reused in the body. The lesson uses a separate original 1200×675 instructional build-pipeline diagram. The three YouTube videos use responsive native Gutenberg 16:9 embed blocks, and the social item uses a responsive native Gutenberg embed. Ordinary lesson prose is not placed inside bordered, shaded, card, callout, panel, or fixed-width text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->