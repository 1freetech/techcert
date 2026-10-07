---
title: "Linux Command #43 – userdel (Linux OS)"
wordpress_post_id: 21204
source: BitcoinVersus.tech
published: 2026-10-06T00:39:24
modified: 2026-10-06T00:39:24
live_url: https://bitcoinversus.tech/2026/10/06/linux-command-43-userdel/
track: linux/commands
lesson_number: 43
raw_source: 043-linux-command-43-userdel-21204.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong><code>userdel</code> removes a local <a href="https://bitcoinversus.tech/category/linux/">Linux</a> user account from the system account databases.</strong> <strong>Linux Command #43</strong> follows <a href="https://bitcoinversus.tech/2026/10/03/linux-command-38-useradd/"><strong>useradd</strong></a>, <a href="https://bitcoinversus.tech/2026/10/03/linux-command-39-usermod/"><strong>usermod</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/05/linux-command-42-groupmod/"><strong>groupmod</strong></a> by completing the basic account lifecycle: create, modify, verify, and remove. The command is simple to type, but safe removal requires deciding what happens to home data, active processes, groups, jobs, and files that still carry the user's numeric UID.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=19WOD84JFxA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=19WOD84JFxA
</div><figcaption class="wp-element-caption"><em>Learn Linux TV — Managing Users. Covers Linux account creation and removal, passwords, and the /etc/passwd and /etc/shadow account databases.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">1. What userdel changes</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The Shadow utilities manual defines <code>userdel</code> as the low-level tool that deletes entries referring to a named login from the local account files, including the user records represented through <code>/etc/passwd</code> and <code>/etc/shadow</code>. A plain <code>userdel LOGIN</code> removes the account identity but does not automatically erase every file the user owns, so administrators should treat account removal and data cleanup as separate checks. Debian also documents <code>deluser</code> as its usual higher-level administrative front end, while this lesson focuses on the portable low-level <code>userdel</code> interface.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=jwnvKOjmtEA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=jwnvKOjmtEA
</div><figcaption class="wp-element-caption"><em>NetworkChuck — Linux user management. Demonstrates userdel in the context of Linux users, groups, sudo, and account files.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Basic deletion versus -r</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Without <code>-r</code>, <code>userdel</code> removes the account while leaving the user's home directory and other data in place. With <code>-r</code> or <code>--remove</code>, the tool also removes the user's home directory and mail spool, but files on other filesystems or in shared application paths still require separate review. Because home-directory deletion is destructive, data-retention, backup, ownership-transfer, and legal requirements should be resolved before using <code>-r</code> on a production account.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=W2EfhGKy3iQ","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=W2EfhGKy3iQ
</div><figcaption class="wp-element-caption"><em>CodeLucky — useradd and userdel. Demonstrates userdel, the -r option, and account-removal best practices.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">3. Running processes and force deletion</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>userdel</code> normally refuses to remove an account that still owns running processes, and the documented exit status for a currently logged-in user is <code>8</code>. The <code>-f</code> or <code>--force</code> option bypasses safety checks and is explicitly described as dangerous because it can leave the system inconsistent, so the safer workflow is to identify sessions, jobs, services, and processes first, stop them deliberately, then perform the deletion without force whenever possible.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=DonXgySLztc","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=DonXgySLztc
</div><figcaption class="wp-element-caption"><em>Ajay Kumawat — usermod and userdel on Red Hat Enterprise Linux. Demonstrates account modification and deletion in an administrative workflow.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Numeric UIDs survive account deletion</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Linux file ownership is stored numerically, so deleting a username does not rewrite every inode that contains the old UID. Files left behind can display only the numeric UID after the account disappears, and later UID reuse can make those files appear to belong to a different account. Record the UID before deletion, search important storage for that UID, and either archive, delete, or deliberately reassign the files before the old number is allowed to become ambiguous.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=iGLAsZW39aA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=iGLAsZW39aA
</div><figcaption class="wp-element-caption"><em>MrHorbio — Linux User Management. Covers useradd, usermod, userdel, groups, permissions, and the identity concepts surrounding Linux account ownership.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Verify the account before deleting it</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>getent passwd trainee
id trainee
pgrep -a -u trainee</code></pre><!-- /wp:code -->

<!-- wp:list --><ul class="wp-block-list"><li><code>getent passwd trainee</code> confirms how the account resolves through the configured name service.</li><li><code>id trainee</code> records the UID, primary GID, and supplementary groups.</li><li><code>pgrep -a -u trainee</code> checks for processes still owned by the account.</li><li>Review scheduled jobs, services, containers, SSH keys, application credentials, shared storage, and access-control lists that reference the user.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">6. Record the UID and inspect owned files</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>uid=$(id -u trainee)
echo "$uid"

sudo find /home /srv /var -xdev -uid "$uid" -print</code></pre><!-- /wp:code -->

<!-- wp:list --><ul class="wp-block-list"><li>Use targeted filesystems rather than blindly scanning every mounted path.</li><li>Record ownership that must be transferred before deletion.</li><li>After the account is gone, search with <code>-uid NUMBER</code>, because the username no longer resolves.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">7. Delete the account</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code># Remove account, keep home directory and files
sudo userdel trainee

