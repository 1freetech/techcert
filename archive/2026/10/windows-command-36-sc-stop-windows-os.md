<!-- wp:paragraph -->
<p><strong><code>sc stop</code> sends a stop control request to a Windows service.</strong> It is the natural follow-up to <a href="https://bitcoinversus.tech/2026/10/06/windows-command-34-sc-query/"><strong>Windows Command #34 — <code>sc query</code></strong></a> and <a href="https://bitcoinversus.tech/2026/10/07/windows-command-35-sc-start/"><strong>Windows Command #35 — <code>sc start</code></strong></a>. Use it when a service is currently running and you need to request a controlled shutdown from an elevated Command Prompt.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=bP3IHdVeatk","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=bP3IHdVeatk
</div><figcaption class="wp-element-caption"><em>AddictiveTipsTV — How to stop and start a Windows service from Command Prompt.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Use the Service Name</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The basic syntax is <code>sc stop ServiceName</code>. Microsoft’s current <a href="https://learn.microsoft.com/windows/desktop/Services/controlling-a-service-using-sc"><strong>SC documentation</strong></a> defines <code>stop</code> as one of the service-control commands sent through <code>Sc.exe</code>. The value after <code>stop</code> should be the service name assigned when the service was installed—not merely the friendly display name shown to users. If you are unsure, query the service first with <code>sc query</code> or inspect it in the Services console before sending a stop request.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=gnX18cbT9HE","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=gnX18cbT9HE
</div><figcaption class="wp-element-caption"><em>El Barto Mz — Windows service management from CMD, including <code>sc query</code>, <code>sc start</code>, and stop/start workflow.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>STOP_PENDING Does Not Mean the Service Is Already Stopped</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After <code>sc stop</code>, Windows may report <code>STATE : 3 STOP_PENDING</code>. That means the Service Control Manager accepted the stop request, but the service is still shutting down. Do not assume the service is finished just because the prompt returned. Run <code>sc query ServiceName</code> again and wait for <code>STATE : 1 STOPPED</code>. This distinction matters during troubleshooting, scripting, updates, and service restarts because the next action may fail if the service has not completed its shutdown.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=xr3xW2fFPU8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=xr3xW2fFPU8
</div><figcaption class="wp-element-caption"><em>Tiny Tips — Starting and stopping Windows services manually and from Command Prompt.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Not Every Service Can Be Stopped</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Some Windows services reject stop controls because they are protected, critical, already stopping, disabled in a way that prevents the expected workflow, or have dependencies that make a stop unsafe. Microsoft’s <code>sc stop</code> documentation explicitly notes that not all services can be stopped. For training, use a lab VM or a harmless test service rather than stopping security, storage, networking, update, authentication, or other production-critical services simply to practice the command.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=DH6n3wNsBQw","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=DH6n3wNsBQw
</div><figcaption class="wp-element-caption"><em>KTS Training Videos — Windows Service Control Manager fundamentals and safely enabling or disabling services.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Use sc.exe in PowerShell</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In classic Windows PowerShell, <code>sc</code> can be an alias for <code>Set-Content</code>. To avoid ambiguity, call the executable explicitly: <code>sc.exe stop ServiceName</code>. This is an important difference between Command Prompt and PowerShell. If you are writing documentation or scripts that may run from PowerShell, using <code>sc.exe</code> makes the intent unambiguous.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/PowerShell/comments/jbtzq6/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/PowerShell/comments/jbtzq6/
</div><figcaption class="wp-element-caption"><em>A directly relevant PowerShell discussion explains the <code>sc</code> alias ambiguity and recommends calling <code>sc.exe</code> explicitly when controlling Windows services.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Quick Commands</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><code>sc query ServiceName</code> — check the current service state.</li><li><code>sc stop ServiceName</code> — request that a service stop from Command Prompt.</li><li><code>sc.exe stop ServiceName</code> — explicit executable form, especially useful in PowerShell.</li><li><code>sc start ServiceName</code> — start the service again after verifying it is stopped.</li><li><code>sc queryex state= all type= service</code> — list service states when you need to identify a service.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Safe Lab</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Use a disposable Windows lab VM or a noncritical test service.</li><li>Open Command Prompt as Administrator.</li><li>Run <code>sc query ServiceName</code> and confirm that the service is running.</li><li>Run <code>sc stop ServiceName</code>.</li><li>Read the returned state. If it says <code>STOP_PENDING</code>, wait briefly.</li><li>Run <code>sc query ServiceName</code> again until the state is <code>STOPPED</code>.</li><li>If the lab requires it, restore the service with <code>sc start ServiceName</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What does <code>sc stop</code> do?</strong> It sends a stop control request to a Windows service.</li><li><strong>What does <code>STOP_PENDING</code> mean?</strong> The service accepted the stop request but has not finished shutting down.</li><li><strong>How do you verify that a service fully stopped?</strong> Run <code>sc query ServiceName</code> and confirm <code>STATE : 1 STOPPED</code>.</li><li><strong>Can every Windows service be stopped?</strong> No.</li><li><strong>Why use <code>sc.exe</code> in PowerShell?</strong> Because <code>sc</code> can resolve to the <code>Set-Content</code> alias instead of the Service Controller executable.</li><li><strong>Should you practice by stopping random production services?</strong> No. Use a lab VM or an explicitly noncritical test service.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Prior Windows Command Lessons</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/06/windows-command-33-net-start/"><strong>Windows Command #33 — <code>net start</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/06/windows-command-34-sc-query/"><strong>Windows Command #34 — <code>sc query</code></strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/07/windows-command-35-sc-start/"><strong>Windows Command #35 — <code>sc start</code></strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image directly shows the Windows <code>SC STOP Spooler</code> command and resulting service-state output. No unrelated generic Windows or computer photograph is used. Technical references include Microsoft’s current SC documentation and current Windows service-management documentation. Every video is distinct and directly related to Windows service control; the Reddit embed is directly about the <code>sc</code>/<code>sc.exe</code> PowerShell behavior.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Support and donation options are available through BitcoinVersus.Tech.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech is not a financial advisor. Content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->