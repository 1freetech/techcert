---
title: "Windows Command #42 – sc delete (Windows OS)"
status: published
wordpress_post_id: 22499
published: "2026-10-09T08:08:00"
live_url: "https://bitcoinversus.tech/2026/10/09/windows-command-42-sc-delete-windows-os/"
series: "Windows Command"
subject: windows
lesson_number: "042"
featured_media_id: 22494
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-42-sc-delete-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22493
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-42-sc-delete-body.jpg"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=Go46vQtzLuQ"
social_1: "https://www.reddit.com/r/sysadmin/comments/gzqh1w/broken_entry_in_windows_service_manager/"
seo_title: "Windows Command #42 – sc delete | Windows OS"
seo_description: "Learn how sc.exe delete removes a Windows service registration, why a service can remain marked for deletion, how to verify the correct service name, and how to practice safely in a lab."
no_text_boxes: true
---

<!-- wp:paragraph -->
<p><strong><code>sc.exe delete</code> removes a Windows service registration from the Service Control Manager database and its service registry subkey.</strong> It is the natural follow-up to <a href="https://bitcoinversus.tech/2026/10/08/windows-command-41-sc-create-windows-os/"><strong>Windows Command #41 — <code>sc create</code></strong></a>: #41 showed how a service entry is registered; this lesson shows how an intentionally created or obsolete service entry is removed.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Deletion is a small command with a large consequence, so the important skill is not memorizing two words. The important skill is verifying the exact service, stopping it when appropriate, understanding what Windows means by <em>marked for deletion</em>, and confirming the result afterward.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">1. What sc.exe delete Actually Does</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Microsoft documents <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sc-delete"><strong><code>sc delete</code></strong></a> as deleting a service subkey from the registry. The command operates on the service registration known to the Windows Service Control Manager; it is not a general-purpose application uninstaller.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That distinction matters. A service may have program files, configuration files, scheduled tasks, drivers, shortcuts, logs, or an installer-owned uninstall process outside the service registration itself. Removing the service entry does not automatically clean up every other component of the software.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22493,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-42-sc-delete-body.jpg?w=1024" alt="Illustrated Windows command prompt showing a safe lab service being queried, deleted with sc.exe delete, and verified as removed." class="wp-image-22493" /><figcaption class="wp-element-caption"><em>A safe lab pattern for <code>sc.exe delete</code>: verify the service, delete the intended registration, then query again to confirm it is gone.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">2. Basic Syntax</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sc.exe delete ServiceName</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For a local service named <code>ExampleService</code>:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sc.exe delete ExampleService</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A successful request normally reports:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>[SC] DeleteService SUCCESS</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Use <code>sc.exe</code> explicitly in Windows PowerShell. The short command name <code>sc</code> can resolve to the PowerShell <code>Set-Content</code> alias, while <code>sc.exe</code> unambiguously runs the Windows Service Controller utility.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">3. Verify the Service Before You Delete It</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Never begin with deletion. First confirm that the internal service name is the one you intend to remove. <a href="https://bitcoinversus.tech/2026/10/06/windows-command-34-sc-query/"><code>sc.exe query</code></a> shows the service state, while <a href="https://bitcoinversus.tech/2026/10/08/windows-command-38-sc-qc-windows-os/"><code>sc.exe qc</code></a> shows stored configuration such as the binary path and startup type.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sc.exe query ExampleService
sc.exe qc ExampleService</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <strong>service name</strong> is the identifier used by SC commands. It is not always identical to the friendlier display name shown in <code>services.msc</code>. Microsoft’s syntax specifically expects the service name, so verification prevents deleting the wrong registration.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">4. Stop the Service When Appropriate</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If the service is running and it is safe to stop it, use the procedure from <a href="https://bitcoinversus.tech/2026/10/08/windows-command-36-sc-stop-windows-os/"><strong>Windows Command #36 — <code>sc stop</code></strong></a> before deletion:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sc.exe stop ExampleService
sc.exe query ExampleService
sc.exe delete ExampleService</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Microsoft’s .NET Windows Service guidance explicitly recommends ensuring a service is stopped before issuing the delete command. If the service is still running, Windows can accept the deletion request without removing the entry immediately.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Go46vQtzLuQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Go46vQtzLuQ
</div><figcaption class="wp-element-caption"><em>This walkthrough demonstrates removing a Windows service from an elevated Command Prompt with the <code>sc delete</code> command.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">5. “Marked for Deletion” Does Not Mean “Gone Right Now”</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This is the most important behavior in the command. Microsoft states that if the service is running or another process still has an open handle to it, the service is <strong>marked for deletion</strong>. The underlying service entry is removed only after the service is no longer running and the relevant open handles have been closed.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That explains the common error:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>[SC] CreateService FAILED 1072:
The specified service has been marked for deletion.</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Error 1072 can appear when an administrator tries to recreate a service too quickly after deleting it. A Services console, management tool, remote session, or another process may still hold an open service handle. Microsoft’s lower-level <a href="https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nf-winsvc-deleteservice">DeleteService documentation</a> explains that the database entry remains until all open handles are closed and the service is stopped; if necessary, removal completes after a restart.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/sysadmin/comments/gzqh1w/broken_entry_in_windows_service_manager/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/sysadmin/comments/gzqh1w/broken_entry_in_windows_service_manager/
</div><figcaption class="wp-element-caption"><em>A directly relevant sysadmin discussion shows the real-world “marked for deletion” state and notes that open management handles can keep a service entry pending.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">6. Verify the Result</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After deletion, query the same service name again:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sc.exe query ExampleService</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Once the service is fully removed, Windows normally reports that the specified service does not exist as an installed service. If the service still appears, do not immediately start deleting registry keys. First determine whether the service is still running, whether a management console is holding a handle, or whether the software’s own installer should be used instead.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">7. Do Not Use This as a General Windows Cleanup Command</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Important:</strong> practice only with a disposable lab service that you intentionally created or with an obsolete third-party service whose removal procedure you understand. Microsoft specifically warns against using <code>sc delete</code> to remove built-in operating-system services such as DHCP, DNS, or IIS components. Windows roles and components should be removed with their supported installation or feature-management tools.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The safest mental model is: <code>sc.exe delete</code> removes a <em>service registration</em>. It does not decide whether the entire application, driver package, Windows feature, or supporting files should also be removed.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">8. Remote Service Deletion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>SC can target a remote Windows computer by placing the server name before the command:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sc.exe \\SERVER01 delete ExampleService</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The account running the command must have the required rights on the target system, and the remote Service Control Manager must be reachable. Because remote deletion changes another machine’s service database, verify the target server and service name separately before executing it.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">9. Safe Lab: Finish the Service You Created in #41</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If you completed <a href="https://bitcoinversus.tech/2026/10/08/windows-command-41-sc-create-windows-os/">Windows Command #41</a> in a disposable Windows VM with a genuine test service executable, finish that lab with the same temporary service. Do not substitute a built-in Windows service.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sc.exe query ExampleService
sc.exe qc ExampleService
sc.exe stop ExampleService
sc.exe query ExampleService
sc.exe delete ExampleService
sc.exe query ExampleService</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Read every line of output. The goal is to understand the lifecycle: identify the service, inspect its configuration, stop it when appropriate, request deletion, and verify the final state.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">10. Exercises</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>In a disposable Windows lab VM, identify a test service that you intentionally created.</li><li>Run <code>sc.exe query</code> and record its current state.</li><li>Run <code>sc.exe qc</code> and identify its binary path and startup type.</li><li>If the test service is running and designed to stop cleanly, stop it and confirm the <code>STOPPED</code> state.</li><li>Run <code>sc.exe delete</code> against the test service only.</li><li>Query the same service name again and record the final message.</li><li>Explain in your own words why successful deletion does not necessarily uninstall the application that supplied the service.</li><li>Explain why a service may remain “marked for deletion” for a short time.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">11. Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What does <code>sc.exe delete</code> remove?</li><li>Which identifier should you pass to the command: the service name or merely the friendly display name?</li><li>Why should a service normally be stopped before deletion?</li><li>What does “marked for deletion” mean?</li><li>Does <code>[SC] DeleteService SUCCESS</code> prove every application file was uninstalled?</li><li>Which two commands are useful for verifying a service before deletion?</li><li>Why should you avoid using this command on built-in Windows services?</li><li>How do you verify that the service entry is gone?</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>It removes the service registration/subkey from the Service Control Manager database and registry.</li><li>Use the internal service name expected by SC.</li><li>A running service cannot be fully removed immediately; stopping it helps deletion complete cleanly.</li><li>Windows accepted the deletion request, but the service is still running or one or more processes still hold open handles to it.</li><li>No. It confirms the service deletion request succeeded, not that the entire software package and all files were uninstalled.</li><li><code>sc.exe query</code> and <code>sc.exe qc</code>.</li><li>Built-in roles and components have supported installation/removal mechanisms and dependencies that <code>sc delete</code> does not manage.</li><li>Run <code>sc.exe query ServiceName</code> again and confirm Windows reports that the service is no longer installed.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">12. What You Should Remember</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>sc.exe delete</code> is simple syntax wrapped around an important administrative operation. Verify the service first, stop it when appropriate, delete only a service you are authorized and prepared to remove, and query it again afterward. If Windows says the service is marked for deletion, think about running state and open handles before reaching for the registry.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Previous Windows Commands</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/06/windows-command-34-sc-query/"><strong>#34 — <code>sc query</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/07/windows-command-35-sc-start/"><strong>#35 — <code>sc start</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/windows-command-36-sc-stop-windows-os/"><strong>#36 — <code>sc stop</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/windows-command-37-sc-config-windows-os/"><strong>#37 — <code>sc config</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/windows-command-38-sc-qc-windows-os/"><strong>#38 — <code>sc qc</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/windows-command-39-sc-qdescription-windows-os/"><strong>#39 — <code>sc qdescription</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/windows-command-40-sc-description-windows-os/"><strong>#40 — <code>sc description</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/windows-command-41-sc-create-windows-os/"><strong>#41 — <code>sc create</code></strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image and body image are separate assets. This lesson uses responsive Gutenberg headings, paragraphs, lists, code blocks, one unique body image, one directly relevant YouTube video, and one directly relevant social embed. No normal prose appears in decorative text boxes, cards, panels, callouts, or fixed-width containers.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->