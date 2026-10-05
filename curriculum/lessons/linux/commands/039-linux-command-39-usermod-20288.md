---
title: "Linux Command #39 – usermod (Linux OS)"
wordpress_post_id: 20288
source: BitcoinVersus.tech
published: 2026-10-03T16:14:23
modified: 2026-10-03T16:18:44
live_url: https://bitcoinversus.tech/2026/10/03/linux-command-39-usermod/
track: linux/commands
lesson_number: 39
raw_source: 039-linux-command-39-usermod-20288.gutenberg.html
---

<!-- wp:paragraph -->
<p><strong><code>usermod</code> changes an existing Linux user account.</strong> Its most useful beginner task is adding a user to a group while keeping that user's other group memberships.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The previous lesson, <a href="https://bitcoinversus.tech/2026/10/03/linux-command-38-useradd/">Linux Command #38 – useradd</a>, created an account. This lesson continues from there: the account already exists, and you need to change one of its settings.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>By the end:</strong> you will be able to read a <code>usermod</code> command, add supplementary group membership, verify the result, and recognize options for changing a shell, home directory, or login name.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Start with the smallest useful command</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo usermod -aG lab_ops labtech</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Read it as: “Add the existing user <code>labtech</code> to the existing group <code>lab_ops</code>, and keep the user's other supplementary groups.” These are sample lab names. They must exist before this command can work.</p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table class="has-fixed-layout"><thead><tr><th>Part</th><th>Plain-English meaning</th></tr></thead><tbody><tr><td><code>sudo</code></td><td>Run with administrative privileges, if your account is authorized.</td></tr><tr><td><code>usermod</code></td><td>Modify an existing local account.</td></tr><tr><td><code>-a</code></td><td>Append: keep existing supplementary memberships.</td></tr><tr><td><code>-G</code></td><td>Specify supplementary groups. The uppercase letter matters.</td></tr><tr><td><code>lab_ops</code></td><td>The group to add.</td></tr><tr><td><code>labtech</code></td><td>The account to change. The username goes last.</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p><code>-aG</code> combines two options. You can also write <code>-a -G</code>; the meaning is the same. The distinction between appending and replacing is documented in the <a href="https://manpages.debian.org/trixie/passwd/usermod.8.en.html">Debian usermod manual</a>. Check <code>man usermod</code> on your own machine for the installed version.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What is a group?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A group brings accounts together so access can be assigned to a team or role. For example, a mining lab might use <code>lab_readers</code> for people who read reports and <code>lab_ops</code> for people who perform approved operations. The names alone grant nothing: files, applications, or other policies must actually use those groups.</p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table class="has-fixed-layout"><thead><tr><th>Term</th><th>What it means</th></tr></thead><tbody><tr><td>User account</td><td>A named identity on the system, such as labtech.</td></tr><tr><td>Primary group</td><td>The account's main group. It is recorded with the account's numeric group ID.</td></tr><tr><td>Supplementary groups</td><td>Additional memberships the account can use for access.</td></tr><tr><td>UID / GID</td><td>Numeric user ID / group ID. Linux uses these numbers to track ownership and identity.</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>If you want a refresher on viewing memberships, see <a href="https://bitcoinversus.tech/2026/10/02/linux-command-35-groups/">Linux Command #35 – groups</a>. A user's primary group and supplementary groups can appear together in the output, so do not mistake every displayed group for a supplementary membership.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The important difference: -aG adds; -G replaces</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Imagine that <code>labtech</code> already belongs to the supplementary groups <code>lab_readers</code> and <code>video</code>. You want to add <code>lab_ops</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":20284,"sizeSlug":"full","linkDestination":"media"} -->
<figure class="wp-block-image size-full"><a href="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-39-usermod-group-diagram.jpg"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-39-usermod-group-diagram.jpg" alt="Comparison: usermod -aG adds lab_ops while retaining lab_readers and video; usermod -G replaces the supplementary list with lab_ops. The primary group is unchanged." class="wp-image-20284" /></a><figcaption class="wp-element-caption"><em>Tap the diagram to open the full-size image. Original BitcoinVersus.Tech diagram: -aG retains existing supplementary groups and adds lab_ops; -G alone replaces that list. The primary group is unchanged. Colors distinguish the two paths; this is a concept diagram.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:table -->
<figure class="wp-block-table"><table class="has-fixed-layout"><thead><tr><th>Command</th><th>Result in this example</th></tr></thead><tbody><tr><td><code>sudo usermod -aG lab_ops labtech</code></td><td>Supplementary groups: lab_readers, video, lab_ops.</td></tr><tr><td><code>sudo usermod -G lab_ops labtech</code></td><td>Supplementary groups: lab_ops only. The two other memberships are removed.</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p><strong>Use <code>-aG</code> when the goal is to add membership.</strong> Use <code>-G</code> alone only when you deliberately intend to replace the complete supplementary list. Removing a group used for administration can cause an access problem after the user starts a new session.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 1: See usermod in action</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=p8QOnty6rSU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=p8QOnty6rSU
</div><figcaption class="wp-element-caption"><em>Learn Linux TV — Linux Crash Course: usermod. Watch how account settings are changed, then compare the options with the examples in this lesson.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A small practice lab: inspect, change, verify</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use a disposable Linux VM or training machine that you administer. Keep your administrator session separate from the test account. The exercise changes only the test user's membership; it does not require changing your own account.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Step 1: Check whether the practice names already exist.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>getent passwd labtech
getent group lab_readers
getent group lab_ops</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A matching record means that name already exists. If any name belongs to an account or group you did not create for this exercise, choose different unused names and substitute them throughout. If all three names are unused, create the practice objects:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo groupadd lab_readers
sudo groupadd lab_ops
sudo useradd -m -U labtech</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>groupadd</code> creates a group. <code>useradd -m</code> creates the account and its home directory; <code>-U</code> explicitly requests a primary group with the same name. This exercise does not need an interactive login password.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Step 2: Give the test user one existing supplementary membership.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo usermod -aG lab_readers labtech
id -nG labtech</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For this fresh lab account, a typical result is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>labtech lab_readers</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The group <code>labtech</code> is the primary group; <code>lab_readers</code> is supplementary. Group order and additional memberships can vary with system configuration. Focus on which names are present.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Step 3: Add the second group.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo usermod -aG lab_ops labtech
id -nG labtech</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A typical result is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>labtech lab_readers lab_ops</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The important result is that <strong>both</strong> <code>lab_readers</code> and <code>lab_ops</code> remain. You added access without dropping the first supplementary membership.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Step 4: Check from another view.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>groups labtech
getent group lab_ops</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The first command lists the account's memberships. The second should show <code>labtech</code> in the member list for <code>lab_ops</code>. Neither command needs <code>sudo</code> for this ordinary lookup.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Optional: Undo just the membership you added in Step 3.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo gpasswd -d labtech lab_ops
id -nG labtech</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>After that change, <code>lab_readers</code> should still be present and <code>lab_ops</code> should be absent. This step removes a membership, not the user account or either group.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why can the database and current session disagree?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A running process carries its own group list. Changing the account database does not rewrite that list in processes already running. A fresh login normally picks up the new memberships.</p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table class="has-fixed-layout"><thead><tr><th>Command</th><th>What you are checking</th></tr></thead><tbody><tr><td><code>id -nG labtech</code></td><td>Look up the named account's groups from the user and group databases.</td></tr><tr><td><code>id -nG</code></td><td>Inspect the groups of the process running this command.</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>For an interactive account, save your work, fully log out, and log back in before testing the new access. Opening another terminal inside the same desktop session may inherit the old group list. A service running under that account may need to be restarted through the normal maintenance process.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 2: Understand group membership</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=GnlgAD8-GhE","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=GnlgAD8-GhE
</div><figcaption class="wp-element-caption"><em>Learn Linux TV — Linux Crash Course: Managing Groups. This reinforces primary and supplementary groups, usermod -aG, and why a new login can be necessary.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Adding more than one group</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>List the group names with commas and no spaces between them. All the groups must already exist.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sudo usermod -aG lab_ops,lab_readers labtech
id -nG labtech</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Use only the memberships required for the task. Adding a person to a group is meaningful only when the system's access rules use that group. Red Hat's <a href="https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/configuring_basic_system_settings/managing-users-and-groups_configuring-basic-system-settings">user and group administration guide</a> provides a broader view of account management.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Other usermod options worth recognizing</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The table below is a reference, not a sequence to run. Check the account and target values before using an option.</p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table class="has-fixed-layout"><thead><tr><th>Option</th><th>Purpose</th><th>Example</th></tr></thead><tbody><tr><td><code>-c</code></td><td>Change the account comment.</td><td><code>sudo usermod -c "Mining lab operator" labtech</code></td></tr><tr><td><code>-s</code></td><td>Change the login shell.</td><td><code>sudo usermod -s /bin/bash labtech</code></td></tr><tr><td><code>-g</code></td><td>Change the primary group. Lowercase g.</td><td><code>sudo usermod -g lab_ops labtech</code></td></tr><tr><td><code>-d</code> with <code>-m</code></td><td>Change the recorded home path and move the existing home contents.</td><td><code>sudo usermod -d /home/labtech-new -m labtech</code></td></tr><tr><td><code>-l</code></td><td>Change the login name.</td><td><code>sudo usermod -l labtech2 labtech</code></td></tr><tr><td><code>-L</code> / <code>-U</code></td><td>Lock / unlock the password.</td><td><code>sudo usermod -L labtech</code></td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>For a shell change, first check <code>cat /etc/shells</code> and confirm the chosen executable exists. <code>/bin/bash</code> is an example, not a promise about every Linux installation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a login-name or home-directory change, the affected user must have no running processes. Work from a separate administrator account. <code>-l</code> does not automatically rename the home directory. <code>-d</code> without <code>-m</code> changes the recorded path without moving the existing files. Review ownership, application paths, and configuration after a move.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>A password lock is not a complete account shutdown.</strong> <code>-L</code> blocks password authentication; SSH keys or other methods may still work, and existing sessions are not ended. Likewise, <code>-U</code> does not undo every other access restriction.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>To set or change a password, use the interactive command covered in <a href="https://bitcoinversus.tech/2026/10/02/linux-command-37-passwd/">Linux Command #37 – passwd</a>. Do not pass a plain-text password to <code>usermod -p</code>: that option expects an encrypted hash, and command-line arguments can be exposed.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 3: Connect the options to practical maintenance</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vf3L62SxCiU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vf3L62SxCiU
</div><figcaption class="wp-element-caption"><em>Akamai Developers — How to Utilize the Usermod Utility in Linux to Perform User Maintenance with a Linode Cloud Server. Revisit group changes, home directories, and login names. Keep the lesson's distinction between locking a password and disabling all access in mind.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Troubleshooting without guessing</h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table class="has-fixed-layout"><thead><tr><th>What you see</th><th>What to check</th></tr></thead><tbody><tr><td>The user does not exist.</td><td>Check the spelling with <code>getent passwd labtech</code>. usermod modifies an account; it does not create one.</td></tr><tr><td>The group does not exist.</td><td>Check <code>getent group lab_ops</code>. Create a lab group only when that is your intended task.</td></tr><tr><td>Permission denied or cannot lock account files.</td><td>Confirm your administrative authorization and whether another account-management operation is running. Do not delete lock files casually.</td></tr><tr><td>The new group is listed, but access still fails.</td><td>Test in a fresh login. Then check the resource's permissions and policy; membership alone does not configure the resource.</td></tr><tr><td>The user is used by a process.</td><td>For a rename, UID change, or home move, arrange for that account's processes to stop before retrying.</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>This lesson covers local accounts managed by the Linux shadow utilities. If an identity comes from Active Directory, LDAP, or another central service, use that service's administration workflow. A name returned by <code>getent</code> is not proof that it is a local account.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Check your understanding</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What is the difference between useradd and usermod?</li><li>Why do we use -aG rather than -G when adding one group?</li><li>Does -g use the same meaning as -G?</li><li>Why can id -nG labtech show a new membership while labtech's existing session cannot use it?</li><li>Does changing the login name automatically move the home directory?</li><li>Does locking the password block every possible login method?</li></ol>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><strong>Answers:</strong> useradd creates; usermod modifies. -aG appends; -G alone replaces the supplementary list. -g changes the primary group. Existing processes retain their group lists. A login-name change does not automatically move the home directory. A password lock does not block every authentication method.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What to remember</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Inspect the account, change only the intended setting, and verify the result.</strong> For adding supplementary membership, the pattern is <code>sudo usermod -aG group user</code>. Remember the lowercase <code>a</code>; it keeps the existing supplementary groups.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>Presentation note: commands and sample output are plain text, with no simulated terminal colors. Terminal palettes depend on the application, profile, and theme. The comparison diagram uses labeled paths rather than claiming to reproduce a terminal.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->