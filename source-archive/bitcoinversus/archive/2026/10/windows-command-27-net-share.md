---
title: "Windows Command #27 – net share (Windows OS)"
status: published
wordpress_post_id: 20173
published: "2026-10-02T19:39:34"
live_url: "https://bitcoinversus.tech/2026/10/02/windows-command-27-net-share/"
series: "Windows Commands"
pathway: windows
command_number: "27"
command: "net share"
featured_media_id: 20172
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-27-net-share-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=JmVrqSVBu90"
youtube_2: "https://www.youtube.com/watch?v=iAf3nb_nToQ"
youtube_3: "https://www.youtube.com/watch?v=3kdavfiNogM"
---

# Windows Command #27 – net share (Windows OS)

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>The Windows <code>net share</code> command shows and manages folders or other resources that your computer shares over a network.</strong></p>

<p class="wp-block-paragraph">Think of a shared folder like a team locker: the files stay on one computer, but approved people on other computers can reach that shared location over the network. <code>net share</code> lets you inspect that sharing from Command Prompt.</p>

<h2 class="wp-block-heading">List the shares on your computer</h2>
<pre class="wp-block-code"><code>net share</code></pre>
<p class="wp-block-paragraph">With no additional parameters, <code>net share</code> displays the resources shared by the local computer. You may see ordinary folder shares plus built-in administrative shares such as <code>IPC$</code>.</p>
<pre class="wp-block-code"><code>C:\&gt;net share

Share name   Resource
---------------------------------
Public       C:\Shared\Public
Projects     D:\Projects
IPC$</code></pre>

<h2 class="wp-block-heading">Video 1: Creating Windows network shares</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=JmVrqSVBu90?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span>
</div><figcaption class="wp-element-caption"><em>This demonstration includes the net share command as one method for creating Windows shared folders.</em></figcaption></figure>

<h2 class="wp-block-heading">Look at one specific share</h2>
<pre class="wp-block-code"><code>net share Public</code></pre>
<p class="wp-block-paragraph">Adding the share name asks Windows for information about that particular shared resource.</p>

<h2 class="wp-block-heading">Create a simple share</h2>
<p class="wp-block-paragraph">From an appropriately elevated Command Prompt, the basic pattern is:</p>
<pre class="wp-block-code"><code>net share Public=C:\Shared\Public</code></pre>
<p class="wp-block-paragraph">This tells Windows to expose the local folder <code>C:\Shared\Public</code> on the network under the share name <code>Public</code>. The folder must already exist.</p>

<p class="wp-block-paragraph">Be deliberate when creating shares. A network share can expose files to other systems, and both share permissions and the folder&#8217;s normal Windows security permissions matter.</p>

<h2 class="wp-block-heading">Video 2: Windows file and folder sharing</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=iAf3nb_nToQ?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span>
</div><figcaption class="wp-element-caption"><em>This Windows Server tutorial demonstrates how shared folders are configured and used on a Windows network.</em></figcaption></figure>

<h2 class="wp-block-heading">net share vs. net use</h2>
<p class="wp-block-paragraph">The previous lesson, <a href="https://bitcoinversus.tech/2026/10/02/windows-command-26-net-use/">Windows Command #26 – net use</a>, focuses on connecting your computer to a shared network resource. <code>net share</code> looks at the other side of that relationship: resources your local computer is making available.</p>
<ul class="wp-block-list"><li><code>net use</code>: connect to or inspect network resources your computer is using.</li><li><code>net share</code>: inspect or manage resources your computer is sharing.</li></ul>

<h2 class="wp-block-heading">Stop sharing a folder</h2>
<pre class="wp-block-code"><code>net share Public /delete</code></pre>
<p class="wp-block-paragraph">This removes the <strong>share</strong>. It does not mean “delete all the files in the folder.” Still, read the command carefully and verify the share name before changing a real system.</p>

<h2 class="wp-block-heading">Video 3: Create a Windows network shared folder</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=3kdavfiNogM?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span>
</div><figcaption class="wp-element-caption"><em>This focused walkthrough demonstrates creating a Windows network shared folder—the resource type that net share displays and manages.</em></figcaption></figure>

<h2 class="wp-block-heading">Simple workplace example</h2>
<p class="wp-block-paragraph">A small office keeps common documents in <code>C:\TeamFiles</code>. The computer hosting those files can publish the folder as <code>TeamFiles</code>. Other authorized computers can then connect to that network share. If someone asks, “What is this computer currently sharing?”, <code>net share</code> gives you a quick command-line answer.</p>

<h2 class="wp-block-heading">Simple data-center example</h2>
<p class="wp-block-paragraph">A Windows maintenance workstation may expose a folder containing approved installers or documentation to other authorized machines. Before troubleshooting a client connection, a technician can run <code>net share</code> on the host to confirm that the expected share actually exists.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Confusing the local folder path with the share name.</li><li>Confusing <code>net share</code> with <code>net use</code>.</li><li>Creating a share and assuming that automatically gives every user permission to the files.</li><li>Changing or deleting a share without first verifying which users or systems depend on it.</li></ul>

<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list"><li>Open Command Prompt.</li><li>Run <code>net share</code>.</li><li>Identify the <strong>share name</strong> and <strong>resource path</strong> columns.</li><li>Compare the purpose of <code>net share</code> with <code>net use</code>.</li><li>Explain in one sentence why a shared folder and a normal local folder are not exactly the same thing.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><code>net share</code> answers a simple Windows networking question: <strong>What resources is this computer sharing?</strong> It can also create, inspect, and remove shares, making it useful for basic file-sharing setup and troubleshooting.</p>
