---
title: "Windows Command #23 – net user (Windows OS)"
status: published
wordpress_post_id: 20048
published: "2026-10-02T12:10:46"
live_url: "https://bitcoinversus.tech/2026/10/02/windows-command-23-net-user/"
series: "Windows Commands"
pathway: windows
command_number: "23"
command: "net user"
featured_media_id: 20047
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-23-net-user-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=lhU2-1r-hdE"
youtube_2: "https://www.youtube.com/watch?v=zg95jHfYSQ8"
youtube_3: "https://www.youtube.com/watch?v=L9SxnXeRX5U"
---

# Windows Command #23 – net user (Windows OS)

Original published WordPress article content, preserved below in full:



<p class="has-large-font-size wp-block-paragraph"><strong>The Windows <code>net user</code> command lets you list user accounts, inspect an account, and—when you have authorization and sufficient privileges—manage local or domain user accounts from Command Prompt.</strong></p>



<p class="wp-block-paragraph">The previous lesson, <a href="https://bitcoinversus.tech/2026/10/02/windows-command-22-whoami/">Windows Command #22 – whoami</a>, answers “Which account is this terminal using?” <code>net user</code> answers a different question: “Which user accounts exist here, and what does Windows know about one of them?”</p>



<h2 class="wp-block-heading">Start by listing local users</h2>



<pre class="wp-block-code"><code>net user</code></pre>



<p class="wp-block-paragraph">Run <code>net user</code> with no username to display local user accounts known to the computer. The exact names depend on the machine and its configuration.</p>



<pre class="wp-block-code"><code>C:\&gt; net user

User accounts for \\LAB-PC

-------------------------------------------------------------------------------
Administrator            labtech                  Guest
The command completed successfully.</code></pre>



<p class="wp-block-paragraph">This example is fictional. It shows three local account names on a computer named <code>LAB-PC</code>.</p>



<h2 class="wp-block-heading">Video 1: Complete net user walkthrough</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/lhU2-1r-hdE?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Jantersand Studio demonstrates common Windows net user operations for local accounts.</em></figcaption></figure>



<h2 class="wp-block-heading">Inspect one account</h2>



<pre class="wp-block-code"><code>net user labtech</code></pre>



<p class="wp-block-paragraph">Adding a username asks Windows for details about that account. Depending on the account and system, the output can include whether the account is active, password-related settings, local group memberships, profile information, and recent logon data.</p>



<p class="wp-block-paragraph">This is especially useful after <code>whoami</code>. First confirm the identity of the current shell, then use <code>net user username</code> to inspect the local account record.</p>



<h2 class="wp-block-heading">Local computer vs. domain</h2>



<pre class="wp-block-code"><code>net user
net user labtech
net user /domain
net user labtech /domain</code></pre>



<p class="wp-block-paragraph">Without <code>/domain</code>, <code>net user</code> normally works with the local computer’s account database. On a domain-connected system, <code>/domain</code> asks the command to work against the current domain instead. Domain queries depend on connectivity, permissions, and the organization’s directory configuration.</p>



<h2 class="wp-block-heading">Video 2: Managing Windows accounts with net user</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/zg95jHfYSQ8?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Computerbasics walks through listing Windows users and several common account-management tasks with net user.</em></figcaption></figure>



<h2 class="wp-block-heading">Account-management syntax</h2>



<p class="wp-block-paragraph"><code>net user</code> can also change accounts. These forms should be used only on systems you are authorized to administer:</p>



<pre class="wp-block-code"><code>net user trainee StrongExamplePassword! /add
net user trainee /active:no
net user trainee /active:yes
net user trainee /delete</code></pre>



<p class="wp-block-paragraph">The first example creates a fictional local account named <code>trainee</code>. The next two disable and re-enable it. The last deletes the account record. Administrative privileges are typically required for account changes.</p>



<p class="wp-block-paragraph">For a real environment, follow the organization’s password policy and identity-management process rather than copying an example password.</p>



<h2 class="wp-block-heading">Avoid exposing passwords in command history</h2>



<p class="wp-block-paragraph">Typing a password directly into a command can expose it on-screen, in documentation, screenshots, terminal history, or support logs. When possible, use approved administrative tools and workflows that do not leave credentials visible in plaintext.</p>



<h2 class="wp-block-heading">Useful account questions</h2>



<ul class="wp-block-list"><li><strong>Which account am I using?</strong> <code>whoami</code></li><li><strong>Which local accounts exist?</strong> <code>net user</code></li><li><strong>What information is stored for one account?</strong> <code>net user username</code></li><li><strong>Which groups are in my current security token?</strong> <code>whoami /groups</code></li><li><strong>Which domain accounts are visible?</strong> <code>net user /domain</code> on an appropriate domain-connected system</li></ul>



<h2 class="wp-block-heading">Data-center troubleshooting example</h2>



<p class="wp-block-paragraph">A technician reaches a Windows management workstation and an application refuses to run under the expected service account. A sensible first pass is:</p>



<pre class="wp-block-code"><code>hostname
whoami
net user
net user serviceaccount</code></pre>



<p class="wp-block-paragraph"><code>hostname</code> confirms the computer, <code>whoami</code> confirms the current identity, <code>net user</code> confirms the local account list, and <code>net user serviceaccount</code> checks whether that local account record exists and how Windows reports it.</p>



<h2 class="wp-block-heading">Video 3: Create a Windows user from Command Prompt</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/L9SxnXeRX5U?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Kapil Arya MVP demonstrates creating a Windows user from Command Prompt with net user and compares the workflow with PowerShell.</em></figcaption></figure>



<h2 class="wp-block-heading">Built-in help</h2>



<pre class="wp-block-code"><code>net user /?
net help user</code></pre>



<p class="wp-block-paragraph">Use the built-in help before making changes. Windows displays the available syntax and switches supported by the installed command.</p>



<h2 class="wp-block-heading">Common beginner mistakes</h2>



<ul class="wp-block-list"><li>Confusing <code>whoami</code> with <code>net user</code>. The first reports the current identity; the second works with account records.</li><li>Assuming every account shown in an organization is a local account.</li><li>Using <code>/domain</code> on a computer that is not connected to the expected domain environment.</li><li>Attempting account changes from a non-elevated shell and assuming the syntax is wrong when permissions are the real issue.</li><li>Putting real passwords into screenshots, notes, scripts, or training examples.</li></ul>



<h2 class="wp-block-heading">Practice</h2>



<ol class="wp-block-list"><li>Open Command Prompt.</li><li>Run <code>whoami</code>.</li><li>Run <code>net user</code>.</li><li>Find your local account name if it appears in the list.</li><li>Run <code>net user yourusername</code> using your own account name.</li><li>Identify whether the account is active.</li><li>Run <code>net user /?</code> and find the description of <code>/domain</code>.</li></ol>



<h2 class="wp-block-heading">Previous Windows lessons</h2>



<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/windows-command-22-whoami/">Windows Command #22 – whoami (Windows OS)</a></p>



<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/01/windows-command-21-getmac/">Windows Command #21 – getmac (Windows OS)</a></p>



<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/01/windows-command-20-hostname/">Windows Command #20 – hostname (Windows OS)</a></p>



<h2 class="wp-block-heading">Reference</h2>



<p class="wp-block-paragraph"><a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/net-user">Microsoft’s net user command reference</a></p>



<h2 class="wp-block-heading">Key takeaway</h2>



<p class="wp-block-paragraph">Use <code>net user</code> to list Windows user accounts and inspect account details from Command Prompt. Pair it with <code>whoami</code> when troubleshooting identity: one tells you who the shell is running as, while the other tells you what account records Windows knows about.</p>


