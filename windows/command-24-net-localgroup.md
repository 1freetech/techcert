---
title: "Windows Command #24 – net localgroup (Windows OS)"
status: published
wordpress_post_id: 20053
published: "2026-10-02T12:17:13"
live_url: "https://bitcoinversus.tech/2026/10/02/windows-command-24-net-localgroup/"
series: "Windows Commands"
pathway: windows
command_number: "24"
command: "net localgroup"
featured_media_id: 20052
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-24-net-localgroup-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=8r1XUnuVKzc"
youtube_2: "https://www.youtube.com/watch?v=--20jetcfQ8"
youtube_3: "https://www.youtube.com/watch?v=vFxkyM0mLl4"
---

# Windows Command #24 – net localgroup (Windows OS)

Original published WordPress article content, preserved below in full:



<p class="has-large-font-size wp-block-paragraph"><strong>The Windows <code>net localgroup</code> command lets you list local groups, inspect group membership, and—when authorized—add or remove users from local groups.</strong></p>



<p class="wp-block-paragraph">In <a href="https://bitcoinversus.tech/2026/10/02/windows-command-23-net-user/">Windows Command #23 – net user</a>, we worked with user accounts. <code>net localgroup</code> moves one level up: it shows how Windows organizes those users into local groups such as <code>Users</code>, <code>Administrators</code>, and <code>Remote Desktop Users</code>.</p>



<h2 class="wp-block-heading">List local groups</h2>



<pre class="wp-block-code"><code>net localgroup</code></pre>



<p class="wp-block-paragraph">Run the command with no group name to display local groups configured on the computer.</p>



<pre class="wp-block-code"><code>C:\&gt; net localgroup

Aliases for \\LAB-PC

-------------------------------------------------------------------------------
*Administrators
*Backup Operators
*Remote Desktop Users
*Users
The command completed successfully.</code></pre>



<p class="wp-block-paragraph">This example is fictional. Your Windows edition and installed software may create additional local groups.</p>



<h2 class="wp-block-heading">Video 1: net localgroup walkthrough</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/8r1XUnuVKzc?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This walkthrough demonstrates listing local groups, creating a group, viewing membership, and adding or removing members with net localgroup.</em></figcaption></figure>



<h2 class="wp-block-heading">Inspect one group</h2>



<pre class="wp-block-code"><code>net localgroup Administrators
net localgroup Users
net localgroup "Remote Desktop Users"</code></pre>



<p class="wp-block-paragraph">Adding a group name displays the members of that group. Put names containing spaces inside quotation marks.</p>



<p class="wp-block-paragraph">For example, <code>net localgroup Administrators</code> is a quick way to see which accounts currently belong to the local Administrators group. Listing a group is a read-only operation; it does not grant anyone new permissions.</p>



<h2 class="wp-block-heading">Video 2: View local groups in Windows</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/--20jetcfQ8?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Laurence Tindall demonstrates using net localgroup from Command Prompt to display the local groups configured on a Windows computer.</em></figcaption></figure>



<h2 class="wp-block-heading">Add a user to a local group</h2>



<p class="wp-block-paragraph">On a computer you are authorized to administer, the general syntax is:</p>



<pre class="wp-block-code"><code>net localgroup GroupName UserName /add</code></pre>



<p class="wp-block-paragraph">For a fictional support account:</p>



<pre class="wp-block-code"><code>net localgroup "Remote Desktop Users" labtech /add</code></pre>



<p class="wp-block-paragraph">This adds the fictional <code>labtech</code> account to the local <code>Remote Desktop Users</code> group. Membership changes usually require an elevated Command Prompt and should follow the organization’s access-control policy.</p>



<h2 class="wp-block-heading">Remove a user from a local group</h2>



<pre class="wp-block-code"><code>net localgroup "Remote Desktop Users" labtech /delete</code></pre>



<p class="wp-block-paragraph">The <code>/delete</code> switch removes that account from the specified group. It does not delete the user account itself. That distinction matters: group membership and the underlying account are separate objects.</p>



