---
title: "OSPython.021: Lambda Functions Basics"
status: published
wordpress_post_id: 20277
published: "2026-10-03T12:40:48"
live_url: "https://bitcoinversus.tech/2026/10/03/ospython-021-lambda-functions-basics/"
series: "Open-Source Python"
pathway: python
lesson_number: "021"
featured_media_id: 20276
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-021-lambda-functions-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=qEm_q72N_fE"
youtube_2: "https://www.youtube.com/watch?v=hYzwCsKGRrg"
youtube_3: "https://www.youtube.com/watch?v=IljPHDyBRog"
---

# OSPython.021: Lambda Functions Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>A Python <code>lambda</code> creates a small function from one expression.</strong></p>

<p class="wp-block-paragraph">You already know how to create a normal function with <code>def</code>. A lambda is another way to create a function when the job is very small.</p>

<h2 class="wp-block-heading">Start with the normal function</h2>
<pre class="wp-block-code"><code>def double(x):
    return x * 2

print(double(5))</code></pre>
<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>10</code></pre>

<p class="wp-block-paragraph">This function takes one value, doubles it, and returns the result.</p>

<h2 class="wp-block-heading">Now write the tiny lambda version</h2>
<pre class="wp-block-code"><code>double = lambda x: x * 2

print(double(5))</code></pre>
<p class="wp-block-paragraph">The output is still:</p>
<pre class="wp-block-code"><code>10</code></pre>

<p class="wp-block-paragraph">Read this from left to right:</p>
<pre class="wp-block-code"><code>lambda x: x * 2
       ↑    ↑
     input  result expression</code></pre>

<p class="wp-block-paragraph"><code>lambda x:</code> means “make a function that receives <code>x</code>.” The expression <code>x * 2</code> becomes the value returned by that function.</p>

<h2 class="wp-block-heading">Video 1: Python lambda functions for beginners</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/qEm_q72N_fE?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This beginner tutorial introduces Python lambda syntax and small examples.</em></figcaption></figure>

<h2 class="wp-block-heading">A lambda can take more than one input</h2>
<pre class="wp-block-code"><code>add = lambda a, b: a + b

print(add(3, 4))</code></pre>
<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>7</code></pre>

<p class="wp-block-paragraph">The pattern is still simple:</p>
<pre class="wp-block-code"><code>lambda inputs: expression</code></pre>

<p class="wp-block-paragraph">A lambda expression is limited to a single expression. If the logic needs several steps, a normal <code>def</code> function is usually much easier to read.</p>

<h2 class="wp-block-heading">Why use lambda at all?</h2>
<p class="wp-block-paragraph">Lambdas are useful when another operation needs a tiny function for one clear job.</p>

<p class="wp-block-paragraph">A common example is sorting.</p>
<pre class="wp-block-code"><code>players = [
    ("Alex", 90),
    ("Sam", 75),
    ("Jordan", 95)
]

players.sort(key=lambda player: player[1])

print(players)</code></pre>

<p class="wp-block-paragraph">Here, each item contains a player&#8217;s name and score. The lambda tells <code>sort()</code> to use item <code>[1]</code>—the score—as the sorting key.</p>

<p class="wp-block-paragraph">Result:</p>
<pre class="wp-block-code"><code>[('Sam', 75), ('Alex', 90), ('Jordan', 95)]</code></pre>

<h2 class="wp-block-heading">Video 2: Anonymous functions and lambda</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/hYzwCsKGRrg?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This lesson explains the connection between anonymous functions and Python&#8217;s lambda syntax.</em></figcaption></figure>

<h2 class="wp-block-heading">“Anonymous function” does not mean mysterious</h2>
<p class="wp-block-paragraph">You will often hear a lambda called an <strong>anonymous function</strong>. That means the function expression itself does not use a normal <code>def function_name(...)</code> statement.</p>

<p class="wp-block-paragraph">You can still store the resulting function object in a variable, as we did with <code>double</code>. But lambdas are especially useful when you pass the small function directly to something else:</p>

<pre class="wp-block-code"><code>names = ["Bo", "Alexander", "Sam"]

names.sort(key=lambda name: len(name))

print(names)</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>['Bo', 'Sam', 'Alexander']</code></pre>

<p class="wp-block-paragraph">The lambda says: “for each name, use its length as the sorting key.”</p>

<h2 class="wp-block-heading">Video 3: A short lambda walkthrough</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/IljPHDyBRog?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This focused walkthrough reinforces the idea of using lambda for small, one-expression functions.</em></figcaption></figure>

<h2 class="wp-block-heading">Lambda vs. def</h2>
<p class="wp-block-paragraph">Use the simplest tool that keeps the code clear.</p>
<ul class="wp-block-list"><li><strong>Use <code>lambda</code></strong> when the function is tiny, one expression, and easy to understand immediately.</li><li><strong>Use <code>def</code></strong> when the function needs a useful name, several steps, statements, documentation, or more complicated logic.</li></ul>

<p class="wp-block-paragraph">A lambda is not “better” than <code>def</code>. It is simply a compact option for small function expressions.</p>

<h2 class="wp-block-heading">How this connects to earlier lessons</h2>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/09/24/python-functions-parameters-return-values/">OSPython.001: Functions, Parameters, and Return Values</a> introduced normal Python functions. Lambda uses the same basic idea—inputs produce a result—but with compact expression syntax.</p>

<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/03/ospython-020-list-comprehensions-basics/">OSPython.020: List Comprehensions Basics</a> showed another compact Python syntax. In both cases, compact code is useful only when it stays easy to read.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Trying to put several statements inside one lambda.</li><li>Making a lambda so complicated that a normal <code>def</code> would be clearer.</li><li>Forgetting the colon between the parameters and expression.</li><li>Expecting <code>lambda</code> to use an explicit <code>return</code> statement.</li><li>Using lambda everywhere just because it is shorter.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list"><li>Create <code>square = lambda x: x * x</code>.</li><li>Call <code>square(4)</code> and predict the result before running it.</li><li>Create a lambda that adds two numbers.</li><li>Sort <code>["cat", "elephant", "dog"]</code> by string length using <code>key=lambda word: len(word)</code>.</li><li>Rewrite one of your lambdas as a normal <code>def</code> function and compare readability.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong><code>lambda</code> creates a small function from one expression.</strong> Use it when the job is short and immediately understandable. When the logic becomes more complicated, use a normal <code>def</code> function instead.</p>
