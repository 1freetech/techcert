---
title: "OSPython.007: Reading and Writing Files"
wordpress_post_id: 19287
source: BitcoinVersus.tech
published: 2026-09-27T20:32:00
modified: 2026-09-30T20:08:12
live_url: https://bitcoinversus.tech/2026/09/27/open-source-python-lesson-7-reading-and-writing-files/
track: python
lesson_number: 7
raw_source: 007-open-source-python-lesson-7-reading-and-writing-files-19287.gutenberg.html
---

<!-- wp:paragraph --><p><strong>Open-Source Python Lesson #7</strong> introduces file input and output. After learning exceptions in Lesson #6, the next practical step is saving information to disk and reading it back.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Open a file safely</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Python's <code>with</code> statement is a clean way to work with files because the file is closed when the block finishes.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><code>with open("notes.txt", "w", encoding="utf-8") as file:</code><br><code>&nbsp;&nbsp;&nbsp;&nbsp;file.write("Hello from Python!\n")</code></p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Read the file</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>with open("notes.txt", "r", encoding="utf-8") as file:</code><br><code>&nbsp;&nbsp;&nbsp;&nbsp;text = file.read()</code><br><br><code>print(text)</code></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>The mode <code>r</code> reads a file. The mode <code>w</code> writes a file and replaces existing contents. The mode <code>a</code> appends new information to the end.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Append another line</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>with open("notes.txt", "a", encoding="utf-8") as file:</code><br><code>&nbsp;&nbsp;&nbsp;&nbsp;file.write("Second line\n")</code></p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Technician exercise</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Create a small equipment log. Write a device name and status to <code>equipment.txt</code>, append a second device, then read the entire file and print it. This same basic pattern can later support logs, configuration files, test results, and automation scripts.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video reference</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=BRrem1k3904","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-block-embed-youtube wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=BRrem1k3904
</div><figcaption class="wp-element-caption"><em>Video reference: a practical demonstration of Python file handling, including reading, writing, appending, and the with statement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Use <code>with open(...)</code> to manage a file, choose the correct mode for reading or writing, and keep the first programs small enough that you can inspect the resulting file yourself.</p><!-- /wp:paragraph -->