---
title: "OSBash.001: Shell and Script Basics — Bash, Shebangs, chmod, ./, and Your First Script"
status: published
wordpress_post_id: 22737
published: "2026-10-09T13:19:20"
modified: "2026-10-09T13:19:20"
live_url: "https://bitcoinversus.tech/2026/10/09/osbash-001-shell-script-basics-bash-shebang-chmod-first-script/"
series: "Open Source Bash"
subject: bash
lesson_number: "001"
featured_media_id: 22735
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osbash-001-shell-script-basics-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22736
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osbash-001-shell-script-basics-body.jpg"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=SPwyp2NG-bE"
youtube_2: "https://www.youtube.com/watch?v=tK9Oc6AEnR4"
youtube_3: "https://www.youtube.com/watch?v=PNhq_4d-5ek"
social_1: "https://www.reddit.com/r/bash/comments/w2kpu7/"
seo_title: "OSBash.001: Shell and Script Basics — Bash, Shebangs, chmod & ./"
seo_description: "Learn Bash shell and script basics: terminals versus shells, shebangs, bash script execution, chmod +x, ./ paths, PATH lookup, and first troubleshooting steps."
no_text_boxes: true
image_style: "photorealistic, no words, no diagrams"
youtube_minimum_met: 3
archive_format: "final Gutenberg source"
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Bash is both a command shell and a scripting language.</strong> You can type commands interactively into a terminal, or you can save a sequence of commands in a text file and run that file as a script. A Bash script is useful when you want the computer to repeat a procedure consistently instead of relying on you to type every command by hand.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This first Bash lesson stays deliberately narrow. You will learn what a shell is, what makes Bash different from the terminal window itself, how a script file works, what a shebang does, why executable permission matters, and why <code>./script.sh</code> is different from simply typing a command name. Later Bash lessons will slow down and focus separately on commands and paths, variables, quoting, pipes, redirection, conditionals, loops, functions, arguments, exit codes, text-processing tools, permissions, processes, environment variables, scheduling, SSH automation, logging, and safe error handling.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What a shell does and where Bash fits.</li><li>The difference between an interactive command and a saved shell script.</li><li>How to create a first Bash script.</li><li>What the <code>#!</code> shebang line means.</li><li>How to run a script with <code>bash script.sh</code>.</li><li>How to make a script executable with <code>chmod +x</code>.</li><li>Why <code>./script.sh</code> specifies a path to the current directory.</li><li>Why the shell searches <code>PATH</code> when you type a command name without a slash.</li><li>How to read the first common Bash execution errors without guessing.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What A Shell Is</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>shell</strong> is a program that reads commands and starts other programs. Bash stands for <strong>Bourne Again Shell</strong>. It grew out of the Unix shell tradition and remains one of the most widely encountered shells on Linux systems, servers, containers, development environments, and infrastructure tooling.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The terminal window is not Bash itself. A terminal application gives you a text interface. Inside that terminal, a shell such as Bash, Zsh, or another command interpreter reads what you type. That distinction becomes important when a script behaves differently under <code>bash</code> than it does under <code>sh</code> or another shell.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>When the shell launches another program, the operating system participates in the process-creation and execution path. The earlier BitcoinVersus.Tech explainer <a href="https://bitcoinversus.tech/2026/10/08/what-are-fork-and-exec-how-linux-creates-and-launches-a-new-program/"><strong>What Are fork() and exec()?</strong></a> provides useful background on how Unix-like systems create and launch programs beneath the command line.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=SPwyp2NG-bE","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=SPwyp2NG-bE
</div><figcaption class="wp-element-caption"><em>NetworkChuck introduces Bash scripting, the shell, shebangs, script execution, and executable permissions in a practical first lesson.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22736,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osbash-001-shell-script-basics-body.jpg" alt="A programmer typing on a laptop in a bright plant-filled workspace." class="wp-image-22736" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech lesson image for OSBash.001.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Interactive Commands Versus Scripts</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If you type a command directly at a Bash prompt, Bash reads and executes it interactively. For example:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>pwd
ls
echo "Hello"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A script stores commands in a file so the same sequence can be run again. The GNU Bash manual defines a shell script as a text file containing shell commands. That simple idea is the foundation of automation: commands that work interactively can often be organized into a repeatable script.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Create Your First Script</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Create a file named <code>hello.sh</code> in a working directory. Use any plain-text editor you are comfortable with. If you are new to code editors, the BitcoinVersus.Tech lesson <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>What Is Syntax Highlighting?</strong></a> explains why editors visually distinguish commands, strings, comments, and other syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>#!/usr/bin/env bash

