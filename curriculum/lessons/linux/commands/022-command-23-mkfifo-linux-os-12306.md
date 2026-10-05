---
title: "Command #22 mkfifo (Linux OS)"
wordpress_post_id: 12306
source: BitcoinVersus.tech
published: 2025-06-13T08:00:00
modified: 2025-04-09T08:32:44
live_url: https://bitcoinversus.tech/2025/06/13/command-23-mkfifo-linux-os/
track: linux/commands
lesson_number: 22
raw_source: 022-command-23-mkfifo-linux-os-12306.gutenberg.html
---

<!-- wp:paragraph -->
<p>The <code>mkfifo</code> command in Linux is used to create <strong>named pipes</strong>, also known as <strong>FIFOs</strong> (First In, First Out). Unlike regular files, a FIFO behaves like a pipe that allows data to flow between processes. </p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ykER3Ow9V0U\u0026amp;pp=ygUQbWsgZmlmbyBsaW51eCBvcw%3D%3D","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ykER3Ow9V0U&amp;pp=ygUQbWsgZmlmbyBsaW51eCBvcw%3D%3D
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p>You can think of it as a communication tunnel where one process writes data and another reads it. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For example, running <code>mkfifo fi_fo</code> creates a named pipe called <code>fi_fo</code>. If one terminal sends data into it with <code>echo "Bitcoinversus.tech" &gt; fi_fo</code>, another terminal can read that data using <code>cat fi_fo</code>. </p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":12309,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2025/04/screenshot-from-2025-04-08-22-25-01.png?w=1024" alt="" class="wp-image-12309" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>The read operation will wait until something is written, and the write will pause until a reader is present, allowing synchronized data transfer. This is useful for scripting, logging, and building custom workflows between processes. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For Linux+ candidates, understanding how <code>mkfifo</code> works provides insight into how Linux handles low-level process communication cleanly and efficiently.</p>
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