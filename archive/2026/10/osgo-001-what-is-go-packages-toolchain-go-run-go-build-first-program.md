---
title: "OSGo.001: What Is Go? — Packages, the Go Toolchain, go run, go build, and Your First Program"
status: published
wordpress_post_id: 22448
wordpress_status: publish
published: "2026-10-08T23:53:17"
live_url: "https://bitcoinversus.tech/2026/10/08/osgo-001-what-is-go-packages-toolchain-go-run-go-build-first-program/"
series: "Open Source Go"
certification: OSGo
pathway: go
lesson_number: "001"
lesson_topic: "What Is Go? — Packages, the Go Toolchain, go run, go build, and Your First Program"
featured_media_id: 22447
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osgo001-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 22445
body_media_dimensions: "3000x2000"
seo_title: "OSGo.001: What Is Go? Packages, go run & go build"
seo_description: "Learn Go fundamentals: packages, package main, fmt, func main, go mod init, go run, go build, compiled binaries, and your first Hello Go program."
---

<!-- wp:paragraph -->
<p><strong>Elementary overview:</strong> Go is an open-source, statically typed, compiled programming language designed to make software easier to build, understand, and maintain at scale. You write Go source code in <code>.go</code> files, organize that code into packages, and use the <code>go</code> command to run, test, format, and build programs.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This first Open Source Go lesson stays intentionally narrow: understand <strong>what Go is, why it exists, what a package is, what the Go toolchain does, and how to run and build one tiny program</strong>. Variables, types, functions, methods, interfaces, goroutines, channels, modules, and concurrency patterns will each get their own lessons later.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What You Should Learn</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What Go is and why it was created.</li><li>What a Go source file and package are.</li><li>What <code>package main</code> and <code>func main()</code> mean.</li><li>What the <code>go</code> command does.</li><li>The difference between <code>go run</code> and <code>go build</code>.</li><li>How to run your first Go program.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":22445,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osgo001-body-source.jpg?w=1024" alt="Laptop open with programming code and a coffee mug on a developer desk" class="wp-image-22445" /><figcaption class="wp-element-caption"><em>Go source code is plain text; the Go toolchain turns that source into something you can run, test, and compile.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What Is Go?</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Go is a general-purpose programming language created at Google. Robert Griesemer, Rob Pike, and Ken Thompson began sketching the language in 2007 after encountering software-engineering problems involving large codebases, long build times, networked systems, multicore hardware, and complex development workflows. Go became open source in 2009.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The Go project describes the language as focused on building simple, reliable, and efficient software. Its design deliberately removes some language complexity while combining static typing, compilation, garbage collection, built-in concurrency support, fast tooling, and a strong standard library.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>As of October 8, 2026, the official Go release history lists <strong>Go 1.27.2</strong> as the latest patch release. The beginner workflow in this lesson—source files, packages, <code>go run</code>, and <code>go build</code>—remains the core model regardless of the patch version installed.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=75lJDVT1h0s","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=75lJDVT1h0s</div><figcaption class="wp-element-caption"><em>Tech With Tim introduces Go, sets up a beginner environment, and walks through a first Go program.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Go Is a Compiled Language</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Go source files normally end in <code>.go</code>. The Go compiler translates source code into machine code for a target operating system and processor. For a command package, <code>go build</code> can produce a native executable that runs without requiring a Go virtual machine.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This differs from the execution model in <a href="https://bitcoinversus.tech/2026/10/08/osjava-001-what-is-java-source-code-bytecode-jvm-jdk-first-program/">OSJava.001</a>, where Java source is commonly compiled to JVM bytecode. Go generally compiles application code directly into a native executable for the selected target platform.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Packages Organize Go Code</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Every Go source file begins with a <code>package</code> declaration. A package groups related source files and the declarations inside them. Files in the same directory normally belong to the same package.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>package main</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A package named <code>main</code> is special: it identifies an executable command. To actually start execution, that package also needs a <code>main</code> function.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Your First Go Program</strong></h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>package main

import "fmt"

