---
title: "Windows Command #30 – net file (Windows OS)"
wordpress_post_id: 20401
source: BitcoinVersus.tech
published: 2026-10-03T23:36:37
modified: 2026-10-03T23:36:37
live_url: https://bitcoinversus.tech/2026/10/03/windows-command-30-net-file/
track: windows/commands
lesson_number: 30
raw_source: 030-windows-command-30-net-file-20401.gutenberg.html
---

<!-- wp:paragraph --><p><strong><code>net file</code> shows files that other computers have opened on the Windows computer where you run the command.</strong> It is a server-side view of remotely opened shared files.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/03/windows-command-29-net-session/">Windows Command #29 – net session</a>. That command answers, “Which clients have SMB sessions connected to this computer?” <code>net file</code> goes one level deeper and asks, <strong>“Which shared files are currently open through those connections?”</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>By the end:</strong> you will be able to list remotely opened files, understand file IDs and lock counts, inspect a specific entry, recognize when a file is being used over SMB, and understand why closing an open file is a maintenance action rather than a casual troubleshooting step.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Start with the basic command</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code" style="color:#c0c0c0;background-color:#000000"><code>net file</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Run it from an elevated Command Prompt on the computer that is providing the shared files.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Client computer
      │
      │ opens \\FILE-SERVER\Practice\report.xlsx
      ▼
FILE-SERVER
      │
      ├── net session → shows the client session
      └── net file    → shows the remotely opened file</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The direction matters. If LAB-PC opens a file stored on FILE-SERVER, run <code>net file</code> on <strong>FILE-SERVER</strong> to inspect that remote open.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: The net file command itself</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Ev4nON9iXow","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Ev4nON9iXow
</div><figcaption class="wp-element-caption"><em>CMD Networks — The net file command. This focused walkthrough demonstrates the command used in this lesson.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">What does net file list?</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Microsoft's Sysinternals documentation for <a href="https://learn.microsoft.com/en-us/sysinternals/downloads/psfile">PsFile</a> describes <code>net file</code> as a command that shows files opened on the local system by other computers. A typical listing can include:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>File ID</strong> — a numeric identifier Windows assigns to that remote open file.</li><li><strong>File path</strong> — the server-side path to the opened resource.</li><li><strong>User name</strong> — the account associated with the open file.</li><li><strong>Lock count</strong> — the reported number of file locks.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The exact formatting can vary by Windows version and context. Do not treat the example below as captured output from every system.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="color:#c0c0c0;background-color:#000000"><code>ID     Path                         User name      # Locks
17     C:\Shares\Practice\report.xlsx   LAB\alex       1</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Read it as: file ID <code>17</code> represents one remote open of <code>report.xlsx</code> by the listed account, with one reported lock.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Why does the file have an ID?</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The ID gives Windows a concise way to refer to one open file entry.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Remote open file
      ↓
Windows assigns an open-file ID
      ↓
net file lists that ID
      ↓
Administrator can inspect or, if approved, close that specific entry</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This is safer than guessing based only on a filename because multiple users or sessions may interact with similarly named files.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Inspect one file ID</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>If the listing shows ID <code>17</code>, use:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="color:#c0c0c0;background-color:#000000"><code>net file 17</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Replace <code>17</code> with an ID from your own current listing. The ID is not a permanent identifier for the document; it represents that open-file entry.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">How net file fits with the recent Windows commands</h2><!-- /wp:heading -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Command</th><th>Question it answers</th></tr></thead><tbody><tr><td><code>net use</code></td><td>What shared resources is this client connected to?</td></tr><tr><td><code>net share</code></td><td>What resources is this computer sharing?</td></tr><tr><td><code>net view</code></td><td>What shared resources can be listed on another computer?</td></tr><tr><td><code>net session</code></td><td>What client SMB sessions are connected to this server?</td></tr><tr><td><code>net file</code></td><td>What files are remotely open on this server?</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:code --><pre class="wp-block-code"><code>SHARE
  ↓
SESSION
  ↓
OPEN FILE

net share
net session
net file</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: View open shared files on Windows Server</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=FVIXpNM-HHU","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=FVIXpNM-HHU
</div><figcaption class="wp-element-caption"><em>Active Directory Pro — View Open Files on Windows Server. This demonstrates the broader administrative task of identifying files that are currently open on Windows servers and workstations.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">A lock is not automatically a problem</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A reported lock can simply mean an application is actively using the file in a way that requires coordinated access. Do not assume that every locked file is stale or broken.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Before intervening, identify:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>the file path,</li><li>the user,</li><li>the client session,</li><li>whether the application is still using the file,</li><li>whether the user has unsaved work.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>A file lock is often protecting data consistency. Removing it carelessly can cause lost work or application errors.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Closing an open file changes the system</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The read-only command is:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="color:#c0c0c0;background-color:#000000"><code>net file</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Closing a file is different. The built-in syntax uses the file ID with <code>/close</code>:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="color:#c0c0c0;background-color:#000000"><code>net file 17 /close</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><strong>Do not use this casually.</strong> Closing the server-side open file can interrupt the client application and can cause unsaved changes to be lost. Use it only after identifying the correct file and user, asking the user to save and close the file when possible, and following the maintenance procedure for the system.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Microsoft's Defrag Tools networking episode demonstrates both listing open files with <code>net file</code> and closing a selected entry with <code>net file NNN /close</code>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Reference: <a href="https://learn.microsoft.com/en-us/shows/defrag-tools/129-networking-part-2">Microsoft Learn — Defrag Tools #129: Networking, Part 2</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">SMB is the protocol context</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>These network-share sessions and remotely opened files normally exist in the context of SMB, the Server Message Block protocol used by Windows file sharing.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Client application
      ↓
