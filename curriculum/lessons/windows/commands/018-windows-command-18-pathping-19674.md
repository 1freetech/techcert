---
title: "Windows Command #18 – pathping (Windows OS)"
wordpress_post_id: 19674
source: BitcoinVersus.tech
published: 2026-09-30T22:27:18
modified: 2026-09-30T22:27:18
live_url: https://bitcoinversus.tech/2026/09/30/windows-command-18-pathping/
track: windows/commands
lesson_number: 18
raw_source: 018-windows-command-18-pathping-19674.gutenberg.html
---

<!-- wp:paragraph -->
<p>A video call keeps freezing. You can reach the website, but something along the connection may be unreliable. Your next step is to collect evidence before changing settings.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In <a href="https://bitcoinversus.tech/2026/09/27/windows-command-17-tracert/">Windows Command #17, tracert</a>, you learned to inspect the route. <code>pathping</code> follows that route and repeatedly probes its hops to estimate delay and packet loss.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Start with a familiar destination</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Open Command Prompt and run:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>pathping /n microsoft.com</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The <code>/n</code> option skips name lookups for intermediate routers. The command lists hops first, then collects statistics. Let it finish; this stage can take a few minutes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a shorter practice sample, request 20 probes per hop:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>pathping /n /q 20 microsoft.com</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The default is 100. A smaller sample is quicker, but gives you less evidence.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Watch the command in action</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Watch the demonstration, then return to your own report and identify the destination row.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ynUGngoK8sU","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ynUGngoK8sU
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Roger Zimmerman — How the pathping command works.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read the results carefully</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>RTT</strong> means round-trip time. <strong>Lost/Sent</strong> compares missing replies with probes sent. For example, 2 missing replies out of 20 is 10%.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Source to Here</strong> summarizes results from your computer to that hop. <strong>This Node/Link</strong> estimates loss at an individual router or link; a vertical bar marks a link row.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Loss shown at one router does not necessarily mean it fails to forward traffic. Compare later hops and the destination before blaming a device.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice: write a useful support note</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Run one test to a destination you normally use. Record the time, destination, whether you used Wi-Fi or Ethernet, and the destination’s reported loss. Write: “At [time], pathping to [destination] reported [result] while [symptom] occurred.”</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If the symptom returns, repeat the same test and compare your notes. Include incomplete results rather than guessing what missing replies mean.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>pathping</code> helps you investigate an unreliable connection by collecting route and reply statistics. Use the report as evidence to investigate, rather than a reason to replace equipment immediately.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Reference: <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/pathping">Microsoft Learn: pathping syntax and output</a>.</p>
<!-- /wp:paragraph -->