---
title: "Linux Command #37 – passwd (Linux OS)"
status: published
wordpress_post_id: 20122
published: "2026-10-02T17:31:40"
live_url: "https://bitcoinversus.tech/2026/10/02/linux-command-37-passwd/"
series: "Linux Commands"
pathway: linux
command_number: "37"
command: "passwd"
featured_media_id: 20121
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-37-passwd-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=M9FccMReqzQ"
youtube_2: "https://www.youtube.com/watch?v=eLFaHclixdI"
youtube_3: "https://www.youtube.com/watch?v=5jZFjy5Lk4U"
---

# Linux Command #37 – passwd (Linux OS)

Original published WordPress article content, preserved below in full:


<p class="has-large-font-size wp-block-paragraph"><strong>The Linux <code>passwd</code> command changes account passwords and gives administrators several controls for locking, unlocking, expiring, and inspecting password state.</strong></p>



<p class="wp-block-paragraph">In <a href="https://bitcoinversus.tech/2026/10/02/linux-command-36-getent/">Linux Command #36 – getent</a>, we queried account information from Linux system databases. <code>passwd</code> moves from lookup to account maintenance: it changes authentication credentials for your own account or, with appropriate privileges, another local account.</p>



<h2 class="wp-block-heading">Change your own password</h2>



<pre class="wp-block-code"><code>passwd</code></pre>



<p class="wp-block-paragraph">Run <code>passwd</code> without a username to change the password for the account you are currently using. The command normally asks for your current password and then prompts for the new password twice.</p>



<p class="wp-block-paragraph">Passwords are not displayed while you type them. A blank-looking prompt does not mean the keyboard stopped working; the terminal intentionally avoids echoing the password.</p>



<h2 class="wp-block-heading">Video 1: Using the passwd command</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/M9FccMReqzQ?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Learn Linux TV demonstrates the passwd command, including changing your own password and administering another user’s password.</em></figcaption></figure>



<h2 class="wp-block-heading">Change another user’s password</h2>



<pre class="wp-block-code"><code>sudo passwd alex</code></pre>



<p class="wp-block-paragraph">An administrator can specify a username. With <code>sudo</code>, this example sets a new password for the account named <code>alex</code>. The administrator is asked to enter and confirm the new password rather than needing to know the user&#8217;s existing password.</p>



<p class="wp-block-paragraph">This is useful when provisioning a local account or resetting credentials, but it should be handled according to the organization’s access-control procedures.</p>



<h2 class="wp-block-heading">Check password status</h2>



<pre class="wp-block-code"><code>passwd -S
sudo passwd -S alex</code></pre>



<p class="wp-block-paragraph">The <code>-S</code> option reports password status. Depending on the Linux distribution, the output can include whether the account has a usable password, when it was last changed, and password-aging values.</p>



<h2 class="wp-block-heading">Lock and unlock a password</h2>



<pre class="wp-block-code"><code>sudo passwd -l alex
sudo passwd -u alex</code></pre>



<p class="wp-block-paragraph"><code>-l</code> locks the account&#8217;s password by making the stored password hash unusable for normal password authentication. <code>-u</code> unlocks it. Locking a password is not always the same as disabling every possible way an account could authenticate, so administrators should understand the system&#8217;s SSH keys, PAM configuration, and other login methods.</p>



<h2 class="wp-block-heading">Video 2: Linux account security and PAM</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/eLFaHclixdI?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Red Hat Enterprise Linux explains account maintenance and the PAM framework that sits underneath Linux password and authentication workflows.</em></figcaption></figure>



<h2 class="wp-block-heading">Expire a password</h2>



<pre class="wp-block-code"><code>sudo passwd -e alex</code></pre>



<p class="wp-block-paragraph">The <code>-e</code> option expires the password immediately. On a typical password-login workflow, that forces the user to choose a new password the next time the account authenticates through a path that honors password expiration.</p>



