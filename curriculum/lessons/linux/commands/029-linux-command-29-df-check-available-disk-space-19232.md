---
title: "Linux Command #29 – df (Linux OS)"
wordpress_post_id: 19232
source: BitcoinVersus.tech
published: 2026-09-27T18:05:42
modified: 2026-09-27T18:45:21
live_url: https://bitcoinversus.tech/2026/09/27/linux-command-29-df-check-available-disk-space/
track: linux/commands
lesson_number: 29
raw_source: 029-linux-command-29-df-check-available-disk-space-19232.gutenberg.html
---

<!-- wp:paragraph --><p>The Linux <code>df</code> command answers a simple question: <strong>how much storage space is available?</strong> If you have ever checked whether your phone, laptop, or game console has enough room for another game, movie, or download, you already understand the basic idea.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Start With df -h</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>df -h</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>-h</code> option means human-readable. Instead of showing large storage values in harder-to-read units, Linux displays familiar sizes such as MB, GB, and TB.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">What Should You Look For?</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>When you run <code>df -h</code>, focus first on two columns: <strong>Size</strong> tells you the total size, and <strong>Avail</strong> tells you roughly how much space is still available. You may also see <strong>Use%</strong>, which shows how full the storage is.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Simple Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       500G  300G  200G  60% /</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>In this simplified example, the computer has about 500 GB total, about 300 GB is being used, and about 200 GB remains available.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">A Familiar Way to Think About It</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>Gaming:</strong> Is there enough space to install another game?</li><li><strong>Movies and music:</strong> Is there room for more downloads?</li><li><strong>Photos:</strong> Is your storage getting full?</li><li><strong>Bitcoin mining:</strong> Does the Linux computer you use for management, logs, or software still have free disk space?</li></ul><!-- /wp:list -->
<!-- wp:paragraph --><p>The subject changes, but the question is the same: <strong>how much storage do I have, and how much is left?</strong></p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Try It</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>df -h</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Run the command in a Linux terminal. Find the <strong>Size</strong>, <strong>Avail</strong>, and <strong>Use%</strong> columns. Do not worry about memorizing every column yet.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video Reference</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>This beginner video demonstrates the Linux <code>df</code> command, explains its output, and shows the human-readable <code>-h</code> option.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=dcBWezi-yOY","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=dcBWezi-yOY
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Quick Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Run <code>df -h</code>.</li><li>Find the total storage size.</li><li>Find the available storage.</li><li>Find the percentage currently in use.</li><li>In one sentence, explain what <code>df -h</code> tells you.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>df -h</code> is an easy way to check Linux disk space in readable units. Remember it as: <strong>How much storage do I have left?</strong></p><!-- /wp:paragraph -->