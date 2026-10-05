---
title: "Linux Command #35 – groups (Linux OS)"
status: published
wordpress_post_id: 20024
published: "2026-10-02T10:49:50"
live_url: "https://bitcoinversus.tech/2026/10/02/linux-command-35-groups/"
series: "Linux Commands"
pathway: linux
command_number: "35"
command: "groups"
featured_media_id: 20023
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-35-groups-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=88hgZJPoP14"
youtube_2: "https://www.youtube.com/watch?v=RecADYq9E30"
youtube_3: "https://www.youtube.com/watch?v=tlSWXBah904"
---

# Linux Command #35 – groups (Linux OS)

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>The Linux <code>groups</code> command shows which user groups an account belongs to.</strong></p>

<p class="wp-block-paragraph">If you have ever been added to a team at work, a group chat, or a multiplayer squad, you already understand the basic idea. Linux groups collect users together so the system can give several accounts the same access or permissions.</p>

<h2 class="wp-block-heading">Start with groups</h2>
<pre class="wp-block-code"><code>groups</code></pre>
<p class="wp-block-paragraph">Run the command with no extra options to see the groups associated with your current account.</p>

<pre class="wp-block-code"><code>$ groups
burton sudo developers</code></pre>
<p class="wp-block-paragraph">This example says the current user belongs to three groups: <code>burton</code>, <code>sudo</code>, and <code>developers</code>. Your own output will be different.</p>

<h2 class="wp-block-heading">Video 1: The groups command</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/88hgZJPoP14?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>LinuxSimply demonstrates the Linux groups command with practical examples.</em></figcaption></figure>

<h2 class="wp-block-heading">Why groups exist</h2>
<p class="wp-block-paragraph">Imagine five people share a computer project. Instead of configuring the same access separately for all five accounts, Linux can place them in one group and assign access to that group.</p>
<ul class="wp-block-list"><li>A <strong>user</strong> is an individual account.</li><li>A <strong>group</strong> is a collection of user accounts.</li><li>Group membership can help determine what files, folders, devices, or administrative actions a user may access.</li></ul>

<p class="wp-block-paragraph">The previous lesson, <a href="https://bitcoinversus.tech/2026/10/02/linux-command-34-id/">Linux Command #34 – id</a>, shows user and group IDs. <code>groups</code> is narrower: it gives you a quick list of group names.</p>

<h2 class="wp-block-heading">Check another user</h2>
<pre class="wp-block-code"><code>groups alex</code></pre>
<p class="wp-block-paragraph">If the account exists and you are allowed to query it, this asks Linux to display the groups associated with <code>alex</code>.</p>

<h2 class="wp-block-heading">Video 2: Creating and working with Linux groups</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/RecADYq9E30?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This Linux tutorial shows how groups are created and used, giving context to the membership displayed by the groups command.</em></figcaption></figure>

<h2 class="wp-block-heading">A familiar permissions example</h2>
<p class="wp-block-paragraph">Suppose a family computer has a folder that only members of a <code>photos</code> group may edit. If your username appears as a member of <code>photos</code>, Linux can use that membership when deciding whether you have group-level access.</p>

<p class="wp-block-paragraph">At work, the same idea might be used for a shared project folder. On a Linux server, a group might collect the accounts that are allowed to perform a particular task. The exact permissions are configured elsewhere; <code>groups</code> simply helps you see membership.</p>

<h2 class="wp-block-heading">Simple data-center example</h2>
<p class="wp-block-paragraph">You log into a Linux management computer and a tool says you do not have permission to use a shared file. Running <code>groups</code> is a quick first check: are you actually a member of the team group that should have access?</p>

<h2 class="wp-block-heading">Video 3: Managing users and groups from the command line</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/tlSWXBah904?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This command-line demonstration shows users, groups, and shared group access working together.</em></figcaption></figure>

<h2 class="wp-block-heading">groups vs. id</h2>
<ul class="wp-block-list"><li><code>groups</code>: quickly lists group names.</li><li><code>id</code>: shows more identity information, including numeric user and group IDs.</li></ul>
<p class="wp-block-paragraph">Use <code>groups</code> when the simple question is: <strong>Which groups does this user belong to?</strong></p>

<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list"><li>Open a Linux terminal.</li><li>Run <code>groups</code>.</li><li>Count how many group names appear.</li><li>Run <code>id</code> and find the group information there.</li><li>In one sentence, explain why putting several users into one group can make permissions easier to manage.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><code>groups</code> answers one straightforward Linux question: <strong>Which groups does this user belong to?</strong> It is a fast identity and permissions troubleshooting command and a natural companion to <code>whoami</code> and <code>id</code>.</p>
