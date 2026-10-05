---
title: "Command #25 – lsblk (Linux OS)"
wordpress_post_id: 17440
source: BitcoinVersus.tech
published: 2026-09-24T05:20:00
modified: 2026-09-11T21:59:09
live_url: https://bitcoinversus.tech/2026/09/24/command-25-lsblk-linux-os/
track: linux/commands
lesson_number: 25
raw_source: 025-command-25-lsblk-linux-os-17440.gutenberg.html
---

<!-- wp:paragraph -->
<p>The <code>lsblk</code> command in Linux is used to display information about block storage devices connected to a system. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The name stands for <strong>list block devices</strong>, and the command can identify hard drives, SSDs, USB drives, partitions, and other storage devices directly from the terminal.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Running the basic command:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>lsblk</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>displays available block devices in a tree-style structure. Common information includes the device name, size, type, and mount point.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For example, a Linux system may display devices such as:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>sda</code> – Physical storage drive<br><code>sda1</code> – Partition located on the drive<br><code>nvme0n1</code> – NVMe storage device<br><code>nvme0n1p1</code> – Partition located on the NVMe drive</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A useful variation is:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>lsblk -f</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The <code>-f</code> option displays filesystem information, including filesystem type, labels, UUIDs, and mount points.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Another useful command is:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This allows the user to specify exactly which storage information should appear in the output.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=I57_MNRNdhQ\u0026amp;pp=ygUNbHNibGsgY29tbWFuZA%3D%3D","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=I57_MNRNdhQ&amp;pp=ygUNbHNibGsgY29tbWFuZA%3D%3D
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><code>lsblk</code> is particularly useful during Linux installation, disk partitioning, filesystem troubleshooting, USB drive identification, mounting operations, and storage administration. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Because it provides a quick visual representation of disks and their partitions, it can help administrators confirm which device they are working with before performing more advanced storage operations.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/"><strong><em><sup>BitcoinVersus.Tech</sup></em></strong></a> <strong><em><sup>Editor's Note:</sup></em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong><em><sup>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</sup></em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p>
<!-- /wp:paragraph -->