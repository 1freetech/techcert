---
title: "Windows Command #32 – net statistics (Windows OS)"
status: published
wordpress_post_id: 20924
published: "2026-10-05T01:24:21"
live_url: "https://bitcoinversus.tech/2026/10/05/windows-command-32-net-statistics/"
series: "Windows Command Lessons"
subject: windows
lesson_number: "32"
featured_media_id: 20923
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-32-net-statistics-cover.png"
youtube_1: "https://www.youtube.com/watch?v=aEe5PBuzsl8"
youtube_2: "https://www.youtube.com/watch?v=88_2CdWNUK8"
youtube_3: "https://www.youtube.com/watch?v=ikrGiR4Di_U"
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong><code>net statistics</code> displays cumulative statistics for Windows Workstation and Server services, giving administrators a quick command-line view of service activity, sessions, traffic, failures, and the time from which the counters have been collected.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Windows Command #32</strong> follows <a href="https://bitcoinversus.tech/2026/10/04/windows-command-31-net-config/"><strong>Windows Command #31 – net config</strong></a>. The previous lesson inspected Workstation and Server service configuration. This lesson moves from configuration to observed service activity: what the services have actually recorded since their statistics were initialized.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Command purpose</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>net statistics
net statistics workstation
net statistics server</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Running <code>net statistics</code> without a service name lists the running services for which statistics are available. The common forms are <code>workstation</code> and <code>server</code>. <code>net stats</code> is accepted as a shorter form on Windows systems that support the command.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Microsoft's <a href="https://learn.microsoft.com/en-us/shows/defrag-tools/129-networking-part-2"><strong>Defrag Tools networking reference</strong></a> demonstrates <code>net statistics server</code> and <code>net statistics workstation</code> as part of the built-in Windows networking toolkit.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">What the command measures</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The command reports counters maintained by Windows networking services. Exact fields vary by Windows version and service implementation, but typical output can include:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>statistics start time;</li><li>bytes sent and received;</li><li>SMB operations or requests;</li><li>sessions accepted or disconnected;</li><li>failed or errored sessions;</li><li>network errors;</li><li>connections to shared resources;</li><li>read and write activity;</li><li>reconnects or other service-specific counters.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>These counters are evidence, not a complete diagnosis. A nonzero failure counter proves that an event was recorded; it does not by itself identify the root cause.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Windows networking commands in context</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=aEe5PBuzsl8","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=aEe5PBuzsl8
</div><figcaption class="wp-element-caption"><em>OnlineComputerTips — Common Windows Networking Commands. Useful context for placing service statistics beside other Windows command-line network diagnostics.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Workstation statistics</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>net statistics workstation</code> reports activity associated with the Windows Workstation service, which provides client-side SMB/network redirector behavior.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>net statistics workstation</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>An illustrative output shape can include a statistics start time followed by received/transmitted bytes, read/write operations, network errors, failed sessions, disconnects, reconnects, and successful or failed connections to shared resources.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The most important diagnostic question is not whether every counter equals zero. The useful question is whether a counter changes while a reproducible problem is occurring.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Server statistics</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>net statistics server</code> reports counters associated with the Windows Server service, which provides local SMB file and printer sharing to remote clients.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>net statistics server</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Typical Server-service output can include sessions accepted, sessions timed out, sessions errored out, bytes sent and received, response errors, and other server-side activity. Availability and field names can differ by Windows release and system configuration.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>If only Workstation statistics are available, verify the system's running services and actual role rather than assuming the Server-service counters must exist on every machine.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Current Windows network troubleshooting workflow</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=88_2CdWNUK8","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=88_2CdWNUK8
</div><figcaption class="wp-element-caption"><em>GuiNet — Top Windows Networking Commands: Troubleshooting Guide. Demonstrates command-line evidence gathering in a modern Windows support workflow.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Statistics start time</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The line beginning with <strong>Statistics since</strong> establishes the collection window. This matters because every cumulative counter needs a time context.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>net statistics workstation | findstr /C:"Statistics since"</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The timestamp can sometimes provide a rough service-uptime clue, but it should not be treated as a universal system-uptime command. Service restart behavior, Windows version, fast startup, and other implementation details can make service statistics differ from actual system boot time.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Baseline before troubleshooting</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A single snapshot is less useful than a before-and-after comparison. Capture statistics before reproducing the fault:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>net statistics workstation &gt; C:\Temp\workstation-before.txt
net statistics server &gt; C:\Temp\server-before.txt</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Reproduce the issue, then capture again:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>net statistics workstation &gt; C:\Temp\workstation-after.txt
net statistics server &gt; C:\Temp\server-after.txt</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The difference between the two snapshots is usually more informative than the lifetime total.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Do not confuse net statistics with netstat</h2><!-- /wp:heading -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Command</th><th>Primary purpose</th></tr></thead><tbody><tr><td><code>net statistics</code></td><td>Workstation/Server service counters</td></tr><tr><td><code>netstat</code></td><td>Connections, listening ports, protocol statistics, routing information</td></tr><tr><td><code>net config</code></td><td>Workstation/Server service configuration</td></tr><tr><td><code>net session</code></td><td>Connected SMB client sessions on the local server</td></tr><tr><td><code>net file</code></td><td>Remotely opened files handled by the local server</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>The earlier <a href="https://bitcoinversus.tech/2026/09/26/command-15-netstat-windows-os/"><strong>Windows netstat lesson</strong></a> covers connection and listening-port inspection. Similar names do not mean the commands inspect the same layer.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Relating counters to SMB troubleshooting</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Microsoft's current SMB guidance emphasizes layered diagnosis: verify connectivity, the relevant services, TCP port 445, SMB configuration, authentication, signing, and permissions before weakening protocol security. See <a href="https://learn.microsoft.com/windows-server/storage/file-server/troubleshoot/detect-enable-and-disable-smbv1-v2-v3"><strong>Microsoft Learn: SMB protocol guidance</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><code>net statistics</code> contributes one layer of that evidence. If a mapped drive fails while failed-session or disconnect counters increase at the same time, the counters support further investigation. They do not prove whether the cause is DNS, routing, firewall policy, SMB signing, credentials, the remote server, or storage latency.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">A layered support workflow</h2><!-- /wp:heading -->

