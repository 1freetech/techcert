---
title: "OSPython.022: Context Managers and the with Statement Basics"
status: published
wordpress_post_id: 20280
published: "2026-10-03T13:56:46"
live_url: "https://bitcoinversus.tech/2026/10/03/ospython-022-context-managers-with-statement-basics/"
series: "Open-Source Python"
pathway: python
lesson_number: "022"
featured_media_id: 20279
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-022-context-managers-with-statement-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=i3iqByWM7ic"
youtube_2: "https://www.youtube.com/watch?v=YophuKuEP2w"
youtube_3: "https://www.youtube.com/watch?v=IQ20WLlEHbU"
---

# OSPython.022: Context Managers and the with Statement Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>A context manager handles setup and cleanup around a block of Python code.</strong></p>

<p class="wp-block-paragraph">The easiest example is a file. You open it, use it, and then it needs to be closed. Python&#8217;s <code>with</code> statement lets that cleanup happen automatically when the block ends.</p>

<h2 class="wp-block-heading">Start with the smallest useful example</h2>
<pre class="wp-block-code"><code>with open("scores.txt", "r") as file:
    data = file.read()

print(data)</code></pre>

<p class="wp-block-paragraph">Read it in plain English:</p>
<ol class="wp-block-list"><li>Open <code>scores.txt</code>.</li><li>Call the opened file <code>file</code>.</li><li>Read the file inside the indented block.</li><li>Leave the block.</li><li>Python closes the file through the file object&#8217;s context-management behavior.</li></ol>

<h2 class="wp-block-heading">Visual model: enter → use → exit</h2>
<pre class="wp-block-preformatted">┌──────────────────┐     ┌──────────────────┐     ┌────────────────────┐
│ 1. ENTER / SETUP │  →  │ 2. USE RESOURCE  │  →  │ 3. EXIT / CLEANUP  │
│ open the file    │     │ read the file    │     │ close the file     │
└──────────────────┘     └──────────────────┘     └────────────────────┘
          ___________________ with block ___________________/</pre>
<p class="wp-block-paragraph"><em>Visual learning diagram: a context manager surrounds the work with a controlled entry and exit.</em></p>

<p class="wp-block-paragraph">That is the main idea. Everything else in this lesson explains how Python makes that pattern work.</p>

<h2 class="wp-block-heading">Why not just call close() yourself?</h2>
<p class="wp-block-paragraph">You can write:</p>
<pre class="wp-block-code"><code>file = open("scores.txt", "r")
data = file.read()
file.close()</code></pre>

<p class="wp-block-paragraph">But cleanup becomes easier to forget as code grows. An error can also interrupt the normal path through the program. A context manager puts the resource-management rule around the block that uses the resource.</p>

<p class="wp-block-paragraph">Python&#8217;s language reference says the <code>with</code> statement wraps a block using methods supplied by a context manager, and if entry succeeds, the corresponding exit method is called when the block is left.</p>

<h2 class="wp-block-heading">Video 1: What the with statement really does</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/i3iqByWM7ic?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This focused lesson explains what Python&#8217;s with statement is doing around a block of code.</em></figcaption></figure>

<h2 class="wp-block-heading">The two important methods</h2>
<p class="wp-block-paragraph">A class can participate in a normal <code>with</code> statement by implementing the context-manager protocol. The two names to recognize are:</p>
<ul class="wp-block-list"><li><code>__enter__()</code> — runs when Python enters the context.</li><li><code>__exit__()</code> — runs when Python leaves the context.</li></ul>

<pre class="wp-block-preformatted">with SomeContext() as thing:
     │
     ├── __enter__() runs
     │
     ├── indented block runs
     │
     └── __exit__() runs when the block is left</pre>
<p class="wp-block-paragraph"><em>Visual model: enter establishes the context; exit performs the matching cleanup or exit work.</em></p>

<h2 class="wp-block-heading">A tiny custom context manager</h2>
<pre class="wp-block-code"><code>class GameSession:
    def __enter__(self):
        print("Session started")
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        print("Session ended")
        return False

with GameSession() as session:
    print("Playing Hash Race")</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>Session started
Playing Hash Race
Session ended</code></pre>

<p class="wp-block-paragraph">The important part is the order: <strong>enter → work → exit</strong>.</p>

