---
title: "File System Directory #10: /usr (Linux OS)"
source: BitcoinVersus.tech
wordpress_post_id: 12385
published: 2025-06-15T08:00:00
live_url: https://bitcoinversus.tech/2025/06/15/file-system-directory-10-usr-linux-os/
slug: file-system-directory-10-usr-linux-os
---

<!-- wp:paragraph -->
<p>The <code>/usr</code> directory in Linux holds the majority of user-level applications, libraries, documentation, and system utilities that are not required during the initial stages of booting. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>While its name might suggest it's for user files, it's actually more like a shared, read-only part of the system for application files and binaries. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Subdirectories like <code>/usr/bin</code>, <code>/usr/sbin</code>, and <code>/usr/lib</code> store essential programs and libraries used once the system is fully up and running. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For instance, <code><a href="https://bitcoinversus.tech/2025/03/20/command-10-nano-linux-os/">nano</a></code>, <code><a href="https://bitcoinversus.tech/2025/03/06/how-to-use-python-linux-os-edition/">python3</a></code>, and many user-accessible commands are located in <code>/usr/bin</code>. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The <code>/usr/share</code> directory contains icons, documentation, and other shared files, while <code>/usr/local</code> is reserved for locally compiled software to avoid conflicts with package-managed system files. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The screenshot below shows a terminal session where the user lists the contents of the <code>/usr/bin/</code> directory using the <code>ls</code> command, revealing a large number of installed executable programs. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The error in the first command occurs because <code>/usr/bin/</code> is a directory, and trying to execute it directly without <code>ls</code> or another command causes Bash to return an error.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":12397,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2025/04/image-2.png?w=594" alt="" class="wp-image-12397" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>On the Linux+ exam, understanding <code>/usr</code> is important because it helps clarify how Linux separates system-critical startup tools (found in <code>/bin</code>, <code>/sbin</code>) from everyday programs that live in <code>/usr</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://bsky.app/profile/bitcoinversus.bsky.social/post/3lfxg2mzcs22l","type":"rich","providerNameSlug":"bluesky-social"} -->
<figure class="wp-block-embed is-type-rich is-provider-bluesky-social wp-block-embed-bluesky-social"><div class="wp-block-embed__wrapper">
https://bsky.app/profile/bitcoinversus.bsky.social/post/3lfxg2mzcs22l
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/"><strong><em><sup>BitcoinVersus.Tech</sup></em></strong></a><strong><em><sup> Editor's Note:</sup></em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong><em><sup>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please </sup></em></strong><a href="https://www.gofundme.com/f/support-bitcoin-mining-data-centers-for-everyone"><strong><em><sup>donate here</sup></em></strong></a></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p>
<!-- /wp:paragraph -->
