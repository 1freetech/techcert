---
title: "OSITC.004: Windows Event Viewer Fundamentals — Logs, Levels, Event IDs, Sources, Filtering, and Troubleshooting"
status: published
wordpress_post_id: 22525
published: "2026-10-09T08:29:26"
live_url: "https://bitcoinversus.tech/2026/10/09/ositc-004-windows-event-viewer-fundamentals-logs-levels-event-ids-sources-filtering-troubleshooting/"
series: "Open-Source Information Technology Certificate"
subject: information_technology
lesson_number: "004"
featured_media_id: 22531
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ositc-004-event-viewer-original-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22524
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ositc-004-event-viewer-body.png"
body_image_dimensions: "568x213"
youtube_1: "https://www.youtube.com/watch?v=08WZXnicLBo"
social_1: "https://twitter.com/69297945/status/1811330391409582405"
seo_title: "OSITC.004: Windows Event Viewer Fundamentals"
seo_description: "Learn Windows Event Viewer fundamentals: logs, levels, Event IDs, sources, filtering, timelines, and Get-WinEvent for practical IT troubleshooting."
no_text_boxes: true
---

<!-- wp:paragraph -->
<p><strong>Windows Event Viewer is the built-in place to read many of the records Windows and its applications write about what happened on a computer.</strong> In beginner IT work, the goal is not to memorize thousands of Event IDs. The goal is to start with a symptom and time window, open the correct log, narrow the noise, identify the event source and ID, read the details, and correlate the entry with what the user or system was doing.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson builds directly on <a href="https://bitcoinversus.tech/2026/10/06/ositc-001-it-systems-fundamentals-hardware-operating-systems-networks-troubleshooting/"><strong>OSITC.001: IT Systems Fundamentals</strong></a>, <a href="https://bitcoinversus.tech/2026/10/06/ositc-002-storage-file-systems-hdds-ssds-partitions-volumes-ntfs-ext4-mounting-basic-diagnostics/"><strong>OSITC.002: Storage and File Systems</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/08/ositc-003-windows-process-troubleshooting-task-manager-pid-process-explorer/"><strong>OSITC.003: Windows Process Troubleshooting</strong></a>. Event Viewer adds another evidence source to the same troubleshooting habit: <strong>observe → narrow → verify → act</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What Event Viewer is and when an IT technician should use it.</li><li>The difference between the Application, Security, Setup, System, and Forwarded Events logs.</li><li>What Critical, Error, Warning, Information, and Verbose levels mean.</li><li>Why an Event ID must be read together with its provider/source and context.</li><li>How to filter by time, level, provider, and Event ID.</li><li>How to use a simple PowerShell <code>Get-WinEvent</code> query as a second view of the same evidence.</li><li>How to correlate events with a user-reported symptom instead of treating every warning as a failure.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Open Event Viewer</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The quickest GUI path is to press <code>Win+R</code>, type <code>eventvwr.msc</code>, and press Enter. You can also search Start for <strong>Event Viewer</strong>. Microsoft’s <a href="https://learn.microsoft.com/en-us/shows/inside/event-viewer"><strong>Event Viewer overview</strong></a> identifies the Application, Security, and System logs as core Windows logs and notes that component-specific logging also appears under Applications and Services Logs.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>eventvwr.msc</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=08WZXnicLBo","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=08WZXnicLBo
</div><figcaption class="wp-element-caption"><em>Tech In Moments — Windows Event Viewer tutorial covering the interface, event levels, filtering, Event IDs, sources, and practical troubleshooting.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Know Which Log to Open First</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Application:</strong> events written by applications and application components.</li><li><strong>Security:</strong> audit events defined by Windows security and audit policy.</li><li><strong>Setup:</strong> events related to Windows setup and servicing activity.</li><li><strong>System:</strong> operating-system components, drivers, services, hardware-related conditions, startup, shutdown, and other system activity.</li><li><strong>Forwarded Events:</strong> events collected from other computers when Windows Event Forwarding is configured.</li><li><strong>Applications and Services Logs:</strong> more specific logs for Windows components and applications.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Do not search every log at once unless you have a reason. Start with the symptom. An application crash usually points you toward Application. A driver, service, reboot, or hardware-related symptom often starts in System. Authentication and audit questions often start in Security. Component-specific failures may have a dedicated log under Applications and Services Logs.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22524,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ositc-004-event-viewer-body.png" alt="Windows Event Viewer System log filtered to show event IDs including 13, 41, 1074, 6008, and 6009." class="wp-image-22524" /><figcaption class="wp-element-caption"><em>Microsoft Learn example of a filtered Windows System log. The screenshot shows why Event ID, source, level, and timestamp should be read together rather than as isolated numbers.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Understand Event Levels Without Panicking</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Critical:</strong> a serious condition requiring attention, often associated with major failure or loss of normal operation.</li><li><strong>Error:</strong> a significant problem occurred, but the system or application may continue operating.</li><li><strong>Warning:</strong> something unusual happened or may become a problem, but it is not automatically a failure.</li><li><strong>Information:</strong> normal operational activity, state changes, startup messages, or successful operations.</li><li><strong>Verbose:</strong> detailed diagnostic information when a provider exposes that level.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>A healthy Windows machine can contain warnings and errors. The useful question is not “Does Event Viewer contain red icons?” The useful question is “Which events match the time, component, and symptom I am investigating?” This is why random Event Viewer screenshots without a timeline rarely prove a root cause.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Event ID + Source + Time + Message</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An <strong>Event ID</strong> is an identifier assigned by the event provider. It is useful, but the number by itself is not enough. Microsoft explicitly warns in its <a href="https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/troubleshoot-unexpected-reboots-system-event-logs"><strong>unexpected-reboot troubleshooting guide</strong></a> that Event ID numbers can be associated with different sources. A technician should record at least the log name, timestamp, level, provider/source, Event ID, and the message.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Log: System
Time: 2026-10-09 14:31:08
Level: Critical
Source: Microsoft-Windows-Kernel-Power
Event ID: 41
Message: ...</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For example, Kernel-Power Event ID 41 means Windows detected that the computer restarted without a clean shutdown. It does <strong>not</strong> by itself prove a bad power supply. The underlying cause could be power loss, a crash, a freeze followed by reset, or another interruption. The event is evidence of the shutdown state, not a complete diagnosis.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Filter the Log Around the Symptom</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In Event Viewer, select a log and choose <strong>Filter Current Log</strong>. A beginner-friendly filter starts with a narrow time window and the event levels most likely to matter. If you already know the provider or Event ID, add those too. Filtering reduces thousands of unrelated entries to a manageable timeline.</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Ask when the problem happened.</li><li>Open the most relevant log.</li><li>Filter to a few minutes before and after the reported time.</li><li>Start with Critical, Error, and Warning if the symptom is a failure.</li><li>Look for providers that match the affected component.</li><li>Read the full General and Details information for promising events.</li><li>Compare neighboring events to build a sequence.</li></ol>
<!-- /wp:list -->

