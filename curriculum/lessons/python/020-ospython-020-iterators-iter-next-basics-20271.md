---
title: "OSPython.020: Iterators, iter(), and next() Basics"
wordpress_post_id: 20271
source: BitcoinVersus.tech
published: 2026-10-03T12:04:58
modified: 2026-10-03T12:04:58
live_url: https://bitcoinversus.tech/2026/10/03/ospython-020-iterators-iter-next-basics/
track: python
lesson_number: 20
raw_source: 020-ospython-020-iterators-iter-next-basics-20271.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>An iterator gives you one item at a time and remembers where it is.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>You already use iteration whenever you write a <code>for</code> loop. In this lesson, we look underneath the loop and see the simple tools Python uses: <code>iter()</code> and <code>next()</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Start with a normal list</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>players = ["Ava", "Jay", "Mia"]</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The list contains three names. We can ask Python for an iterator over that list:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>player_iter = iter(players)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>iter(players)</code> does not give us the first name immediately. It gives us an <strong>iterator object</strong> that can move through the list one item at a time.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Use next() to get one item</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>print(next(player_iter))
print(next(player_iter))
print(next(player_iter))</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The output is:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>Ava
Jay
Mia</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Each call to <code>next()</code> asks for the next available item. The iterator remembers its position between calls.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Iterators and iterables</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=jTYiNjvnHZY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=jTYiNjvnHZY
</div><figcaption class="wp-element-caption"><em>This tutorial introduces Python iterables and iterators and shows how the two ideas work together.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Iterable vs. iterator</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>These words sound almost the same, so keep the distinction simple:</p><!-- /wp:paragraph -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>Iterable:</strong> something Python can get an iterator from. A list is a common example.</li><li><strong>Iterator:</strong> the object that returns items one at a time as you call <code>next()</code>.</li></ul><!-- /wp:list -->

<!-- wp:code --><pre class="wp-block-code"><code>players = ["Ava", "Jay", "Mia"]   # iterable
player_iter = iter(players)        # iterator</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>A useful mental picture is:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>list
  ↓ iter()
iterator
  ↓ next()
one item
  ↓ next()
next item</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">What happens when there are no items left?</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>After the iterator reaches the end, another <code>next()</code> call normally raises <code>StopIteration</code>.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>players = ["Ava"]

player_iter = iter(players)

print(next(player_iter))  # Ava
print(next(player_iter))  # StopIteration</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>StopIteration</code> is Python's way of signaling that this iterator has no next item.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: iter() and next()</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=fqZlSZ4RnDQ","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=fqZlSZ4RnDQ
</div><figcaption class="wp-element-caption"><em>This beginner lesson focuses directly on Python iterators and the iter() and next() tools.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">A for loop normally handles this for you</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Most of the time, you do not manually call <code>iter()</code> and <code>next()</code> just to loop through a list.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>players = ["Ava", "Jay", "Mia"]

for player in players:
    print(player)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The <code>for</code> loop handles the iteration process for you. Conceptually, Python gets an iterator, asks it for items, and stops when the iterator is exhausted.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This connects directly to <a href="https://bitcoinversus.tech/2026/09/27/python-4-for-loops-range-iteration/">OSPython.004: For Loops, Range, and Iteration</a>. Back then, you learned how to use a loop. Now you are learning what makes that style of iteration possible.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">How this connects to generators</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The previous lesson, <a href="https://bitcoinversus.tech/2026/10/03/ospython-019-generators-yield-basics/">OSPython.019: Generators and yield Basics</a>, introduced generator functions.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A generator object is also an iterator. That is why <code>next()</code> works with a generator:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>def countdown():
    yield 3
    yield 2
    yield 1

timer = countdown()

print(next(timer))  # 3
print(next(timer))  # 2
print(next(timer))  # 1</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>You do not need to memorize the deeper protocol yet. Just notice the same behavior: <strong>one item at a time, with position remembered between calls.</strong></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Iterable, iterator, and the iterator protocol</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=mZ9ssSM5580","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=mZ9ssSM5580
</div><figcaption class="wp-element-caption"><em>This lesson reinforces iter(), next(), iterable versus iterator, and how Python iteration works underneath a for loop.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Simple gaming example</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Imagine a game has three players waiting for their turn:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>turn_order = ["Player 1", "Player 2", "Player 3"]

turns = iter(turn_order)

print(next(turns))  # Player 1
print(next(turns))  # Player 2
print(next(turns))  # Player 3</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The iterator remembers which player's turn comes next. That is the core idea.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Thinking an iterable and an iterator are always the same object.</li><li>Calling <code>next()</code> on a normal list instead of first getting an iterator with <code>iter()</code>.</li><li>Forgetting that an iterator keeps its current position.</li><li>Calling <code>next()</code> after the iterator is exhausted and being surprised by <code>StopIteration</code>.</li><li>Manually using <code>next()</code> when a normal <code>for</code> loop would be clearer.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create <code>colors = ["red", "green", "blue"]</code>.</li><li>Create an iterator with <code>color_iter = iter(colors)</code>.</li><li>Call <code>next(color_iter)</code> three times and print each result.</li><li>Explain what the iterator is remembering.</li><li>Rewrite the same example using a normal <code>for</code> loop.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>An iterable can provide an iterator. An iterator returns items one at a time and remembers its position.</strong> <code>iter()</code> gets an iterator, <code>next()</code> asks it for the next item, and a normal <code>for</code> loop usually manages this process for you.</p><!-- /wp:paragraph -->