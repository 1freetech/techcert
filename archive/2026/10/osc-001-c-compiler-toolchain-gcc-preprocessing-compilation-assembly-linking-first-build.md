---
title: "OSC.001: C Compiler and Toolchain — GCC, Preprocessing, Compilation, Assembly, Linking, and Your First Build"
status: published
wordpress_post_id: 22631
published: "2026-10-09T10:52:02"
modified: "2026-10-09T10:52:02"
live_url: "https://bitcoinversus.tech/2026/10/09/osc-001-c-compiler-toolchain-gcc-preprocessing-compilation-assembly-linking-first-build/"
series: "Open Source C"
subject: c
lesson_number: "001"
featured_media_id: 22629
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osc-001-c-compiler-toolchain-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22630
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osc-001-c-compiler-toolchain-body.png"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=Qn-PrsAKcco"
youtube_2: "https://www.youtube.com/watch?v=14hIjQWm81M"
youtube_3: "https://www.youtube.com/watch?v=zfuOcvYrhOs"
social_1: "https://www.reddit.com/r/C_Programming/comments/1rq04sm/linking_step_vs_pre_processing_step_in_compiling/"
seo_title: "OSC.001: C Compiler and Toolchain — GCC Build Basics"
seo_description: "Learn the C compiler toolchain from the beginning: GCC, preprocessing, compilation, assembly, linking, object files, first builds, warnings, and troubleshooting."
no_text_boxes: true
youtube_minimum_met: 3
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>A C source file is not the final executable program.</strong> Before the operating system can run your code, a toolchain transforms the source through several stages. With GCC, the normal build flow can involve preprocessing, compilation, assembly, and linking. Learning that flow early makes later compiler errors, linker errors, libraries, headers, Makefiles, debugging, and embedded builds much easier to understand.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is the first lesson in the Open Source C track. It connects naturally to <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/"><strong>PATH</strong></a>, because your shell must be able to find the compiler command, and to <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>syntax highlighting</strong></a> and <a href="https://bitcoinversus.tech/2026/10/08/what-is-a-monospace-font-why-terminals-and-code-editors-use-fixed-width-text/"><strong>monospace fonts</strong></a>, which make source easier to read but do not change how the compiler interprets valid C.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What a compiler toolchain is.</li><li>What the <code>gcc</code> command does at a beginner level.</li><li>The difference between preprocessing, compilation, assembly, and linking.</li><li>What <code>.c</code>, <code>.i</code>, <code>.s</code>, <code>.o</code>, and executable files represent.</li><li>How to compile and run a first C program.</li><li>How <code>-E</code>, <code>-S</code>, <code>-c</code>, and <code>-o</code> expose individual build stages.</li><li>How compiler errors differ from linker errors.</li><li>How to perform a basic first-line toolchain check.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Toolchain Is More Than One Program</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>People often say “the compiler” as if one program performs every step. In practice, a C toolchain includes multiple jobs. The GCC driver coordinates the stages needed for a normal build. GNU’s GCC documentation describes the standard order as <strong>preprocessing → compilation → assembly → linking</strong>. GCC can also stop after an intermediate stage when you want to inspect what happened.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>hello.c
  ↓ preprocess
hello.i
  ↓ compile
hello.s
  ↓ assemble
hello.o
  ↓ link
hello</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Qn-PrsAKcco","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Qn-PrsAKcco
</div><figcaption class="wp-element-caption"><em>PhyMac Illustrator — “How to work with GCC.” A practical walkthrough of preprocessing, compiling to assembly, assembling to object code, linking, and the GCC switches used to stop at each stage.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22630,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osc-001-c-compiler-toolchain-body.png" alt="Original diagram showing a C source file moving through preprocessing, compilation, assembly, and linking, with example GCC commands for each stage." class="wp-image-22630" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech diagram: the normal C build flow moves from source code through preprocessing, compilation, assembly, and linking to produce an executable.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Write A First C Program</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Create a file named <code>hello.c</code>:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>#include &lt;stdio.h&gt;

