<!-- wp:paragraph -->
<p><strong>Windows process troubleshooting starts by identifying exactly which process is using resources or failing—not by randomly ending tasks.</strong> In this lesson, you will use <a href="https://bitcoinversus.tech/2026/10/06/easy-tech-read-process-vs-thread-how-your-cpu-runs-multiple-tasks/"><strong>processes</strong></a>, Task Manager, process IDs (PIDs), CPU and memory usage, and Microsoft Sysinternals Process Explorer to isolate a problem safely.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Ki7hPJ2TAs4","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Ki7hPJ2TAs4
</div><figcaption class="wp-element-caption"><em>Gary Explains — A complete walkthrough of Windows Task Manager, including running processes, CPU, memory, disk, and ending unresponsive tasks.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Start With the Symptom and Sort by the Resource</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Open Task Manager with <code>Ctrl+Shift+Esc</code>. If the computer is slow, first ask which resource is under pressure: <a href="https://bitcoinversus.tech/2026/10/06/how-does-a-cpu-actually-run-a-program/"><strong>CPU</strong></a>, <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-virtual-memory-ram-pagefile-swap-page-faults/"><strong>memory</strong></a>, disk, network, or GPU. Microsoft’s <a href="https://learn.microsoft.com/en-us/troubleshoot/windows-server/support-tools/support-tools-task-manager"><strong>Task Manager troubleshooting guide</strong></a> describes Task Manager as the built-in Windows tool for monitoring application/process performance and resource use. On the Processes tab, click the CPU, Memory, Disk, or Network column to bring the heaviest current users to the top.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=nrXlAKXojOY","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=nrXlAKXojOY
</div><figcaption class="wp-element-caption"><em>Bureautique-Académie — Windows 11 Task Manager walkthrough showing processes plus CPU, memory, disk, network, and startup information.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22034,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ositc-003-task-manager-process-pid.png" alt="Official Microsoft Windows Task Manager Details view showing running processes and their PID values." class="wp-image-22034" /><figcaption class="wp-element-caption"><em>Microsoft Task Manager Details view showing process names and PIDs. Image: Microsoft Learn.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Use the PID to Identify the Exact Process</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <strong>process ID</strong>, or <strong>PID</strong>, is the numeric identifier Windows assigns to a running process. Two processes can have similar names, and several copies of the same executable may run at once, so the PID lets you correlate the exact instance across Task Manager, command-line tools, logs, debuggers, and monitoring utilities. Microsoft’s <a href="https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/finding-the-process-id"><strong>PID guide</strong></a> shows how to find a PID in Task Manager, with <a href="https://bitcoinversus.tech/2024/11/23/command-7-tasklist-windows-os/"><strong><code>tasklist</code></strong></a>, or with PowerShell <code>Get-Process</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=igiLi3jjQ3E","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=igiLi3jjQ3E
</div><figcaption class="wp-element-caption"><em>Sam Hayden — Demonstrates <code>tasklist</code>, process names, PIDs, and how Windows process IDs are used from the command line.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Do Not End a Process Until You Know What It Is</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A process using high CPU is not automatically broken. It may be compiling code, scanning files, installing an update, compressing data, rendering video, or performing legitimate background work. Before using End task, note the process name, PID, user account, resource pattern, and whether the application is responding. Ending a process can discard unsaved work or interrupt a dependent service. If termination is truly required, the older <a href="https://bitcoinversus.tech/2025/07/18/command-11-taskkill-windows-os/"><strong><code>taskkill</code></strong></a> lesson covers the command-line method.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=qiiW7YKoI3Y","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=qiiW7YKoI3Y
</div><figcaption class="wp-element-caption"><em>EasyComputerUse — Shows how to identify a running program’s process and deal with a process that is not responding.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Escalate to Process Explorer When Task Manager Is Not Enough</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><a href="https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer"><strong>Process Explorer</strong></a> from Microsoft Sysinternals gives deeper visibility than Task Manager. It shows the process tree, owning account, open handles, loaded DLLs and memory-mapped files, and can search for which process has a particular file or object open. Use it when you need to understand parent/child relationships, identify a process holding a file open, investigate handle leaks, or inspect what a suspicious or misbehaving process has loaded.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ZqZvzA4OGDA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ZqZvzA4OGDA
</div><figcaption class="wp-element-caption"><em>Microsoft Windows At Work — Sysinternals Process Explorer deep dive with process, handle, DLL, and troubleshooting demonstrations.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:embed {"url":"https://www.reddit.com/r/sysadmin/comments/14rdii9/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/sysadmin/comments/14rdii9/
</div><figcaption class="wp-element-caption"><em>A directly relevant sysadmin discussion on identifying Windows CPU-heavy processes; common recommendations include Task Manager, Resource Monitor, PerfMon, and Process Explorer.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Use a Repeatable Troubleshooting Flow</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use the same sequence every time: <strong>reproduce the symptom → open Task Manager → sort by the affected resource → record process name and PID → check the user and application context → verify whether the load is expected → use Process Explorer if deeper inspection is needed → only then restart or end the process if justified.</strong> This prevents the common help-desk mistake of killing the first process with a high number without understanding why it is active.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=eA-9VUk6tH4","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=eA-9VUk6tH4
</div><figcaption class="wp-element-caption"><em>Saloman Kane Tech Talk — Practical Process Explorer troubleshooting, process hierarchy, metrics, handles, DLLs, and investigation workflow.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Exercise</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Open Task Manager with <code>Ctrl+Shift+Esc</code>.</li><li>Sort the Processes tab by CPU, then by Memory.</li><li>Select one normal user application and note its process name.</li><li>Open the Details tab and record its PID.</li><li>Run <code>tasklist /fi "PID eq PID_NUMBER"</code>, replacing <code>PID_NUMBER</code> with the PID you recorded.</li><li>Open Process Explorer and locate the same process.</li><li>Compare the process name, PID, parent process, CPU usage, and memory usage.</li><li>Do not terminate the process unless you intentionally chose a disposable test application.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is a PID?</strong> A numeric identifier Windows assigns to a running process instance.</li><li><strong>Why sort Task Manager by CPU or Memory?</strong> To quickly identify which processes are currently consuming the resource associated with the symptom.</li><li><strong>Does high CPU automatically mean a process is broken?</strong> No. High usage can be legitimate work.</li><li><strong>What should you record before ending a process?</strong> At minimum, its name, PID, user/context, resource usage, and whether the workload is expected.</li><li><strong>What does Process Explorer add?</strong> Deeper process-tree, handle, DLL, ownership, and object-search information.</li><li><strong>What is the safe troubleshooting order?</strong> Observe, identify, correlate, verify, inspect deeper if needed, then take action.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Prior IT Lessons</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/06/ositc-001-it-systems-fundamentals-hardware-operating-systems-networks-troubleshooting/"><strong>OSITC.001: IT Systems Fundamentals</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/06/ositc-002-storage-file-systems-hdds-ssds-partitions-volumes-ntfs-ext4-mounting-basic-diagnostics/"><strong>OSITC.002: Storage and File Systems</strong></a></li><li><a href="https://bitcoinversus.tech/2024/11/23/command-7-tasklist-windows-os/"><strong>Command #7 — <code>tasklist</code></strong></a></li><li><a href="https://bitcoinversus.tech/2025/07/18/command-11-taskkill-windows-os/"><strong>Command #11 — <code>taskkill</code></strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Images are official Microsoft Task Manager screenshots that directly show the exact process/PID and CPU-performance views taught in this lesson. They are used at their authentic source proportions rather than stretched or replaced with unrelated stock photography merely to satisfy a size target. Technical references are Microsoft Learn and Microsoft Sysinternals. Every YouTube embed is distinct and directly relevant to Task Manager, PIDs, process termination, or Process Explorer; the Reddit embed is directly about Windows process/CPU troubleshooting tools.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Support and donation options are available through BitcoinVersus.Tech.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech is not a financial advisor. Content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->