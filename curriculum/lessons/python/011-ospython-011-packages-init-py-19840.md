---
title: "OSPython.011: Packages and __init__.py"
wordpress_post_id: 19840
source: BitcoinVersus.tech
published: 2026-10-01T12:38:50
modified: 2026-10-01T12:39:16
live_url: https://bitcoinversus.tech/2026/10/01/ospython-011-packages-init-py/
track: python
lesson_number: 11
raw_source: 011-ospython-011-packages-init-py-19840.gutenberg.html
---

<!-- wp:paragraph --><p>A Python <strong>package</strong> is a way to organize related modules together. Think of a package as a folder for Python code that belongs to the same part of a project.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>This lesson follows OSPython.008 on modules/imports, OSPython.009 on virtual environments, and <a href="https://bitcoinversus.tech/2026/10/01/ospython-010-pip-package-installation/">OSPython.010: pip and Package Installation</a>. Now we will build a tiny package of our own.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Package vs. Module</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A <strong>module</strong> can be a single Python file such as <code>player.py</code>. A <strong>package</strong> groups modules under one package name.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">A Tiny Package</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>game/
    __init__.py
    player.py
    scores.py
main.py</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Here, <code>game</code> is the package. <code>player.py</code> and <code>scores.py</code> are modules inside it.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">What Does __init__.py Do?</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>In a regular Python package, <code>__init__.py</code> identifies the directory as a package and can contain initialization code. For a beginner project, it can simply be an empty file.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video: Understanding __init__.py</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>This focused tutorial demonstrates how <code>__init__.py</code> is used when organizing and importing Python code from a package.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=cONc0NcKE7s","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=cONc0NcKE7s
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Import From the Package</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Suppose <code>player.py</code> contains a simple function:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>def show_player(name):
    print("Player:", name)</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Then <code>main.py</code> can import that module from the package:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>from game import player

player.show_player("Satoshi")</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The package name comes first, followed by the module we want to use.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Gaming Example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A small game might keep player code in <code>player.py</code>, scoring code in <code>scores.py</code>, and map code in <code>maps.py</code>. Putting those files inside a <code>game</code> package keeps related code together instead of putting every file in one folder.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Bitcoin Mining Example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A simple mining-monitor project could use a <code>miner</code> package containing <code>temperature.py</code>, <code>hashrate.py</code>, and <code>status.py</code>. Each module handles one small job while the package groups them under one clear name.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Packages You Create vs. Packages You Install</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>In OSPython.010, you used <code>pip</code> to install packages written by other people. In this lesson, you are learning the basic structure used to organize your own Python code. Both ideas use packages, but from different sides: installing reusable code and creating organized reusable code.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a folder named <code>game</code>.</li><li>Add an empty <code>__init__.py</code>.</li><li>Create <code>player.py</code> with a simple function.</li><li>Create <code>main.py</code> outside the package.</li><li>Use <code>from game import player</code> and call your function.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A module is a Python file; a package organizes related modules under one name. A regular package commonly contains <code>__init__.py</code>, and package imports let larger programs stay organized as they grow.</p><!-- /wp:paragraph -->