<!-- wp:list --><ol class="wp-block-list"><li>Confirm local IP configuration with <code>ipconfig /all</code>.</li><li>Test name resolution and reachability.</li><li>Test SMB reachability with PowerShell when appropriate: <code>Test-NetConnection SERVER -Port 445</code>.</li><li>Inspect Workstation/Server configuration with <code>net config</code>.</li><li>Capture <code>net statistics</code> before reproducing the fault.</li><li>Reproduce the exact user-visible problem.</li><li>Capture the counters again and identify meaningful deltas.</li><li>Check shares, sessions, open files, Event Viewer, SMB logs, firewall rules, authentication, and permissions as required.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Broader command-line troubleshooting practice</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ikrGiR4Di_U","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ikrGiR4Di_U
</div><figcaption class="wp-element-caption"><em>Sarthak Education — Windows Networking Commands for Beginners. Covers a broad Windows CMD and PowerShell troubleshooting sequence and reinforces choosing the command that answers the specific diagnostic question.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Common interpretation mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Treating a cumulative error count as proof that the current incident caused every recorded error.</li><li>Ignoring the <strong>Statistics since</strong> timestamp.</li><li>Comparing two machines whose counters cover different time windows.</li><li>Confusing <code>net statistics</code> with <code>netstat</code>.</li><li>Assuming successful statistics output proves TCP port 445, DNS, share permissions, or remote-server health.</li><li>Restarting a service only to clear counters before evidence has been captured.</li><li>Using service statistics as a substitute for event logs or packet captures when deeper evidence is required.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical exercise</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use a disposable Windows lab machine and a reachable SMB share.</p><!-- /wp:paragraph -->

<!-- wp:list --><ol class="wp-block-list"><li>Run <code>net statistics</code> and record which services expose counters.</li><li>Capture <code>net statistics workstation</code> to a text file.</li><li>Open and close a remote SMB share several times.</li><li>Capture the Workstation statistics again.</li><li>Identify counters that changed.</li><li>If Server statistics are available, capture them before and after a second client connects to a local share.</li><li>Compare the statistics with <code>net session</code> and <code>net file</code> where available.</li><li>Explain why the counter deltas are useful evidence but do not identify root cause by themselves.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>What does <code>net statistics workstation</code> inspect?</strong><br>Cumulative counters maintained by the Windows Workstation service.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>What does <code>net statistics server</code> inspect?</strong><br>Cumulative counters maintained by the Windows Server service when those statistics are available.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Why does the statistics start time matter?</strong><br>It defines the period over which the cumulative counters were collected.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Does a nonzero failure counter prove the current incident caused that failure?</strong><br>No. The counter may include earlier events from the same collection window.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>What is the strongest way to use cumulative counters during troubleshooting?</strong><br>Capture a baseline, reproduce the problem, capture again, and compare the delta.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Is <code>net statistics</code> the same as <code>netstat</code>?</strong><br>No. <code>net statistics</code> reports Workstation/Server service statistics; <code>netstat</code> focuses on network connections, ports, and protocol/routing information.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>What additional evidence may be required for an SMB failure?</strong><br>IP configuration, DNS, TCP 445 testing, service state, shares, sessions, open files, event logs, SMB logs, firewall policy, authentication, permissions, and sometimes packet capture.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong><code>net statistics</code> converts Workstation and Server service activity into counters that can be compared over time.</strong> Its greatest value is not a single total; it is the ability to establish a baseline, reproduce a problem, observe which counters changed, and use those changes to guide the next layer of Windows network or SMB troubleshooting.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Technical note: Counter names and availability vary by Windows release, role, and service state. Production troubleshooting should follow the exact Windows/Windows Server version and current Microsoft documentation.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->