# Remove account plus home directory and mail spool
sudo userdel -r trainee</code></pre><!-- /wp:code -->

<!-- wp:list --><ul class="wp-block-list"><li>Choose one command based on the approved data-retention plan.</li><li>Do not use <code>-f</code> as the routine solution to active sessions or processes.</li><li>If the system uses a same-name private group, review <code>USERGROUPS_ENAB</code> behavior and verify the group after deletion.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">8. Verify cleanup</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>getent passwd trainee || echo "account no longer resolves"
getent group trainee || true
sudo find /home /srv /var -xdev -uid "$uid" -print</code></pre><!-- /wp:code -->

<!-- wp:list --><ul class="wp-block-list"><li>Confirm the login no longer resolves.</li><li>Confirm the expected primary/private group state.</li><li>Search for files still carrying the deleted UID.</li><li>Verify application access, scheduled jobs, services, shared storage, and security controls.</li><li>Document the deletion and any retained or transferred data.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">9. Important exit values</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><code>0</code> — success.</li><li><code>1</code> — password file could not be updated.</li><li><code>2</code> — invalid command syntax.</li><li><code>6</code> — specified user does not exist.</li><li><code>8</code> — user is currently logged in or still active.</li><li><code>10</code> — group file could not be updated.</li><li><code>12</code> — home directory could not be removed.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">10. Safe account-removal workflow</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Resolve the account with <code>getent</code>.</li><li>Record UID, GID, groups, home path, and shell with <code>id</code> and the passwd record.</li><li>Determine whether the identity is local or centrally managed.</li><li>Review active sessions, processes, services, scheduled jobs, containers, keys, tokens, and automation.</li><li>Search controlled storage for files owned by the UID.</li><li>Decide whether home data should be retained, archived, reassigned, or deleted.</li><li>Use <code>userdel</code> or <code>userdel -r</code> according to the approved plan.</li><li>Verify that the login no longer resolves.</li><li>Search again for orphaned UID ownership.</li><li>Document the final state before the UID can be reused.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">11. Common mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Deleting an account before recording its numeric UID.</li><li>Assuming <code>userdel</code> automatically removes every file the account owns.</li><li>Using <code>-r</code> without confirming backup and retention requirements.</li><li>Using <code>-f</code> instead of stopping active processes and sessions cleanly.</li><li>Forgetting scheduled jobs, service ownership, SSH keys, API credentials, or application references.</li><li>Deleting a local record when the real identity is managed by LDAP, NIS, Active Directory integration, or another central directory.</li><li>Allowing the old UID to be reused before orphaned files are reviewed.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">12. Practice exercise</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>In a disposable Linux VM, create a training account named <code>lab_remove</code>.</li><li>Create files owned by that account in its home directory and a separate controlled directory such as <code>/srv/lab-remove</code>.</li><li>Use <code>getent</code> and <code>id</code> to record the account and UID.</li><li>Start a harmless process as the training user and verify that <code>pgrep -a -u lab_remove</code> finds it.</li><li>Stop the process cleanly.</li><li>Search the controlled paths for files owned by the UID.</li><li>Remove the account without <code>-r</code> and verify that the home directory remains.</li><li>Search again with <code>find ... -uid NUMBER</code> and observe numeric ownership.</li><li>Recreate the lab from a snapshot, then repeat with <code>userdel -r</code>.</li><li>Document exactly which files are removed and which survive outside the home directory.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">13. Knowledge check + answers</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>What does plain <code>userdel USER</code> remove?</strong> The account's local identity records; it does not automatically remove every file owned by that UID.</li><li><strong>What does <code>-r</code> add?</strong> Removal of the user's home directory and mail spool.</li><li><strong>Why record the UID before deletion?</strong> Files store numeric ownership, so the UID is needed to find orphaned files after the username no longer resolves.</li><li><strong>Why is <code>-f</code> dangerous?</strong> It bypasses safety checks and can leave inconsistent account, process, file, or group state.</li><li><strong>What does exit status <code>8</code> indicate?</strong> The target user is currently logged in or otherwise active in a way that prevents normal removal.</li><li><strong>Does <code>userdel -r</code> remove files on every filesystem?</strong> No. Files outside the home directory and mail spool must be reviewed separately.</li><li><strong>Why verify the identity source first?</strong> A centrally managed account should be removed in its authoritative directory rather than only deleting a local record.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Useful prior lessons</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/03/linux-command-38-useradd/"><strong>Linux Command #38 – useradd</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/03/linux-command-39-usermod/"><strong>Linux Command #39 – usermod</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/02/linux-command-36-getent/"><strong>Linux Command #36 – getent</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/05/linux-command-42-groupmod/"><strong>Linux Command #42 – groupmod</strong></a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Technical references</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><a href="https://man7.org/linux/man-pages/man8/userdel.8%40%40shadow-utils.html">Linux man-pages: userdel(8), shadow-utils</a></li><li><a href="https://manpages.debian.org/unstable/passwd/userdel.8.en.html">Debian Manpages: userdel(8)</a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong><code>userdel</code> removes an account identity, not every dependency attached to that identity.</strong> Record the UID, stop active work cleanly, decide what should happen to home data, search for owned files, delete the account, then verify the filesystem and access state before the job is considered complete.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->