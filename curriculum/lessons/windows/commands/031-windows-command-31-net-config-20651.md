---
title: "Windows Command #31 – net config (Windows OS)"
wordpress_post_id: 20651
source: BitcoinVersus.tech
published: 2026-10-04T09:59:29
modified: 2026-10-04T09:59:29
live_url: https://bitcoinversus.tech/2026/10/04/windows-command-31-net-config/
track: windows/commands
lesson_number: 31
raw_source: 031-windows-command-31-net-config-20651.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong><code>net config</code> displays configuration information for the Windows Workstation and Server services.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Windows Command #31</strong> follows <a href="https://bitcoinversus.tech/2026/10/03/windows-command-30-net-file/"><strong>Windows Command #30 – net file</strong></a>. The recent Windows sequence has examined SMB shares, visible systems, sessions, and remotely opened files. <code>net config</code> shifts attention to the local Windows services that provide client and server-side network behavior.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Distinguish <code>net config workstation</code> from <code>net config server</code>.</li><li>Identify the Workstation service as the client-side SMB/network redirector service.</li><li>Identify the Server service as the service that provides local file and printer sharing.</li><li>Interpret common configuration fields without confusing them with IP configuration.</li><li>Recognize when <code>ipconfig</code>, <code>net share</code>, <code>net session</code>, or <code>net file</code> is the better diagnostic command.</li><li>Treat legacy tuning switches as administrative changes rather than routine troubleshooting steps.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">1. The two main forms</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>net config workstation
net config server</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Microsoft's current Windows Server guidance lists <code>CONFIG</code> as part of the long-standing <code>NET</code> command family alongside <code>ACCOUNTS</code>, <code>FILE</code>, <code>LOCALGROUP</code>, <code>SESSION</code>, <code>SHARE</code>, <code>USE</code>, <code>USER</code>, and <code>VIEW</code>. See <a href="https://learn.microsoft.com/en-au/troubleshoot/windows-server/networking/net-commands-on-operating-systems"><strong>Microsoft Learn: Net Commands on Operating Systems</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Microsoft's Defrag Tools networking reference also demonstrates both <code>net config server</code> and <code>net config workstation</code> as part of the Windows <code>net</code> command set. See <a href="https://learn.microsoft.com/en-us/shows/defrag-tools/129-networking-part-2"><strong>Defrag Tools #129 – Networking, Part 2</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: The net config command</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=8cnF-7hKt3w","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=8cnF-7hKt3w
</div><figcaption class="wp-element-caption"><em>CMD Networks — The net config command. Focused coverage of the command and the configuration information it exposes.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">2. net config workstation</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>net config workstation</code> displays information associated with the Windows Workstation service. This service supports client-side access to SMB resources and related network redirector functions.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>net config workstation</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Typical output can include the computer name, full computer name, current user, active workstation bindings, Windows version, workstation domain, DNS domain name, and logon domain. Exact fields vary by Windows edition, service state, and environment.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>An illustrative output shape is:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Computer name                        \\LAB-PC
Full Computer name                   LAB-PC.example.local
User name                            student
Workstation active on                NetbiosSmb
Software version                     Windows 11
Workstation domain                   EXAMPLE
Workstation Domain DNS Name          example.local
Logon domain                         EXAMPLE</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The example is not a guaranteed output template. The important distinction is that the command reports Workstation-service identity and configuration; it is not an IP-address inventory command.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">3. Workstation service does not mean physical workstation</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The word <strong>Workstation</strong> in this command refers to a Windows service role, not merely to a desktop form factor. Windows Server systems can also use the Workstation service when they act as clients of remote SMB resources.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This distinction matters in troubleshooting because a server can simultaneously provide SMB resources through the Server service and consume SMB resources through the Workstation service.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">4. net config server</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>net config server</code> displays configuration associated with the Windows Server service, the service responsible for providing file and printer sharing to other systems.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>net config server</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Typical fields can include the server name, descriptive comment, Windows version, active transport bindings, hidden/browse status, maximum logged-on users, maximum open files per session, and idle-session timing.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>An illustrative output shape is:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Server Name                           \\FILE-SERVER
Server Comment
Software version                      Windows 11
Server is active on                   NetbiosSmb
Server hidden                         No
Maximum Logged On Users               20
Maximum open files per session        16384
Idle session time (min)               15</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Microsoft documents that running <code>NET CONFIG SERVER</code> without additional tuning parameters displays useful Server-service configuration while leaving automatic tuning intact. Configuration changes through legacy switches should therefore be treated as deliberate administrative changes rather than casual diagnostics.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">5. net config is not ipconfig</h2><!-- /wp:heading -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Command</th><th>Main question</th></tr></thead><tbody><tr><td><code>net config workstation</code></td><td>How is the Workstation service configured?</td></tr><tr><td><code>net config server</code></td><td>How is the Server service configured?</td></tr><tr><td><code>ipconfig /all</code></td><td>What IP, gateway, DNS, DHCP, and adapter settings are assigned?</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:paragraph --><p><code>net config</code> does not replace <code>ipconfig</code>. A system can have a valid IP address while an SMB-related service is stopped or misconfigured, and it can have healthy Workstation/Server services while the underlying IP configuration is wrong.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Common Windows networking commands</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=aEe5PBuzsl8","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=aEe5PBuzsl8
</div><figcaption class="wp-element-caption"><em>OnlineComputerTips — Common Windows Networking Commands. Places Windows command-line network inspection in the broader troubleshooting toolkit.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">6. Relationship to net share</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/02/windows-command-27-net-share/"><strong>Windows Command #27 – net share</strong></a> lists or manages individual shared resources. <code>net config server</code> instead reports broader Server-service configuration.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A system can have the Server service available but no custom shares configured. Conversely, an SMB troubleshooting case often requires both the service-level view and the share-level view.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">7. Relationship to net view</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/03/windows-command-28-net-view/"><strong>Windows Command #28 – net view</strong></a> inspects visible systems or shares from a network-discovery perspective. <code>net config</code> examines local Workstation or Server service configuration instead.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A discovery failure should therefore not be diagnosed from one command alone. Service state, name resolution, firewall policy, SMB availability, network profile, and remote-system configuration can all affect results.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">8. Relationship to net session</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/03/windows-command-29-net-session/"><strong>Windows Command #29 – net session</strong></a> reports active client sessions connected to the local Server service.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><code>net config server</code> describes how the Server service is configured. <code>net session</code> describes who is currently connected. These are different layers of the same SMB troubleshooting problem.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">9. Relationship to net file</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/03/windows-command-30-net-file/"><strong>Windows Command #30 – net file</strong></a> lists remote file opens handled by the local system. It is more granular than <code>net session</code> and much more specific than <code>net config server</code>.</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Command</th><th>Focus</th></tr></thead><tbody><tr><td><code>net config server</code></td><td>Server-service configuration</td></tr><tr><td><code>net share</code></td><td>Shared resources</td></tr><tr><td><code>net session</code></td><td>Connected client sessions</td></tr><tr><td><code>net file</code></td><td>Remotely opened files</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">10. The Server and Workstation services are SMB-critical</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Microsoft security guidance identifies the Windows <strong>Server</strong> and <strong>Workstation</strong> services as central to SMB behavior. Disabling the Server service prevents the computer from receiving normal SMB file-sharing connections. Disabling the Workstation service prevents normal outbound SMB client connections and can disrupt domain-related functions.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Service changes on domain members, file servers, and domain controllers require change control and an understanding of dependencies. <code>net config</code> is valuable because inspection can precede modification.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">11. Legacy tuning switches require caution</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Historical versions of <code>net config server</code> expose settings such as automatic disconnect timing, server comments, and browse visibility. Historical Workstation-service options also include COM-device buffering values.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>These switches remain part of the legacy command family, but not every old tuning practice is appropriate for modern Windows. Microsoft has documented cases where changing Server-service configuration through <code>NET CONFIG SERVER</code> can permanently set registry-backed values that were previously automatically tuned.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For certification-level troubleshooting, the safe default is to inspect first, verify current Microsoft guidance for the exact Windows version, and change only the setting required by the approved configuration plan.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Windows networking commands in real-world support</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vn76PCGI4yg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vn76PCGI4yg
</div><figcaption class="wp-element-caption"><em>East Charmer — Windows Networking Commands We Often Use at Work. A practical IT-support view of Windows command-line network diagnostics.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">12. Diagnostic use case: SMB share cannot be reached</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A Windows client cannot open a known file share on a server. A structured investigation can collect evidence from several commands without immediately changing configuration.</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Check IP configuration and basic reachability.</li><li>Inspect <code>net config workstation</code> on the client.</li><li>Inspect <code>net config server</code> on the file server.</li><li>Use <code>net share</code> on the server to confirm the intended share exists.</li><li>Use <code>net session</code> to determine whether clients are connecting.</li><li>Use <code>net file</code> when the issue involves an open shared file or lock.</li><li>Review firewall, SMB, authentication, name-resolution, and event-log evidence when the basic service checks do not explain the failure.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">13. Diagnostic use case: domain identity looks wrong</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>net config workstation</code> can expose the local computer name, workstation domain, DNS domain, and logon-domain fields. These values help distinguish machine identity from the identity currently used for sign-in.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Unexpected domain information does not by itself prove an Active Directory fault. Additional evidence can include <code>whoami</code>, <code>systeminfo</code>, DNS checks, time synchronization, secure-channel tests, and domain-controller logs.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">14. Diagnostic use case: server settings are visible but no clients connect</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A successful <code>net config server</code> display proves that the command can query the Server-service configuration. It does not prove that every network path, firewall rule, SMB policy, share permission, NTFS permission, or authentication requirement is correct.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The command should therefore be treated as one evidence source in a layered troubleshooting process.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">15. Common mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Using <code>net config</code> as a substitute for <code>ipconfig</code>.</li><li>Assuming the Workstation service refers only to desktop PCs.</li><li>Assuming <code>net config server</code> lists every share.</li><li>Assuming a displayed Server-service configuration proves SMB connectivity is healthy.</li><li>Changing legacy tuning values before capturing the current state.</li><li>Disabling Server or Workstation services without checking system and domain dependencies.</li><li>Confusing a service configuration problem with a share-permission or file-lock problem.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Practice exercise</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A lab contains a Windows client named <code>LAB-PC</code> and a Windows file server named <code>FILE-SERVER</code>. The client can ping the server but cannot open a known SMB share.</p><!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Run <code>net config workstation</code> on the client and identify the computer, domain, and active Workstation-service information.</li><li>Run <code>net config server</code> on the server and record the Server-service configuration.</li><li>Use <code>net share</code> to verify that the expected share exists.</li><li>Use <code>net session</code> to determine whether the client is establishing a server-side session.</li><li>State which command would be used if the suspected problem involved a remotely opened file.</li><li>Explain why valid <code>net config</code> output does not prove that firewall rules or share permissions are correct.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What does net config workstation inspect?</strong><br>The configuration of the Windows Workstation service and related local client-side network identity information.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. What does net config server inspect?</strong><br>The configuration of the Windows Server service used to provide file and printer sharing.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. Which command is more appropriate for IP addresses, gateways, and DNS server assignments?</strong><br><code>ipconfig /all</code>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. Which command lists local shared resources?</strong><br><code>net share</code>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. Which command lists active SMB client sessions on the local server?</strong><br><code>net session</code>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>6. Which command lists remotely opened files handled by the local server?</strong><br><code>net file</code>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>7. Why should legacy net config tuning switches be changed cautiously?</strong><br>They can alter persistent service settings, and some historical tuning practices are not appropriate for modern automatically tuned Windows systems.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong><code>net config</code> exposes the service-level context behind Windows network sharing.</strong> <code>net config workstation</code> describes the client-side Workstation service; <code>net config server</code> describes the Server service that provides SMB resources. Correct troubleshooting combines this service-level evidence with IP configuration, shares, sessions, open files, firewall policy, permissions, and authentication state.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->