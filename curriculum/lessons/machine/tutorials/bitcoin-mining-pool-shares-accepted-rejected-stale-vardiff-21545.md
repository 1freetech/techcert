---
title: "Bitcoin Mining: What Is a Pool Share? Accepted, Rejected, Stale, and Vardiff Explained"
wordpress_post_id: 21545
source: BitcoinVersus.tech
published: 2026-10-07T10:15:23
modified: 2026-10-07T10:15:23
live_url: https://bitcoinversus.tech/2026/10/07/bitcoin-mining-pool-shares-accepted-rejected-stale-vardiff/
track: machine/tutorials
lesson_number: null
raw_source: bitcoin-mining-pool-shares-accepted-rejected-stale-vardiff-21545.gutenberg.html
---

<!-- wp:paragraph --><p><strong>A Bitcoin mining share is proof that a miner is doing real hashing work for a pool. It is not necessarily a valid Bitcoin block. The pool uses an easier target so it can measure how much work each miner contributes.</strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>A machine can submit thousands of accepted shares without finding a block. Those shares still matter because they provide statistical evidence of the miner's hashrate.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">The Network Target Is Much Harder</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Bitcoin miners repeatedly hash block-header candidates. A block is valid only when its hash is below the target implied by Bitcoin's current mining difficulty. That target is intentionally difficult, so pools need a faster way to measure individual contributors.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">A Pool Creates An Easier Share Target</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A mining pool assigns work with a lower share difficulty. A hash satisfying that easier target can be submitted as a share even when it does not satisfy Bitcoin's network target. If it satisfies both, the pool has a block candidate; otherwise the share still demonstrates useful work.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Shares Estimate Hashrate</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Hashing is probabilistic, so short-term results vary. Pools estimate hashrate from share difficulty and how quickly valid shares arrive. That is why a pool dashboard can temporarily disagree with the hashrate displayed by an ASIC.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>Our <a href="https://bitcoinversus.tech/2026/09/29/axeos-fundamentals-pool-settings-worker-names-failover/">AxeOS pool-settings guide</a> explains how worker names, pool addresses and failover settings connect an individual miner to this accounting system.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">What Is Vardiff?</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Variable difficulty, or vardiff, lets a pool adjust share difficulty for different miners. A fast miner can use a harder share target so it does not flood the pool with submissions, while a slower miner can receive an easier target that still produces enough samples to estimate hashrate.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.Tech previously examined how <a href="https://bitcoinversus.tech/2026/09/29/bitcoin-mining-vardiff-strand-miners-hashrate-curtailment/">vardiff can temporarily strand miners after sharp curtailment</a> when assigned difficulty no longer matches reduced fleet hashrate.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Accepted, Rejected, And Stale Shares</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>An accepted share reached the pool and satisfied the assigned target. A rejected share failed a pool rule or could not be accepted. A stale share generally represents work tied to an older job after the pool has moved miners to new work.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>Persistent rejected or stale-share rates can point to connectivity problems, unstable tuning, incorrect configuration or excessive network latency.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Shares Are Not Bitcoin</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A share is an accounting proof, not a piece of Bitcoin. Pools use share records as inputs to payout systems. The exact payment calculation depends on the pool's payout model, fees and rules.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>Our coverage of <a href="https://bitcoinversus.tech/2026/09/27/bitaxe-pool-adds-encrypted-stratum-v2-mining-through-axeos/">encrypted Stratum V2 mining through AxeOS</a> shows how newer protocols can change miner-to-pool communication while the need to assign work and account for hashing remains.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">The Easy Mental Model</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Imagine Bitcoin asks everyone to find an extremely rare winning ticket. A pool asks workers to also turn in tickets matching an easier pattern. Those easier matches measure how much searching each worker performed. Occasionally one also satisfies the real Bitcoin target, producing a block.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Sources</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Technical references: <a href="https://developer.bitcoin.org/devguide/mining.html">Bitcoin Developer Guide: Mining</a> and <a href="https://github.com/stratum-mining/sv2-spec">Stratum V2 specification on GitHub</a>.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">BitcoinVersus.Tech</h2><!-- /wp:heading -->
<!-- wp:heading {"level":3} --><h3 class="wp-block-heading">Editor’s Note</h3><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to help keep the information on this platform verifiably accurate. If you would like to support our independent research, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. Content is provided for informational purposes.</p><!-- /wp:paragraph -->