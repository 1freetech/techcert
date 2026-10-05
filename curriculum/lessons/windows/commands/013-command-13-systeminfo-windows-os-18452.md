---
title: "Command #13 – systeminfo (Windows OS)"
wordpress_post_id: 18452
source: BitcoinVersus.tech
published: 2026-09-24T20:16:35
modified: 2026-09-27T00:56:43
live_url: https://bitcoinversus.tech/2026/09/24/command-13-systeminfo-windows-os/
track: windows/commands
lesson_number: 13
raw_source: 013-command-13-systeminfo-windows-os-18452.gutenberg.html
---

<!-- wp:paragraph --><p>The Windows <code>systeminfo</code> command gives technicians a fast way to inspect a computer from Command Prompt. It reports the Windows version, system manufacturer and model, BIOS information, installed memory, network adapters, boot time, and other configuration details without opening several different menus.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Basic command</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>systeminfo</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Open Command Prompt, type the command, and press Enter. Windows will collect the local machine's configuration and print the results in the terminal.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">What to look for</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>OS Name and OS Version:</strong> useful when confirming the installed Windows edition and build.</li><li><strong>System Manufacturer and System Model:</strong> useful when identifying unfamiliar hardware.</li><li><strong>BIOS Version:</strong> useful during firmware and hardware troubleshooting.</li><li><strong>Total Physical Memory:</strong> a quick check of installed RAM.</li><li><strong>System Boot Time:</strong> shows when the machine last started.</li><li><strong>Network Card(s):</strong> provides information about detected network adapters.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Useful output formats</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>systeminfo /fo list
systeminfo /fo table
systeminfo /fo csv</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Microsoft supports LIST, TABLE, and CSV output. CSV is especially useful when system information needs to be saved or processed as structured data.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Check another Windows computer</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>systeminfo /s COMPUTERNAME</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>/s</code> option targets a remote computer by name or IP address when the user has the required access. Microsoft also provides <code>/u</code> and <code>/p</code> options for supplying account credentials. Avoid putting passwords directly into reusable scripts or documentation.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Why technicians use systeminfo</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>For field support, data-center work, and ordinary Windows troubleshooting, <code>systeminfo</code> is a useful first inspection command. Before changing drivers, firmware, networking, or operating-system settings, a technician can establish what machine and Windows build they are actually working on.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>systeminfo
systeminfo /fo table
systeminfo /fo csv</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Compare the three outputs. Then locate the OS version, BIOS version, installed memory, boot time, and network adapter information.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Official reference</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Microsoft documents the complete syntax and supported parameters in its official Windows command reference: <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/systeminfo">systeminfo | Microsoft Learn</a>.</p><!-- /wp:paragraph -->
<!-- wp:separator --><hr class="wp-block-separator has-alpha-channel-opacity" /><!-- /wp:separator -->
<!-- wp:paragraph --><p><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><a href="https://x.com/1BitcoinVersus/status/1937006164555993338">BitcoinVersus.Tech on X</a></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->