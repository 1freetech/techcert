---
lesson_id: Linux Command #65
post_id: 26865
title: "Linux Command #65 – systemd-analyze (Linux OS)"
url: "https://bitcoinversus.tech/2026/10/28/linux-command-65-systemd-analyze-linux-os/"
featured_media: 26859
featured_image_dimensions: "1200x630"
featured_cover_style: "Realistic Photo/Anime Blend (rotation #4)"
in_story_media_count: 2
in_story_youtube_video_ids: [fBKc2wh3ZIQ, _XEDgeWo3ms]
footer_donation_qr_id: 24043
category_ids: [5812, 34922710, 2509703]
qa_status: "published — live independent browser screenshot/playback QA pending"
qa_note: "WordPress posts.get edit verified published source and featured media. WordPress posts.get view returned two rendered YouTube iframe players. No independent video playback or desktop/mobile screenshot inspection was performed. Every claim of verification limited to checks actually completed."
rotation_notes: "Main technical rotation resumed after OSNTC.036 and OSPython.043; OSHRE.000–002 are specialty interludes. Next regular subject: Windows Command; expected #51, subject to live duplicate check."
---

<!-- wp:paragraph --><p><strong>Linux Command #65 — <code>systemd-analyze</code> (Linux OS).</strong> When a Linux workstation or server takes longer than expected to boot, guessing which service is responsible can waste time and create risk. The <a href="https://www.freedesktop.org/software/systemd/man/latest/systemd-analyze.html"><code>systemd-analyze</code> utility</a> reports startup timing and helps explain which units affected the boot sequence. This focused command lesson follows <a href="https://bitcoinversus.tech/2026/10/27/linux-command-64-localectl-linux-os/">Linux Command #64 — <code>localectl</code></a> and concentrates on <strong>read-only boot-time diagnosis</strong>. It does not instruct learners to disable system services.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2>Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul><li>Read total startup timing with <code>systemd-analyze time</code>.</li><li>Rank unit initialization durations using <code>systemd-analyze blame</code> without mistaking the list for a list of causes.</li><li>Read the dependency timing presented by <code>systemd-analyze critical-chain</code>.</li><li>Recognize the limitations of phase timing, socket activation, hardware waits and parallel startup.</li><li>Create a safe diagnostic note before considering configuration changes.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2>What is systemd-analyze?</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>On many modern distributions, <a href="https://bitcoinversus.tech/2026/10/08/what-is-systemd-how-linux-starts-stops-and-watches-background-services/">systemd</a> is the service manager that starts units such as daemons, sockets, mounts and targets. The command <code>systemd-analyze</code> queries systemd for diagnostic and timing information; <a href="https://www.freedesktop.org/software/systemd/man/latest/systemctl.html"><code>systemctl</code></a>, by contrast, is commonly used to inspect or change unit states. Many <code>systemd-analyze</code> subcommands are informative and read-only. The tool also supports configuration verification and security analysis, but this chapter teaches only timing inspection.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Before assuming a Linux machine follows this pattern, confirm that it actually runs a compatible systemd service manager. Some minimal containers, specialized appliances and alternative Linux distributions use other init systems or do not expose complete boot timing information. For the broader boot sequence—firmware, bootloader, kernel, initramfs and service manager—see <a href="https://bitcoinversus.tech/2026/10/11/how-linux-boots-uefi-grub-initramfs-kernel-systemd/">How Linux Boots</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2>1. Inspect the boot-duration summary</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The first command is <code>systemd-analyze time</code>. The <code>time</code> subcommand is optional; running <code>systemd-analyze</code> alone commonly displays the same report. The output may list firmware, loader, kernel, initrd and userspace phases, depending on the platform and available measurement support. The displayed total refers to recorded startup phases; it does not guarantee that the graphical desktop is responsive or that every application has fully initialized.</p><!-- /wp:paragraph -->

<!-- wp:preformatted --><pre class="wp-block-preformatted">$ systemd-analyze time
Startup finished in 2.400s (kernel) + 3.100s (initrd) + 5.700s (userspace) = 11.200s
multi-user.target reached after 5.600s in userspace</pre><!-- /wp:preformatted -->

<!-- wp:paragraph --><p><em>Illustrative output, not a measurement from a particular computer.</em> Add the reported phases to confirm the arithmetic: <strong>2.4 + 3.1 + 5.7 = 11.2 seconds</strong>. The <code>multi-user.target</code> time is a milestone within the userspace phase; it should not be added a second time. EFI firmware and loader timing can be omitted where no supported measurements are available.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2>2. Find slow-starting units with blame</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Run <code>systemd-analyze blame</code> to rank currently known units according to how long they spent initializing. The <a href="https://www.freedesktop.org/software/systemd/man/latest/systemd-analyze.html">official manual</a> cautions that this ranking can be misleading: services commonly start in parallel, some waits are not represented as unit activation time, and services of certain types—such as <code>Type=simple</code>—may not show meaningful activation delays. The top entry is <em>a candidate for investigation</em>, not necessarily the cause of total boot latency.</p><!-- /wp:paragraph -->

