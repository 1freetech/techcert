---
title: "Linux Command #36 – getent (Linux OS)"
status: published
wordpress_post_id: 20039
published: "2026-10-02T11:44:33"
live_url: "https://bitcoinversus.tech/2026/10/02/linux-command-36-getent/"
series: "Linux Commands"
pathway: linux
command_number: "36"
command: "getent"
featured_media_id: 20038
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-36-getent-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=NDKszREq8Ho"
youtube_2: "https://www.youtube.com/watch?v=w_u2GWVtii4"
youtube_3: "https://www.youtube.com/watch?v=-OzmiIPOTxI"
---

# Linux Command #36 – getent (Linux OS)

Original published WordPress article content, preserved below in full:



<p class="has-large-font-size wp-block-paragraph"><strong>The Linux <code>getent</code> command retrieves entries from system databases such as users, groups, hosts, networks, protocols, and services through the Name Service Switch.</strong></p>



<p class="wp-block-paragraph">In <a href="https://bitcoinversus.tech/2026/10/02/linux-command-35-groups/">Linux Command #35 – groups</a>, we checked which groups a user belongs to. <code>getent</code> goes wider: it can query the same user and group information Linux applications use, including centrally managed identity sources when the system is configured for them.</p>



<h2 class="wp-block-heading">Start with getent passwd</h2>



<pre class="wp-block-code"><code>getent passwd</code></pre>



<p class="wp-block-paragraph">This asks the system for entries in the <code>passwd</code> database. On a simple machine, much of the output may resemble <code>/etc/passwd</code>. On systems using services such as LDAP, SSSD, or other directory sources, <code>getent</code> can also return accounts supplied through those configured identity sources.</p>



<pre class="wp-block-code"><code>$ getent passwd alex
alex:x:1001:1001:Alex:/home/alex:/bin/bash</code></pre>



<p class="wp-block-paragraph">Adding a username limits the query to one account. The colon-separated fields include the username, UID, primary GID, description field, home directory, and login shell.</p>



<h2 class="wp-block-heading">Video 1: getent command walkthrough</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/NDKszREq8Ho?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>LinuxSimply demonstrates practical getent lookups for users, groups, services, hosts, and networks.</em></figcaption></figure>



<h2 class="wp-block-heading">Query a specific group</h2>



<pre class="wp-block-code"><code>getent group sudo</code></pre>



<p class="wp-block-paragraph">This requests the entry for the <code>sudo</code> group. A typical result may look similar to:</p>



<pre class="wp-block-code"><code>sudo:x:27:alex,jordan</code></pre>



<p class="wp-block-paragraph">The output identifies the group name, its numeric GID, and supplementary members listed in the group database. This complements both <a href="https://bitcoinversus.tech/2026/10/02/linux-command-34-id/">Linux Command #34 – id</a> and the previous <code>groups</code> lesson.</p>



<h2 class="wp-block-heading">Why not just read /etc/passwd?</h2>



<p class="wp-block-paragraph">Linux can obtain identity information from more than local text files. The Name Service Switch configuration in <code>/etc/nsswitch.conf</code> tells the system which sources to consult for databases such as <code>passwd</code>, <code>group</code>, and <code>hosts</code>.</p>



<pre class="wp-block-code"><code>grep '^passwd:' /etc/nsswitch.conf
grep '^group:' /etc/nsswitch.conf</code></pre>



<p class="wp-block-paragraph">A host joined to a central identity system may be configured to consult local files plus another provider. In that situation, reading only <code>/etc/passwd</code> can miss accounts that <code>getent passwd</code> can see.</p>



<h2 class="wp-block-heading">Video 2: Linux users, groups, and account databases</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/w_u2GWVtii4?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>MPrashant Academy reviews Linux user and group management along with the passwd, shadow, and group files that getent can help you query through system databases.</em></figcaption></figure>



<h2 class="wp-block-heading">Look up hosts</h2>



<pre class="wp-block-code"><code>getent hosts localhost
getent hosts example.com</code></pre>



<p class="wp-block-paragraph">The <code>hosts</code> database lets you ask the system resolver for hostname information. This is useful because applications normally rely on the configured name-service path rather than reading one file in isolation.</p>



<h2 class="wp-block-heading">Look up services</h2>



<pre class="wp-block-code"><code>getent services ssh
getent services https</code></pre>



<p class="wp-block-paragraph">The services database maps familiar service names to ports and protocols. Depending on the system, you may see output similar to:</p>



<pre class="wp-block-code"><code>ssh                  22/tcp
https                443/tcp</code></pre>



<h2 class="wp-block-heading">Useful getent databases</h2>



<ul class="wp-block-list"><li><code>getent passwd</code> — user accounts.</li><li><code>getent group</code> — groups.</li><li><code>getent hosts</code> — hostnames and addresses.</li><li><code>getent services</code> — service names and ports.</li><li><code>getent protocols</code> — protocol names and numbers.</li><li><code>getent networks</code> — network database entries.</li></ul>



<h2 class="wp-block-heading">A data-center troubleshooting example</h2>



<p class="wp-block-paragraph">Suppose a technician can sign in to one management server but a centrally managed account appears missing on another. A quick comparison can help narrow the problem:</p>



<pre class="wp-block-code"><code>getent passwd alex
id alex
groups alex</code></pre>



<p class="wp-block-paragraph">If <code>getent passwd alex</code> returns nothing on the problem host while the account resolves elsewhere, the next troubleshooting step may involve that system’s identity-source or NSS configuration rather than simply assuming the local <code>/etc/passwd</code> file is wrong.</p>



<h2 class="wp-block-heading">Video 3: Users, groups, and /etc/passwd</h2>



<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/-OzmiIPOTxI?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Firebox Training explains Linux users, groups, /etc/passwd, and /etc/group—the core identity concepts behind common getent lookups.</em></figcaption></figure>



<h2 class="wp-block-heading">Check the command itself</h2>



<pre class="wp-block-code"><code>getent --help
getent --version</code></pre>



<p class="wp-block-paragraph"><code>--help</code> shows the local command’s supported syntax and databases. <code>--version</code> reports the installed implementation version on systems that provide the GNU version of <code>getent</code>.</p>



<h2 class="wp-block-heading">Common beginner mistakes</h2>



<ul class="wp-block-list"><li>Assuming <code>getent passwd</code> reads only <code>/etc/passwd</code>.</li><li>Confusing the <code>passwd</code> database with the <code>passwd</code> command used to change passwords.</li><li>Running an unfiltered database query when you only need one username or group.</li><li>Assuming an empty lookup automatically means an account does not exist anywhere; the configured identity source itself may be unavailable.</li><li>Forgetting that different systems can have different NSS configurations.</li></ul>



<h2 class="wp-block-heading">Practice</h2>



<ol class="wp-block-list"><li>Run <code>getent passwd</code> and inspect the first five lines.</li><li>Run <code>getent passwd "$USER"</code>.</li><li>Run <code>getent group</code> and locate one group you recognize.</li><li>Run <code>getent hosts localhost</code>.</li><li>Run <code>getent services ssh</code>.</li><li>Compare <code>getent passwd "$USER"</code> with <code>id "$USER"</code> and explain what each command tells you.</li></ol>



<h2 class="wp-block-heading">Key takeaway</h2>



<p class="wp-block-paragraph"><code>getent</code> is a flexible read-only lookup tool for Linux system databases. It is especially useful for user and group troubleshooting because it follows the system’s configured name-service path instead of assuming every identity lives in a single local file.</p>