func main() {
    fmt.Println("Hello, Go!")
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>There are four beginner ideas in this program. <code>package main</code> marks an executable package. <code>import "fmt"</code> makes the standard library’s formatting package available. <code>func main()</code> defines the entry function. <code>fmt.Println()</code> prints a line of text.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Create a Module for the Project</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The official Go getting-started tutorial begins a small project by creating a module. From an empty project directory, run:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>go mod init example/hello</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This creates a <code>go.mod</code> file that identifies the module and becomes the foundation for dependency tracking. Modules will get a dedicated lesson later; for now, treat <code>go.mod</code> as the project-level file that tells the Go tooling which module your code belongs to.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Run the Program with go run</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Save the program as <code>hello.go</code>, then run:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>go run .</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The expected output is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Hello, Go!</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>go run</code> is convenient while learning or iterating because it compiles and runs the program in one operation. It does not leave the normal project executable behind for you to distribute.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Build an Executable with go build</strong></h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>go build</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For a command package, <code>go build</code> compiles the package and its dependencies and writes an executable in the current directory. The executable name normally follows the package or module directory name unless you specify another output name.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>go build -o hello
./hello</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>On Windows, the executable will normally use an <code>.exe</code> suffix. This is one of Go’s practical strengths: a command can be compiled into a native binary that is straightforward to deploy.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/golang/status/1889383557182689695","type":"rich","providerNameSlug":"twitter","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-twitter wp-block-embed-twitter"><div class="wp-block-embed__wrapper">https://twitter.com/golang/status/1889383557182689695</div><figcaption class="wp-element-caption"><em>The official Go project account announces a Go release, showing the language’s actively maintained toolchain and release cycle.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>The official Go project’s release post is included as a directly relevant social example of the language’s active maintenance and release cycle.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>The go Command Is a Toolchain Front End</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>go</code> command is not just a launcher. It is the main front end for Go’s development tooling. Common commands include <code>go run</code>, <code>go build</code>, <code>go test</code>, <code>go fmt</code>, <code>go mod</code>, <code>go install</code>, and <code>go help</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>go version
go help</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>go version</code> reports the installed Go version. <code>go help</code> lists available commands and gives you a built-in path to documentation from the terminal.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Go and “Golang” Mean the Same Language</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The language’s official name is <strong>Go</strong>. The term <strong>Golang</strong> became common largely because the original project website used the domain <code>golang.org</code> and because “Go” is a very common search word. In documentation and formal writing, “Go” is the preferred language name.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Why Go Was Designed Differently</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The Go team’s FAQ explains that the language grew from frustration with tradeoffs among compilation speed, execution efficiency, safety, and ease of programming. The design intentionally reduces clutter: no header files, few keywords, automatic garbage collection, a simple package model, built-in formatting tools, and language-level support for concurrency.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not confuse “simple” with “limited.” Go is used for servers, command-line tools, networking software, distributed systems, cloud infrastructure, developer tooling, and many other production workloads. Simplicity is a design constraint intended to keep large programs understandable.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Common Beginner Mistakes</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Calling the language Golang everywhere:</strong> the official name is Go.</li><li><strong>Forgetting <code>package main</code>:</strong> an executable command needs the main package.</li><li><strong>Forgetting <code>func main()</code>:</strong> the main package needs an entry function.</li><li><strong>Importing a package you never use:</strong> the compiler rejects unused imports.</li><li><strong>Expecting <code>go run</code> to leave a distributable executable:</strong> use <code>go build</code> for that.</li><li><strong>Skipping <code>go mod init</code> in a new module-based project:</strong> modern Go tooling expects module metadata for normal project dependency management.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Practice</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Run <code>go version</code>.</li><li>Create an empty directory and run <code>go mod init example/hello</code>.</li><li>Create <code>hello.go</code> with the example program.</li><li>Run <code>go run .</code>.</li><li>Change the message and run it again.</li><li>Run <code>go build -o hello</code>.</li><li>Run the generated executable.</li><li>Explain the difference between <code>go run</code> and <code>go build</code> in one sentence.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is Go?</strong> An open-source, statically typed, compiled programming language designed for productive software engineering.</li><li><strong>Who began designing Go?</strong> Robert Griesemer, Rob Pike, and Ken Thompson at Google.</li><li><strong>What does <code>package main</code> identify?</strong> An executable command package.</li><li><strong>What does <code>func main()</code> do?</strong> It defines the entry function for a command.</li><li><strong>What does <code>go run .</code> do?</strong> It compiles and runs the current package for immediate execution.</li><li><strong>What does <code>go build</code> do?</strong> It compiles the package and dependencies and can produce an executable for a main package.</li><li><strong>What is <code>go.mod</code>?</strong> The module definition file used by Go’s module-aware tooling.</li><li><strong>Is Golang a different language from Go?</strong> No. Go is the official name.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Primary Technical References</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://go.dev/doc/tutorial/getting-started">Go Documentation — Tutorial: Get Started with Go</a></li><li><a href="https://go.dev/doc/tutorial/compile-install">Go Documentation — Compile and Install the Application</a></li><li><a href="https://go.dev/doc/faq">Go Documentation — Frequently Asked Questions</a></li><li><a href="https://go.dev/doc/devel/release">Go Documentation — Release History</a></li><li><a href="https://go.dev/doc/install">Go Documentation — Download and Install</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Elementary Review</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Write Go source in a package. Use the Go toolchain to run or build it.</strong> A command uses <code>package main</code> and <code>func main()</code>. <code>go run</code> is convenient for immediate execution; <code>go build</code> creates the executable you can keep and deploy.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Next Go Lesson</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>OSGo.002: Variables, Constants, and Short Declarations</strong> will introduce <code>var</code>, <code>const</code>, <code>:=</code>, zero values, and Go’s basic declaration rules without jumping ahead into larger program structure.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured artwork is a unique 1200×630 photorealistic Go programming scene created specifically for OSGo.001 and is not reused inside the lesson. The body uses a separate developer-workspace photograph rather than a simplified diagram. No boxed prose or decorative callout panels are used.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->