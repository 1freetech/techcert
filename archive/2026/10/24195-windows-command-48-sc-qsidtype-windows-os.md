---
post_id: 24195
title: "Windows Command #48 – sc qsidtype (Windows OS)"
live_url: "https://bitcoinversus.tech/2026/10/13/windows-command-48-sc-qsidtype-windows-os/"
slug: "windows-command-48-sc-qsidtype-windows-os"
featured_media_id: 24196
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/windows-command-48-sc-qsidtype-cover-1200x630-1.png"
status: publish
---

<!-- wp:paragraph -->
<p><strong><code>sc.exe qsidtype</code> queries the configured Service SID type for a Windows service.</strong> It is a read-only Service Control Manager command: it tells you whether a service is configured with no per-service SID, an unrestricted Service SID, or a restricted Service SID.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/12/windows-command-47-sc-privs-windows-os/"><strong>Windows Command #47 – sc privs</strong></a>, <a href="https://bitcoinversus.tech/2026/10/11/windows-command-46-sc-qprivs-windows-os/"><strong>Windows Command #46 – sc qprivs</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/08/windows-command-38-sc-qc-windows-os/"><strong>Windows Command #38 – sc qc</strong></a>. Together, these commands help inspect service identity, privileges, and configuration before you make security-sensitive changes.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=9wQm6jeWWgg&amp;w=900&amp;h=506]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>Attack Detect Defend explains why Windows services are security-sensitive objects and shows how the Service Control Manager fits into service execution, persistence, detection, and defense.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You’ll Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Explain what a Windows Service SID is.</li><li>Run <code>sc.exe qsidtype SERVICE_NAME</code>.</li><li>Interpret <code>NONE</code>, <code>UNRESTRICTED</code>, and <code>RESTRICTED</code>.</li><li>Distinguish the SID type from the actual SID value.</li><li>Understand why Service SIDs improve resource isolation.</li><li>Recognize the shared-process restriction rule.</li><li>Use SID-type checks during Windows Firewall and service-hardening troubleshooting.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What Is a Service SID?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A Windows Service SID is a security identity associated with a specific service. Microsoft introduced per-service SIDs as part of Windows Service Hardening so permissions can be granted to one service rather than broadly to every service running under the same built-in account.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The friendly account form is <code>NT SERVICE\ServiceName</code>. The underlying SID uses the <code>S-1-5-80-...</code> namespace. This lets administrators place a service-specific identity in an access control list for a file, registry key, named object, database permission, or other securable resource.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Microsoft’s <a href="https://learn.microsoft.com/en-us/windows/win32/api/winsvc/ns-winsvc-service_sid_info"><strong>SERVICE_SID_INFO documentation</strong></a> defines three Service SID types: <code>NONE</code>, <code>UNRESTRICTED</code>, and <code>RESTRICTED</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Basic Syntax</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Command:</strong> <code>sc.exe qsidtype SERVICE_NAME</code></p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sc.exe qsidtype w32time</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A successful query returns the service name and a <code>SERVICE_SID_TYPE</code> value. Because this is a query operation, it does not change the service configuration.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In PowerShell, use <code>sc.exe</code> explicitly. On some PowerShell versions and profiles, <code>sc</code> can resolve to another command or alias rather than the Service Control executable.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">SERVICE_SID_TYPE: NONE</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>NONE</code> means the service is not configured to add a per-service SID to its process token through this mechanism. Microsoft documents this as <code>SERVICE_SID_TYPE_NONE</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not interpret <code>NONE</code> as “the service has no identity.” The service still runs under a service account or built-in account and still has a process token. The result only tells you that the per-service SID feature is not enabled for that service.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[embed]https://www.reddit.com/r/sysadmin/comments/e03jhu/[/embed]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>An r/sysadmin discussion examines exactly what enabling an unrestricted SID type changes for the Windows NPS service and why service-specific identity matters to Windows Firewall rules.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">SERVICE_SID_TYPE: UNRESTRICTED</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>UNRESTRICTED</code> means the Service Control Manager is configured to add the service’s per-service SID to the service process token when the applicable service process is created. Microsoft documents the service SID as enabled by default in the token and capable of being used as an owner SID.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This enables permissions such as <code>NT SERVICE\MSSQLSERVER</code> or <code>NT SERVICE\HealthService</code> to be granted directly to the service rather than granting equivalent access to a broad account such as LocalSystem.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Microsoft’s SQL Server guidance uses this pattern to grant rights directly to service identities. The same security concept applies outside SQL Server: the Service SID can be placed in ACLs so only the intended service receives access.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">SERVICE_SID_TYPE: RESTRICTED</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>RESTRICTED</code> includes the per-service SID and also places Service SID information in the restricted portion of the token. Microsoft documents additional restricted SIDs including the World SID, the service logon SID, and the write-restricted SID <code>S-1-5-33</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The practical goal is tighter write isolation. A service configured this way can be prevented from writing to resources unless the relevant restricted identities are allowed. This is a stronger configuration than merely adding a Service SID.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Shared-process warning:</strong> Microsoft states that if several services are hosted in the same process and one service uses <code>RESTRICTED</code>, all services hosted in that process must use <code>RESTRICTED</code>. This is one reason administrators should inspect the service hosting model before changing SID types.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=j26zUKjOm8g&amp;w=900&amp;h=506]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>ManageEngine reviews Windows service-account security and least-privilege practices, providing broader context for why per-service identities and narrowly scoped permissions matter.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">qsidtype Does Not Show the Actual SID</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>sc.exe qsidtype</code> tells you the <strong>type</strong> of Service SID configuration. It does not print the actual <code>S-1-5-80-...</code> identifier.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>To display the actual SID generated for a service, use <code>sc.exe showsid SERVICE_NAME</code>. That will be covered separately so the query for SID type and the query for the SID value remain distinct troubleshooting steps.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why Windows Firewall May Care About SID Type</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Current Microsoft Windows Firewall guidance says a firewall rule that is scoped to a specific service requires the service to have a SID type of <code>UNRESTRICTED</code> or <code>RESTRICTED</code>. If <code>sc qsidtype SERVICE_NAME</code> returns <code>NONE</code>, the service cannot be targeted by that service-specific firewall-rule option.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This makes <code>qsidtype</code> a useful diagnostic command when a service-specific firewall rule appears correct but does not behave as expected.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[embed]https://www.reddit.com/r/PFSENSE/comments/dbyff5/[/embed]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>A pfSense community post documents a real Windows Server RADIUS troubleshooting case involving <code>sc sidtype IAS unrestricted</code> and service-aware Windows Firewall behavior.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Query a Remote Computer</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>SC supports a remote server name in UNC form before the command:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>sc.exe \\SERVER01 qsidtype w32time</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Remote queries require connectivity to the remote Service Control Manager and sufficient permissions. An access-denied response is an authorization problem, not evidence that the target service has no Service SID.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Safe Inspection Workflow</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>Identify the service’s short name.</li><li>Run <code>sc.exe qc SERVICE_NAME</code> to inspect its configuration and service type.</li><li>Run <code>sc.exe qsidtype SERVICE_NAME</code>.</li><li>Record whether the result is <code>NONE</code>, <code>UNRESTRICTED</code>, or <code>RESTRICTED</code>.</li><li>If you need the actual Service SID, run <code>sc.exe showsid SERVICE_NAME</code>.</li><li>If you are troubleshooting a firewall rule, confirm that the SID type is not <code>NONE</code>.</li><li>If you are reviewing resource permissions, look for an ACE using <code>NT SERVICE\ServiceName</code> or the corresponding Service SID.</li><li>Do not change the SID type until you understand the service’s resource and hosting requirements.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Confusing SID type with the SID itself:</strong> <code>qsidtype</code> reports the configuration class; <code>showsid</code> reports the actual SID value.</li><li><strong>Assuming NONE means no account:</strong> the service still has a normal process token and service account context.</li><li><strong>Assuming UNRESTRICTED means “no security”:</strong> it means the per-service SID is added without the additional restricted-token behavior.</li><li><strong>Changing to RESTRICTED casually:</strong> tighter write restrictions can break services whose resources are not ACLed correctly.</li><li><strong>Ignoring shared-process hosting:</strong> restricted SID behavior has special requirements when services share a process.</li><li><strong>Using a display name instead of the service name:</strong> use the service’s short name with SC commands.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hands-On Exercise</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>Open an elevated Command Prompt or PowerShell window on a disposable Windows VM.</li><li>Run <code>sc.exe query</code> and choose two noncritical services to inspect.</li><li>Run <code>sc.exe qc SERVICE_NAME</code> for each service.</li><li>Run <code>sc.exe qsidtype SERVICE_NAME</code> for each service.</li><li>Record the returned SID type.</li><li>Run <code>sc.exe showsid SERVICE_NAME</code> and compare the actual SID with the SID-type result.</li><li>Open the security properties of a disposable folder and check whether <code>NT SERVICE\ServiceName</code> can be resolved for a service with an enabled Service SID.</li><li>Do not change SID types in this exercise. The goal is inspection and interpretation.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>What does <code>sc.exe qsidtype</code> query?</li><li>Does <code>qsidtype</code> change the service?</li><li>What are the three SID-type values?</li><li>What does <code>NONE</code> mean?</li><li>What additional behavior distinguishes <code>RESTRICTED</code> from <code>UNRESTRICTED</code>?</li><li>Which command prints the actual Service SID?</li><li>Why can Service SIDs be safer than granting access broadly to LocalSystem?</li><li>Why does shared-process hosting matter for restricted Service SIDs?</li><li>What SID types can be used for service-specific Windows Firewall rules?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>The configured Service SID type for a service.</li><li>No. It is a query operation.</li><li><code>NONE</code>, <code>UNRESTRICTED</code>, and <code>RESTRICTED</code>.</li><li>No per-service SID is configured to be added through the Service SID mechanism.</li><li>The Service SID also participates in the restricted token, with additional restricted identities used to limit writes.</li><li><code>sc.exe showsid SERVICE_NAME</code>.</li><li>Permissions can be granted to one specific service instead of every process sharing a broad built-in service account.</li><li>If one service in a shared process is configured as restricted, Microsoft requires all services in that process to be restricted.</li><li><code>UNRESTRICTED</code> or <code>RESTRICTED</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><code>sc.exe qsidtype</code> is the inspection command for per-service SID configuration.</strong> Use it to determine whether a service is operating with no Service SID configuration, an unrestricted per-service identity, or a restricted service identity before you troubleshoot ACLs, service-aware firewall rules, or Windows Service Hardening.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Primary references:</strong> <a href="https://learn.microsoft.com/en-us/windows/win32/services/configuring-a-service-using-sc">Microsoft Learn — Configuring a Service Using SC</a>, <a href="https://learn.microsoft.com/en-us/windows/win32/api/winsvc/ns-winsvc-service_sid_info">Microsoft Learn — SERVICE_SID_INFO</a>, and <a href="https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/configure">Microsoft Learn — Windows Firewall configuration</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Next:</strong> Windows Command #49 will cover <code>sc sidtype</code>, the write-side command used to configure the Service SID type.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech provides technical education and analysis for informational purposes only. Test service-security changes in a disposable environment before applying them to production systems.</em></p>
<!-- /wp:paragraph -->