<h2 class="wp-block-heading">What does “as” mean?</h2>
<p class="wp-block-paragraph">In this example:</p>
<pre class="wp-block-code"><code>with GameSession() as session:</code></pre>

<p class="wp-block-paragraph">the value returned by <code>__enter__()</code> is assigned to <code>session</code>. With files, the opened file object is what you normally use after <code>as</code>.</p>

<h2 class="wp-block-heading">Video 2: Context managers and the with statement</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/YophuKuEP2w?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This tutorial reinforces with, context managers, and the enter/exit lifecycle.</em></figcaption></figure>

<h2 class="wp-block-heading">What if an error happens inside the block?</h2>
<p class="wp-block-paragraph">Python passes exception information to <code>__exit__()</code> when the block is being left because of an exception. That gives the context manager a chance to perform its exit work even when the normal flow was interrupted.</p>

<p class="wp-block-paragraph">For a beginner, remember this:</p>
<pre class="wp-block-preformatted">ENTER
  ↓
USE RESOURCE
  ↓
normal finish OR exception
  ↓
EXIT / CLEANUP</pre>

<p class="wp-block-paragraph">Whether an exception is then allowed to continue depends on what <code>__exit__()</code> returns. Returning a false value, including <code>False</code> or <code>None</code>, does not suppress the exception. Returning a true value tells the <code>with</code> machinery that the exception was handled.</p>

<h2 class="wp-block-heading">How this connects to the earlier file lesson</h2>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/09/27/open-source-python-lesson-7-reading-and-writing-files/">OSPython.007: Reading and Writing Files</a> introduced file operations. This lesson explains why the <code>with open(...)</code> pattern is so useful: the file object is a context manager that handles its exit behavior for you.</p>

<h2 class="wp-block-heading">Context managers are not only for files</h2>
<p class="wp-block-paragraph">The same pattern can manage many kinds of resources or temporary states. Examples include locks, database connections, temporary directories, and other resources that need a clear beginning and end.</p>

<p class="wp-block-paragraph">The exact setup and cleanup depend on the context manager. The common idea stays the same:</p>
<pre class="wp-block-code"><code>with resource_manager() as resource:
    # use the resource here
    pass

# exit work has happened here</code></pre>

<h2 class="wp-block-heading">Video 3: What exactly is a Python context manager?</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/IQ20WLlEHbU?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This visual explanation reinforces the resource-management idea behind Python context managers.</em></figcaption></figure>

<h2 class="wp-block-heading">A useful connection to generators and decorators</h2>
<p class="wp-block-paragraph">Python&#8217;s <code>contextlib</code> module includes a <code>@contextmanager</code> decorator. It can turn a specially written generator function into a context manager. This connects two recent lessons—<a href="https://bitcoinversus.tech/2026/10/03/ospython-018-decorators-basics/">decorators</a> and <a href="https://bitcoinversus.tech/2026/10/03/ospython-019-generators-yield-basics/">generators</a>—to the idea in this lesson.</p>

<pre class="wp-block-code"><code>from contextlib import contextmanager

@contextmanager
def game_session():
    print("Session started")
    try:
        yield
    finally:
        print("Session ended")

with game_session():
    print("Playing Hash Race")</code></pre>

<p class="wp-block-paragraph">You do not need to memorize this version yet. The important connection is that <code>yield</code> marks where the body of the <code>with</code> block runs, while the code around it handles entry and exit work.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Thinking <code>with</code> is only special syntax for files.</li><li>Forgetting that the indented block defines the active context.</li><li>Assuming <code>__exit__()</code> means every exception is automatically ignored.</li><li>Manually calling <code>__enter__()</code> and <code>__exit__()</code> when a normal <code>with</code> statement is clearer.</li><li>Putting code that still needs the resource after the <code>with</code> block has ended.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list"><li>Create a small text file named <code>score.txt</code>.</li><li>Open it with <code>with open("score.txt", "r") as file:</code>.</li><li>Read and print the contents inside the block.</li><li>Draw the three boxes: <strong>ENTER → USE → EXIT</strong>.</li><li>Explain which method corresponds to entering and which corresponds to exiting a custom context manager.</li><li>Explain why resource cleanup is easier to reason about when it is attached to the context.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong>A Python context manager defines what should happen when code enters and leaves a controlled context.</strong> The <code>with</code> statement makes that lifecycle easy to use. Start by remembering one visual: <strong>ENTER → USE → EXIT/CLEANUP.</strong></p>
