---
post_id: 24176
title: "Linux Command #55 – chattr (Linux OS)"
live_url: "https://bitcoinversus.tech/2026/10/13/linux-command-55-chattr-linux-os/"
slug: "linux-command-55-chattr-linux-os"
featured_media_id: 24182
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-55-chattr-cover-1200x630-1.png"
status: publish
---

<!-- wp:paragraph -->
<p><strong><code>chattr</code> changes Linux filesystem attribute flags that sit outside ordinary <code>chmod</code> permissions and ACLs.</strong> It is the companion command to <code>lsattr</code>: use <code>lsattr</code> to inspect attributes, then use <code>chattr</code> only when you understand which flag needs to change.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/12/linux-command-54-lsattr-linux-os/"><strong>Linux Command #54 – lsattr</strong></a>, <a href="https://bitcoinversus.tech/2026/10/10/linux-command-52-getfacl-linux-os/"><strong>Linux Command #52 – getfacl</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/10/linux-command-50-chmod-linux-os/"><strong>Linux Command #50 – chmod</strong></a>. Together, these tools help separate filesystem attributes from ACLs and ordinary Unix mode bits.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You’ll Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Explain what <code>chattr</code> changes.</li><li>Use <code>+i</code> and <code>-i</code> to set and clear the immutable attribute.</li><li>Use <code>+a</code> and <code>-a</code> to control append-only behavior.</li><li>Understand the difference between <code>+</code>, <code>-</code>, and <code>=</code>.</li><li>Verify every change with <code>lsattr</code>.</li><li>Recognize filesystem and privilege limitations.</li><li>Troubleshoot files that cannot be modified, renamed, or deleted.</li></ul>
<!-- /wp:list -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=jJph4HCbIyI&amp;w=900&amp;h=506]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>Server Gyan demonstrates changing Linux file attributes with <code>chattr</code>, including common attribute flags and practical command syntax.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What chattr Changes</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The current <a href="https://man7.org/linux/man-pages/man1/chattr.1.html"><strong>chattr(1) manual</strong></a> defines <code>chattr</code> as the command for changing file attributes on a Linux filesystem. Its symbolic mode uses three operators: <code>+</code> adds selected attributes, <code>-</code> removes selected attributes, and <code>=</code> replaces the current set with exactly the attributes you specify.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The general form is <code>chattr MODE FILE...</code>. In day-to-day administration, the most important modes are usually <code>+i</code>, <code>-i</code>, <code>+a</code>, and <code>-a</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Important:</strong> attribute support varies by filesystem. The e2fsprogs manual explicitly warns that not every flag is supported or used by every filesystem. When behavior is unexpected, identify the filesystem first with a command such as <code>findmnt -T FILE</code> and then consult that filesystem’s documentation.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Make a File Immutable</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use <code>sudo chattr +i FILE</code> to add the immutable attribute when the filesystem supports it. For example:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chattr +i important.conf
lsattr important.conf</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>With the <code>i</code> flag set, the file cannot normally be modified, renamed, deleted, or linked. The current manual states that only the superuser or a process with the <code>CAP_LINUX_IMMUTABLE</code> capability can set or clear this attribute.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[embed]https://www.reddit.com/r/linuxquestions/comments/1l63v6f/[/embed]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>A LinuxQuestions discussion shows a practical reason administrators use <code>chattr +i</code>: normal read-only permissions do not necessarily stop a file from being unlinked when the directory permissions allow deletion.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Remove the Immutable Attribute</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When a legitimate change is required, first confirm why the immutable flag exists. Then remove it with:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chattr -i important.conf
lsattr important.conf</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>After verification, make the intended change. If the file is supposed to remain protected, restore the immutable attribute with <code>sudo chattr +i important.conf</code> and verify again with <code>lsattr</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Use Append-Only for Logs and Records</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>a</code> attribute is append only. A file carrying this flag can be opened for writing only in append mode. Existing contents cannot normally be overwritten or truncated while the flag remains set.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo chattr +a audit.log
lsattr audit.log
printf '%s\n' 'new record' | sudo tee -a audit.log
sudo chattr -a audit.log</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This can be useful for specific logging or record-keeping workflows, but it is not a substitute for a complete logging, backup, or security architecture.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[embed]https://www.reddit.com/r/linuxquestions/comments/q3ek7p/[/embed]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>A LinuxQuestions thread highlights an important distinction: append-only behavior is a filesystem attribute, not one of the normal read/write/execute permission bits.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Understand +, -, and =</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><code>chattr +i FILE</code> — add immutable while preserving other changeable attributes.</li><li><code>chattr -i FILE</code> — remove immutable while preserving other attributes.</li><li><code>chattr +a FILE</code> — add append-only.</li><li><code>chattr -a FILE</code> — remove append-only.</li><li><code>chattr =a FILE</code> — replace the changeable attribute set with append-only. Use <code>=</code> carefully because it is not merely additive.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>For routine administration, <code>+</code> and <code>-</code> are usually safer because they change only the named attribute. Do not use <code>=</code> unless you deliberately intend to replace the existing changeable attribute set.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Directories Behave Differently Than Files</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Making a directory immutable does not automatically apply the <code>i</code> flag to every child file. Instead, the directory itself cannot be modified, which prevents operations such as creating, removing, or renaming directory entries. Existing child files may still be editable if their own attributes and permissions allow it.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If you truly intend to change attributes recursively, <code>chattr</code> provides <code>-R</code>. Treat recursive attribute changes as high impact. Inspect the target path first, use a disposable lab when learning, and avoid broad commands against system trees unless you have a documented reason and recovery plan.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=okir0JAo-yA&amp;w=900&amp;h=506]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>Linux eHub demonstrates immutable-file behavior, including setting <code>+i</code>, testing modification and deletion, verifying with <code>lsattr</code>, and clearing the attribute.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Not Every lsattr Flag Can Be Changed</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>lsattr</code> can display some read-only attributes that <code>chattr</code> cannot change. The current manual identifies encrypted (<code>E</code>), indexed-directory (<code>I</code>), inline-data (<code>N</code>), and verity (<code>V</code>) attributes as read-only from <code>chattr</code>'s perspective.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not assume that every letter shown by <code>lsattr</code> is something you should remove. Some attributes describe filesystem implementation details rather than an administrator-applied protection flag.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Real-World Troubleshooting Workflow</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>Reproduce the failure without destructive retries.</li><li>Check ownership and mode bits with <code>ls -ld</code> or <code>stat</code>.</li><li>Check ACLs with <code>getfacl</code>.</li><li>Inspect file attributes with <code>lsattr FILE</code>.</li><li>Inspect the parent directory with <code>lsattr -d PARENT_DIRECTORY</code>.</li><li>Identify the filesystem with <code>findmnt -T FILE</code>.</li><li>If <code>i</code> or <code>a</code> is set, determine whether it is intentional.</li><li>Change only the required attribute with <code>chattr</code>.</li><li>Run <code>lsattr</code> again to verify the exact resulting state.</li><li>Document or restore the protection if the application expects it.</li></ol>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><strong>Operational caution:</strong> the e2fsprogs manual notes that setting <code>a</code> or <code>i</code> does not retroactively block writes through file descriptors that were already open. Attribute changes should therefore be treated as one control within a larger operational and security design, not as a complete isolation mechanism.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hands-On Exercise</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>Create a disposable directory: <code>mkdir -p ~/chattr-lab</code>.</li><li>Create a test file: <code>printf 'baseline\n' &gt; ~/chattr-lab/test.txt</code>.</li><li>Record its baseline attributes with <code>lsattr ~/chattr-lab/test.txt</code>.</li><li>Set immutable: <code>sudo chattr +i ~/chattr-lab/test.txt</code>.</li><li>Verify with <code>lsattr</code>.</li><li>Attempt a normal edit, rename, and deletion. Record the errors instead of forcing the operations.</li><li>Clear immutable with <code>sudo chattr -i ~/chattr-lab/test.txt</code>.</li><li>Set append-only with <code>sudo chattr +a ~/chattr-lab/test.txt</code>.</li><li>Append one line with <code>tee -a</code>, then verify that truncating the file fails.</li><li>Clear append-only with <code>sudo chattr -a ~/chattr-lab/test.txt</code>.</li><li>Remove the disposable lab directory when finished.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>What does <code>chattr</code> change?</li><li>What does <code>+i</code> do?</li><li>What does <code>-i</code> do?</li><li>What is the purpose of <code>+a</code>?</li><li>Why should <code>lsattr</code> be run after <code>chattr</code>?</li><li>What is the difference between <code>+</code> and <code>=</code>?</li><li>Why can the same attribute behave differently across filesystems?</li><li>Which capability can permit setting or clearing immutable/append-only attributes?</li><li>Does setting <code>+i</code> on a directory recursively apply <code>i</code> to every child file?</li><li>Why should recursive <code>chattr -R</code> commands be used cautiously?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>Filesystem attribute flags.</li><li>It adds the immutable attribute when supported.</li><li>It removes the immutable attribute.</li><li>It makes supported writes append-only while the attribute is set.</li><li>To verify the actual resulting attribute state.</li><li><code>+</code> adds named attributes; <code>=</code> replaces the changeable set with exactly what is specified.</li><li>Not every filesystem implements every attribute or implements it identically.</li><li><code>CAP_LINUX_IMMUTABLE</code>.</li><li>No. The directory itself becomes immutable; recursive application requires <code>-R</code>.</li><li>They can affect many files and directories at once and may disrupt services or recovery workflows.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><code>chattr</code> changes Linux filesystem attributes; <code>lsattr</code> verifies them.</strong> Use immutable and append-only flags deliberately, understand the filesystem underneath them, and change only the attribute required for the task.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Next in this Linux command sequence:</strong> Linux Command #56 will continue with another filesystem-inspection tool after this attribute pair.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech provides technical education and analysis for informational purposes only. Test administrative commands in a disposable environment before applying them to production systems.</em></p>
<!-- /wp:paragraph -->