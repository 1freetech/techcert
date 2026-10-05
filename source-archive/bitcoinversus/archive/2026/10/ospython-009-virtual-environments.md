---
title: "OSPython.009: Virtual Environments"
status: published
wordpress_post_id: 19729
published: "2026-10-01T00:11:16"
source_url: "https://bitcoinversus.tech/2026/10/01/ospython-009-virtual-environments/"
series: "Open-Source Python"
certification: OSPython
lesson_number: "009"
featured_media_id: 19728
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-009-cover.jpg"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=APOPm01BVrk"
technical_reference: "https://docs.python.org/3/tutorial/venv.html"
---

# OSPython.009: Virtual Environments

<!-- wp:paragraph -->
<p><strong>Simple explanation:</strong> A virtual environment gives one Python project its own place for installed packages. It helps keep the tools for one project separate from the tools used by another.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Definition:</strong> A <em>virtual environment</em> is a project-specific Python environment. It uses a Python interpreter and keeps that project’s installed packages in a separate location.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In <a href="https://bitcoinversus.tech/2026/09/30/ospython-008-modules-imports/">OSPython.008: Modules and Imports</a>, we used tools supplied by Python and shared a small module between scripts. A third-party package adds more tools. A virtual environment helps a project keep track of which packages it uses.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why separate environments?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Imagine one script uses version 1 of a library while another project needs version 2. Installing everything in one shared place can cause the projects to interfere with one another. Separate environments let each project keep its own package set.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A virtual environment does not install a completely independent operating system or magically make code secure. It uses a base Python installation and isolates project packages and scripts from other environments.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Create an environment</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Open a terminal in your project folder. On macOS, Linux, or WSL, run <code>python3 -m venv .venv</code>. On Windows, run <code>py -m venv .venv</code>; <code>python -m venv .venv</code> also works when the Python launcher is available under that name. The dot in <code>.venv</code> is a common folder naming convention.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>After creation, the folder holds the environment’s interpreter and support files. The exact folder layout differs between operating systems.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Watch the setup</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Corey Schafer’s walkthrough shows how to create and use Python virtual environments on Windows. The steps below also give the corresponding activation command for macOS, Linux, and WSL.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=APOPm01BVrk","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=APOPm01BVrk
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Video: “Python Tutorial: VENV (Windows)” — Corey Schafer.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Activate it and use its Python</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In PowerShell, activate with <code>.venv\Scripts\Activate.ps1</code>. In Windows Command Prompt, use <code>.venv\Scripts\activate.bat</code>. On macOS, Linux, or WSL, use <code>source .venv/bin/activate</code>. The prompt usually displays <code>(.venv)</code> when the environment is active.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Now check which Python will run with <code>python --version</code>. Use <code>python -m pip --version</code> to check pip through that same interpreter. Writing <code>python -m pip</code> helps ensure packages are installed with the Python you intend to use.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>To install a package in the active environment, run <code>python -m pip install requests</code>. Then <code>python -m pip show requests</code> displays information about that installed package. This practice example adds a package only inside the project environment.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Share the project’s package list</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>You can record installed package versions in <code>requirements.txt</code> with <code>python -m pip freeze &gt; requirements.txt</code>. A teammate or a second environment can install that list with <code>python -m pip install -r requirements.txt</code>. The file records dependencies; it does not contain the packages themselves.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Keep the environment folder, commonly <code>.venv/</code>, out of version control because it is local to your machine and can be recreated. A typical <code>.gitignore</code> entry is <code>.venv/</code>; commit your project files and its dependency list instead.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Turn it off and practice</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When finished, type <code>deactivate</code> in the terminal. This leaves the environment; it does not erase the <code>.venv</code> folder.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Practice: create a folder for a fictional equipment-report script, create its .venv, activate it, check the Python and pip locations, then deactivate it. In one sentence, explain how the project environment differs from your base Python.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Check your answer:</strong> The environment has a project-specific interpreter context and package location. Its installed packages are kept separate from other project environments. The base Python installation still exists underneath.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Create one environment per project with <code>python -m venv .venv</code> (or the platform’s Python command). Activate it before installing packages, use <code>python -m pip</code>, record needed packages, and deactivate it when you are done. See the <a href="https://docs.python.org/3/tutorial/venv.html">official Python virtual environments and packages guide</a> for additional platform details.</p>
<!-- /wp:paragraph -->
