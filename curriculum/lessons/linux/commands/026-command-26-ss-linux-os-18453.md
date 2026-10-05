---
title: "Command #26 – ss (Linux OS)"
wordpress_post_id: 18453
source: BitcoinVersus.tech
published: 2026-09-24T20:17:55
modified: 2026-09-27T00:56:24
live_url: https://bitcoinversus.tech/2026/09/24/command-26-ss-linux-os/
track: linux/commands
lesson_number: 26
raw_source: 026-command-26-ss-linux-os-18453.gutenberg.html
---

<!-- wp:paragraph --><p>The Linux <code>ss</code> command shows socket statistics and active network connections. It is one of the fastest command-line tools for checking which ports are listening, which TCP or UDP connections exist, and which processes are using network sockets.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Basic command</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>ss</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Running <code>ss</code> with no options displays open non-listening sockets, including established connections.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Show listening ports</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>ss -l</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>-l</code> option limits the output to listening sockets. This is useful when checking whether a server or service is actually waiting for connections.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">TCP and UDP</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>ss -t
ss -u
ss -t -a
ss -u -a</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>-t</code> selects TCP sockets, <code>-u</code> selects UDP sockets, and <code>-a</code> includes both listening and non-listening sockets.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">A practical technician command</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>ss -tulpn</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>This combination is useful during Linux and data-center troubleshooting. It can show TCP and UDP sockets, listening ports, numeric addresses and ports, and process information. Process details may require elevated permissions depending on the system.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Why ss matters</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>If a web server, monitoring agent, database, mining service, or other network application appears unreachable, <code>ss</code> helps answer a basic question: is the service actually listening on the expected port? It can also help identify established connections and unexpected network listeners before deeper troubleshooting begins.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>ss
ss -l
ss -t -a
ss -u -a
ss -tulpn</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Compare the output from each command. Look for the socket type, state, local address and port, peer address and port, and process information when available.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Reference</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The Linux <code>ss(8)</code> manual describes the command as a utility for investigating sockets and documents its TCP, UDP, listening, process, numeric-output, filtering, and socket-statistics options.</p><!-- /wp:paragraph -->
<!-- wp:separator --><hr class="wp-block-separator has-alpha-channel-opacity" /><!-- /wp:separator -->
<!-- wp:paragraph --><p><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><a href="https://x.com/1BitcoinVersus/status/1937006164555993338">BitcoinVersus.Tech on X</a></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->