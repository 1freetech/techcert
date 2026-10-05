---
title: "OSPython.022: Context Managers and the with Statement Basics"
wordpress_post_id: 20280
source: BitcoinVersus.tech
published: 2026-10-03T13:56:46
modified: 2026-10-03T13:56:46
live_url: https://bitcoinversus.tech/2026/10/03/ospython-022-context-managers-with-statement-basics/
track: python
lesson_number: 22
raw_source: 022-ospython-022-context-managers-with-statement-basics-20280.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>A context manager handles setup and cleanup around a block of Python code.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The easiest example is a file. You open it, use it, and then it needs to be closed. Python's <code>with</code> statement lets that cleanup happen automatically when the block ends.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Start with the smallest useful example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>with open("scores.txt", "r") as file:
    data = file.read()

print(data)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Read it in plain English:</p><!-- /wp:paragraph -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Open <code>scores.txt</code>.</li><li>Call the opened file <code>file</code>.</li><li>Read the file inside the indented block.</li><li>Leave the block.</li><li>Python closes the file through the file object's context-management behavior.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Visual model: enter → use → exit</h2><!-- /wp:heading -->
<!-- wp:preformatted --><pre class="wp-block-preformatted">┌──────────────────┐     ┌──────────────────┐     ┌────────────────────┐
│ 1. ENTER / SETUP │  →  │ 2. USE RESOURCE  │  →  │ 3. EXIT / CLEANUP  │
│ open the file    │     │ read the file    │     │ close the file     │
└──────────────────┘     └──────────────────┘     └────────────────────┘
          ___________________ with block ___________________/</pre><!-- /wp:preformatted -->
<!-- wp:paragraph --><p><em>Visual learning diagram: a context manager surrounds the work with a controlled entry and exit.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>That is the main idea. Everything else in this lesson explains how Python makes that pattern work.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Why not just call close() yourself?</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>You can write:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>file = open("scores.txt", "r")
data = file.read()
file.close()</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>But cleanup becomes easier to forget as code grows. An error can also interrupt the normal path through the program. A context manager puts the resource-management rule around the block that uses the resource.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Python's language reference says the <code>with</code> statement wraps a block using methods supplied by a context manager, and if entry succeeds, the corresponding exit method is called when the block is left.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: What the with statement really does</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=i3iqByWM7ic","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=i3iqByWM7ic
</div><figcaption class="wp-element-caption"><em>This focused lesson explains what Python's with statement is doing around a block of code.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">The two important methods</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A class can participate in a normal <code>with</code> statement by implementing the context-manager protocol. The two names to recognize are:</p><!-- /wp:paragraph -->
<!-- wp:list --><ul class="wp-block-list"><li><code>__enter__()</code> — runs when Python enters the context.</li><li><code>__exit__()</code> — runs when Python leaves the context.</li></ul><!-- /wp:list -->

<!-- wp:preformatted --><pre class="wp-block-preformatted">with SomeContext() as thing:
     │
     ├── __enter__() runs
     │
     ├── indented block runs
     │
     └── __exit__() runs when the block is left</pre><!-- /wp:preformatted -->
<!-- wp:paragraph --><p><em>Visual model: enter establishes the context; exit performs the matching cleanup or exit work.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">A tiny custom context manager</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>class GameSession:
    def __enter__(self):
        print("Session started")
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        print("Session ended")
        return False

with GameSession() as session:
    print("Playing Hash Race")</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Output:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>Session started
Playing Hash Race
Session ended</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The important part is the order: <strong>enter → work → exit</strong>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">What does “as” mean?</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>In this example:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>with GameSession() as session:</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>the value returned by <code>__enter__()</code> is assigned to <code>session</code>. With files, the opened file object is what you normally use after <code>as</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Context managers and the with statement</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=YophuKuEP2w","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=YophuKuEP2w
</div><figcaption class="wp-element-caption"><em>This tutorial reinforces with, context managers, and the enter/exit lifecycle.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">What if an error happens inside the block?</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Python passes exception information to <code>__exit__()</code> when the block is being left because of an exception. That gives the context manager a chance to perform its exit work even when the normal flow was interrupted.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For a beginner, remember this:</p><!-- /wp:paragraph -->
<!-- wp:preformatted --><pre class="wp-block-preformatted">ENTER
  ↓
USE RESOURCE
  ↓
normal finish OR exception
  ↓
EXIT / CLEANUP</pre><!-- /wp:preformatted -->

<!-- wp:paragraph --><p>Whether an exception is then allowed to continue depends on what <code>__exit__()</code> returns. Returning a false value, including <code>False</code> or <code>None</code>, does not suppress the exception. Returning a true value tells the <code>with</code> machinery that the exception was handled.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">How this connects to the earlier file lesson</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/09/27/open-source-python-lesson-7-reading-and-writing-files/">OSPython.007: Reading and Writing Files</a> introduced file operations. This lesson explains why the <code>with open(...)</code> pattern is so useful: the file object is a context manager that handles its exit behavior for you.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Context managers are not only for files</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The same pattern can manage many kinds of resources or temporary states. Examples include locks, database connections, temporary directories, and other resources that need a clear beginning and end.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The exact setup and cleanup depend on the context manager. The common idea stays the same:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>with resource_manager() as resource:
    # use the resource here
    pass

# exit work has happened here</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: What exactly is a Python context manager?</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IQ20WLlEHbU","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=IQ20WLlEHbU
</div><figcaption class="wp-element-caption"><em>This visual explanation reinforces the resource-management idea behind Python context managers.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">A useful connection to generators and decorators</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Python's <code>contextlib</code> module includes a <code>@contextmanager</code> decorator. It can turn a specially written generator function into a context manager. This connects two recent lessons—<a href="https://bitcoinversus.tech/2026/10/03/ospython-018-decorators-basics/">decorators</a> and <a href="https://bitcoinversus.tech/2026/10/03/ospython-019-generators-yield-basics/">generators</a>—to the idea in this lesson.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>from contextlib import contextmanager

@contextmanager
def game_session():
    print("Session started")
    try:
        yield
    finally:
        print("Session ended")

with game_session():
    print("Playing Hash Race")</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>You do not need to memorize this version yet. The important connection is that <code>yield</code> marks where the body of the <code>with</code> block runs, while the code around it handles entry and exit work.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Thinking <code>with</code> is only special syntax for files.</li><li>Forgetting that the indented block defines the active context.</li><li>Assuming <code>__exit__()</code> means every exception is automatically ignored.</li><li>Manually calling <code>__enter__()</code> and <code>__exit__()</code> when a normal <code>with</code> statement is clearer.</li><li>Putting code that still needs the resource after the <code>with</code> block has ended.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a small text file named <code>score.txt</code>.</li><li>Open it with <code>with open("score.txt", "r") as file:</code>.</li><li>Read and print the contents inside the block.</li><li>Draw the three boxes: <strong>ENTER → USE → EXIT</strong>.</li><li>Explain which method corresponds to entering and which corresponds to exiting a custom context manager.</li><li>Explain why resource cleanup is easier to reason about when it is attached to the context.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>A Python context manager defines what should happen when code enters and leaves a controlled context.</strong> The <code>with</code> statement makes that lifecycle easy to use. Start by remembering one visual: <strong>ENTER → USE → EXIT/CLEANUP.</strong></p><!-- /wp:paragraph -->