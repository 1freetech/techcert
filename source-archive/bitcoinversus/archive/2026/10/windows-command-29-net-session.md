---
title: "Windows Command #29 – net session (Windows OS)"
wordpress_post_id: 20296
wordpress_url: https://bitcoinversus.tech/2026/10/03/windows-command-29-net-session/
published: 2026-10-03T20:53:16
subject: windows
lesson_number: 29
featured_media: 20293
---

# Windows Command #29 – net session (Windows OS)

Complete final Gutenberg source fetched from WordPress after publication.

```html
<!-- wp:paragraph --><p><strong><code>net session</code> shows network sessions connected to the Windows computer where you run it.</strong> On a file server, it helps answer: “Which client computers are connected to this server’s shared resources?”</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A <strong>client</strong> asks for a resource. A <strong>server</strong> provides it. Here, a session is the connection used to access shared resources through SMB, short for Server Message Block. A Windows PC can act as a file server even if it is not running Windows Server.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Watch the command in action</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=KjCovhW1vzY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=KjCovhW1vzY
</div><figcaption class="wp-element-caption"><em>RCCForensics — Using the Net Sessions command to get connection information. A short demonstration of inspecting connected computers.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Start on the computer that provides the share</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Suppose <code>LAB-PC</code> opens <code>\\FILE-SERVER\Practice</code>. Run <code>net session</code> on <strong>FILE-SERVER</strong> to inspect the incoming session. Running it on LAB-PC instead inspects incoming sessions to LAB-PC.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":20294,"sizeSlug":"full","linkDestination":"media"} --><figure class="wp-block-image size-full"><a href="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-29-net-session-diagram.jpg"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-29-net-session-diagram.jpg" alt="LAB-PC opens the Practice share on FILE-SERVER. Run net session on FILE-SERVER to inspect incoming SMB sessions." class="wp-image-20294" /></a><figcaption class="wp-element-caption"><em>Original concept diagram: the client opens the share; the server inspects incoming sessions. Names and values are illustrative. Select the diagram to enlarge it.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p>Use your lab file server or a computer you administer. Open Start, search for <strong>Command Prompt</strong>, choose <strong>Run as administrator</strong>, and approve the Windows prompt. Then enter:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="color:#cccccc;background-color:#000000"><code>net session</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This inspection command does not disconnect anyone. It can return a list of sessions or report that there are no entries. The Server service must be running. An access-denied result means you should check your administrative access.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Microsoft’s <a href="https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/hh750729(v=ws.11)">net session reference</a> documents the command’s syntax. That page is an older reference; use <code>net help session</code> to check the help installed on your Windows computer.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Read the result one part at a time</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>For a learning example, imagine these values. This is an explanation table, not a captured command result:</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Item</th><th>Example</th><th>Meaning</th></tr></thead><tbody><tr><td>Computer</td><td><code>\\LAB-PC</code></td><td>Client connected to this server.</td></tr><tr><td>User name</td><td><code>labreader</code></td><td>Account associated with the session.</td></tr><tr><td>Client type</td><td>Depends on the client</td><td>Client information reported by Windows.</td></tr><tr><td>Opens</td><td><code>1</code></td><td>Reported open resources; not a count of people.</td></tr><tr><td>Idle time</td><td><code>00:00:12</code></td><td>Twelve seconds without session activity.</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>A session with zero opens can still exist. An idle session also does not prove that a person has left their desk. Read these values as information about network activity, not a complete picture of what the person is doing.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Inspect one client</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code" style="color:#cccccc;background-color:#000000"><code>net session \\LAB-PC</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Replace LAB-PC with a client name shown in your result. The two leading backslashes identify the client. <strong>This does not switch the command to a remote server.</strong> It selects that client’s session on the local server.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For a list rather than the normal table layout, use:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="color:#cccccc;background-color:#000000"><code>net session /list</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>To read the built-in explanation before trying other options:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="color:#cccccc;background-color:#000000"><code>net help session</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Understand SMB</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Xno6Bh6lWp0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Xno6Bh6lWp0
</div><figcaption class="wp-element-caption"><em>Tech Gee — What is the Server Message Block (SMB) Protocol? Background on the protocol used for Windows network file sharing.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">How the recent commands fit together</h2><!-- /wp:heading -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Command</th><th>Question it helps answer</th></tr></thead><tbody><tr><td><code>net use</code></td><td>What network resources is this client connected to?</td></tr><tr><td><code>net share</code></td><td>What resources does this computer share?</td></tr><tr><td><code>net view \\FILE-SERVER</code></td><td>What shares can I list on that server?</td></tr><tr><td><code>net session</code></td><td>What client sessions are connected to this computer?</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>Review <a href="https://bitcoinversus.tech/2026/10/02/windows-command-26-net-use/">Windows #26: net use</a> for the client’s connections, <a href="https://bitcoinversus.tech/2026/10/02/windows-command-27-net-share/">Windows #27: net share</a> for the server’s shared resources, and <a href="https://bitcoinversus.tech/2026/10/03/windows-command-28-net-view/">Windows #28: net view</a> for listing shares.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Disconnecting a session changes the situation</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Inspection and disconnection are different actions. Adding <code>/delete</code> ends the selected session and closes its open resources. Someone may lose unsaved work. Before using it, identify the client, ask the user to save and close files, and follow your maintenance procedure.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For an approved disconnection of one lab client, the syntax is:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="color:#cccccc;background-color:#000000"><code>net session \\LAB-PC /delete</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Leaving out the client name selects <strong>all sessions on the local server</strong>. That is a much broader action. Keep the beginner practice below read-only. Ending a session does not delete an account or remove the shared folder; an authorized client can establish a new session later.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: See a modern Windows file-sharing setup</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=iAf3nb_nToQ","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=iAf3nb_nToQ
</div><figcaption class="wp-element-caption"><em>Tech Pub — Windows Server 2025 File and Folder Sharing Demonstration and Tutorial. Professor Robert McMillen shows the shared-resource environment in which server-side sessions arise.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Practice: observe a session in a two-computer lab</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use a server with an existing Practice share and a second Windows computer with permission to read it. There is no need to create accounts or change firewall settings for this exercise.</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Step</th><th>Action</th><th>What to notice</th></tr></thead><tbody><tr><td>1 — Client</td><td>On LAB-PC, open <code>\\FILE-SERVER\Practice</code> in File Explorer.</td><td>The client accesses a resource on the server.</td></tr><tr><td>2 — Server</td><td>On FILE-SERVER, open an administrative Command Prompt and run <code>net session</code>.</td><td>Look for the client name or reported address.</td></tr><tr><td>3 — Inspect</td><td>Use the reported client name with <code>net session \\LAB-PC</code>.</td><td>Inspect that client rather than every session.</td></tr><tr><td>4 — Compare</td><td>Read Opens and Idle time, then repeat the inspection.</td><td>Values can change as the client uses resources.</td></tr><tr><td>5 — Finish</td><td>Close the shared folder on LAB-PC.</td><td>A session may remain temporarily; closure need not remove it immediately.</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>If your computer has no incoming sessions, an empty result is useful too: it tells you there is nothing in this session list at that moment. Do not add <code>/delete</code> to this observation exercise.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">When the result is unexpected</h2><!-- /wp:heading -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Result</th><th>What to check next</th></tr></thead><tbody><tr><td>Access is denied</td><td>Confirm you opened an administrative Command Prompt on the server and have the required rights.</td></tr><tr><td>The Server service is not started</td><td>Check the service named Server. Do not enable sharing on a managed computer without its administrator’s approval.</td></tr><tr><td>No entries</td><td>Confirm a client actually opened this server’s share. Check that you ran the command on the server.</td></tr><tr><td>Client session not found</td><td>Use the client identifier shown in the current list; the session may have ended.</td></tr><tr><td>You wanted Remote Desktop users</td><td>This is a network-sharing session command. Remote Desktop sessions are a different kind of session.</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">A modern PowerShell companion</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>For more detailed SMB information, Microsoft’s <a href="https://learn.microsoft.com/en-us/powershell/module/smbshare/get-smbsession?view=windowsserver2025-ps">Get-SmbSession documentation</a> describes the PowerShell cmdlet that reports current SMB sessions. It can show a session ID, client computer, client user, and number of opens.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Open PowerShell as an administrator on the SMB server and enter <code>Get-SmbSession</code> if that cmdlet is available on your system. It is a PowerShell command, so typing its name directly into Command Prompt will not run it.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Check your understanding</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1.</strong> LAB-PC opens a folder on FILE-SERVER. Where do you run <code>net session</code> to see the incoming session? <strong>Answer:</strong> FILE-SERVER.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2.</strong> Does <code>net session \\LAB-PC</code> inspect a remote server called LAB-PC? <strong>Answer:</strong> No. It selects the client LAB-PC on the local server.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3.</strong> Does an idle time prove the user is finished? <strong>Answer:</strong> No. It describes inactivity in the session.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4.</strong> What changes when you add <code>/delete</code>? <strong>Answer:</strong> The command disconnects the selected session instead of only displaying information.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Remember the direction</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>The client uses the share. The server provides the share. Run <code>net session</code> on the server to inspect its incoming sessions.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Display note: command examples use a traditional Command Prompt presentation of light gray text on black, without syntax highlighting. Windows Terminal, VS Code, and customized consoles can use other configured palettes. The labeled diagram is a concept illustration.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:paragraph --><p><strong><em>Editor’s Note:</em></strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->
```
