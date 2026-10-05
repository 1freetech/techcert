---
title: "OSPython.021: Lambda Functions Basics"
wordpress_post_id: 20277
source: BitcoinVersus.tech
published: 2026-10-03T12:40:48
modified: 2026-10-03T12:40:48
live_url: https://bitcoinversus.tech/2026/10/03/ospython-021-lambda-functions-basics/
track: python
lesson_number: 21
raw_source: 021-ospython-021-lambda-functions-basics-20277.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>A Python <code>lambda</code> creates a small function from one expression.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>You already know how to create a normal function with <code>def</code>. A lambda is another way to create a function when the job is very small.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Start with the normal function</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>def double(x):
    return x * 2

print(double(5))</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Output:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>10</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This function takes one value, doubles it, and returns the result.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Now write the tiny lambda version</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>double = lambda x: x * 2

print(double(5))</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The output is still:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>10</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Read this from left to right:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>lambda x: x * 2
       ↑    ↑
     input  result expression</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>lambda x:</code> means “make a function that receives <code>x</code>.” The expression <code>x * 2</code> becomes the value returned by that function.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Python lambda functions for beginners</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=qEm_q72N_fE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=qEm_q72N_fE
</div><figcaption class="wp-element-caption"><em>This beginner tutorial introduces Python lambda syntax and small examples.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">A lambda can take more than one input</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>add = lambda a, b: a + b

print(add(3, 4))</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Output:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>7</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The pattern is still simple:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>lambda inputs: expression</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>A lambda expression is limited to a single expression. If the logic needs several steps, a normal <code>def</code> function is usually much easier to read.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Why use lambda at all?</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Lambdas are useful when another operation needs a tiny function for one clear job.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A common example is sorting.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>players = [
    ("Alex", 90),
    ("Sam", 75),
    ("Jordan", 95)
]

players.sort(key=lambda player: player[1])

print(players)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Here, each item contains a player's name and score. The lambda tells <code>sort()</code> to use item <code>[1]</code>—the score—as the sorting key.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Result:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>[('Sam', 75), ('Alex', 90), ('Jordan', 95)]</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Anonymous functions and lambda</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=hYzwCsKGRrg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=hYzwCsKGRrg
</div><figcaption class="wp-element-caption"><em>This lesson explains the connection between anonymous functions and Python's lambda syntax.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">“Anonymous function” does not mean mysterious</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>You will often hear a lambda called an <strong>anonymous function</strong>. That means the function expression itself does not use a normal <code>def function_name(...)</code> statement.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>You can still store the resulting function object in a variable, as we did with <code>double</code>. But lambdas are especially useful when you pass the small function directly to something else:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>names = ["Bo", "Alexander", "Sam"]

names.sort(key=lambda name: len(name))

print(names)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Output:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>['Bo', 'Sam', 'Alexander']</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The lambda says: “for each name, use its length as the sorting key.”</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: A short lambda walkthrough</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IljPHDyBRog","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=IljPHDyBRog
</div><figcaption class="wp-element-caption"><em>This focused walkthrough reinforces the idea of using lambda for small, one-expression functions.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Lambda vs. def</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Use the simplest tool that keeps the code clear.</p><!-- /wp:paragraph -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>Use <code>lambda</code></strong> when the function is tiny, one expression, and easy to understand immediately.</li><li><strong>Use <code>def</code></strong> when the function needs a useful name, several steps, statements, documentation, or more complicated logic.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>A lambda is not “better” than <code>def</code>. It is simply a compact option for small function expressions.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">How this connects to earlier lessons</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/09/24/python-functions-parameters-return-values/">OSPython.001: Functions, Parameters, and Return Values</a> introduced normal Python functions. Lambda uses the same basic idea—inputs produce a result—but with compact expression syntax.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/03/ospython-020-list-comprehensions-basics/">OSPython.020: List Comprehensions Basics</a> showed another compact Python syntax. In both cases, compact code is useful only when it stays easy to read.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Trying to put several statements inside one lambda.</li><li>Making a lambda so complicated that a normal <code>def</code> would be clearer.</li><li>Forgetting the colon between the parameters and expression.</li><li>Expecting <code>lambda</code> to use an explicit <code>return</code> statement.</li><li>Using lambda everywhere just because it is shorter.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create <code>square = lambda x: x * x</code>.</li><li>Call <code>square(4)</code> and predict the result before running it.</li><li>Create a lambda that adds two numbers.</li><li>Sort <code>["cat", "elephant", "dog"]</code> by string length using <code>key=lambda word: len(word)</code>.</li><li>Rewrite one of your lambdas as a normal <code>def</code> function and compare readability.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><code>lambda</code> creates a small function from one expression.</strong> Use it when the job is short and immediately understandable. When the logic becomes more complicated, use a normal <code>def</code> function instead.</p><!-- /wp:paragraph -->