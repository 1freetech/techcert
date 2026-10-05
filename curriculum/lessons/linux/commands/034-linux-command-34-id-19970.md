---
title: "Linux Command #34 – id (Linux OS)"
wordpress_post_id: 19970
source: BitcoinVersus.tech
published: 2026-10-02T08:35:15
modified: 2026-10-02T09:27:46
live_url: https://bitcoinversus.tech/2026/10/02/linux-command-34-id/
track: linux/commands
lesson_number: 34
raw_source: 034-linux-command-34-id-19970.gutenberg.html
---

<!-- wp:paragraph -->
<p>The Linux <code>id</code> command shows the identity Linux uses for a user: the user ID, primary group ID, and every supplementary group the account belongs to. It is a fast, read-only way to answer, “Who is this account, and which group permissions can it use?”</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Definition</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><code>id</code></strong> is an identity-reporting command. A <strong>UID</strong> is the number Linux assigns to a user account. A <strong>GID</strong> is the number Linux assigns to a group. Supplementary groups give the user additional group-based access.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Basic Syntax</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>id</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A typical result looks like this:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>uid=1000(bitcoin) gid=1000(bitcoin) groups=1000(bitcoin),27(sudo)</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><code>uid=1000(bitcoin)</code> means the username is <code>bitcoin</code> and its numeric user ID is <code>1000</code>.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><code>gid=1000(bitcoin)</code> identifies the account’s primary group.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><code>groups=...</code> lists the primary group plus supplementary groups. Membership in <code>sudo</code> may allow administrative commands when the system’s sudo policy permits them.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Check Another Account</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Add a username to inspect that account without switching users:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>id alice</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If the account does not exist, <code>id</code> reports that no such user is available.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video Walkthrough</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This short walkthrough demonstrates the <code>id</code> command and its most useful options.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=uiZrWIHX32Y","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=uiZrWIHX32Y
</div></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Useful Options</h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Command</th><th>What it prints</th></tr></thead><tbody><tr><td><code>id -u</code></td><td>Effective numeric user ID</td></tr><tr><td><code>id -un</code></td><td>Effective username</td></tr><tr><td><code>id -g</code></td><td>Effective primary group ID</td></tr><tr><td><code>id -gn</code></td><td>Effective primary group name</td></tr><tr><td><code>id -G</code></td><td>All group IDs</td></tr><tr><td><code>id -Gn</code></td><td>All group names</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>The <code>-n</code> option asks for a name instead of a number. Use it with <code>-u</code>, <code>-g</code>, or <code>-G</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><code>whoami</code> vs. <code>id</code></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>whoami</code> prints only the current effective username. <code>id</code> provides the broader identity picture: user number, primary group, and supplementary groups. In most ordinary shells, <code>whoami</code> and <code>id -un</code> print the same username.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical Troubleshooting</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Suppose a technician receives <code>Permission denied</code> while accessing a shared directory. Run:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>id
ls -ld /path/to/shared-directory</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Compare the user’s groups with the directory’s owner, group, and permission bits. If the required group is absent from the <code>id</code> output, group membership may explain the failure. After an administrator changes group membership, the user may need to sign out and back in before a new session receives it.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Safety Note</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>id</code> only reads and displays identity information; it does not change accounts, groups, passwords, or permissions. It is safe to run during routine troubleshooting.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Run <code>id</code> and identify your UID, primary GID, and supplementary groups.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Run <code>id -un</code> and compare the result with <code>whoami</code>.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Run <code>id -Gn</code> and explain what each listed group could control.</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>If another local username is available, run <code>id username</code> to compare its identity.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>What is the difference between a UID and a GID?</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Which command prints only group names?</li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li>Why can group membership affect access even when the username is correct?</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Continue the Linux Series</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><a href="https://bitcoinversus.tech/2026/10/01/linux-command-33-whoami/">Linux Command #33 – whoami (Linux OS)</a></li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><a href="https://bitcoinversus.tech/2025/03/15/linux-file-permissions-and-ownership/">Linux File Permissions and Ownership</a></li>
<!-- /wp:list-item -->
<!-- wp:list-item -->
<li><a href="https://bitcoinversus.tech/2024/11/19/command-1-sudo-linux-os/">Linux Command #1 – sudo (Linux OS)</a></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Reference</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For the complete option reference, see the <a href="https://www.gnu.org/software/coreutils/manual/html_node/id-invocation.html">GNU Coreutils <code>id</code> manual</a> or run <code>man id</code> in a terminal.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use <code>id</code> to confirm the exact user and group identity Linux will use when evaluating access. It turns a vague permissions problem into concrete UID, GID, and group-membership facts.</p>
<!-- /wp:paragraph -->