echo "Hello from Bash"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The second line runs the Bash builtin <code>echo</code>, which writes text to standard output. The first line is more unusual. It begins with the two characters <code>#!</code>, commonly called a <strong>shebang</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=tK9Oc6AEnR4","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=tK9Oc6AEnR4
</div><figcaption class="wp-element-caption"><em>freeCodeCamp.org — “Bash Scripting Tutorial for Beginners.” The course begins with basic commands and a first Bash script before moving into later scripting features.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What The Shebang Does</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When a script is executed directly, the shebang tells the operating system which interpreter should handle the file. In this example:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>#!/usr/bin/env bash</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>env</code> searches the current environment's <code>PATH</code> for a program named <code>bash</code>. Another common form is <code>#!/bin/bash</code>, which names a specific path directly. Which form is appropriate depends on the environment and deployment requirements. The important beginner rule is simpler: <strong>the shebang identifies the intended interpreter when the script is executed as a program.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you explicitly run <code>bash hello.sh</code>, you are already choosing Bash on the command line, so Bash can read the file even if it is not marked executable. Direct execution through <code>./hello.sh</code> is different because the file itself is being launched as a program.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/bash/comments/w2kpu7/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/bash/comments/w2kpu7/
</div><figcaption class="wp-element-caption"><em>r/bash discussion: why an executable script with a shebang behaves differently from explicitly running the same file with <code>bash script.sh</code>.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Run The Script With Bash</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The most direct beginner test is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>bash hello.sh</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This starts Bash and gives the script file to Bash as input. The file needs to be readable, but it does not need its executable permission bit set just to be read this way.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If the command works, you have already proved several things: Bash exists, the shell can find the Bash executable, the file is readable, and the script syntax is valid enough for Bash to execute it.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Make The Script Executable</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>To launch the file directly as a program, add executable permission:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>chmod +x hello.sh</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Then run it with a path:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>./hello.sh</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>chmod +x</code> changes the file's mode so the operating system can treat it as executable for the applicable permission classes. Permissions deserve their own later lesson; for now, remember the practical sequence: create the script, add a shebang, make the file executable, then launch it with a path.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=PNhq_4d-5ek","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=PNhq_4d-5ek
</div><figcaption class="wp-element-caption"><em>TechWorld with Nana — “Bash Scripting Tutorial for Beginners.” The walkthrough covers shells, Bash, the first script, file extensions, shebangs, formatting, and later automation concepts.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why ./ Matters</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The characters <code>./</code> are a path. A single dot means the current directory, so <code>./hello.sh</code> means “execute the file named <code>hello.sh</code> from this directory.”</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you type only <code>hello.sh</code>, Bash normally treats that as a command name and searches the directories listed in the <code>PATH</code> environment variable. The current directory is commonly not included in <code>PATH</code> by default, which is why a local script may work with <code>./hello.sh</code> but not with <code>hello.sh</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a deeper explanation, read <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/"><strong>What Is the PATH Environment Variable?</strong></a>. Later in this Bash track, commands and paths will get a dedicated lesson rather than being overloaded into this introduction.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Comments And Blank Lines</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In Bash, a line beginning with <code>#</code> is normally a comment. Comments are ignored as shell commands and are useful for explaining why a script exists or what a section is doing.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>#!/usr/bin/env bash

