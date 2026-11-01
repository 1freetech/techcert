---
lesson_id: "OSITC.012"
track: "Open Source Information Technology"
level: "Super-Fundamentals"
post_id: 28161
title: "OSITC.012: Windows Performance Monitor — Counters, Baselines, and Data Collector Sets"
url: "https://bitcoinversus.tech/2026/11/01/ositc-012-windows-performance-monitor-perfmon-counters-baselines-data-collector-sets/"
published_date: "2026-11-01"
wordpress_category_ids: [44329, 5812, 2509703]
featured_media_id: 28156
featured_dimensions: "1200x630"
featured_style: "wordless comic editorial artwork"
featured_person: "Fictional Pacific Islander adult male IT engineer, 30s-40s"
in_story_media_count: 4
in_story_media:
  - "YouTube SxlsDOddBXI: Darien's Tips Performance Monitor counters and collector set walkthrough (2026)"
  - "WordPress image 28154: original conceptual performance time-series diagram"
  - "WordPress image 28155: original conceptual data collection and report workflow"
  - "YouTube XQjs7KW43Uk: David Dalton Windows Performance Monitor counters, collector sets and alerts (2025)"
video_embed_method: "WordPress core/shortcode [youtube canonical YouTube URL]"
video_render_qa: "Two real YouTube iframe src URLs returned by published WordPress posts.get context=view, captions immediately after their blocks. This checks rendered HTML, NOT actual player playback."
code_qa: "Pre-publication logman counter argument double-backslash defect discovered and repaired via post-sections.update; post-publication correct single-slash counter paths verified."
internal_links_count: 9
original_sources: ["https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/troubleshoot-performance-problems-in-windows", "https://learn.microsoft.com/en-us/troubleshoot/windows-server/support-tools/troubleshoot-issues-performance-monitor", "https://learn.microsoft.com/en-us/windows/win32/perfctrs/performance-counters-tools", "https://learn.microsoft.com/en-us/windows/win32/perfctrs/collecting-performance-data"]
qa_status: "WordPress published title and SEO, two iframe video players, two image blocks with captions, 1200x630 featured cover, 9 internal links, Microsoft sources, unchanged Editor's Note, original QR and disclaimer. Independent public-page fetch inaccessible; actual playback and desktop/mobile screenshots unverified."
next_main_subject: "c"
---

