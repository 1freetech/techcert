---
post_id: 27982
title: "Bitcoin Core Fixes Three AI-Discovered Node Security Flaws"
permalink: "https://bitcoinversus.tech/2026/11/01/bitcoin-core-ai-found-three-node-security-flaws-patched-2026/"
published_date: "2026-11-01"
category_rotation: "Bitcoin"
wordpress_categories: [36507086, 5812, 6, 27318186]
featured_media_id: 27980
featured_image_size: "1200x630"
featured_style: "split-screen diptych"
featured_person: "Fictional adult Indigenous female cybersecurity engineer, late 30s; cover composition not independently visually inspected"
in_story_media_count: 3
in_story_media_ids: [27977, 27979, 27978]
in_story_media_types: ["generated conceptual peer-node illustration", "source-backed memory-growth bar chart", "MIT-licensed historical Bitcoin Core screenshot"]
in_story_chart_source: "Bitcoin Core CVE-2026-117349, 2 MB/hour inbound and 5 MB/hour outbound per peer (upper estimates)"
in_story_video_embeds: 0
internal_links_count: 6
article_word_count_excluding_captions_and_footer: 397
original_sources: ["https://bitcoincore.org/en/2026/10/28/disclose-tcp-oom/", "https://bitcoincore.org/en/2026/10/28/disclose-fpausesend-oom/", "https://bitcoincore.org/en/2026/10/28/disclose-undo-overflow/", "https://bitcoincore.org/en/releases/32.1/"]
corroboration: "https://bitcoinops.org/en/newsletters/2026/10/30/"
qa_status: "published WordPress edit and rendered read-back confirm three image blocks, three captions, 1200x630 cover, verified external primary sources, six internal links, original QR and approved footer. Independent public web fetch inaccessible; browser screenshots not verified."
learning_ledger: "editorial/recursive-learning-ledger-v4.json"
---

<!-- wp:paragraph --><p>Bitcoin Core developers released security updates on October 27–28, 2026, after an automated language-model scan identified three vulnerabilities in the widely used Bitcoin node software. Human contributors validated the findings, and fixes shipped in versions <strong>32.1, 31.2, 30.4 and 29.5</strong>. Two issues were rated medium severity and one low, according to <a href="https://bitcoincore.org/en/security-advisories/">Bitcoin Core's official advisories</a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The discoveries came from Elias Rohrer's Project Loupe at Spiral and reflect a changing security environment: bugs cheap for AI tools to find may also be cheap for attackers to rediscover. Bitcoin Core had already announced its <a href="https://bitcoinversus.tech/2026/10/25/bitcoin-core-ai-easy-vulnerabilities-security-policy-2026/">accelerated disclosure policy</a>; these are its first prominent applications.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":27977,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/bitcoin-peer-to-peer-message-queue-e28094-conceptual-editorial-diagram.png" alt="Original conceptual editorial illustration of Bitcoin peer computers, a network-connected full node and a pressure point in a message buffer" class="wp-image-27977" /><figcaption class="wp-element-caption"><em>Original conceptual illustration of peer-to-peer message queues, not a depiction of the actual exploit or an instruction to reproduce it.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:heading --><h2 class="wp-block-heading">What the three flaws could do</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The first issue, <a href="https://bitcoincore.org/en/2026/10/28/disclose-tcp-oom/">CVE-2026-117350</a>, allowed a connected malicious peer to exhaust memory on Windows, macOS or BSD nodes using a particular socket backend. The advisory says <strong>Linux nodes were not affected by that specific bug</strong>. The second, <a href="https://bitcoincore.org/en/2026/10/28/disclose-fpausesend-oom/">CVE-2026-117349</a>, let stalled older-protocol peers accumulate outbound announcements without a firm limit.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For the second bug, developers estimated memory growth of up to <strong>2 MB per hour per inbound peer</strong> and <strong>5 MB per hour per outbound peer</strong>. These are upper estimates for vulnerable connections, not measurements of overall Bitcoin network memory use.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":27979,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/bitcoin-core-2026-cve-117349-memory-growth-inbound-outbound-chart.png" alt="Source-based bar chart of memory queue growth rates: up to 2 megabytes per hour for one inbound peer versus 5 megabytes per hour for one outbound peer" class="wp-image-27979" /><figcaption class="wp-element-caption"><em>Illustrative comparison using the <a href="https://bitcoincore.org/en/2026/10/28/disclose-fpausesend-oom/">Bitcoin Core CVE-2026-117349 advisory's</a> upper estimates per malicious peer; these are not observed network-wide figures.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p>The third flaw, <a href="https://bitcoincore.org/en/2026/10/28/disclose-undo-overflow/">CVE-2026-117346</a>, concerned oversized block-undo files under highly contrived mining conditions. Bitcoin Core called exploitation impractical. Its fix addresses 64-bit file offsets, but <strong>32-bit systems and nodes storing blocks on FAT32 remain affected</strong> by related storage limits—an important distinction from general <a href="https://bitcoinversus.tech/2026/11/01/linux-7-4-fat32-file-preallocation-265x-speedup/">FAT32 performance improvements</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Why the release matters</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The project tagged Bitcoin Core 32.0 but never fully released it because of last-minute issues; 32.1 became the published version. Earlier <a href="https://bitcoinversus.tech/2026/10/14/bitcoin-core-32-rc4/">release-candidate testing</a> had focused on broader feature changes. This week's fixes instead demonstrate why independent <a href="https://bitcoinversus.tech/2026/10/14/bitcoin-nodes-enforce-the-rules/">full-node operators</a> need ongoing security maintenance.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":27978,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/bitcoin-core-2015-screenshot-wikimedia-mit-licensed.png" alt="Historical Bitcoin Core desktop interface screenshot from 2015, not a picture of the 2026 node vulnerability" class="wp-image-27978" /><figcaption class="wp-element-caption"><em>Historical Bitcoin Core v0.10.0 interface screenshot from 2015, by Bitcoin Core developers / <a href="https://commons.wikimedia.org/wiki/File:Bitcoin-core-v0.10.0.png">Wikimedia Commons</a>, MIT/Expat license. It is not a 2026 bug screenshot.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p>Node operators should review the <a href="https://bitcoincore.org/en/releases/32.1/">official upgrade instructions</a>, verify their actual running version and follow a suitable maintenance process. Version 29.x has reached end of life despite receiving this final patch. These are <strong>node availability and data-handling vulnerabilities</strong>, not evidence that Bitcoin's consensus rules were breached or users' coins were stolen. The project says three additional medium/high issues fixed earlier will be disclosed later under its normal schedule.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For context, a previous <a href="https://bitcoinversus.tech/2026/10/27/electrum-bitcoin-wallet-fee-bump-exploit-4-8-3-2026/">Electrum wallet patch</a> involved different software and a different risk; Bitcoin Core fixes likewise should not be confused with <a href="https://bitcoinversus.tech/2026/10/10/core-lightning-26-06-9-security-update-payment-delays/">Core Lightning's separate security updates</a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="BitcoinVersus.Tech original Bitcoin donation QR code for a 5,000 satoshi contribution" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open this story on a laptop or larger display and scan with a compatible Bitcoin wallet. Confirm the destination before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->