<h2 class="wp-block-heading">Delete a stored password carefully</h2>



<pre class="wp-block-code"><code>sudo passwd -d alex</code></pre>



<p class="wp-block-paragraph">The <code>-d</code> option removes the account&#8217;s password. This is an administrative operation and should not be confused with locking an account. Depending on system policy, an account without a password may behave differently from a locked account, so do not use this option casually on production systems.</p>



<h2 class="wp-block-heading">Where Linux stores account information</h2>



<p class="wp-block-paragraph">Basic account metadata appears in <code>/etc/passwd</code>, while password hashes and password-aging information for local accounts are normally stored in the protected <code>/etc/shadow</code> file. Regular users should not be able to read the shadow file directly.</p>



<pre class="wp-block-code"><code>getent passwd "$USER"
sudo passwd -S "$USER"</code></pre>



<p class="wp-block-paragraph">This pairs the previous lesson with the current one: <code>getent</code> looks up the account, while <code>passwd</code> reports or changes password state.</p>



<h2 class="wp-block-heading">Video 3: User and group administration</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/5jZFjy5Lk4U?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Verified education channel ProgrammingKnowledge provides a dedicated Linux passwd tutorial that reinforces password-changing syntax and command-line usage.</em></figcaption></figure>



<h2 class="wp-block-heading">A technician workflow</h2>



<p class="wp-block-paragraph">Suppose a local maintenance account exists on a Linux management server but the technician cannot authenticate with its password. Start by confirming the account and then inspect its password state before changing anything:</p>



<pre class="wp-block-code"><code>getent passwd technician
sudo passwd -S technician</code></pre>



<p class="wp-block-paragraph">If the account exists and the password is locked or expired, the status output gives you evidence before you decide whether the approved fix is an unlock, password reset, or expiration change. This is safer than immediately overwriting credentials without checking the account state.</p>



<h2 class="wp-block-heading">Useful passwd options</h2>



<ul class="wp-block-list"><li><code>passwd</code> — change your own password.</li><li><code>sudo passwd USER</code> — set another local user&#8217;s password.</li><li><code>passwd -S</code> — display password status.</li><li><code>sudo passwd -l USER</code> — lock password authentication for an account.</li><li><code>sudo passwd -u USER</code> — unlock the password.</li><li><code>sudo passwd -e USER</code> — expire the password now.</li><li><code>sudo passwd -d USER</code> — delete the stored password; use with care.</li></ul>



<h2 class="wp-block-heading">Common beginner mistakes</h2>



<ul class="wp-block-list"><li>Thinking nothing is being typed because password characters are hidden.</li><li>Confusing the <code>/etc/passwd</code> account database with the <code>passwd</code> command.</li><li>Assuming <code>passwd -l</code> disables every possible authentication method.</li><li>Resetting another user&#8217;s password before checking whether the account is locked or expired.</li><li>Using <code>passwd -d</code> when the real goal is to lock an account.</li><li>Changing production credentials without following the site&#8217;s access-control and change procedures.</li></ul>



<h2 class="wp-block-heading">Practice</h2>



<ol class="wp-block-list"><li>Run <code>passwd -S</code> for your own account.</li><li>Run <code>getent passwd "$USER"</code> and compare the account information with the password-status output.</li><li>On a disposable lab VM, create or use a test account and inspect it with <code>sudo passwd -S USER</code>.</li><li>If permitted in your lab, lock and unlock only that test account and observe how the status changes.</li><li>Explain in one sentence why locking a password is not necessarily identical to disabling an entire account.</li></ol>



<h2 class="wp-block-heading">Key takeaway</h2>



<p class="wp-block-paragraph"><code>passwd</code> is more than a password-change command. It also lets administrators inspect, lock, unlock, expire, and remove local password credentials. Use the status option first when troubleshooting, understand that password state is only one part of Linux authentication, and make administrative changes only through an approved workflow.</p>

