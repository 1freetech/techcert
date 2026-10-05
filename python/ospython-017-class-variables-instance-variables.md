---
title: "OSPython.017: Class Variables and Instance Variables"
status: published
wordpress_post_id: 20210
published: "2026-10-03T07:30:07"
live_url: "https://bitcoinversus.tech/2026/10/03/ospython-017-class-variables-instance-variables/"
series: "Open-Source Python"
pathway: python
lesson_number: "017"
featured_media_id: 20209
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-017-class-instance-variables-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=qSDiHI1kP98"
youtube_2: "https://www.youtube.com/watch?v=bytvWg4fPB0"
youtube_3: "https://www.youtube.com/watch?v=En7NJ8NC6Ow"
---

# OSPython.017: Class Variables and Instance Variables

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>A class variable is shared. An instance variable belongs to one object.</strong></p>

<p class="wp-block-paragraph">That is the whole lesson in one sentence.</p>

<p class="wp-block-paragraph">If you create two dogs, both dogs can share the fact that they are canine. But each dog can have its own name.</p>

<h2 class="wp-block-heading">Start with the smallest example</h2>
<pre class="wp-block-code"><code>class Dog:
    species = "canine"

    def __init__(self, name):
        self.name = name</code></pre>

<p class="wp-block-paragraph">There are two kinds of data here:</p>
<ul class="wp-block-list"><li><code>species</code> is a <strong>class variable</strong>. It is defined on the class and shared as class-level data.</li><li><code>self.name</code> is an <strong>instance variable</strong>. Each <code>Dog</code> object gets its own name.</li></ul>

<h2 class="wp-block-heading">Create two dogs</h2>
<pre class="wp-block-code"><code>dog1 = Dog("Buddy")
dog2 = Dog("Max")

print(dog1.name)
print(dog2.name)

print(dog1.species)
print(dog2.species)</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>Buddy
Max
canine
canine</code></pre>

<p class="wp-block-paragraph"><code>Buddy</code> belongs to <code>dog1</code>. <code>Max</code> belongs to <code>dog2</code>. Both objects can read the shared class value <code>canine</code>.</p>

<h2 class="wp-block-heading">Video 1: Class variables vs. instance variables</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/qSDiHI1kP98?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This focused Python lesson compares class variables with instance variables directly.</em></figcaption></figure>

<h2 class="wp-block-heading">Think: shared vs. unique</h2>
<p class="wp-block-paragraph">A simple way to decide which kind of variable makes sense is to ask:</p>
<ul class="wp-block-list"><li><strong>Should every object normally share this value?</strong> A class variable may fit.</li><li><strong>Can each object have a different value?</strong> An instance variable usually fits.</li></ul>

<p class="wp-block-paragraph">For a game, every basic enemy might start with the same category:</p>
<pre class="wp-block-code"><code>class Enemy:
    category = "basic"

    def __init__(self, name, health):
        self.name = name
        self.health = health</code></pre>

<p class="wp-block-paragraph"><code>category</code> is shared class-level data. But one enemy can be named <code>Goblin</code> with 50 health while another is named <code>Guard</code> with 100 health.</p>

<h2 class="wp-block-heading">Video 2: Class variables in a simple example</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/bytvWg4fPB0?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This short lesson focuses specifically on Python class variables and shared data.</em></figcaption></figure>

<h2 class="wp-block-heading">You can read a class variable from the class</h2>
<pre class="wp-block-code"><code>print(Dog.species)</code></pre>
<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>canine</code></pre>

<p class="wp-block-paragraph">This makes the relationship clear: <code>species</code> lives on <code>Dog</code> as class data.</p>

<h2 class="wp-block-heading">An instance can have its own value</h2>
<pre class="wp-block-code"><code>dog1.species = "robot dog"

print(dog1.species)
print(dog2.species)
print(Dog.species)</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>robot dog
canine
canine</code></pre>

<p class="wp-block-paragraph">Here, assigning <code>dog1.species</code> creates an instance attribute that hides the class value when you read that name through <code>dog1</code>. It does not change <code>Dog.species</code> or <code>dog2.species</code>.</p>

<h2 class="wp-block-heading">The shared-list mistake</h2>
<p class="wp-block-paragraph">This is one of the most important beginner mistakes to recognize.</p>

<pre class="wp-block-code"><code>class Dog:
    tricks = []

    def __init__(self, name):
        self.name = name</code></pre>

<p class="wp-block-paragraph">Because <code>tricks</code> is a class variable, the same list is shared.</p>

<pre class="wp-block-code"><code>dog1 = Dog("Buddy")
dog2 = Dog("Max")

dog1.tricks.append("sit")

print(dog2.tricks)</code></pre>

<p class="wp-block-paragraph">You may be surprised to see:</p>
<pre class="wp-block-code"><code>['sit']</code></pre>

<p class="wp-block-paragraph">Why? Both objects are using the same class-level list.</p>

<h2 class="wp-block-heading">The simple fix</h2>
<p class="wp-block-paragraph">If every dog should have its own tricks, create the list on each instance:</p>

<pre class="wp-block-code"><code>class Dog:
    species = "canine"

    def __init__(self, name):
        self.name = name
        self.tricks = []</code></pre>

<p class="wp-block-paragraph">Now every new <code>Dog</code> gets a separate <code>tricks</code> list.</p>

<h2 class="wp-block-heading">Video 3: Another direct comparison</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/En7NJ8NC6Ow?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This tutorial reinforces the difference between data shared by a Python class and data stored on individual instances.</em></figcaption></figure>

<h2 class="wp-block-heading">How this connects to earlier lessons</h2>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/">OSPython.012: Classes and Objects</a> introduced classes and objects. This lesson zooms in on where object data can live.</p>
<p class="wp-block-paragraph">The official Python tutorial describes instance variables as data unique to each instance and class variables as data shared by all instances of the class.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Putting unique object data in a class variable.</li><li>Using a mutable class variable such as a list when each object needs its own list.</li><li>Assuming changing an instance attribute always changes the class variable.</li><li>Forgetting that <code>self.name</code> belongs to the current object.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list"><li>Create a <code>Player</code> class.</li><li>Add <code>game = "Hash Race"</code> as a class variable.</li><li>Give each player its own <code>name</code> in <code>__init__()</code>.</li><li>Create two players with different names.</li><li>Print both names and the shared game value.</li><li>Add an empty inventory list to each instance, not to the class.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong>Class variable = shared class-level data. Instance variable = data belonging to one object.</strong> If every object needs its own mutable value, such as its own list, create that value on the instance.</p>
