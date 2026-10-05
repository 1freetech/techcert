---
title: "Windows Command #26 – net use (Windows OS)"
wordpress_post_id: 20132
source: BitcoinVersus.tech
published: 2026-10-02T17:37:18
modified: 2026-10-02T17:38:53
live_url: https://bitcoinversus.tech/2026/10/02/windows-command-26-net-use/
track: windows/commands
lesson_number: 26
raw_source: 026-windows-command-26-net-use-20132.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>The Windows <code>net use</code> command lists, creates, and removes connections to shared network resources, including mapped drive letters.</strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>After <a href="https://bitcoinversus.tech/2026/10/02/windows-command-24-net-localgroup/">Windows Command #24 – net localgroup</a>, the rotation moves from local group administration into network-resource access. Microsoft documents <code>net use</code> as the command for connecting to or disconnecting from shared resources and displaying current connections.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">List current connections</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>net use</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>With no additional parameters, <code>net use</code> displays the current user's network-resource connections.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Map a shared folder</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>net use Z: \\FILESERVER\Public</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>This maps the UNC path <code>\\FILESERVER\Public</code> to drive <code>Z:</code>. The server and share must exist, the network path must be reachable, and the account must have permission to access it.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Map a network drive with net use</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Rp33PmFiTmc","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Rp33PmFiTmc
</div><figcaption class="wp-element-caption"><em>MSFT WebCast demonstrates Windows network-drive mapping through both File Explorer and the net use command.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Use alternate credentials safely</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>net use Z: \\FILESERVER\Public * /user:CONTOSO\alex</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The asterisk tells Windows to prompt for the password instead of placing it directly in the command line. That is preferable to exposing a password in terminal history, screenshots, scripts, or documentation.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Control persistence</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>net use Z: \\FILESERVER\Public /persistent:yes
net use Y: \\FILESERVER\Scratch /persistent:no</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>/persistent:yes</code> requests that the connection be restored at later logons. <code>/persistent:no</code> prevents the new mapping from being saved for automatic restoration.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Windows file sharing and mapped drives</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=cvi31J9NjDQ","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=cvi31J9NjDQ
</div><figcaption class="wp-element-caption"><em>Computer Learning Zone teaches Windows file sharing, permissions, network settings, mapped drives, and troubleshooting in a complete network-share workflow.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Disconnect a mapping</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>net use Z: /delete</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>This removes the connection assigned to <code>Z:</code>. Before disconnecting, close files or programs actively using the mapped resource.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Connect without choosing a drive letter</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>net use \\FILESERVER\Public</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>A connection can also be established directly to a UNC share without assigning a drive letter. Microsoft notes that deviceless connections are not persistent.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video 3: net use from Command Prompt</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=VXEM_IROqpw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=VXEM_IROqpw
</div><figcaption class="wp-element-caption"><em>Tech Sway demonstrates mapping a Windows network drive through Explorer and directly from Command Prompt with net use.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Technician troubleshooting workflow</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>net use
ping FILESERVER
net use Z: \\FILESERVER\Public *
net use Z: /delete</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Start by checking existing mappings, confirm basic reachability or name resolution as appropriate, then attempt the share connection. If it fails, separate network reachability, SMB availability, authentication, and share/NTFS permissions instead of treating every failure as a bad password.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Useful net use patterns</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><code>net use</code> — list current connections.</li><li><code>net use Z: \\SERVER\Share</code> — map a share.</li><li><code>net use Z: \\SERVER\Share * /user:DOMAIN\user</code> — connect with alternate credentials and a hidden password prompt.</li><li><code>net use Z: /delete</code> — remove one mapping.</li><li><code>net use * /delete</code> — request removal of all current mappings; use carefully.</li><li><code>net use /?</code> — display syntax supported by the Windows installation you are using.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Run <code>net use</code> and identify any existing connections.</li><li>In an authorized lab, create a shared folder on another Windows machine or server.</li><li>Map that share to an unused drive letter.</li><li>Verify the mapped drive in File Explorer and Command Prompt.</li><li>Remove the mapping with <code>/delete</code>.</li><li>Explain why using <code>*</code> for a password prompt is safer than typing a password into the command itself.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>net use</code> is a practical Windows administration command for viewing remote-resource connections, mapping shared folders, selecting credentials, controlling persistence, and disconnecting mappings. For technicians, it is especially useful when validating file-server access and troubleshooting Windows network shares.</p><!-- /wp:paragraph -->