# Print a simple greeting.
echo "Hello from Bash"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The shebang is a special first-line case recognized by the operating system when the file is executed. Blank lines are also useful because they visually separate logical sections without changing normal execution.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read Errors In A Fixed Order</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong><code>bash: command not found</code>:</strong> verify Bash is installed and discoverable through <code>PATH</code>.</li><li><strong><code>No such file or directory</code>:</strong> verify your current directory, the filename, and the path you typed. Also inspect the shebang if direct execution fails unexpectedly.</li><li><strong><code>Permission denied</code> with <code>./script.sh</code>:</strong> inspect the file's execute permission.</li><li><strong>Works with <code>bash script.sh</code> but not <code>./script.sh</code>:</strong> check executable permission and the shebang.</li><li><strong>Works in Bash but fails under <code>sh</code>:</strong> the script may use Bash-specific syntax. Run it with the interpreter it was written for instead of assuming every shell is interchangeable.</li></ol>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>This habit matters more than memorizing one error message. Start with the command you typed, the path, permissions, interpreter, and first useful diagnostic. Avoid changing several unrelated things at once.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a directory named <code>bash_lab</code> and enter it.</li><li>Create <code>hello.sh</code> containing a Bash shebang and one <code>echo</code> command.</li><li>Run it with <code>bash hello.sh</code>.</li><li>Run <code>ls -l hello.sh</code> and inspect the permissions.</li><li>Add executable permission with <code>chmod +x hello.sh</code>.</li><li>Run it with <code>./hello.sh</code>.</li><li>Remove the executable bit and observe what changes for direct execution.</li><li>Restore executable permission.</li><li>Temporarily misspell the filename and read the exact error instead of guessing.</li><li>Commit the working script to a small repository if you are practicing <a href="https://bitcoinversus.tech/2026/10/08/what-is-git-github-version-control-commits-branches/"><strong>Git and GitHub</strong></a>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Confusing the terminal with Bash:</strong> the terminal hosts a shell; Bash is one possible shell.</li><li><strong>Assuming every <code>.sh</code> file is Bash:</strong> the extension does not determine the interpreter by itself.</li><li><strong>Forgetting the shebang:</strong> direct execution needs a clear interpreter path if the operating system is expected to choose the interpreter.</li><li><strong>Forgetting executable permission:</strong> <code>bash script.sh</code> and <code>./script.sh</code> are not identical execution paths.</li><li><strong>Typing only a local filename:</strong> command lookup uses <code>PATH</code>; <code>./</code> explicitly names the current directory.</li><li><strong>Running a Bash script with <code>sh</code>:</strong> Bash-specific syntax is not guaranteed to work under another shell.</li><li><strong>Editing several things after one error:</strong> change one variable at a time so you know what fixed the problem.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Exercises</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Explain the difference between a terminal and a shell.</li><li>Create a two-line Bash script that prints your chosen message.</li><li>Run the script once with <code>bash filename</code> and once through direct execution.</li><li>Use <code>ls -l</code> before and after <code>chmod +x</code> and identify the changed permission bit.</li><li>Explain what <code>./</code> means in <code>./hello.sh</code>.</li><li>Explain why typing only <code>hello.sh</code> may produce “command not found.”</li><li>Change the shebang to an invalid path, attempt direct execution, record the error, and restore the correct shebang.</li><li>Write one comment in a script that explains intent rather than repeating the command.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is Bash?</strong> A Unix-style command shell and scripting language.</li><li><strong>Is a terminal window the same thing as Bash?</strong> No. A terminal provides the text interface in which a shell such as Bash can run.</li><li><strong>What is a Bash script?</strong> A text file containing commands intended to be read and executed by Bash.</li><li><strong>What does a shebang do?</strong> It identifies the interpreter intended to execute the file when the script is launched directly.</li><li><strong>Does <code>bash hello.sh</code> require the file to have its executable bit set?</strong> No. Bash reads the file as input.</li><li><strong>What does <code>chmod +x hello.sh</code> do?</strong> It adds executable permission according to the applicable file mode classes.</li><li><strong>What does <code>./hello.sh</code> mean?</strong> Execute <code>hello.sh</code> using the path to the current directory.</li><li><strong>Why might <code>hello.sh</code> alone fail?</strong> The shell searches <code>PATH</code>, and the current directory may not be in that search path.</li><li><strong>Should a Bash-specific script automatically be run with <code>sh</code>?</strong> No. Use the interpreter the script was written and tested for.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.gnu.org/software/bash/manual/bash.html"><strong>GNU Bash Reference Manual</strong></a></li><li><a href="https://www.gnu.org/software/bash/manual/bash.html#Shell-Scripts"><strong>GNU Bash Reference Manual — Shell Scripts</strong></a></li><li><a href="https://www.gnu.org/software/coreutils/manual/html_node/chmod-invocation.html"><strong>GNU Coreutils — chmod</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/"><strong>BitcoinVersus.Tech — What Is the PATH Environment Variable?</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/what-are-fork-and-exec-how-linux-creates-and-launches-a-new-program/"><strong>BitcoinVersus.Tech — What Are fork() and exec()?</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>A Bash script is simply a text file containing shell commands, but execution details matter.</strong> The shebang identifies the intended interpreter for direct execution. <code>bash script.sh</code> explicitly starts Bash and asks it to read the file. <code>chmod +x</code> makes direct execution possible, and <code>./</code> tells the shell exactly where the local script is. Once those mechanics make sense, later Bash syntax becomes much easier to troubleshoot.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The next canonical Bash lesson is <strong>OSBash.002: Commands and Paths</strong>, where command lookup, absolute paths, relative paths, <code>PATH</code>, current directories, and executable discovery can be studied in detail.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is an original 1200×630 BitcoinVersus.Tech photograph created specifically for OSBash.001 and is not reused in the body. The lesson uses a separate original 1200×675 body photograph. The three YouTube videos use responsive native Gutenberg 16:9 embed blocks, and the social item uses a responsive native Gutenberg embed. Ordinary lesson prose is not placed inside bordered, shaded, card, callout, panel, or fixed-width text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->