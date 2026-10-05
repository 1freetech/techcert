---
title: "OSPython.020: List Comprehensions Basics"
status: published
wordpress_post_id: 20270
published: "2026-10-03T12:04:36"
live_url: "https://bitcoinversus.tech/2026/10/03/ospython-020-list-comprehensions-basics/"
series: "Open-Source Python"
pathway: python
lesson_number: "020"
featured_media_id: 20268
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-020-list-comprehensions-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=YlY2g2xrl6Q"
youtube_2: "https://www.youtube.com/watch?v=dW0m93sU0eg"
youtube_3: "https://www.youtube.com/watch?v=AhSvKGTh28Q"
---

# OSPython.020: List Comprehensions Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>A list comprehension is a short way to build a new Python list from another iterable.</strong></p>

<p class="wp-block-paragraph">The easiest way to understand it is to start with a normal <code>for</code> loop and then shorten that same idea.</p>

<h2 class="wp-block-heading">Start with a normal loop</h2>
<pre class="wp-block-code"><code>numbers = [1, 2, 3, 4]
squares = []

for number in numbers:
    squares.append(number * number)

print(squares)</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>[1, 4, 9, 16]</code></pre>

<p class="wp-block-paragraph">This code says: take each number, square it, and add the result to a new list.</p>

<h2 class="wp-block-heading">Now write the same idea as a list comprehension</h2>
<pre class="wp-block-code"><code>numbers = [1, 2, 3, 4]
squares = [number * number for number in numbers]

print(squares)</code></pre>

<p class="wp-block-paragraph">The output is still:</p>
<pre class="wp-block-code"><code>[1, 4, 9, 16]</code></pre>

<p class="wp-block-paragraph">Nothing magical happened. Python simply gives us a compact form for this common pattern.</p>

<h2 class="wp-block-heading">Read it in three pieces</h2>
<pre class="wp-block-code"><code>[number * number  for number  in numbers]
 └──── result ───┘ └─ loop ─┘ └ source ┘</code></pre>

<ul class="wp-block-list"><li><code>number * number</code> — the value to put in the new list.</li><li><code>for number</code> — take one item at a time.</li><li><code>in numbers</code> — get those items from <code>numbers</code>.</li></ul>

<p class="wp-block-paragraph">If the one-line form feels confusing, write the normal loop first. Once the loop makes sense, the comprehension is much easier to read.</p>

<h2 class="wp-block-heading">Video 1: List comprehensions in a few minutes</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/YlY2g2xrl6Q?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This beginner lesson demonstrates the basic Python list-comprehension pattern and compares it with ordinary loops.</em></figcaption></figure>

<h2 class="wp-block-heading">You can also copy items into a new list</h2>
<pre class="wp-block-code"><code>players = ["Ava", "Jay", "Mia"]

new_players = [player for player in players]

print(new_players)</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>['Ava', 'Jay', 'Mia']</code></pre>

<p class="wp-block-paragraph">This example does not change each item. It simply shows the structure in its easiest form.</p>

<h2 class="wp-block-heading">Transform each item</h2>
<p class="wp-block-paragraph">A comprehension becomes more useful when the new list needs a changed version of each item.</p>
<pre class="wp-block-code"><code>prices = [10, 20, 30]

doubled = [price * 2 for price in prices]

print(doubled)</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>[20, 40, 60]</code></pre>

<p class="wp-block-paragraph">The source list stays <code>[10, 20, 30]</code>. The comprehension creates a new list containing the calculated values.</p>

<h2 class="wp-block-heading">Video 2: Making list comprehensions easier to read</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/dW0m93sU0eg?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This tutorial breaks the syntax into a simple pattern so the one-line form is easier to remember.</em></figcaption></figure>

<h2 class="wp-block-heading">Add one simple filter</h2>
<p class="wp-block-paragraph">You can add an <code>if</code> condition when only some items should enter the new list.</p>
<pre class="wp-block-code"><code>numbers = [1, 2, 3, 4, 5, 6]

evens = [number for number in numbers if number % 2 == 0]

print(evens)</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>[2, 4, 6]</code></pre>

<p class="wp-block-paragraph">Read it like this: <strong>put the number in the new list for each number in <code>numbers</code> if that number is even.</strong></p>

<h2 class="wp-block-heading">Gaming example</h2>
<p class="wp-block-paragraph">Suppose a game has player scores and we only want scores of 100 or higher.</p>
<pre class="wp-block-code"><code>scores = [55, 120, 88, 150, 40]

high_scores = [score for score in scores if score &gt;= 100]

print(high_scores)</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>[120, 150]</code></pre>

<p class="wp-block-paragraph">The comprehension creates a new list containing only the scores that pass the condition.</p>

<h2 class="wp-block-heading">Video 3: Building lists with comprehensions</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/AhSvKGTh28Q?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This lesson reinforces how a list comprehension constructs a new list from a compact loop expression.</em></figcaption></figure>

<h2 class="wp-block-heading">How this connects to earlier Python lessons</h2>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/09/26/python-lists-tuples-sets/">OSPython.002: Lists, Tuples, and Sets</a> introduced lists. <a href="https://bitcoinversus.tech/2026/09/27/python-4-for-loops-range-iteration/">OSPython.004: For Loops, Range, and Iteration</a> introduced the loop used inside a comprehension. <a href="https://bitcoinversus.tech/2026/10/03/ospython-019-generators-yield-basics/">OSPython.019: Generators and yield Basics</a> introduced another way Python can produce values through iteration.</p>

<h2 class="wp-block-heading">When should you use the normal loop instead?</h2>
<p class="wp-block-paragraph">A list comprehension is useful when the operation is short and easy to understand. If the logic needs many steps, several conditions, logging, error handling, or other side effects, a normal loop is often clearer.</p>

<p class="wp-block-paragraph">Shorter code is not automatically better code. The goal is code that another person can understand.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Forgetting the square brackets <code>[ ]</code>.</li><li>Putting the pieces in the wrong order.</li><li>Trying to squeeze complicated multi-step logic into one line.</li><li>Assuming a comprehension changes the original list when it actually creates a new list in these examples.</li><li>Adding an <code>if</code> filter before understanding the basic no-filter form.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list"><li>Start with <code>numbers = [1, 2, 3, 4]</code>.</li><li>Use a normal loop to create a list containing each number multiplied by 10.</li><li>Rewrite that loop as a list comprehension.</li><li>Create another comprehension that keeps only numbers greater than 2.</li><li>Explain which part is the result expression, which part is the loop, and which part is the source.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong>A list comprehension is a compact way to build a new list.</strong> Learn it by comparing it with the normal <code>for</code> loop first. Keep the one-line form when it stays easy to read; use a normal loop when the job becomes complicated.</p>