int main(void) {
    printf("Hello, C!\n");
    return 0;
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>#include</code> line is handled during preprocessing. The <code>main</code> function is the program’s entry point in this simple example. <code>printf</code> comes from the C standard library interface declared by <code>stdio.h</code>. Later C lessons will explain headers, functions, types, and the language syntax in detail. For now, the goal is to make the toolchain visible.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Compile And Run In One Normal Build</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>On a Unix-like shell with GCC installed, a simple build is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>gcc hello.c -o hello
./hello</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The first command asks GCC to process <code>hello.c</code> through the necessary build stages and place the final executable at <code>hello</code>. The <code>-o</code> option names the output. The second command runs the executable from the current directory.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you omit <code>-o hello</code> in a basic GCC build on many Unix-like systems, the default executable name is commonly <code>a.out</code>. Naming the output explicitly is clearer for beginners.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>gcc -Wall -Wextra -Wpedantic hello.c -o hello</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The warning options above are useful during learning because they ask GCC to report more suspicious code. A warning is not automatically the same thing as an error, but warnings should be read rather than ignored.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=14hIjQWm81M","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=14hIjQWm81M
</div><figcaption class="wp-element-caption"><em>Embedded C — “Compilation Process in C with Live Example.” A GCC-based demonstration of preprocessing, compilation, assembly, linking, intermediate files, and where different build failures appear.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Stage 1: Preprocessing</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The preprocessor handles directives that begin with <code>#</code>, including <code>#include</code>, <code>#define</code>, and conditional compilation directives. It operates before normal C compilation. One useful way to inspect the result is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>gcc -E hello.c -o hello.i</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>-E</code> option tells GCC to stop after preprocessing. The resulting <code>hello.i</code> file can be much larger than the source because included headers and macro expansions have been processed into the preprocessed translation unit.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Stage 2: Compilation Proper</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The compilation stage analyzes the C program and produces assembly-language output for the target architecture. To stop after this stage:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>gcc -S hello.i -o hello.s</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You can also run <code>gcc -S hello.c -o hello.s</code>; in that case GCC performs the required preprocessing first and then stops after producing assembly. The <code>.s</code> file is human-readable assembly rather than the final executable.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Stage 3: Assembly</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The assembler converts assembly instructions into an <strong>object file</strong>. An object file contains machine code and metadata needed for later linking, but it is usually not a complete standalone program yet.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>gcc -c hello.s -o hello.o</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For day-to-day work you will often compile directly from C source to an object file:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>gcc -c hello.c -o hello.o</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>-c</code> option tells GCC not to perform the final link step. This becomes important when a project contains multiple source files that can be compiled separately.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Stage 4: Linking</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The linker combines object files and required libraries, resolves references between compiled pieces, and produces the final executable or another linked output. With the single object file above:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>gcc hello.o -o hello</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The distinction between preprocessing and linking is important. Preprocessing modifies the source translation unit before compilation. Linking happens after object code exists and connects compiled pieces and libraries. A recent <a href="https://www.reddit.com/r/C_Programming/comments/1rq04sm/linking_step_vs_pre_processing_step_in_compiling/"><strong>C programming discussion</strong></a> illustrates exactly this beginner confusion and the difference between those stages.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/C_Programming/comments/1rq04sm/linking_step_vs_pre_processing_step_in_compiling/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/C_Programming/comments/1rq04sm/linking_step_vs_pre_processing_step_in_compiling/
</div><figcaption class="wp-element-caption"><em>r/C_Programming discussion: preprocessing handles directives such as includes and macros before compilation, while linking combines compiled object files and libraries afterward.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Compiler Errors And Linker Errors Are Different</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>compiler error</strong> usually means the compiler could not correctly analyze or translate the source. Examples include malformed syntax, undeclared identifiers, incompatible expressions, or other language-level problems.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int main(void) {
    printf("Hello"  // missing closing syntax
    return 0;
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A <strong>linker error</strong> happens later. The source may have compiled into object code, but the linker cannot resolve a required symbol or combine the requested pieces correctly. A common example is declaring or calling a function but failing to link the object file or library that defines it.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>undefined reference to `some_function'</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>When you see a failure, first identify <strong>which stage failed</strong>. That prevents wasting time changing source syntax when the real problem is a missing object file or library.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">GCC Is A Driver For The Build Process</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>gcc</code> command is convenient because it can coordinate the entire normal build or stop at a requested stage. GNU documentation states that GCC normally performs preprocessing, compilation, assembly, and linking, and that options such as <code>-E</code>, <code>-S</code>, and <code>-c</code> stop the process earlier.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is also why you do not normally invoke the linker directly for a beginner program. Letting the compiler driver perform the link helps it supply the expected startup files, libraries, and platform-specific options.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Clang Is Another Major C Toolchain</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>GCC is not the only C compiler toolchain. <strong>Clang</strong>, built on LLVM, is another widely used compiler front end. For simple beginner builds, its command-line interface often looks familiar:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>clang hello.c -o hello</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The exact compiler available depends on the operating system, development environment, and project. This track uses GCC examples first because its intermediate-stage switches make the build pipeline easy to inspect. The concepts—source, preprocessing, compilation, object files, and linking—transfer to other toolchains.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">When Make Enters The Picture</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Typing one GCC command is fine for a one-file program. As projects grow, manually rebuilding many files becomes repetitive. Build tools such as <code>make</code> automate which commands should run and which files need rebuilding. That is a later topic, but seeing a basic Makefile now helps place the compiler inside the larger development workflow.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=zfuOcvYrhOs","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=zfuOcvYrhOs
</div><figcaption class="wp-element-caption"><em>SpecterDev — “Programming in the C language: Makefiles and Compiling.” A practical example of compiling a C program with GCC and introducing Makefile-driven builds.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The First Troubleshooting Order</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Can the shell find the compiler?</strong> Run <code>gcc --version</code>.</li><li><strong>Are you in the correct directory?</strong> Confirm the source file actually exists with the expected name.</li><li><strong>Does preprocessing succeed?</strong> Use <code>gcc -E</code> if includes or macros are suspected.</li><li><strong>Does compilation succeed?</strong> Read the first useful compiler diagnostic.</li><li><strong>Does object generation succeed?</strong> Use <code>gcc -c</code> to separate compilation from linking.</li><li><strong>Does linking succeed?</strong> Check for missing object files, missing libraries, and unresolved symbols.</li><li><strong>Does the executable run?</strong> Confirm the output path and permissions, then run the correct file.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create <code>hello.c</code> with the example program.</li><li>Run <code>gcc --version</code>.</li><li>Build normally with <code>gcc hello.c -o hello</code>.</li><li>Run <code>./hello</code>.</li><li>Generate preprocessed output with <code>gcc -E hello.c -o hello.i</code>.</li><li>Generate assembly with <code>gcc -S hello.c -o hello.s</code>.</li><li>Generate an object file with <code>gcc -c hello.c -o hello.o</code>.</li><li>Link the object file with <code>gcc hello.o -o hello</code>.</li><li>Introduce one syntax error and observe the compiler diagnostic.</li><li>Restore the source and confirm the full build works again.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What are the four normal GCC build stages?</strong> Preprocessing, compilation, assembly, and linking.</li><li><strong>What does <code>-E</code> do?</strong> Stop after preprocessing.</li><li><strong>What does <code>-S</code> do?</strong> Stop after compilation proper and produce assembly output.</li><li><strong>What does <code>-c</code> do?</strong> Compile or assemble without performing the final link.</li><li><strong>What does <code>-o</code> do?</strong> Set the output file name.</li><li><strong>What is an object file?</strong> Compiled machine-code output plus metadata that normally still needs linking before becoming the final program.</li><li><strong>What does the linker do?</strong> Combine object files and required libraries and resolve references to produce the linked output.</li><li><strong>Why should you identify the failing stage first?</strong> Compiler, assembler, and linker failures require different fixes.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://gcc.gnu.org/onlinedocs/gcc/Invoking-GCC.html"><strong>GNU GCC — Invoking GCC</strong></a></li><li><a href="https://gcc.gnu.org/onlinedocs/gcc/Overall-Options.html"><strong>GNU GCC — Options Controlling the Kind of Output</strong></a></li><li><a href="https://gcc.gnu.org/onlinedocs/"><strong>GNU GCC — Online Documentation</strong></a></li><li><a href="https://clang.llvm.org/docs/UsersManual.html"><strong>Clang Compiler User’s Manual</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>The first C skill is knowing how source becomes a program.</strong> Write the <code>.c</code> file, let the toolchain preprocess it, compile it, assemble it, and link it, then run the executable. GCC hides most of those steps during a normal build, but <code>-E</code>, <code>-S</code>, and <code>-c</code> let you expose them whenever you need to understand what happened.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is an original 1200×630 BitcoinVersus.Tech cover created specifically for OSC.001 and is not reused in the body. The lesson uses a separate original 1200×675 build-pipeline diagram. The three YouTube videos use responsive native Gutenberg 16:9 embed blocks, and the social item uses a responsive native Gutenberg embed. Ordinary lesson prose is not placed inside bordered, shaded, card, callout, panel, or fixed-width text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->