# Command #25 – lsblk (Linux OS)

Published: 2026-09-24T05:20:00

Live: https://bitcoinversus.tech/2026/09/24/command-25-lsblk-linux-os/


<p class="wp-block-paragraph">The <code>lsblk</code> command in Linux is used to display information about block storage devices connected to a system. </p>



<p class="wp-block-paragraph">The name stands for <strong>list block devices</strong>, and the command can identify hard drives, SSDs, USB drives, partitions, and other storage devices directly from the terminal.</p>



<p class="wp-block-paragraph">Running the basic command:</p>



<p class="wp-block-paragraph"><code>lsblk</code></p>



<p class="wp-block-paragraph">displays available block devices in a tree-style structure. Common information includes the device name, size, type, and mount point.</p>



<p class="wp-block-paragraph">For example, a Linux system may display devices such as:</p>



<p class="wp-block-paragraph"><code>sda</code> – Physical storage drive<br><code>sda1</code> – Partition located on the drive<br><code>nvme0n1</code> – NVMe storage device<br><code>nvme0n1p1</code> – Partition located on the NVMe drive</p>



<p class="wp-block-paragraph">A useful variation is:</p>



<p class="wp-block-paragraph"><code>lsblk -f</code></p>



<p class="wp-block-paragraph">The <code>-f</code> option displays filesystem information, including filesystem type, labels, UUIDs, and mount points.</p>



<p class="wp-block-paragraph">Another useful command is:</p>



<p class="wp-block-paragraph"><code>lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS</code></p>



<p class="wp-block-paragraph">This allows the user to specify exactly which storage information should appear in the output.</p>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/I57_MNRNdhQ?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div></figure>



<p class="wp-block-paragraph"><code>lsblk</code> is particularly useful during Linux installation, disk partitioning, filesystem troubleshooting, USB drive identification, mounting operations, and storage administration. </p>



<p class="wp-block-paragraph">Because it provides a quick visual representation of disks and their partitions, it can help administrators confirm which device they are working with before performing more advanced storage operations.</p>



<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/"><strong><em><sup>BitcoinVersus.Tech</sup></em></strong></a> <strong><em><sup>Editor&#8217;s Note:</sup></em></strong></p>



<p class="wp-block-paragraph"><strong><em><sup>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</sup></em></strong></p>



<p class="wp-block-paragraph">BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p>