SMB connection
      ↓
SMB session
      ↓
Shared file opened on server
      ↓
net file can list the remote open</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Understand SMB before troubleshooting shared files</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Xno6Bh6lWp0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Xno6Bh6lWp0
</div><figcaption class="wp-element-caption"><em>Tech Gee — What is the Server Message Block (SMB) Protocol? This provides the protocol background for the sessions and shared-file opens that net file helps inspect.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Modern PowerShell companion: Get-SmbOpenFile</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Modern Windows Server administration also provides the PowerShell cmdlet <code>Get-SmbOpenFile</code>. Microsoft's current documentation says it retrieves information about files open on behalf of SMB clients.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Get-SmbOpenFile</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>It can expose richer properties such as FileId, SessionId, Path, ShareRelativePath, ClientComputerName, and ClientUserName.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Reference: <a href="https://learn.microsoft.com/en-us/powershell/module/smbshare/get-smbopenfile?view=windowsserver2025-ps">Microsoft Learn — Get-SmbOpenFile</a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is a PowerShell cmdlet, not a Command Prompt command. Keep the environments distinct:</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Environment</th><th>Example</th></tr></thead><tbody><tr><td>Command Prompt</td><td><code>net file</code></td></tr><tr><td>PowerShell</td><td><code>Get-SmbOpenFile</code></td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">net file has an important limitation</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Microsoft's PsFile documentation notes that <code>net file</code> can truncate long path names and is oriented around the local system. That is one reason newer administrative tools can be useful when you need richer information or remote-management capabilities.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Do not confuse the age of a command with uselessness. <code>net file</code> remains valuable for learning the relationship between a file server, remote clients, SMB sessions, and server-side open-file state.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Safe two-computer practice lab</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use two Windows machines or VMs that you administer. One will be the file server and one the client.</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Step</th><th>Where</th><th>Action</th></tr></thead><tbody><tr><td>1</td><td>FILE-SERVER</td><td>Use an existing training share such as <code>Practice</code>.</td></tr><tr><td>2</td><td>LAB-PC</td><td>Open a document inside <code>\\FILE-SERVER\Practice</code>.</td></tr><tr><td>3</td><td>FILE-SERVER</td><td>Open Command Prompt as administrator and run <code>net session</code>.</td></tr><tr><td>4</td><td>FILE-SERVER</td><td>Run <code>net file</code>.</td></tr><tr><td>5</td><td>FILE-SERVER</td><td>Match the open-file information to the client and file you intentionally opened.</td></tr><tr><td>6</td><td>LAB-PC</td><td>Close the document normally.</td></tr><tr><td>7</td><td>FILE-SERVER</td><td>Run <code>net file</code> again and compare.</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>The practice exercise is intentionally observational. You do <strong>not</strong> need to use <code>/close</code> to understand the command.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Troubleshooting without guessing</h2><!-- /wp:heading -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>What you see</th><th>What to check</th></tr></thead><tbody><tr><td>Access denied</td><td>Confirm the Command Prompt is elevated and that your account has the required administrative rights.</td></tr><tr><td>No entries</td><td>Confirm a remote client currently has a file open from a share hosted by this computer.</td></tr><tr><td>You expected a local application file</td><td><code>net file</code> is about files opened remotely through server sharing, not every file handle used by local processes.</td></tr><tr><td>The path appears shortened</td><td>Older <code>net file</code> output can truncate long paths. Use a modern tool such as <code>Get-SmbOpenFile</code> when appropriate.</td></tr><tr><td>A user reports a locked file</td><td>Identify the user, session, file, and application before considering any forced close.</td></tr><tr><td>The command reports the Server service is unavailable</td><td>Check the Server service and the computer's intended file-sharing role. Do not enable services on managed systems without authorization.</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">Check your understanding</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Where should you run <code>net file</code>: on the client opening the shared file or on the server providing it?</li><li>What does a file ID identify?</li><li>Does a reported lock automatically mean something is broken?</li><li>What does <code>/close</code> do?</li><li>Why can <code>/close</code> cause data loss?</li><li>Which modern PowerShell command provides richer SMB open-file information?</li><li>How is <code>net file</code> different from <code>net session</code>?</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answers:</strong> Run <code>net file</code> on the server providing the share. The file ID identifies one server-side remote open-file entry. A lock is not automatically an error. <code>/close</code> closes the selected remote open file and removes its locks. Doing that while an application has unsaved work can interrupt the application and lose changes. <code>Get-SmbOpenFile</code> is the modern PowerShell companion. <code>net session</code> lists client sessions; <code>net file</code> lists remotely opened files.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">What to remember</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Think from broadest to most specific: share → session → open file.</strong></p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>net share   → what this computer shares
net session → who is connected
net file    → what remote files are open</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><em>Presentation note: Command Prompt examples use the classic console default concept of light gray (#C0C0C0) text on black. This is not presented as the default for Windows Terminal or VS Code, whose appearance depends on the selected profile and theme. Non-terminal diagrams are plain educational graphics.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->