<!-- wp:paragraph --><p><strong>Windows Performance Monitor (PerfMon)</strong> is an operating-system tool for collecting numerical performance counters and viewing them as live or recorded time series. Rather than simply asking “is the computer slow right now?”, PerfMon lets an IT technician measure how CPU, memory, storage and networking conditions change over seconds, minutes or hours. <strong>Data Collector Sets</strong> preserve measurements for later comparison, turning an intermittent complaint into time-stamped evidence.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson advances <a href="https://bitcoinversus.tech/2026/10/28/ositc-011-windows-resource-monitor-cpu-memory-disk-network-troubleshooting/">OSITC.011: Windows Resource Monitor</a>. Resource Monitor helps explore active processes and resource pressure; Performance Monitor emphasizes counter definitions, baselines, historical recordings and trend analysis. <a href="https://bitcoinversus.tech/2026/10/27/ositc-010-windows-reliability-monitor-crash-history-perfmon-rel/">Windows Reliability Monitor</a> instead emphasizes dated failures and reliability history. The tools complement rather than replace each other.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Define performance counter, counter object, instance, sample, baseline, interval, Data Collector Set and binary log.</li><li>Open PerfMon and distinguish live counter graphs from stored BLG recordings.</li><li>Choose counters for CPU, available memory, disk latency, network throughput and process activity.</li><li>Capture and stop a bounded performance log safely with the GUI or <code>logman</code>.</li><li>Compare measurements with a baseline without treating a single threshold as a universal fault.</li><li>Document a reproducible troubleshooting conclusion and preserve evidence appropriately.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Architecture of a performance counter</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <strong>provider</strong> is a Windows component, service, driver or application that publishes measurable state. A <strong>counterset/object</strong> groups related measurements, such as <code>Memory</code>, <code>Processor</code> or <code>PhysicalDisk</code>. An <strong>instance</strong> identifies one entity within a multi-instance object, such as a particular network adapter or disk. A <strong>counter</strong> identifies the property measured, and a <strong>sample</strong> records the measured value with a timestamp. Microsoft's <a href="https://learn.microsoft.com/en-us/windows/win32/perfctrs/using-performance-counters">performance-counter architecture documentation</a> distinguishes providers from consumers such as PerfMon and TypePerf.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A typical path looks like <code>\Processor(_Total)\% Processor Time</code>. The <code>Processor</code> object includes the <code>_Total</code> instance, while <code>% Processor Time</code> is the counter. Instances available on one PC might not appear on another. Counter names can differ by Windows language, installed roles and device drivers. Always enumerate the real target system before assuming a path exists.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":28154,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/performance-monitoring-e28094-from-counters-to-baseline-time-series-e28094-conceptual-illustration.png" alt="Original conceptual graphic of CPU, memory, storage and network counter time series being collected and saved for investigation" class="wp-image-28154" /><figcaption class="wp-element-caption"><em>Original conceptual illustration of Windows counter collection over time. The curves are <strong>synthetic</strong>, not live operating-system measurements or a Microsoft interface screenshot.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:heading --><h2 class="wp-block-heading">What a baseline means</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <strong>performance baseline</strong> is a set of observations captured when a computer is behaving acceptably under a known workload. A baseline is more useful than an unsupported universal number. For example, a video-editing workstation can legitimately consume most of its CPU while rendering, whereas an ordinary office workstation may use little CPU at idle. Compare the same application, workload, hardware state and sample interval whenever possible.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A good record states the device and operating-system version, collection times and timezone, local or remote source, workload being run, hardware changes and visible symptoms. Add the number of sample points, log path and any monitoring limitations. A sample interval is a tradeoff: brief spikes may require seconds-level capture, whereas a multiday baseline may justify a longer interval and bounded storage.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Launching Windows Performance Monitor</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Open <strong>Windows + R</strong>, enter <code>perfmon.exe</code>, and press Enter. On compatible Windows versions, the console opens Microsoft Management Console with Performance Monitor, Data Collector Sets and Reports.</li><li>Select <strong>Monitoring Tools → Performance Monitor</strong> to inspect a live counter graph.</li><li>Choose the <strong>+</strong> control to add counters, first from the local computer. Start with a small, relevant group instead of hundreds of counters.</li><li>Select an object and an appropriate instance. Observe the actual legend, scale and unit—an auto-scaled chart line is not itself a numerical performance finding.</li><li>For a historical capture, open <strong>Data Collector Sets → User Defined</strong>, create a named counter Data Collector Set, select counters and a sample interval, and choose a safe output folder.</li><li>Run the collection only as long as needed, stop it deliberately, and inspect the resulting file through <strong>Reports</strong> or PerfMon's log-source view.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Microsoft's <a href="https://learn.microsoft.com/en-us/troubleshoot/windows-server/support-tools/troubleshoot-issues-performance-monitor">Performance Monitor troubleshooting guide</a> describes live counter graphs, User Defined Data Collector Sets and Reports. Remote collection and privileged diagnostic operations can require explicit authorization. Do not alter permissions on protected system folders merely to make data collection easier.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video study: counters, baselines, logging and alerts</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Darien's Tips demonstrates how to add counters, review Data Collector Sets, open Reports and understand alert thresholds. It also includes remote monitoring and log-storage discussion. Follow your own company's Windows edition, security rules and approved storage paths rather than copying another organization's access changes.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=SxlsDOddBXI]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=SxlsDOddBXI">Darien's Tips — “Windows Performance and Monitoring: Performance Monitor Tutorial”</a> (January 18, 2026). Practical English walkthrough of PerfMon counters, collector sets and recorded diagnostics; third-party demonstration, not Microsoft certification.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Selecting counters that answer a question</h2><!-- /wp:heading -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Counter</th><th>What it describes</th><th>Diagnostic caution</th></tr></thead><tbody><tr><td><code>\Processor(_Total)\% Processor Time</code></td><td>Aggregate percentage of processor busy time</td><td>CPU usage alone cannot prove which application caused an incident</td></tr><tr><td><code>\System\Processor Queue Length</code></td><td>Threads waiting for processor time</td><td>Interpret with core count, CPU use and workload, not a single hard cutoff</td></tr><tr><td><code>\Memory\Available MBytes</code></td><td>Physical memory available for immediate use</td><td>Low values can be meaningful only with sustained pressure and related evidence</td></tr><tr><td><code>\Memory\Pages/sec</code></td><td>Rate of pages read from or written to storage to resolve hard faults</td><td>Not identical to pagefile usage or a direct count of application memory defects</td></tr><tr><td><code>\PhysicalDisk(_Total)\Avg. Disk sec/Read</code></td><td>Average latency per completed disk read</td><td>Check storage type, write latency and workload; _Total may hide one slow drive</td></tr><tr><td><code>\Network Interface(*)\Bytes Total/sec</code></td><td>Bytes transmitted plus received on each network adapter</td><td>Compare against negotiated rate, utilization, drops and errors</td></tr><tr><td><code>\Process(*)\% Processor Time</code></td><td>CPU time consumed by named process instances</td><td>Multi-core totals can exceed 100%; process instance names may shift</td></tr></tbody></table><figcaption class="wp-element-caption"><em>Examples based on Microsoft's <a href="https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/troubleshoot-performance-problems-in-windows">Windows counter collection guidance</a>. Exact counter availability depends on Windows version, installed features, target computer and localized counter names.</em></figcaption></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>A storage latency is measured in seconds by the <code>Avg. Disk sec/Read</code> counter even though engineers often express it in milliseconds: multiply seconds by 1,000 before comparing it with a drive's expected response. A rate counter may require more than one sample to calculate a useful value. Some process-CPU counters on multicore machines can exceed 100% when aggregating time across processors; this is not necessarily erroneous. Microsoft's <a href="https://learn.microsoft.com/en-us/windows/win32/perfctrs/collecting-performance-data">performance-data guide</a> explains these semantics and notes that <code>Process V2</code> includes process IDs in the instance names on newer Windows releases.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Recording a bounded Data Collector Set</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>An authorized administrator can use the graphical wizard for a straightforward capture. For a controlled Windows Server or Windows workstation lab, the <code>logman</code> command also creates a counter Data Collector Set. The following is an <strong>illustrative, deliberately small</strong> collection that records CPU utilization, available memory and disk latency at 15-second intervals. Confirm counter names and permissions on your own machine, use a writable directory, and stop the collector after the test.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>logman create counter OSITC012_Diag -o "C:\PerfLogs\OSITC012_Diag.blg" -f bin -si 00:00:15 -c "\Processor(_Total)\% Processor Time" "\Memory\Available MBytes" "\PhysicalDisk(_Total)\Avg. Disk sec/Read"
logman start OSITC012_Diag

