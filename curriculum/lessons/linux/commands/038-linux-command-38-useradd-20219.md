---
title: "Linux Command #38 – useradd (Linux OS)"
wordpress_post_id: 20219
source: BitcoinVersus.tech
published: 2026-10-03T07:44:15
modified: 2026-10-03T07:44:15
live_url: https://bitcoinversus.tech/2026/10/03/linux-command-38-useradd/
track: linux/commands
lesson_number: 38
raw_source: 038-linux-command-38-useradd-20219.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong><code>useradd</code> creates a new Linux user account.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Think of it like adding a new person to a computer's list of recognized users. The new account can then have its own username, home directory, password, files, and permissions.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The simple command</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>sudo useradd -m alex</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This example has three easy parts:</p><!-- /wp:paragraph -->
<!-- wp:list --><ul class="wp-block-list"><li><code>sudo</code> runs the administrative command with elevated privileges.</li><li><code>useradd</code> creates the account.</li><li><code>-m</code> tells <code>useradd</code> to create the user's home directory if it does not already exist.</li><li><code>alex</code> is the new username.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>After this command, the new home directory is normally <code>/home/alex</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: useradd from the beginning</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=O1ZAiqpfAnc","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=O1ZAiqpfAnc
</div><figcaption class="wp-element-caption"><em>This focused Linux tutorial introduces the useradd command and creating users.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Give the new user a password</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The previous lesson covered <a href="https://bitcoinversus.tech/2026/10/02/linux-command-37-passwd/">Linux Command #37 – passwd</a>. The two commands fit together naturally.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>sudo passwd alex</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Linux asks you to enter the new password and then type it again. The password itself is not normally displayed while you type it.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A simple account-creation sequence is therefore:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>sudo useradd -m alex
sudo passwd alex</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Check that the account exists</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>You can use the earlier <code>getent</code> lesson to look up the account:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>getent passwd alex</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>If the account exists, you should get a line of account information for <code>alex</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Creating users with useradd</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=raw_rHnRskY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=raw_rHnRskY
</div><figcaption class="wp-element-caption"><em>This lesson demonstrates creating Linux users with useradd.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Why use -m?</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A home directory gives the user a normal place for personal files and configuration files.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>sudo useradd -m alex</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The <code>-m</code> option explicitly requests home-directory creation. This is useful because account defaults can vary between Linux distributions and system configurations.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>You can check the directory with:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>ls -ld /home/alex</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">A simple workplace example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Imagine a new technician named Alex joins a team and needs an authorized Linux account on a training server. An administrator could create the account, create its home directory, set an initial password according to company policy, and then verify the account record.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>sudo useradd -m alex
sudo passwd alex
getent passwd alex</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Each command has one clear job: <strong>create → set password → verify</strong>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Practical useradd options</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=uS8aEZ7fUf8","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=uS8aEZ7fUf8
</div><figcaption class="wp-element-caption"><em>This recent beginner tutorial demonstrates useradd and common options such as creating a home directory.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">useradd does not mean “give every permission”</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Creating an account does not automatically mean the new user should become an administrator. Give users only the access they actually need. Group membership and administrative privileges should follow the system owner's policy.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Forgetting <code>sudo</code> when administrative privileges are required.</li><li>Forgetting <code>-m</code> when you intend to create a normal home directory explicitly.</li><li>Creating the account but forgetting to handle its password or login policy.</li><li>Assuming every Linux distribution has identical account-creation defaults.</li><li>Giving a new account more permissions than it needs.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Only do this on a Linux system or lab that you are authorized to administer.</p><!-- /wp:paragraph -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a test user with a home directory: <code>sudo useradd -m alex</code>.</li><li>Set the account password according to your lab's rules: <code>sudo passwd alex</code>.</li><li>Verify the account: <code>getent passwd alex</code>.</li><li>Check the home directory: <code>ls -ld /home/alex</code>.</li><li>Explain what the <code>-m</code> option does.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><code>useradd</code> creates a Linux user account.</strong> A beginner-friendly pattern is <code>sudo useradd -m username</code>, followed by the system's approved password/login setup and a quick verification with <code>getent passwd username</code>.</p><!-- /wp:paragraph -->