<h2 class="wp-block-heading">Video 3: Administrator-group example</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/vFxkyM0mLl4?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Windows Report demonstrates several ways to change account type in Windows 11, including net localgroup from the terminal.</em></figcaption></figure>



<h2 class="wp-block-heading">Create or delete a custom local group</h2>



<p class="wp-block-paragraph">Administrators can also create custom local groups for approved workflows:</p>



<pre class="wp-block-code"><code>net localgroup "Mining Ops" /add
net localgroup "Mining Ops"
net localgroup "Mining Ops" /delete</code></pre>



<p class="wp-block-paragraph">The first command creates a fictional group named <code>Mining Ops</code>. The second displays its members. The third removes the group. Creating or deleting groups should be done only when the change matches an approved system design.</p>



<h2 class="wp-block-heading">net user vs. net localgroup</h2>



<ul class="wp-block-list"><li><code>net user</code> — list and inspect user accounts.</li><li><code>net localgroup</code> — list local groups and inspect their membership.</li><li><code>net user username</code> — show details about one account.</li><li><code>net localgroup groupname</code> — show members of one group.</li></ul>



<p class="wp-block-paragraph">Together, the two commands provide a quick command-line view of local Windows identity structure.</p>



<h2 class="wp-block-heading">Data-center troubleshooting example</h2>



<p class="wp-block-paragraph">A technician can sign into a Windows management station but cannot use a tool restricted to a specific local support group. A sensible read-only check is:</p>



<pre class="wp-block-code"><code>whoami
net user
net localgroup
net localgroup "Remote Desktop Users"</code></pre>



<p class="wp-block-paragraph">These commands confirm the current identity, show local accounts, show available groups, and inspect one group’s membership. If the expected account is missing, the next step is to follow the organization’s authorization process before changing membership.</p>



<h2 class="wp-block-heading">Built-in help</h2>



<pre class="wp-block-code"><code>net localgroup /?
net help localgroup</code></pre>



<p class="wp-block-paragraph">Use the built-in help to review syntax supported by the installed Windows version before making changes.</p>



<h2 class="wp-block-heading">Common beginner mistakes</h2>



<ul class="wp-block-list"><li>Confusing a group with a user account.</li><li>Forgetting quotation marks around group names that contain spaces.</li><li>Assuming membership in <code>Users</code> and <code>Administrators</code> is equivalent.</li><li>Using <code>/delete</code> on the group when the intention was only to remove one member.</li><li>Trying to change protected group membership without an elevated and authorized session.</li><li>Adding users to privileged groups without a documented operational need.</li></ul>



<h2 class="wp-block-heading">Practice</h2>



<ol class="wp-block-list"><li>Open Command Prompt.</li><li>Run <code>net localgroup</code>.</li><li>Identify the <code>Users</code> group.</li><li>Run <code>net localgroup Users</code>.</li><li>Run <code>net localgroup Administrators</code>.</li><li>Compare those results with <code>net user yourusername</code>.</li><li>In one sentence, explain the difference between a Windows user account and a local group.</li></ol>



<h2 class="wp-block-heading">Previous Windows lessons</h2>



<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/windows-command-23-net-user/">Windows Command #23 – net user (Windows OS)</a></p>



<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/windows-command-22-whoami/">Windows Command #22 – whoami (Windows OS)</a></p>



<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/01/windows-command-21-getmac/">Windows Command #21 – getmac (Windows OS)</a></p>



<h2 class="wp-block-heading">Reference</h2>



<p class="wp-block-paragraph"><a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/net-localgroup">Microsoft’s net localgroup command reference</a></p>



<h2 class="wp-block-heading">Key takeaway</h2>



<p class="wp-block-paragraph"><code>net localgroup</code> gives Windows administrators and technicians a fast way to inspect local groups and membership from Command Prompt. Start with read-only listing commands, and make membership changes only on systems you are authorized to administer.</p>


