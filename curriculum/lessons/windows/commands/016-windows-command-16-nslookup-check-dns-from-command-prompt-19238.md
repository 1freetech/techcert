---
title: "Windows Command #16: nslookup — Check DNS from Command Prompt"
wordpress_post_id: 19238
source: BitcoinVersus.tech
published: 2026-09-27T18:38:01
modified: 2026-09-27T18:38:01
live_url: https://bitcoinversus.tech/2026/09/27/windows-command-16-nslookup-check-dns-from-command-prompt/
track: windows/commands
lesson_number: 16
raw_source: 016-windows-command-16-nslookup-check-dns-from-command-prompt-19238.gutenberg.html
---

<!-- wp:paragraph --><p><strong>Windows Command #16</strong> introduces <code>nslookup</code>, a simple built-in command for asking DNS which IP address is associated with a domain name.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">What nslookup does</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>DNS works a little like a contacts list: people remember a name such as <code>example.com</code>, while computers use network addresses. <code>nslookup</code> lets you inspect that lookup from Windows Command Prompt.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Try it</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>nslookup example.com</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Open Command Prompt, type the command, and press Enter. The output normally identifies the DNS server used for the query and returns address information for the requested domain.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Practical exercise</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Run <code>nslookup example.com</code>.</li><li>Find the DNS server shown near the top.</li><li>Find the returned address or addresses.</li><li>Run the command again with another familiar website and compare the result.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Why technicians use it</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>If a website name is not resolving, <code>nslookup</code> provides a fast first check of DNS. It helps separate a name-resolution problem from other connectivity problems.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video reference</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Use a topic-specific YouTube demonstration of Windows <code>nslookup</code> as the visual reference for this lesson. Video references should directly teach the command rather than serve as generic filler.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>nslookup</code> asks DNS for information about a name. For a beginner, remember the basic pattern: <strong>name in → DNS lookup → address information out</strong>.</p><!-- /wp:paragraph -->