<!-- wp:embed {"url":"https://twitter.com/69297945/status/1811330391409582405","type":"rich","providerNameSlug":"twitter","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-twitter wp-block-embed-twitter"><div class="wp-block-embed__wrapper">
https://twitter.com/69297945/status/1811330391409582405
</div><figcaption class="wp-element-caption"><em>Guy Leech demonstrates a practical PowerShell <code>Get-WinEvent -FilterHashtable</code> query against the Windows Security log—directly reinforcing the filtering technique taught in this lesson.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Cross-Check with PowerShell</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The GUI is excellent for learning, but the same event data can be queried from PowerShell. <code>Get-WinEvent</code> is useful when you want repeatable filters, scripting, remote administration, or cleaner output. Microsoft recommends building <code>-FilterHashtable</code> queries one key at a time so you can verify each part of the filter.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-WinEvent -LogName System -MaxEvents 20</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>That command returns the newest twenty events from the System log. A more focused example is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    Id      = 41,1074,6008
} | Select-Object TimeCreated, Id, ProviderName, LevelDisplayName, Message</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This example looks for several reboot-related IDs in the System log and returns the timestamp, ID, provider, level, and message—the same fields you should correlate in the GUI. See Microsoft’s <a href="https://learn.microsoft.com/en-us/powershell/scripting/samples/creating-get-winevent-queries-with-filterhashtable?view=powershell-7.6"><strong><code>Get-WinEvent</code> FilterHashtable guide</strong></a> for the query model.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Build a Timeline, Not a Collection of Red Icons</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Suppose a user says, “The PC restarted at about 2:44 PM.” The useful workflow is to inspect System events around 2:40–2:48 PM, identify shutdown/restart evidence, and then look immediately before it for driver, update, bug-check, service, disk, thermal, or other relevant activity. Microsoft’s reboot guide demonstrates this exact timeline approach with events such as Kernel-Power 41, User32 1074, EventLog 6008/6009, and Windows Error Reporting 1001.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The strongest conclusion you can make depends on the evidence. “Event ID 41 exists” is weak. “At 14:43:58 a bug check was recorded, followed by an unclean restart and Event ID 41 at 14:44:23” is much stronger because the sequence connects related evidence.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Assuming every Error is the root cause:</strong> some errors are consequences of another failure.</li><li><strong>Ignoring timestamps:</strong> an event from last week does not explain today’s five-minute outage.</li><li><strong>Searching only by Event ID:</strong> always include the provider/source and log.</li><li><strong>Clearing logs during troubleshooting:</strong> that destroys evidence and should not be a default “fix.”</li><li><strong>Changing settings before collecting evidence:</strong> record the original state first.</li><li><strong>Reading thousands of events manually:</strong> use filters based on the symptom.</li><li><strong>Ending the investigation at Event Viewer:</strong> logs can point toward the next tool—Task Manager, Process Explorer, Device Manager, Reliability Monitor, networking tools, storage diagnostics, or application logs.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical Exercise</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Open Event Viewer with <code>eventvwr.msc</code>.</li><li>Open <strong>Windows Logs → System</strong>.</li><li>Find one recent Information event and record its timestamp, source, Event ID, and message.</li><li>Use <strong>Filter Current Log</strong> to show only Critical, Error, and Warning events from the last 24 hours.</li><li>Select one event and identify its provider/source before searching the Event ID.</li><li>Open PowerShell and run <code>Get-WinEvent -LogName System -MaxEvents 20</code>.</li><li>Find one event that appears in both PowerShell and Event Viewer and confirm the timestamp, ID, and provider match.</li><li>Remove the filter when finished. Do not clear the log.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is Event Viewer?</strong> A Windows management console for viewing event logs written by Windows components and applications.</li><li><strong>Which log commonly contains driver, service, startup, shutdown, and system-component events?</strong> The System log.</li><li><strong>Does a red Error icon automatically identify the root cause?</strong> No. It must match the symptom, time, provider, and surrounding evidence.</li><li><strong>Why is an Event ID alone insufficient?</strong> The same numeric ID can be used by different providers, so the source/provider and log context matter.</li><li><strong>What should you filter first?</strong> The time window and the log most closely related to the symptom; then add level, provider, or Event ID as needed.</li><li><strong>What PowerShell command reads Windows event logs?</strong> <code>Get-WinEvent</code>.</li><li><strong>What does Kernel-Power Event ID 41 prove?</strong> That Windows detected a restart without a clean shutdown; it does not by itself prove the underlying cause.</li><li><strong>What is the core troubleshooting habit?</strong> Start with the symptom, narrow the evidence, correlate a timeline, and make the smallest justified next action.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Prior IT Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/06/ositc-001-it-systems-fundamentals-hardware-operating-systems-networks-troubleshooting/"><strong>OSITC.001: IT Systems Fundamentals</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/06/ositc-002-storage-file-systems-hdds-ssds-partitions-volumes-ntfs-ext4-mounting-basic-diagnostics/"><strong>OSITC.002: Storage and File Systems</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/ositc-003-windows-process-troubleshooting-task-manager-pid-process-explorer/"><strong>OSITC.003: Windows Process Troubleshooting</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://learn.microsoft.com/en-us/shows/inside/event-viewer"><strong>Microsoft Learn — Event Viewer</strong></a></li><li><a href="https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/troubleshoot-unexpected-reboots-system-event-logs"><strong>Microsoft Learn — Troubleshoot unexpected reboots using system event logs</strong></a></li><li><a href="https://learn.microsoft.com/en-us/powershell/scripting/samples/creating-get-winevent-queries-with-filterhashtable?view=powershell-7.6"><strong>Microsoft Learn — Creating Get-WinEvent queries with FilterHashtable</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Event Viewer is a timeline of evidence, not a magic error detector.</strong> Start with the user’s symptom and the time it happened. Open the most relevant log, filter the noise, read the source and Event ID together, compare neighboring events, and only then decide what tool or repair step comes next.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is an original 1200×630 BitcoinVersus.Tech lesson cover created specifically for OSITC.004 and is not reused in the body. The body uses a separate Microsoft Learn Event Viewer screenshot. The YouTube section uses a native responsive Gutenberg 16:9 YouTube embed block with the canonical watch URL. The lesson otherwise uses standard Gutenberg paragraphs, headings, lists, code, image, and social-embed blocks only; ordinary lesson prose is never placed inside bordered, shaded, card, callout, panel, or fixed-width text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->