REM Reproduce the approved workload, then stop collection:
logman stop OSITC012_Diag</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This example writes to <code>C:\PerfLogs</code>. On devices where the folder or a counter is inaccessible, use the approved path and the appropriate rights rather than weakening directory permissions. The selected sample interval is 15 seconds, but it can miss brief sub-second latency spikes; tighter capture or a different diagnostic tool may be needed. Microsoft's <a href="https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/troubleshoot-performance-problems-in-windows">scenario guide</a> documents <code>logman.exe</code> create, start and stop operations and offers a larger set of counters for authorized support captures.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":28155,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/windows-data-collector-sets-capture-and-review-workflow-e28094-editorial-concept.png" alt="Conceptual illustration of performance counter telemetry being written into a log file before review in a historical report" class="wp-image-28155" /><figcaption class="wp-element-caption"><em>Original illustrative flow of <strong>collect → store → analyze</strong>. It does not depict an actual Data Collector Set screen, customer log, or measured Windows performance.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p>Prefer bounded logs to unlimited background collection: log files can accumulate and can expose application names, user activity, host identifiers and usage patterns. Store diagnostics according to retention rules, avoid personal folders and credentials in shared report packages, and remove temporary collectors when a troubleshooting ticket is closed.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Understanding file formats and reporting</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>BLG</strong> is a Windows binary performance-counter log format used for efficient, time-stamped capture. <strong>CSV</strong> is a text table format that can support external analysis. <strong>TSV</strong> separates fields with tabs. Microsoft documents <code>typeperf</code> for counter listing or collection, <code>logman</code> for Data Collector Set management and <code>relog</code> for format conversion and log merging. The presence of a report file does not establish that its counters are valid or complete.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>PerfMon can load a previous BLG file through its data-source selector. Choose the recorded time window, verify timestamps and inspect meaningful <em>minimum, maximum and average</em> values. Long collections with dense sampling can be summarized or compressed by the graph interface; check displayed values and the real number of samples rather than relying on the shape of a downsampled line.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video study: creating a collector set and an alert</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A separate video by David Dalton demonstrates selecting performance counters and setting up Data Collector Sets and alerts. An <strong>alert</strong> is a configured response to a condition; it is not an automatic diagnosis. Decide how noisy the threshold would be during the host's real workload before enabling notification or automated remediation.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=XQjs7KW43Uk]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=XQjs7KW43Uk">David Dalton — “Using Windows Performance Monitor”</a> (November 13, 2025). Distinct English demonstration of counters, Data Collector Sets and alerts. Verify steps against the current Windows release and Microsoft documentation.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical example: slow application every afternoon</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Imagine a managed Windows workstation whose business application becomes slow around 3 p.m. but is responsive when IT inspects it at 9 a.m. A <a href="https://bitcoinversus.tech/2026/10/28/ositc-011-windows-resource-monitor-cpu-memory-disk-network-troubleshooting/">live Resource Monitor</a> view alone may miss the event. The engineer records one normal day and one incident window at a comparable 15-second interval, collecting CPU use, available memory, disk read/write latency and interface throughput. The measurements here are hypothetical and are not from a real customer.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Suppose the trace shows CPU use near its ordinary baseline, available memory holding steady, but <strong>read latency</strong> climbing sharply while the application's response time worsens. That pattern shifts investigation toward storage or storage-path contention, not proof of a defective SSD. Next steps include checking actual per-disk instances, active I/O processes, <a href="https://bitcoinversus.tech/2026/10/06/ositc-002-storage-file-systems-hdds-ssds-partitions-volumes-ntfs-ext4-mounting-basic-diagnostics/">storage configuration</a>, event logs and backup or antivirus schedules. Compare the incident with a baseline after controlled remediation.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>If instead CPU time increases while the storage counters remain healthy, inspect process-level counters, and compare with <a href="https://bitcoinversus.tech/2026/10/08/ositc-003-windows-process-troubleshooting-task-manager-pid-process-explorer/">Process Explorer and Windows process diagnostics</a>. For a suspected driver or service issue, correlate the timestamps with <a href="https://bitcoinversus.tech/2026/10/09/ositc-004-windows-event-viewer-fundamentals-logs-levels-event-ids-sources-filtering-troubleshooting/">Windows Event Viewer</a> and <a href="https://bitcoinversus.tech/2026/10/10/ositc-005-windows-services-fundamentals-service-control-manager-startup-types-dependencies-services-msc-and-verification/">Services</a>, rather than asserting that a single counter proves root cause.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Limits and frequent mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Confusing averages with brief peaks:</strong> a 15-second average can hide a one-second stall. Select sampling and tools based on the event duration.</li><li><strong>Comparing unlike workloads:</strong> a busy system under a planned render job cannot be judged using an idle laptop baseline.</li><li><strong>Misreading scale:</strong> graph rescaling can make a tiny change look dramatic, so record the raw numbers and units.</li><li><strong>Overinterpreting one counter:</strong> memory, CPU and disk metrics interact. Correlate multiple observations with symptoms.</li><li><strong>Ignoring counter instance identity:</strong> duplicate process names, restarts and storage renumbering can change which instance a graph represents.</li><li><strong>Leaving collectors running:</strong> diagnostics must have a defined time window, data budget and retention policy.</li><li><strong>Assuming local and remote permissions are identical:</strong> enterprise policies may prevent remote counter access or certain security-sensitive data collection.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>What is the difference between a performance counter's <em>object</em>, <em>instance</em> and <em>counter name</em>?</li><li>Why is a workload-matched baseline preferable to a universal CPU or disk threshold?</li><li>Why can <code>\Process(*)\% Processor Time</code> exceed 100% on a multicore machine?</li><li>What advantages does a Data Collector Set have over checking Resource Monitor only after an incident?</li><li>How would you verify that an apparent disk-latency spike was real rather than a graph-scaling artifact?</li><li>What should you record and clean up before closing a performance troubleshooting ticket?</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answer guide:</strong> An object groups related counters, an instance identifies one entity and a counter names the metric. Baselines control for workload. Process CPU may total usage over multiple logical processors. Data Collector Sets preserve timed evidence. Compare units and minimum/maximum/raw samples and correlate with independent logs. Close with observed symptom, counter paths, dates, collection settings, proposed cause versus confirmed cause, outcome and removal of temporary collectors.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">References and related lessons</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Primary documentation: <a href="https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/troubleshoot-performance-problems-in-windows">Microsoft — Troubleshoot Windows performance problems</a>; <a href="https://learn.microsoft.com/en-us/troubleshoot/windows-server/support-tools/troubleshoot-issues-performance-monitor">Microsoft — Troubleshoot using Performance Monitor</a>; <a href="https://learn.microsoft.com/en-us/windows/win32/perfctrs/performance-counters-tools">Microsoft — Performance Counter Tools</a>; <a href="https://learn.microsoft.com/en-us/windows/win32/perfctrs/collecting-performance-data">Microsoft — Collecting Performance Data</a>; <a href="https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.diagnostics/get-counter?view=powershell-5.1">Microsoft — Get-Counter</a>. Continue with related <a href="https://bitcoinversus.tech/2026/10/25/ositc-009-diagnosing-windows-update-failures-history-event-logs/">Windows Update evidence collection</a> and <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-virtual-memory-ram-pagefile-swap-page-faults/">virtual-memory fundamentals</a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Original BitcoinVersus.Tech donation QR for 5,000 sats" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open this lesson on a laptop or larger screen and scan the original QR code with a compatible Bitcoin wallet. Confirm the address before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->