---
title: "OSBash.002: Commands and Paths — pwd, ls, cd, Absolute Paths, Relative Paths, and PATH"
status: published
wordpress_post_id: 23291
wordpress_status: publish
published: "2026-10-10T13:15:43"
modified: "2026-10-10T13:16:06"
live_url: "https://bitcoinversus.tech/2026/10/10/osbash-002-commands-paths-pwd-ls-cd-absolute-relative-paths-path/"
series: "Open Source Bash"
certification: OSBash
pathway: bash
lesson_number: "002"
lesson_topic: "Commands and Paths"
featured_media_id: 23289
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osbash002-commands-paths-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 23290
body_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bash-gnome-terminal-wikimedia.png"
youtube:
  - "https://www.youtube.com/watch?v=_evVqwOg5H8"
  - "https://www.youtube.com/watch?v=6LB3-DKSa5Q"
social:
  - "https://www.reddit.com/r/bash/comments/1l69apz/"
seo_title: "OSBash.002: Bash Commands, Paths, pwd, ls, cd and PATH"
seo_description: "Learn Bash commands and paths: pwd, ls, cd, absolute and relative paths, dot and dot-dot, home expansion, PATH lookup, command -v, type, and troubleshooting."
seo_schema_type: article
excerpt: "Learn Bash commands and paths: pwd, ls, cd, absolute and relative paths, ., .., ~, PATH command lookup, command -v, type, and how to troubleshoot command-not-found errors."
no_text_boxes: true
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong><code>pwd</code> tells you where you are.</strong></li><li><strong><code>ls</code> shows what is in a directory.</strong></li><li><strong><code>cd</code> changes your current working directory.</strong></li><li><strong>An absolute path starts from the filesystem root.</strong> A relative path starts from your current directory.</li><li><strong><code>.</code> means the current directory, <code>..</code> means the parent directory, and <code>~</code> commonly expands to your home directory.</strong></li><li><strong><code>PATH</code> controls where Bash searches for command names that do not contain a slash.</strong></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/2026/10/09/osbash-001-shell-script-basics-bash-shebang-chmod-first-script/"><strong>OSBash.001</strong></a> introduced Bash as a shell and scripting language, along with shebangs, executable scripts, and the meaning of <code>./script.sh</code>. This lesson slows down and focuses on the navigation ideas underneath those examples: commands, directories, paths, and command lookup.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Most beginner Bash mistakes become easier to diagnose once you can answer two questions: <strong>“Where am I?”</strong> and <strong>“How is Bash finding the command I typed?”</strong> The first is about the current working directory. The second is about explicit paths and the <code>PATH</code> environment variable.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=_evVqwOg5H8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=_evVqwOg5H8
</div><figcaption class="wp-element-caption"><em>Engineering Digest walks through the core Linux navigation commands <code>ls</code>, <code>pwd</code>, and <code>cd</code> for beginners.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Your Shell Always Has a Current Working Directory</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Every interactive Bash session has a current working directory. Many relative operations begin there. If you create a file named <code>notes.txt</code> without giving a longer path, the shell and the program you launch interpret that name relative to the current directory unless the program defines different behavior.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>pwd</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>pwd</code> means <strong>print working directory</strong>. A typical result might be:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>/home/user/projects</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The leading slash means this is an absolute path beginning at the filesystem root.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":23290,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bash-gnome-terminal-wikimedia.png?w=1024" alt="Fedora GNOME Terminal screenshot showing Bash commands including pwd, cd, ls, yum, and ping" class="wp-image-23290" /><figcaption class="wp-element-caption"><em>A real Bash session in Fedora GNOME Terminal showing commands including <code>pwd</code>, <code>cd</code>, and <code>ls</code>. Source: Wikimedia Commons.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">ls Lists Directory Contents</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The basic <code>ls</code> command lists entries in a directory.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>ls</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You can also give <code>ls</code> a path:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>ls /etc
ls ~/Downloads
ls ../</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A common inspection form is <code>ls -la</code>. The <code>-l</code> option requests a long listing, while <code>-a</code> includes entries whose names begin with a dot. This is often useful when troubleshooting shell configuration files such as <code>.bashrc</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">cd Changes the Current Directory</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>cd /var/log</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>After that command, <code>pwd</code> should report <code>/var/log</code>. You can also move using a relative path:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>cd projects
cd app
pwd</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If your starting directory was <code>/home/user</code>, those commands move into <code>/home/user/projects/app</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Absolute Paths Start at /</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An absolute path identifies a location from the filesystem root, represented by <code>/</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>/home/user/projects/app
/etc/ssh/sshd_config
/usr/bin/bash</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Absolute paths do not depend on your current working directory. If <code>/home/user/projects/app</code> exists, that path names the same location whether your shell is currently in <code>/tmp</code>, <code>/var/log</code>, or your home directory.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Relative Paths Start Where You Are</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A relative path is interpreted from the current working directory. If <code>pwd</code> prints <code>/home/user/projects</code>, then:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>cd app</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>means “enter <code>/home/user/projects/app</code>.” The shorter spelling is convenient because your current location supplies the missing beginning of the path.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=6LB3-DKSa5Q","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=6LB3-DKSa5Q
</div><figcaption class="wp-element-caption"><em>Qube demonstrates <code>ls</code>, <code>pwd</code>, <code>cd</code>, and the difference between absolute and relative pathnames.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Three Path Shortcuts You Need Immediately</h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Symbol</th><th>Meaning</th><th>Example</th></tr></thead><tbody><tr><td><code>.</code></td><td>Current directory</td><td><code>./script.sh</code></td></tr><tr><td><code>..</code></td><td>Parent directory</td><td><code>cd ..</code></td></tr><tr><td><code>~</code></td><td>Home-directory expansion in common Bash usage</td><td><code>cd ~/projects</code></td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>These shortcuts are small but fundamental. <code>./tool</code> explicitly names a program in the current directory. <code>../file.txt</code> names a file one directory above you. <code>~/Downloads</code> expands from your home directory.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">cd With No Argument Goes Home</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>cd</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In normal Bash usage, <code>cd</code> with no directory argument moves to your home directory. You can confirm with <code>pwd</code>. Bash also supports <code>cd -</code> to switch back to the previous working directory, which is useful when moving between two locations.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/bash/comments/1l69apz/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/bash/comments/1l69apz/
</div><figcaption class="wp-element-caption"><em>A Bash community discussion about shortening directory navigation highlights aliases, tab completion, symlinks, and directory-oriented shell habits.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Paths With Spaces Must Be Protected</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bash normally treats spaces as separators between words. If a path contains spaces, quote it or escape the spaces.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>cd "My Projects"
cd My\ Projects</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Quoting is usually easier to read, especially when paths come from variables. A later Bash lesson will go deeper into quoting and expansion rules.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Command Name Is Not Always a Path</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When you type a command such as:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>python
ssh
git</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>you normally are not giving Bash a path containing a slash. Bash must decide what that command name refers to. The <a href="https://www.gnu.org/software/bash/manual/bash.html#Command-Search-and-Execution"><strong>GNU Bash manual</strong></a> documents the shell's command-search process, including functions, builtins, hashed commands, and the directories listed in <code>PATH</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Our earlier <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/"><strong>PATH explainer</strong></a> covers the same idea across Windows and Linux: <code>PATH</code> is an ordered list of directories searched for executable command names.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Inspect PATH</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>echo "$PATH"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>On Linux, the entries are commonly separated by colons. A value might look like:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>/usr/local/bin:/usr/bin:/bin</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If you type <code>git</code>, Bash can search those directories in order until it finds a suitable executable command.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Use command -v and type to See What Bash Will Run</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>command -v bash
command -v python
type cd
type ls</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>command -v</code> is a useful portable shell-oriented way to ask how a command name resolves. Bash's <code>type</code> builtin can tell you whether a name is an alias, function, builtin, or external executable.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The <a href="https://pubs.opengroup.org/onlinepubs/9799919799/utilities/command.html"><strong>POSIX command specification</strong></a> defines the standardized <code>command -v</code> behavior used to describe how a command name would be interpreted.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why ./script.sh Works When script.sh Does Not</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If the current directory is not in <code>PATH</code>, typing <code>script.sh</code> asks Bash to search its command locations and may produce “command not found.” Typing <code>./script.sh</code> is different: the slash tells Bash you supplied a path explicitly, so no ordinary <code>PATH</code> search is needed.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That connects directly to the execution model introduced in OSBash.001. It also connects to our <a href="https://bitcoinversus.tech/2026/10/08/what-are-fork-and-exec-how-linux-creates-and-launches-a-new-program/"><strong>fork() and exec() explainer</strong></a>, which describes the lower-level Unix process-launch path beneath shell command execution.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Practical Navigation Session</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>pwd
ls
cd ~/projects
pwd
ls -la
cd app
pwd
cd ..
pwd
cd -
pwd</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Do not just memorize the commands. Watch how the output changes after every <code>cd</code>. The goal is to build a mental map between the path printed by <code>pwd</code> and the relative paths you use next.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Troubleshoot “Command Not Found” in a Fixed Order</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Check the spelling of the command.</li><li>Run <code>command -v commandname</code>.</li><li>Inspect <code>echo "$PATH"</code>.</li><li>If it is a local file, ask whether you meant an explicit path such as <code>./tool</code>.</li><li>Run <code>ls -l</code> on the target path and confirm the file actually exists.</li><li>If you changed directories, run <code>pwd</code> and verify you are where you think you are.</li></ol>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>This sequence separates path problems from installation problems. A missing executable and a perfectly valid executable in the wrong directory can produce similar symptoms until you inspect the path deliberately.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Assuming <code>ls</code> changes directories:</strong> it only lists; <code>cd</code> changes location.</li><li><strong>Forgetting to run <code>pwd</code>:</strong> many relative-path errors begin with an incorrect assumption about the current directory.</li><li><strong>Confusing an absolute path with a relative path:</strong> leading <code>/</code> changes the meaning completely.</li><li><strong>Forgetting quotes around spaces:</strong> Bash splits unquoted words on spaces.</li><li><strong>Typing a local script name without <code>./</code>:</strong> Bash may search <code>PATH</code> instead of the current directory.</li><li><strong>Assuming <code>PATH</code> is one folder:</strong> it is an ordered list of directories.</li><li><strong>Relying only on <code>which</code>:</strong> shell builtins and aliases can make <code>command -v</code> or <code>type</code> more informative about Bash's own resolution.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Run <code>pwd</code> and write down the absolute path.</li><li>Use <code>ls</code> and <code>ls -la</code> and compare the outputs.</li><li>Create or choose a directory one level below your current location and enter it with a relative path.</li><li>Return to the parent directory with <code>cd ..</code>.</li><li>Move to your home directory with <code>cd</code>, then return with <code>cd -</code>.</li><li>Use an absolute path to reach the same directory you previously reached with a relative path.</li><li>Create a directory containing a space and enter it using quotes.</li><li>Run <code>command -v bash</code>, <code>command -v git</code>, and <code>type cd</code>.</li><li>Print <code>PATH</code> and identify the first three directories in the search order.</li><li>Create a tiny executable script in the current directory and compare typing its filename alone with typing <code>./filename</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What does pwd do?</strong> Prints the current working directory.</li><li><strong>What does cd do?</strong> Changes the shell's current working directory.</li><li><strong>What makes a path absolute?</strong> It begins from the filesystem root, normally with <code>/</code>.</li><li><strong>What does .. mean?</strong> The parent directory.</li><li><strong>What does . mean?</strong> The current directory.</li><li><strong>What does ~ usually represent in Bash?</strong> A home-directory expansion.</li><li><strong>What is PATH?</strong> An ordered list of directories Bash can use when searching for external command names.</li><li><strong>Why can ./script.sh work when script.sh fails?</strong> <code>./script.sh</code> explicitly supplies a path, while the bare name may rely on command search through <code>PATH</code>.</li><li><strong>Which commands can help show what Bash will run?</strong> <code>command -v</code> and Bash's <code>type</code> builtin.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Bash navigation is built around your current directory and the path you supply.</strong> Use <code>pwd</code> to orient yourself, <code>ls</code> to inspect directories, and <code>cd</code> to move. Absolute paths begin at <code>/</code>; relative paths begin where you are. When you type a bare command name, Bash may use <code>PATH</code> and its command-resolution rules to decide what to execute.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next Bash Lesson</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>OSBash.003: Variables and Expansion</strong> will build on paths by showing how Bash stores values in variables and expands names such as <code>$HOME</code> and <code>$PATH</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is a unique 1200×630 realistic color-pencil Bash workspace created specifically for OSBash.002 and is not reused in the body. The separate body image is a real Fedora Bash terminal screenshot from Wikimedia Commons.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->