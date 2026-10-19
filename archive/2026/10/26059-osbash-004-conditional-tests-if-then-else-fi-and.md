---
title: "OSBash.004: Conditional Tests — if, then, else, fi, and [[ ]]"
status: published
wordpress_post_id: 26059
wordpress_status: publish
published: "2026-10-18T23:05:40"
modified: "2026-10-18T23:05:40"
live_url: "https://bitcoinversus.tech/2026/10/18/osbash-004-conditional-tests-if-then-else-fi-and/"
featured_media_id: 26058
featured_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/a_cinematic_high_detail_anime_realistic_styled_il.png"
youtube: []
social: []
seo_title: "OSBash.004: Conditional Tests — if, then, else, fi, and [[ ]]"
seo_description: "Learn how Bash scripts make decisions with if statements, directory tests and string comparisons through simple examples."
---

<!-- wp:paragraph --><p>This lesson introduces conditional tests in Bash: how a shell script chooses what to do when a condition is true or false. It follows OSBash.003 on variables and expansion.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning Objectives</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Recognize <code>if</code>, <code>then</code>, <code>else</code> and <code>fi</code>; test whether a directory exists; compare strings safely; understand the meaning of an exit status.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The Basic if Statement</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A Bash <code>if</code> statement runs a command and checks its exit status. Status zero means success; a nonzero status means failure. The shell executes the <code>then</code> branch only when the tested command succeeds.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><code>if true; then echo "Condition passed"; else echo "Condition failed"; fi</code></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Check Whether a Directory Exists</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <code>[[ ... ]]</code> test expression is built into Bash. The <code>-d</code> operator checks whether a path exists and is a directory.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><code>if [[ -d /var/log ]]; then echo "Log directory found"; else echo "Log directory missing"; fi</code></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Compare Two Strings</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use <code>==</code> inside <code>[[ ... ]]</code> for string equality. Quote variables to make intent clear, especially when teaching beginners.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><code>role="admin"; if [[ "$role" == "admin" ]]; then echo "Administrator"; else echo "Standard user"; fi</code></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common Mistakes</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Every <code>if</code> must end with <code>fi</code>. Use spaces around operators inside <code>[[ ... ]]</code>. Remember that <code>[[ ... ]]</code> is Bash syntax and is not guaranteed to work in every POSIX <code>sh</code> shell. Never assume a successful test grants authorization; it only checks the condition you wrote.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge Check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>1. What exit status means success? 2. What does <code>-d</code> test? 3. Which keyword ends a Bash <code>if</code> statement? 4. What is the purpose of <code>else</code>?</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Answers</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>1. Zero. 2. Whether the path is a directory. 3. <code>fi</code>. 4. It supplies commands to run when the tested condition fails.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Further Reading</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><a href='https://www.gnu.org/software/bash/manual/html_node/Conditional-Constructs.html'>GNU Bash Manual — Conditional Constructs</a>; <a href='https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html'>GNU Bash Manual — Conditional Expressions</a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>BitcoinVersus.Tech Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043} --><figure class="wp-block-image"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p><!-- /wp:paragraph -->