<!-- wp:preformatted --><pre class="wp-block-preformatted">$ systemd-analyze blame
8.500s systemd-networkd-wait-online.service
3.100s example-database.service
1.400s example-monitor.service
 680ms systemd-journald.service</pre><!-- /wp:preformatted -->

<!-- wp:paragraph --><p><em>Illustrative ranking only.</em> The 8.5-second entry does not imply that the overall boot would become 8.5 seconds faster if that service were disabled. The wait could overlap other startup tasks, and the unit might satisfy an important dependency. On a remote production server, disconnecting a required network service is especially costly.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2>Video study — a focused systemd-analyze walkthrough</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The LinuxHowTo tutorial demonstrates the basic <code>time</code>, <code>blame</code> and graphical timing commands. Treat the video’s optimization suggestions as examples to evaluate, not automatic instructions to disable or mask units. The commands in this chapter stop at observation and documentation.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=fBKc2wh3ZIQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=fBKc2wh3ZIQ
</div><figcaption class="wp-element-caption"><em>LinuxHowTo, “How to Analyze Linux Boot Performance with systemd-analyze — Optimize Your Startup!”, published June 25, 2025. Demonstrates the primary diagnostic commands.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:paragraph --><p>As you watch, note which output shows overall boot phases and which identifies unit activation durations. Neither output alone proves the dependency path responsible for reaching a specific startup target. This leads to a third command.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2>3. Follow the time-critical dependency chain</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>systemd-analyze critical-chain</code> displays a tree of units whose ordering influenced the displayed target. In the result, <strong><code>@</code> marks when a unit became active or began</strong>, while <strong><code>+</code> marks its recorded activation duration</strong>. This is generally a better starting point than a raw longest-first list when identifying a dependency that delays a particular target. Nevertheless, systemd documents limitations when socket activation, parallelism or units with no activating phase are involved.</p><!-- /wp:paragraph -->

<!-- wp:preformatted --><pre class="wp-block-preformatted">$ systemd-analyze critical-chain
multi-user.target @11.200s
└─example-app.service @10.200s +1.000s
  └─network-online.target @10.100s
    └─systemd-networkd-wait-online.service @2.100s +8.000s</pre><!-- /wp:preformatted -->

<!-- wp:paragraph --><p><em>Illustrative dependency-tree excerpt.</em> The <code>example-app.service</code> line became active at 10.2 seconds in this artificial scenario and spent one second in activation. This chain suggests that reaching <code>network-online.target</code> influenced the target’s timing. It does not, by itself, prove a bug in networking, nor does it establish that every other application was ready at 11.2 seconds.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>You can direct the analysis at a specific unit by providing its exact unit name, for example <code>systemd-analyze critical-chain ssh.service</code> on a system with such a unit. Many distributions use <code>sshd.service</code> instead; discover the installed unit name rather than guessing. For the networking context, revisit <a href="https://bitcoinversus.tech/2026/10/27/osntc-036-lldp-neighbor-discovery-switch-port-mapping/">OSNTC.036 on network link discovery</a> and <a href="https://bitcoinversus.tech/2026/10/22/linux-command-60-resolvectl-linux-os/">Linux Command #60 — <code>resolvectl</code></a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2>Worked example — when the biggest number is not the bottleneck</h2><!-- /wp:heading -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th scope="col">Reported observation</th><th scope="col">Interpretation</th><th scope="col">Practical next step</th></tr></thead><tbody><tr><td>A service appears first in <code>blame</code></td><td>Its recorded activation lasted longer than other listed units.</td><td>Check whether the service appears on the critical path.</td></tr><tr><td>The same service appears in <code>critical-chain</code></td><td>Its timing may be relevant to reaching the target.</td><td>Review ordering, dependencies and its own startup logs.</td></tr><tr><td>A slow service is absent from the target chain</td><td>It may have started in parallel or may not affect that target.</td><td>Avoid assuming its removal would shorten target time.</td></tr><tr><td>Kernel phase is long but userspace is short</td><td>Delay may occur before the systemd service manager has taken control.</td><td>Study early-boot hardware and kernel logs, not only service units.</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>Imagine a server reports a 14-second total startup. An optional logging service takes eight seconds but runs in parallel, while a network dependency blocks the application target for five seconds. The eight-second duration ranks highest in <code>blame</code>; however, fixing it may leave the target startup unchanged. First identify the actual target and critical chain, then validate the diagnosis through controlled measurements across comparable boots. The example numbers are hypothetical and are not benchmark data.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2>4. A second video — measured boot optimization in practice</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The DevConf.US 2024 engineering session “Accelerating Linux Boot Time” discusses <code>systemd-analyze</code> within a broader process of measuring Linux startup, evaluating systemd ordering and examining kernel and initramfs contributions. The lecture provides useful professional context for why an accurate baseline comes before any optimization.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=_XEDgeWo3ms","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=_XEDgeWo3ms
</div><figcaption class="wp-element-caption"><em>DevConf.US 2024, “Accelerating Linux Boot Time: Techniques and Strategies for Optimal Performance,” published August 26, 2024. Conference session on boot-time measurement and engineering tradeoffs.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:paragraph --><p>A high-quality measurement process records the distribution, kernel, init system version, boot target, storage and network conditions, cold-versus-warm boot status and whether services were intentionally disabled. Comparing different environments without those details can produce misleading conclusions.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2>5. Safe optional read-only follow-ups</h2><!-- /wp:heading -->

