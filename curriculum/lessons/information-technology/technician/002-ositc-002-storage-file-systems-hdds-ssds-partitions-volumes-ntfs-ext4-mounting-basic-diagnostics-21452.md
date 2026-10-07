---
title: "OSITC.002: Storage and File Systems — HDDs, SSDs, Partitions, Volumes, NTFS, ext4, Mounting, and Basic Diagnostics"
wordpress_post_id: 21452
source: BitcoinVersus.tech
published: 2026-10-06T21:52:29
modified: 2026-10-06T22:08:29
live_url: https://bitcoinversus.tech/2026/10/06/ositc-002-storage-file-systems-hdds-ssds-partitions-volumes-ntfs-ext4-mounting-basic-diagnostics/
track: information-technology/technician
lesson_number: 2
raw_source: 002-ositc-002-storage-file-systems-hdds-ssds-partitions-volumes-ntfs-ext4-mounting-basic-diagnostics-21452.gutenberg.html
---

<!-- wp:heading --><h2 class="wp-block-heading">Elementary Overview</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A computer needs more than a <a href="https://bitcoinversus.tech/2026/10/06/how-does-a-cpu-actually-run-a-program/">CPU</a> and memory. It also needs persistent <a href="https://bitcoinversus.tech/2025/03/29/overview-of-storage-devices/">storage</a> for the operating system, applications, configuration, logs, and user files. <a href="https://bitcoinversus.tech/2026/10/06/ositc-001-it-systems-fundamentals-hardware-operating-systems-networks-troubleshooting/">OSITC.001</a> introduced hardware, operating systems, networks, and troubleshooting; this lesson follows the storage path from the physical drive to the files an operating system can actually use.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=YQEjGKYXjw8","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=YQEjGKYXjw8
</div><figcaption class="wp-element-caption"><em>PowerCert Animated Videos explains hard drives, SSDs, and common storage interfaces.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">HDDs And SSDs Store Data Differently</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A hard disk drive stores bits magnetically on rotating platters and moves read/write heads across their surfaces. A solid-state drive has no spinning platter; it stores data in NAND flash and uses a controller to map logical addresses to physical flash cells. Our <a href="https://bitcoinversus.tech/2026/10/06/easy-tech-read-whats-inside-an-ssd-nand-controller-dram-cache-explained/">SSD anatomy guide</a> explains the NAND, controller, and DRAM-cache roles in more detail. The operating system ultimately sees addressable storage rather than having to understand every physical operation inside the drive.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=5Mh3o886qpg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=5Mh3o886qpg
</div><figcaption class="wp-element-caption"><em>Branch Education visualizes how SSD flash storage works internally.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Interfaces Connect Storage To The Computer</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Storage devices need an electrical and logical path to the system. SATA is common for 2.5-inch SSDs and hard drives, while NVMe SSDs commonly communicate over PCI Express. A <a href="https://bitcoinversus.tech/2026/10/06/easy-tech-read-what-is-a-device-driver-how-hardware-talks-to-the-operating-system/">device driver</a> helps the operating system communicate with hardware controllers, while drive firmware manages device-specific behavior below that software layer. The interface can strongly affect maximum throughput and latency even when two devices have similar capacities.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=EXLfErPEYiw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=EXLfErPEYiw
</div><figcaption class="wp-element-caption"><em>PowerCert Animated Videos compares SATA and NVMe solid-state storage.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">A Physical Disk Can Be Divided Into Partitions</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A partition is a defined region of a storage device. Partition tables describe where those regions begin and end so software can treat one physical disk as one or more logical areas. Modern systems commonly use GPT, while older systems often used MBR. Partitioning is not the same thing as formatting: partitioning defines the region; formatting creates a file system inside a usable region.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=_HgjasKuOBw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=_HgjasKuOBw
</div><figcaption class="wp-element-caption"><em>ExplainingComputers demonstrates disk partitioning and the role of partitions in storage organization.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">File Systems Organize Files And Metadata</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A file system defines how files, directories, names, timestamps, permissions, allocation information, and other metadata are represented on storage. Windows commonly uses NTFS for system volumes, while Linux installations commonly use file systems such as ext4. Different file systems make different design choices, but all solve the basic problem of turning raw addressable storage into organized data that applications and users can navigate.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=KN8YgJnShPM","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=KN8YgJnShPM
</div><figcaption class="wp-element-caption"><em>Computerphile explains how file systems organize stored data and metadata.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Formatting Creates The File-System Structures</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Formatting prepares a partition or volume with a selected file system. That operation creates the structures the file system needs to track files and free space. Because formatting can destroy or replace existing file-system metadata, an IT technician should verify the target disk, partition, backups, and intended file system before running destructive storage commands. “Wrong disk” is one of the simplest ways to turn a routine task into a data-loss incident.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=9wKFLcubyx8","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=9wKFLcubyx8
</div><figcaption class="wp-element-caption"><em>Professor Messer explains disk formatting, file systems, and storage administration concepts.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Windows Uses Drive Letters And Mount Points</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>On Windows, a volume is often exposed through a drive letter such as <code>C:</code> or <code>D:</code>, although Windows can also mount volumes into folders. Disk Management provides a graphical view of disks, partitions, and volumes, while command-line and PowerShell tools can expose the same storage stack for automation and diagnostics. The <a href="https://bitcoinversus.tech/2026/09/10/windows-server-guide-for-it-technicians-and-administrators/">Windows Server guide</a> provides broader administrative context for managing Windows systems.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ue0lxEXf02U","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ue0lxEXf02U
</div><figcaption class="wp-element-caption"><em>Microsoft Windows-focused storage administration demonstration covering disks and volumes.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Linux Mounts File Systems Into One Directory Tree</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Linux normally exposes storage by mounting a file system at a directory called a mount point. Instead of assigning every volume a new drive letter, another file system can appear at locations such as <code>/home</code>, <code>/mnt/data</code>, or <code>/srv</code>. This fits the larger Linux directory hierarchy, where system libraries, configuration, logs, devices, and user data occupy defined parts of one tree; for example, our <a href="https://bitcoinversus.tech/2025/06/02/file-system-directory-6-lib-linux-os/"><code>/lib</code> directory lesson</a> covers one portion of that hierarchy.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=A3G-3hp88mo","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=A3G-3hp88mo
</div><figcaption class="wp-element-caption"><em>LearnLinuxTV demonstrates Linux storage devices, partitions, mounting, and persistent mounts.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Basic Linux Storage Inspection Commands</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Three useful Linux inspection tools are <code>lsblk</code>, <code>df</code>, and <code>mount</code>. <code>lsblk</code> shows block devices and their relationships, <code>df -h</code> reports file-system space in human-readable units, and <code>mount</code> can display mounted file systems. A technician should inspect first and modify second, especially on systems containing production data.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>lsblk
lsblk -f
df -h
mount</code></pre><!-- /wp:code -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=2Z6ouBYfZr8","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=2Z6ouBYfZr8
</div><figcaption class="wp-element-caption"><em>LearnLinuxTV demonstrates Linux disk-space and block-device inspection from the command line.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Capacity And Free Space Are Different</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A drive may have a physical capacity of 2 TB while a particular file system exposes less usable space because of partition boundaries, formatting overhead, reserved space, recovery partitions, or other storage structures. Free space is the unused capacity currently available inside a mounted file system or volume. Always identify whether a number describes the physical device, a partition, a logical volume, or a file system before comparing storage figures.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=i3_JzAqZB6I","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=i3_JzAqZB6I
</div><figcaption class="wp-element-caption"><em>PowerCert Animated Videos explains storage capacity units and how computer storage is measured.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">RAID Is Not A File System</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/06/storage-what-is-raid-0-1-5-6-10-striping-mirroring-parity-explained/">RAID</a> combines multiple storage devices using techniques such as striping, mirroring, or parity. A RAID virtual disk can then be partitioned and formatted with a file system, so RAID and the file system occupy different layers. RAID can improve performance or tolerate some device failures depending on the level, but it is not a substitute for a separate backup.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=U-OCdTeZLac","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=U-OCdTeZLac
</div><figcaption class="wp-element-caption"><em>PowerCert Animated Videos explains common RAID levels and their storage tradeoffs.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Troubleshoot Storage From The Bottom Up</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A useful storage troubleshooting sequence is physical device → firmware/interface → operating-system detection → partition or volume → file system → mount or drive letter → application. If the system cannot see the physical device, repairing permissions inside the file system is premature. If the disk is visible but the file system is damaged, replacing an Ethernet cable will not help. Our dedicated <a href="https://bitcoinversus.tech/2025/04/11/troubleshoot-and-diagnose-problems-with-storage-drives-and-raid-arrays-extended-version/">storage-drive and RAID troubleshooting guide</a> expands this diagnostic approach.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=R7JY8l0mE6E","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=R7JY8l0mE6E
</div><figcaption class="wp-element-caption"><em>Professor Messer demonstrates a structured approach to troubleshooting storage devices and drive problems.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical Command Set</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><code>lsblk</code> — list Linux block devices.</li><li><code>lsblk -f</code> — include file-system and UUID information.</li><li><code>df -h</code> — display mounted file-system usage.</li><li><code>mount</code> — display mounted file systems.</li><li><code>Get-Disk</code> — list disks in Windows PowerShell.</li><li><code>Get-Partition</code> — inspect Windows partitions.</li><li><code>Get-Volume</code> — inspect Windows volumes and file systems.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Identify whether your lab computer uses an HDD, SATA SSD, or NVMe SSD.</li><li>On Linux, run <code>lsblk -f</code> and identify the physical device, partition, file-system type, and mount point without changing anything.</li><li>On Windows, run <code>Get-Disk</code>, <code>Get-Partition</code>, and <code>Get-Volume</code> in PowerShell and map one physical disk to its volume.</li><li>Explain the difference between partitioning and formatting.</li><li>Explain the difference between physical capacity and free file-system space.</li><li>Draw the path: physical drive → interface/controller → partition → file system → mount point or drive letter → file.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge Check + Answers</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>What is a partition?</strong> A defined region of a storage device described by a partition table.</li><li><strong>What does a file system do?</strong> It organizes files, directories, allocation information, and metadata on storage.</li><li><strong>Is RAID a file system?</strong> No. RAID combines storage devices at another layer; a file system can be created on the resulting logical storage.</li><li><strong>What does <code>lsblk</code> show?</strong> Linux block devices and their relationships.</li><li><strong>What does <code>df -h</code> show?</strong> Human-readable space usage for mounted file systems.</li><li><strong>What is a Linux mount point?</strong> A directory where a file system is attached to the directory tree.</li><li><strong>Why inspect before formatting?</strong> Formatting the wrong target can destroy or replace existing file-system data.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Elementary Conclusion</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The easiest storage model is a stack. The HDD or SSD stores bits; SATA, NVMe, PCIe, controllers, firmware, and <a href="https://bitcoinversus.tech/2026/10/06/easy-tech-read-what-is-a-device-driver-how-hardware-talks-to-the-operating-system/">drivers</a> connect the device to the <a href="https://bitcoinversus.tech/2026/10/01/linux-35-operating-systems-mainframes-smartphones/">operating system</a>; partitions divide address space; file systems organize data; and a mount point or drive letter exposes that data to applications and users. When troubleshooting, move through those layers in order instead of guessing. That simple model scales from a laptop SSD to storage inside a <a href="https://bitcoinversus.tech/2026/10/06/osdctc-004-server-rack-and-stack-rail-kits-u-positions-airflow-power-network-verification/">rack-mounted server</a>.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=3EUOQ9M2N6A","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=3EUOQ9M2N6A
</div><figcaption class="wp-element-caption"><em>Professor Messer reviews storage technologies, interfaces, file systems, and practical IT support concepts.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. Content is provided for informational purposes.</p><!-- /wp:paragraph -->