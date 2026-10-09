---
title: "Linux Command #49 – chown (Linux OS)"
status: published
wordpress_post_id: 22462
published: "2026-10-09T07:36:10"
live_url: "https://bitcoinversus.tech/2026/10/09/linux-command-49-chown-linux-os/"
series: "Linux Command"
subject: linux
lesson_number: "049"
featured_media_id: 22457
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-49-chown-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22458
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-49-chown-body.jpg"
body_image_dimensions: "1200x800"
youtube_1: "https://www.youtube.com/watch?v=Y-NrJkcNb6U"
social_1: "https://twitter.com/sysxplore/status/1700958206552580223"
seo_title: "Linux Command #49 — chown (Linux OS)"
seo_description: "Learn Linux chown: change file owners and groups, verify with ls and stat, use -R safely, copy ownership with --reference, and avoid symlink mistakes."
no_text_boxes: true
---

<!-- wp:paragraph -->
<p><strong><code>chown</code> changes the user ownership of a file or directory and can optionally change its group ownership at the same time.</strong> It follows <a href="https://bitcoinversus.tech/2026/10/08/linux-command-48-chgrp-linux-os/"><strong>Linux Command #48 — <code>chgrp</code></strong></a>, which changes only the group owner. At the most elementary level, remember the distinction this way: <code>chown</code> answers <em>who owns this object?</em>; permission tools such as <code>chmod</code> answer <em>what may the owner, group, and others do with it?</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson stays focused on <code>chown</code>: its ownership syntax, safe verification, recursive operation, reference copying, guarded changes, and symbolic-link behavior. For the broader model of read, write, and execute bits, review <a href="https://bitcoinversus.tech/2025/03/15/linux-file-permissions-and-ownership/">Linux File Permissions and Ownership</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22458,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-49-chown-body.jpg?w=1024" alt="A Linux workstation with a laptop, keyboard, and mouse on a desk." class="wp-image-22458" /><figcaption class="wp-element-caption"><em>A Linux workstation. Ownership metadata is part of how Linux decides which user and group control a file. CC0 source: Wikimedia Commons; this body image is separate from the featured cover.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What user ownership and group ownership mean.</li><li>How to change only a file's user owner.</li><li>How to change the user owner and group owner together.</li><li>How to verify ownership with <code>ls -l</code> and <a href="https://bitcoinversus.tech/2026/10/01/linux-command-31-stat-file-metadata/"><code>stat</code></a>.</li><li>When <code>sudo</code> or root privileges are normally required.</li><li>How to use <code>-R</code>, <code>--reference</code>, and <code>--from</code> safely.</li><li>Why symbolic links matter during recursive ownership changes.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Basic Syntax</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>chown [OPTION]... [OWNER][:[GROUP]] FILE...</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The GNU Coreutils form allows an owner, a group, or both. The most common beginner operation is changing a file's user owner:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chown alice report.txt</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This assigns <code>alice</code> as the user owner of <code>report.txt</code>. The file's group ownership is left unchanged. On a normal multiuser Linux system, changing a file to another user usually requires elevated privilege, which is why administrative examples often use <a href="https://bitcoinversus.tech/2024/11/19/command-1-sudo-linux-os/"><code>sudo</code></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read Ownership Before You Change It</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>ls -l report.txt
stat report.txt
id alice</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>ls -l</code> gives a quick ownership view. <a href="https://bitcoinversus.tech/2026/10/01/linux-command-31-stat-file-metadata/"><code>stat</code></a> shows detailed file metadata, including user and group IDs. <a href="https://bitcoinversus.tech/2026/10/02/linux-command-34-id/"><code>id</code></a> verifies that the target account exists and shows its numeric user ID and groups. If you need a compact view of a user's supplementary groups, <a href="https://bitcoinversus.tech/2026/10/02/linux-command-35-groups/"><code>groups</code></a> provides that context.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A strong administration habit is <strong>inspect → change → verify</strong>. Do not begin an ownership change by guessing the current owner, the target account, or the path.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Y-NrJkcNb6U","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=Y-NrJkcNb6U</div><figcaption class="wp-element-caption"><em>Red Hat Enterprise Linux — “File Permissions | Into the Terminal 02.” The lesson covers the permissions model and demonstrates changing ownership beginning at 21:27.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Change the User Owner Only</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chown alice report.txt
ls -l report.txt</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>When the operand contains only an owner name, <code>chown</code> changes the user owner and preserves the existing group owner. This is useful when a file belongs to the wrong account but its group assignment is already correct.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Change the User and Group Together</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chown alice:developers report.txt</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The colon separates the new user owner from the new group owner. In this example, <code>alice</code> becomes the user owner and <code>developers</code> becomes the group owner. The same operation can be useful after creating service directories, restoring files from backup, or correcting files copied by an administrative account.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If the owner field is omitted and only a group is supplied, <code>chown</code> can change just the group:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chown :developers report.txt</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>That overlaps with <a href="https://bitcoinversus.tech/2026/10/08/linux-command-48-chgrp-linux-os/"><code>chgrp developers report.txt</code></a>. Use <code>chgrp</code> when group ownership is the only thing you intend to change and you want the command itself to communicate that narrow intent.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Ownership Is Not Permission</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Changing ownership does not automatically grant read, write, or execute access. Linux evaluates ownership together with permission bits and, on systems that use them, additional access-control mechanisms. A file can be owned by <code>alice:developers</code> while the group still has no write permission. That is why <code>chown</code> and <code>chmod</code> solve different problems.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>ls -l report.txt
# -rw-r----- 1 alice developers ... report.txt</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In that example, the owner can read and write, the group can read, and others have no permission. The names <code>alice</code> and <code>developers</code> identify ownership; the characters <code>rw-r-----</code> describe permission.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/sysxplore/status/1700958206552580223","type":"rich","providerNameSlug":"twitter","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-twitter wp-block-embed-twitter"><div class="wp-block-embed__wrapper">https://twitter.com/sysxplore/status/1700958206552580223</div><figcaption class="wp-element-caption"><em>A directly relevant Linux file-permissions reference. It reinforces the distinction between ownership—the subject changed with <code>chown</code>—and the permission bits evaluated for owner, group, and others.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why sudo Is Common with chown</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Linux intentionally restricts arbitrary ownership transfer. An ordinary user generally cannot give a file away to another user simply by naming that account in <code>chown</code>. Allowing unrestricted ownership transfer would undermine quotas, accountability, and security assumptions. Administrative ownership changes therefore commonly run through root or <code>sudo</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not use <code>sudo</code> automatically. First confirm the path and intended ownership. A privileged ownership mistake can break application access, package-managed files, SSH configuration, home directories, or service data even when the command itself reports success.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Recursive Ownership with -R</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chown -R alice:developers /srv/project</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>-R</code> or <code>--recursive</code> walks through a directory tree and changes ownership on the directory and the entries below it. This is powerful and therefore one of the easiest ways to turn a small typo into a large system change.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Before a recursive command, inspect the exact target:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>pwd
ls -ld /srv/project
find /srv/project -maxdepth 2 -ls | head</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Then run the ownership change only after the starting directory is unambiguous. Avoid broad patterns such as <code>chown -R ... /</code> or an unverified shell variable. Recursive <code>chown</code> is not a repair command to run blindly.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Copy Ownership with --reference</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When a known-good file already has the ownership you want, GNU <code>chown</code> can copy its owner and group:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chown --reference=known-good.conf new.conf
stat known-good.conf new.conf</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This reduces manual transcription and is especially useful in scripts or repair work where matching an established neighboring file is safer than guessing an account or group name.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Guard a Change with --from</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>GNU <code>chown</code> also supports <code>--from=CURRENT_OWNER:CURRENT_GROUP</code>. The command changes an object only when its current ownership matches the condition you supplied.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chown --from=root:root alice:developers report.txt</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This means: change <code>report.txt</code> to <code>alice:developers</code> only if it is currently owned by <code>root:root</code>. The guard is useful in automation because it narrows the set of files eligible for modification rather than changing every matching pathname regardless of its existing state.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Verbose and Changes-Only Output</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><code>-v</code> or <code>--verbose</code> — report every file processed.</li><li><code>-c</code> or <code>--changes</code> — report only files whose ownership actually changes.</li><li><code>-f</code>, <code>--silent</code>, or <code>--quiet</code> — suppress most error messages.</li></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chown -v alice:developers report.txt
sudo chown -c -R alice:developers /srv/project</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Output options improve visibility but do not replace post-change verification. For important work, inspect representative files or the complete intended set afterward with <code>ls</code>, <code>find</code>, or <a href="https://bitcoinversus.tech/2026/10/01/linux-command-31-stat-file-metadata/"><code>stat</code></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Symbolic Links and Recursive Traversal</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Recursive ownership changes become more subtle when symbolic links are present. GNU <code>chown</code> provides <code>-H</code>, <code>-L</code>, and <code>-P</code> to control how recursive traversal handles symlinks. <code>-P</code> is the conservative default: do not traverse symbolic links encountered during the recursive walk.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><code>-P</code> — do not traverse symbolic links encountered during recursive processing; this is the default.</li><li><code>-H</code> — if a command-line argument is a symbolic link to a directory, traverse that referenced directory.</li><li><code>-L</code> — traverse every symbolic link to a directory encountered during recursive processing.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Use <code>-L</code> only when following linked directories is explicitly intended. The GNU manual warns that recursive link following can create security problems if an attacker can introduce a symlink that redirects the traversal into a sensitive part of the filesystem.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Practical Service-Directory Example</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chown -R www-data:www-data /var/www/example
stat /var/www/example</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This pattern is common in documentation because web services often need ownership of application files. It is <strong>not</strong> a universal command. Distribution defaults, web-server users, deployment models, containers, package ownership, and security policies differ. Verify the actual service account and intended path before applying ownership recursively.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Quick Lab</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use a disposable directory in your own home folder. The privileged steps are optional if your account does not have <code>sudo</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create the lab: <code>mkdir -p ~/chown-lab &amp;&amp; touch ~/chown-lab/demo.txt</code>.</li><li>Inspect the starting state with <code>ls -l ~/chown-lab/demo.txt</code> and <code>stat ~/chown-lab/demo.txt</code>.</li><li>Record your user and primary group with <code>id</code>.</li><li>If you have <code>sudo</code>, run <code>sudo chown root:root ~/chown-lab/demo.txt</code>.</li><li>Verify the change with <code>ls -l</code>.</li><li>Restore the file to yourself with <code>sudo chown "$USER":"$(id -gn)" ~/chown-lab/demo.txt</code>.</li><li>Verify again with <code>stat</code>.</li><li>Remove the lab with <code>rm -rf ~/chown-lab</code> after confirming the path.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Confusing ownership with permissions:</strong> <code>chown</code> changes owner/group metadata; it does not directly set <code>rwx</code> bits.</li><li><strong>Running <code>-R</code> from the wrong path:</strong> recursive mistakes can affect thousands of files.</li><li><strong>Guessing a service account:</strong> verify users with <code>id</code> or the system account database first.</li><li><strong>Using <code>sudo</code> reflexively:</strong> privileged ownership changes can break functioning software.</li><li><strong>Ignoring symlinks:</strong> traversal choices can expand the operation beyond the directory you intended.</li><li><strong>Failing to verify:</strong> always inspect the result after the change.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What does <code>chown alice file.txt</code> change?</strong> The file's user owner to <code>alice</code>; its group is preserved.</li><li><strong>What does <code>chown alice:developers file.txt</code> change?</strong> Both the user owner and group owner.</li><li><strong>What does <code>chown :developers file.txt</code> change?</strong> Only the group owner, overlapping with <code>chgrp</code>.</li><li><strong>Does <code>chown</code> automatically grant read or write permission?</strong> No. Permission bits are separate metadata.</li><li><strong>Which option recursively processes a directory tree?</strong> <code>-R</code> or <code>--recursive</code>.</li><li><strong>How can you copy ownership from a known-good file?</strong> Use <code>--reference=FILE</code>.</li><li><strong>What does <code>--from</code> add?</strong> A condition requiring the current ownership to match before a change is applied.</li><li><strong>Which recursive symlink mode is the conservative default?</strong> <code>-P</code>.</li><li><strong>What three-step habit should surround ownership work?</strong> Inspect, change, verify.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Prior Linux Command Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/01/linux-command-31-stat-file-metadata/"><strong>#31 — <code>stat</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/02/linux-command-34-id/"><strong>#34 — <code>id</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/02/linux-command-35-groups/"><strong>#35 — <code>groups</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/03/linux-command-39-usermod/"><strong>#39 — <code>usermod</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/03/linux-command-40-groupadd/"><strong>#40 — <code>groupadd</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/05/linux-command-42-groupmod/"><strong>#42 — <code>groupmod</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/07/linux-command-46-gpasswd/"><strong>#46 — <code>gpasswd</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/linux-command-47-newgrp-linux-os/"><strong>#47 — <code>newgrp</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/linux-command-48-chgrp-linux-os/"><strong>#48 — <code>chgrp</code></strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.gnu.org/software/coreutils/manual/html_node/chown-invocation.html"><strong>GNU Coreutils — chown invocation</strong></a></li><li><a href="https://www.gnu.org/software/coreutils/manual/html_node/Changing-file-attributes.html"><strong>GNU Coreutils — Changing file attributes</strong></a></li><li><a href="https://www.man7.org/linux/man-pages/man1/chown.1.html"><strong>Linux man-pages — chown(1)</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><code>chown</code> changes who owns a file or directory.</strong> Write an owner name to change the user owner; add <code>:group</code> when you also need to change the group. Inspect the current state first, use recursion carefully, and verify the result afterward.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor's Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is a unique 1200×630 realistic-photo lesson cover derived from a CC0 Wikimedia Commons photograph and is not reused in the body. The body uses a different CC0 photograph. The lesson uses responsive native Gutenberg paragraphs, headings, lists, code, image, YouTube, and social-embed blocks only; no ordinary lesson prose is placed inside bordered, shaded, fixed-width, callout, card, or panel-style text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->