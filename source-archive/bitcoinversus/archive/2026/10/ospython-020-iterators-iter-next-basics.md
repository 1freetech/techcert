---
title: "OSPython.020: Iterators, iter(), and next() Basics"
status: published
wordpress_post_id: 20271
published: "2026-10-03T12:04:58"
live_url: "https://bitcoinversus.tech/2026/10/03/ospython-020-iterators-iter-next-basics/"
series: "Open-Source Python"
pathway: python
lesson_number: "020"
featured_media_id: 20269
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-020-iterators-iter-next-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=jTYiNjvnHZY"
youtube_2: "https://www.youtube.com/watch?v=fqZlSZ4RnDQ"
youtube_3: "https://www.youtube.com/watch?v=mZ9ssSM5580"
---

# OSPython.020: Iterators, iter(), and next() Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>An iterator gives you one item at a time and remembers where it is.</strong></p>

<p class="wp-block-paragraph">You already use iteration whenever you write a <code>for</code> loop. In this lesson, we look underneath the loop and see the simple tools Python uses: <code>iter()</code> and <code>next()</code>.</p>

<h2 class="wp-block-heading">Start with a normal list</h2>
<pre class="wp-block-code"><code>players = ["Ava", "Jay", "Mia"]</code></pre>

<p class="wp-block-paragraph">The list contains three names. We can ask Python for an iterator over that list:</p>
<pre class="wp-block-code"><code>player_iter = iter(players)</code></pre>

<p class="wp-block-paragraph"><code>iter(players)</code> does not give us the first name immediately. It gives us an <strong>iterator object</strong> that can move through the list one item at a time.</p>

<h2 class="wp-block-heading">Use next() to get one item</h2>
<pre class="wp-block-code"><code>print(next(player_iter))
print(next(player_iter))
print(next(player_iter))</code></pre>

<p class="wp-block-paragraph">The output is:</p>
<pre class="wp-block-code"><code>Ava
Jay
Mia</code></pre>

<p class="wp-block-paragraph">Each call to <code>next()</code> asks for the next available item. The iterator remembers its position between calls.</p>

<h2 class="wp-block-heading">Video 1: Iterators and iterables</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/jTYiNjvnHZY?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This tutorial introduces Python iterables and iterators and shows how the two ideas work together.</em></figcaption></figure>

<h2 class="wp-block-heading">Iterable vs. iterator</h2>
<p class="wp-block-paragraph">These words sound almost the same, so keep the distinction simple:</p>
<ul class="wp-block-list"><li><strong>Iterable:</strong> something Python can get an iterator from. A list is a common example.</li><li><strong>Iterator:</strong> the object that returns items one at a time as you call <code>next()</code>.</li></ul>

<pre class="wp-block-code"><code>players = ["Ava", "Jay", "Mia"]   # iterable
player_iter = iter(players)        # iterator</code></pre>

<p class="wp-block-paragraph">A useful mental picture is:</p>
<pre class="wp-block-code"><code>list
  ↓ iter()
iterator
  ↓ next()
one item
  ↓ next()
next item</code></pre>

<h2 class="wp-block-heading">What happens when there are no items left?</h2>
<p class="wp-block-paragraph">After the iterator reaches the end, another <code>next()</code> call normally raises <code>StopIteration</code>.</p>

<pre class="wp-block-code"><code>players = ["Ava"]

player_iter = iter(players)

print(next(player_iter))  # Ava
print(next(player_iter))  # StopIteration</code></pre>

<p class="wp-block-paragraph"><code>StopIteration</code> is Python&#8217;s way of signaling that this iterator has no next item.</p>

<h2 class="wp-block-heading">Video 2: iter() and next()</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/fqZlSZ4RnDQ?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This beginner lesson focuses directly on Python iterators and the iter() and next() tools.</em></figcaption></figure>

<h2 class="wp-block-heading">A for loop normally handles this for you</h2>
<p class="wp-block-paragraph">Most of the time, you do not manually call <code>iter()</code> and <code>next()</code> just to loop through a list.</p>

<pre class="wp-block-code"><code>players = ["Ava", "Jay", "Mia"]

for player in players:
    print(player)</code></pre>

<p class="wp-block-paragraph">The <code>for</code> loop handles the iteration process for you. Conceptually, Python gets an iterator, asks it for items, and stops when the iterator is exhausted.</p>

<p class="wp-block-paragraph">This connects directly to <a href="https://bitcoinversus.tech/2026/09/27/python-4-for-loops-range-iteration/">OSPython.004: For Loops, Range, and Iteration</a>. Back then, you learned how to use a loop. Now you are learning what makes that style of iteration possible.</p>

<h2 class="wp-block-heading">How this connects to generators</h2>
<p class="wp-block-paragraph">The previous lesson, <a href="https://bitcoinversus.tech/2026/10/03/ospython-019-generators-yield-basics/">OSPython.019: Generators and yield Basics</a>, introduced generator functions.</p>

<p class="wp-block-paragraph">A generator object is also an iterator. That is why <code>next()</code> works with a generator:</p>

<pre class="wp-block-code"><code>def countdown():
    yield 3
    yield 2
    yield 1

timer = countdown()

print(next(timer))  # 3
print(next(timer))  # 2
print(next(timer))  # 1</code></pre>

<p class="wp-block-paragraph">You do not need to memorize the deeper protocol yet. Just notice the same behavior: <strong>one item at a time, with position remembered between calls.</strong></p>

<h2 class="wp-block-heading">Video 3: Iterable, iterator, and the iterator protocol</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/mZ9ssSM5580?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This lesson reinforces iter(), next(), iterable versus iterator, and how Python iteration works underneath a for loop.</em></figcaption></figure>

<h2 class="wp-block-heading">Simple gaming example</h2>
<p class="wp-block-paragraph">Imagine a game has three players waiting for their turn:</p>

<pre class="wp-block-code"><code>turn_order = ["Player 1", "Player 2", "Player 3"]

turns = iter(turn_order)

print(next(turns))  # Player 1
print(next(turns))  # Player 2
print(next(turns))  # Player 3</code></pre>

<p class="wp-block-paragraph">The iterator remembers which player&#8217;s turn comes next. That is the core idea.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Thinking an iterable and an iterator are always the same object.</li><li>Calling <code>next()</code> on a normal list instead of first getting an iterator with <code>iter()</code>.</li><li>Forgetting that an iterator keeps its current position.</li><li>Calling <code>next()</code> after the iterator is exhausted and being surprised by <code>StopIteration</code>.</li><li>Manually using <code>next()</code> when a normal <code>for</code> loop would be clearer.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list"><li>Create <code>colors = ["red", "green", "blue"]</code>.</li><li>Create an iterator with <code>color_iter = iter(colors)</code>.</li><li>Call <code>next(color_iter)</code> three times and print each result.</li><li>Explain what the iterator is remembering.</li><li>Rewrite the same example using a normal <code>for</code> loop.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong>An iterable can provide an iterator. An iterator returns items one at a time and remembers its position.</strong> <code>iter()</code> gets an iterator, <code>next()</code> asks it for the next item, and a normal <code>for</code> loop usually manages this process for you.</p>
