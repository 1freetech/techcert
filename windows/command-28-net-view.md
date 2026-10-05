---
title: "Windows Command #28 – net view (Windows OS)"
status: published
wordpress_post_id: 20228
published: "2026-10-03T07:51:45"
live_url: "https://bitcoinversus.tech/2026/10/03/windows-command-28-net-view/"
series: "Windows Commands"
pathway: windows
lesson_number: "28"
featured_media_id: 20227
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-28-net-view-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=SNHTmnMUUGM"
youtube_2: "https://www.youtube.com/watch?v=c_ZlwFktayQ"
youtube_3: "https://www.youtube.com/watch?v=CMQo71ShxMg"
---

# Windows Command #28 – net view (Windows OS)

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong><code>net view</code> lets you view Windows computers or shared resources that are visible to the command.</strong></p>

<p class="wp-block-paragraph">The easiest way to remember it is:</p>
<ul class="wp-block-list"><li><strong><code>net share</code>:</strong> “What is this computer sharing?”</li><li><strong><code>net view</code>:</strong> “What computers or shared resources can I view?”</li></ul>

<h2 class="wp-block-heading">Start with the smallest command</h2>
<pre class="wp-block-code"><code>net view</code></pre>

<p class="wp-block-paragraph">With no computer name added, <code>net view</code> can display computers available in the current network/domain browsing context.</p>

<p class="wp-block-paragraph">A simple example might look like this:</p>
<pre class="wp-block-code"><code>Server Name
-------------------------
\\OFFICE-PC
\\FILE-SERVER
\\LAB-PC

The command completed successfully.</code></pre>

<p class="wp-block-paragraph">The names beginning with <code>\\</code> are Windows network computer names.</p>

<h2 class="wp-block-heading">Video 1: Viewing and managing Windows network shares from Command Prompt</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/SNHTmnMUUGM?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This command-line tutorial shows how Windows shared resources can be viewed and managed from Command Prompt.</em></figcaption></figure>

<h2 class="wp-block-heading">View the shares on one computer</h2>
<p class="wp-block-paragraph">If you already know the computer name, add it after <code>net view</code>:</p>

<pre class="wp-block-code"><code>net view \\FILE-SERVER</code></pre>

<p class="wp-block-paragraph">This asks Windows to show resources shared by the computer named <code>FILE-SERVER</code>.</p>

<p class="wp-block-paragraph">A simple result might include:</p>
<pre class="wp-block-code"><code>Share name
-------------------------
Public
Projects</code></pre>

<p class="wp-block-paragraph">That does not automatically mean your account has permission to open every share. It means the resource was listed for you; access permissions are a separate question.</p>

<h2 class="wp-block-heading">A simple office example</h2>
<p class="wp-block-paragraph">Your team tells you that shared files are stored on a computer named <code>FILE-SERVER</code>.</p>

<p class="wp-block-paragraph">First, ask what it is sharing:</p>
<pre class="wp-block-code"><code>net view \\FILE-SERVER</code></pre>

<p class="wp-block-paragraph">If you see a share named <code>Public</code>, its normal UNC path would be:</p>
<pre class="wp-block-code"><code>\\FILE-SERVER\Public</code></pre>

<p class="wp-block-paragraph">UNC is simply the common Windows format for naming a network computer and one of its shared resources.</p>

<h2 class="wp-block-heading">Video 2: Windows network sharing</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/c_ZlwFktayQ?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This Windows 11 tutorial provides visual context for files, folders, drives, and computers shared over a network.</em></figcaption></figure>

<h2 class="wp-block-heading">Why might net view show less than you expect?</h2>
<p class="wp-block-paragraph">A computer being connected to the same network does not guarantee that it will appear in every browsing list. Windows discovery and sharing settings, firewall rules, network configuration, permissions, and the target computer&#8217;s services can all affect what is visible.</p>

<p class="wp-block-paragraph">So if <code>net view</code> does not show a computer, do not immediately conclude that the computer is powered off.</p>

<h2 class="wp-block-heading">Video 3: Network Discovery troubleshooting</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/CMQo71ShxMg?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This Windows 11 guide shows why Network Discovery matters when computers are not appearing as expected.</em></figcaption></figure>

<h2 class="wp-block-heading">How the last three Windows commands fit together</h2>
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/02/windows-command-26-net-use/"><strong>net use</strong></a> — connect to or inspect network resource connections.</li><li><a href="https://bitcoinversus.tech/2026/10/02/windows-command-27-net-share/"><strong>net share</strong></a> — display or manage resources shared by the local computer.</li><li><strong>net view</strong> — display computers or resources shared by a specified computer.</li></ul>

<p class="wp-block-paragraph">A simple memory trick is: <strong>use = connect, share = offer, view = look.</strong></p>

<h2 class="wp-block-heading">Simple data-center example</h2>
<p class="wp-block-paragraph">A technician is given a Windows file server named <code>OPS-FILE-01</code> and needs to confirm which ordinary shares are being advertised to the account.</p>

<pre class="wp-block-code"><code>net view \\OPS-FILE-01</code></pre>

<p class="wp-block-paragraph">The result gives the technician a quick starting point before opening File Explorer or mapping a share.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Confusing <code>net view</code> with <code>net share</code>.</li><li>Forgetting the two leading backslashes before a computer name.</li><li>Assuming every computer on the physical network must appear in <code>net view</code>.</li><li>Assuming a listed share automatically means your account can open it.</li><li>Assuming an empty or failed result proves the remote computer is offline.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<p class="wp-block-paragraph">Use only computers and network resources you are authorized to access.</p>
<ol class="wp-block-list"><li>Open Command Prompt.</li><li>Run <code>net view</code>.</li><li>Choose an authorized Windows computer name from your lab.</li><li>Run <code>net view \\COMPUTER-NAME</code>.</li><li>Explain the difference between a computer name and a share name.</li><li>Explain the difference between <code>net share</code> and <code>net view</code>.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong><code>net view</code> is a simple Windows command for viewing network computers or resources shared by a specified computer.</strong> Use <code>net view</code> for the browsing list, and <code>net view \\ComputerName</code> when you want to ask what that specific computer is sharing.</p>