<!-- wp:list --><ul><li><code>systemd-analyze plot &gt; boot-timeline.svg</code> writes an SVG timeline generated by the systemd tool. It is optional; no diagram is inserted into this published lesson.</li><li><code>systemd-analyze --version</code> reports the installed tool version, which can help explain differences between hosts.</li><li><code>systemctl list-units --type=service</code> shows loaded service-unit status; this is a separate, read-only command.</li><li><code>journalctl -b</code> reads logs from the current boot where access permits. Interpret log timestamps and time domains carefully before comparing them with other tools.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The SVG mentioned above is a built-in diagnostic artifact generated locally by systemd, not an original diagram provided as in-story media. Systemd offers additional verbs such as <code>verify</code> and <code>security</code>; these belong in focused lessons on unit-file validation and service hardening.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2>6. Avoid these common diagnostic errors</h2><!-- /wp:heading -->

<!-- wp:list --><ul><li><strong>Confusing <code>blame</code> with critical-path delay.</strong> Unit startup duration and impact on the final target are different measurements.</li><li><strong>Adding the target milestone to total boot time.</strong> The target timestamp is part of the sequence already reported.</li><li><strong>Comparing unlike systems.</strong> A VM, workstation and bare-metal production server can expose different phases or unit configurations.</li><li><strong>Assuming “boot complete” means every application is fully ready.</strong> Services may still initialize internal work after systemd considers them started.</li><li><strong>Disabling services because a tutorial suggests it.</strong> Removing network, storage, security or monitoring services can damage availability or visibility.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2>7. Practical laboratory assignment</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use a nonproduction Linux system with systemd, or study the illustrative examples above if no suitable machine is available. Do not change service configurations for this assignment.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul><li>Record the distribution, <code>systemd-analyze --version</code>, boot target and hardware type.</li><li>Run <code>systemd-analyze time</code> and record which startup phases are present. Do not invent missing measurements.</li><li>Run <code>systemd-analyze blame</code> and write down the three largest recorded unit activation durations.</li><li>Run <code>systemd-analyze critical-chain</code> and see whether the first <code>blame</code> service appears on the target chain.</li><li>Write a three-sentence diagnosis separating observations, interpretations and the next check you would perform.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2>8. Knowledge check and answer key</h2><!-- /wp:heading -->

<!-- wp:list --><ul><li>What does <code>systemd-analyze time</code> report?</li><li>Does the first entry in <code>blame</code> always delay the final boot target the most?</li><li>What is the meaning of <code>@</code> and <code>+</code> in <code>critical-chain</code> output?</li><li>Can an 8-second service start overlap another service’s initialization?</li><li>Why should a technician avoid disabling a network or storage unit solely to improve its <code>blame</code> ranking?</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answers:</strong> (1) Recorded startup phase durations and selected target timing. (2) No; overlapping services and dependency ordering matter. (3) <code>@</code> is the unit’s relevant activation timestamp, while <code>+</code> is its recorded start duration. (4) Yes, systemd commonly starts units in parallel. (5) The service may be required for normal operation, and the measurement does not prove it causes the observed delay.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2>9. Primary documentation and continued study</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The governing reference is the <a href="https://www.freedesktop.org/software/systemd/man/latest/systemd-analyze.html">official systemd-analyze manual</a>. Practical supporting documentation includes <a href="https://wiki.archlinux.org/title/Improving_performance/Boot_process">ArchWiki’s boot-performance guide</a> and <a href="https://blogs.oracle.com/linux/cracking-linux-boot-code-1">Oracle Linux’s boot-time diagnostics discussion</a>. Continue to <a href="https://bitcoinversus.tech/2026/10/08/what-is-systemd-how-linux-starts-stops-and-watches-background-services/">What Is systemd?</a> or <a href="https://bitcoinversus.tech/2026/10/07/linux-systemd-timers-safer-inspectable-alternative-cron/">Linux systemd timers</a> for related concepts. The next main-rotation course after Linux is Windows Command, while additional specialty tracks—including OSHRE and OSPCB—remain active.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>BitcoinVersus.Tech</strong> — Independent open-source technical education.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>BitcoinVersus.Tech Editor’s Note:</strong> This lesson prioritizes safe, read-only Linux troubleshooting. If these free technical lessons are useful, support independent educational publishing with a donation of <strong>5,000 satoshis</strong>. Scan the original QR code below with a compatible Bitcoin wallet and verify the Bitcoin address <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong> before sending.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Original BitcoinVersus.Tech donation QR code" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>Open the QR code on a separate screen and scan it with a Bitcoin wallet. BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->