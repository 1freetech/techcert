---
title: "Command #15 – netstat (Windows OS)"
wordpress_post_id: 18631
source: BitcoinVersus.tech
published: 2026-09-26T14:54:22
modified: 2026-09-27T11:12:38
live_url: https://bitcoinversus.tech/2026/09/26/command-15-netstat-windows-os/
track: windows/commands
lesson_number: 15
raw_source: 015-command-15-netstat-windows-os-18631.gutenberg.html
---

<!-- wp:paragraph --><p>Windows Command #15 covers <code>netstat</code>, a built-in command-line utility for examining network connections, listening ports, protocol statistics, process IDs, and routing information. It is especially useful when troubleshooting servers, workstations, applications, and network services.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Show Active Connections</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>netstat</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Used without parameters, <code>netstat</code> displays active TCP connections.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Show Connections and Listening Ports</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>netstat -a</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>-a</code> option adds TCP and UDP listening ports. This is useful when checking whether a service is actually listening for connections.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Use Numeric Addresses</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>netstat -n</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>-n</code> option displays IP addresses and port numbers numerically instead of resolving names.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Find the Owning Process</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>netstat -ano</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>This practical combination displays connections and listening ports numerically and includes the owning process ID, or PID. You can compare the PID with Task Manager to identify the application using a connection or port.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Filter the Output</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>netstat -ano | findstr LISTENING
netstat -ano | findstr :443</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Piping output into <code>findstr</code> helps isolate a connection state or port. The second example looks for entries containing port 443.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Protocol Statistics and Routes</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>netstat -s
netstat -r</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>netstat -s</code> displays statistics by protocol. <code>netstat -r</code> displays the IP routing table, equivalent to <code>route print</code>.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Practical Troubleshooting</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>If an application cannot accept connections, first confirm that the expected port is listening. If a port is unexpectedly occupied, use <code>netstat -ano</code> to obtain its PID and identify the owning process. Treat unfamiliar connections as leads for investigation, not automatic proof of malicious activity.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video Reference</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>PowerCert Animated Videos provides a focused visual explanation of NETSTAT, including network connections, ports, states, and practical command output.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=8UZFpCQeXnM","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=8UZFpCQeXnM
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Open Command Prompt and run <code>netstat -ano</code>. Identify one ESTABLISHED connection and one LISTENING entry, note their local ports and PIDs, and then locate the corresponding process in Task Manager. This connects command-line network information to the actual Windows process using it.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong>Reference:</strong> Microsoft Learn documentation for the Windows <code>netstat</code> command.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true,"className":"is-provider-x wp-block-embed-x"} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong>Related BitcoinVersus.tech coverage:</strong> <a href="https://bitcoinversus.tech/2026/09/25/command-27-ip-linux-os/">Linux ip command</a> · <a href="https://bitcoinversus.tech/2026/09/24/command-26-ss-linux-os/">Linux ss command</a> · <a href="https://bitcoinversus.tech/2026/09/25/command-14-ipconfig-windows-os/">Windows ipconfig</a> · <a href="https://bitcoinversus.tech/2026/09/24/command-13-systeminfo-windows-os/">Windows systeminfo</a></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong>BitcoinVersus.Tech Editor's Note:</strong> We volunteer daily to help ensure the credibility of information on this platform is verifiably true. BitcoinVersus.tech is not a financial advisor. This article is independent reporting and educational content for informational purposes only.</p><!-- /wp:paragraph -->