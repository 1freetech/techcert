---
title: "Linux Command #38 – useradd (Linux OS)"
status: published
wordpress_post_id: 20219
published: "2026-10-03T07:44:15"
live_url: "https://bitcoinversus.tech/2026/10/03/linux-command-38-useradd/"
series: "Linux Commands"
pathway: linux
lesson_number: "38"
featured_media_id: 20218
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-38-useradd-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=O1ZAiqpfAnc"
youtube_2: "https://www.youtube.com/watch?v=raw_rHnRskY"
youtube_3: "https://www.youtube.com/watch?v=uS8aEZ7fUf8"
---

# Linux Command #38 – useradd (Linux OS)

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong><code>useradd</code> creates a new Linux user account.</strong></p>

<p class="wp-block-paragraph">Think of it like adding a new person to a computer&#8217;s list of recognized users. The new account can then have its own username, home directory, password, files, and permissions.</p>

<h2 class="wp-block-heading">The simple command</h2>
<pre class="wp-block-code"><code>sudo useradd -m alex</code></pre>

<p class="wp-block-paragraph">This example has three easy parts:</p>
<ul class="wp-block-list"><li><code>sudo</code> runs the administrative command with elevated privileges.</li><li><code>useradd</code> creates the account.</li><li><code>-m</code> tells <code>useradd</code> to create the user&#8217;s home directory if it does not already exist.</li><li><code>alex</code> is the new username.</li></ul>

<p class="wp-block-paragraph">After this command, the new home directory is normally <code>/home/alex</code>.</p>

<h2 class="wp-block-heading">Video 1: useradd from the beginning</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/O1ZAiqpfAnc?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This focused Linux tutorial introduces the useradd command and creating users.</em></figcaption></figure>

<h2 class="wp-block-heading">Give the new user a password</h2>
<p class="wp-block-paragraph">The previous lesson covered <a href="https://bitcoinversus.tech/2026/10/02/linux-command-37-passwd/">Linux Command #37 – passwd</a>. The two commands fit together naturally.</p>

<pre class="wp-block-code"><code>sudo passwd alex</code></pre>

<p class="wp-block-paragraph">Linux asks you to enter the new password and then type it again. The password itself is not normally displayed while you type it.</p>

<p class="wp-block-paragraph">A simple account-creation sequence is therefore:</p>
<pre class="wp-block-code"><code>sudo useradd -m alex
sudo passwd alex</code></pre>

<h2 class="wp-block-heading">Check that the account exists</h2>
<p class="wp-block-paragraph">You can use the earlier <code>getent</code> lesson to look up the account:</p>

<pre class="wp-block-code"><code>getent passwd alex</code></pre>

<p class="wp-block-paragraph">If the account exists, you should get a line of account information for <code>alex</code>.</p>

<h2 class="wp-block-heading">Video 2: Creating users with useradd</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/raw_rHnRskY?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This lesson demonstrates creating Linux users with useradd.</em></figcaption></figure>

<h2 class="wp-block-heading">Why use -m?</h2>
<p class="wp-block-paragraph">A home directory gives the user a normal place for personal files and configuration files.</p>

<pre class="wp-block-code"><code>sudo useradd -m alex</code></pre>

<p class="wp-block-paragraph">The <code>-m</code> option explicitly requests home-directory creation. This is useful because account defaults can vary between Linux distributions and system configurations.</p>

<p class="wp-block-paragraph">You can check the directory with:</p>
<pre class="wp-block-code"><code>ls -ld /home/alex</code></pre>

<h2 class="wp-block-heading">A simple workplace example</h2>
<p class="wp-block-paragraph">Imagine a new technician named Alex joins a team and needs an authorized Linux account on a training server. An administrator could create the account, create its home directory, set an initial password according to company policy, and then verify the account record.</p>

<pre class="wp-block-code"><code>sudo useradd -m alex
sudo passwd alex
getent passwd alex</code></pre>

<p class="wp-block-paragraph">Each command has one clear job: <strong>create → set password → verify</strong>.</p>

<h2 class="wp-block-heading">Video 3: Practical useradd options</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/uS8aEZ7fUf8?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This recent beginner tutorial demonstrates useradd and common options such as creating a home directory.</em></figcaption></figure>

<h2 class="wp-block-heading">useradd does not mean “give every permission”</h2>
<p class="wp-block-paragraph">Creating an account does not automatically mean the new user should become an administrator. Give users only the access they actually need. Group membership and administrative privileges should follow the system owner&#8217;s policy.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Forgetting <code>sudo</code> when administrative privileges are required.</li><li>Forgetting <code>-m</code> when you intend to create a normal home directory explicitly.</li><li>Creating the account but forgetting to handle its password or login policy.</li><li>Assuming every Linux distribution has identical account-creation defaults.</li><li>Giving a new account more permissions than it needs.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<p class="wp-block-paragraph">Only do this on a Linux system or lab that you are authorized to administer.</p>
<ol class="wp-block-list"><li>Create a test user with a home directory: <code>sudo useradd -m alex</code>.</li><li>Set the account password according to your lab&#8217;s rules: <code>sudo passwd alex</code>.</li><li>Verify the account: <code>getent passwd alex</code>.</li><li>Check the home directory: <code>ls -ld /home/alex</code>.</li><li>Explain what the <code>-m</code> option does.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong><code>useradd</code> creates a Linux user account.</strong> A beginner-friendly pattern is <code>sudo useradd -m username</code>, followed by the system&#8217;s approved password/login setup and a quick verification with <code>getent passwd username</code>.</p>
