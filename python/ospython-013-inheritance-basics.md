---
title: "OSPython.013: Inheritance Basics"
status: published
wordpress_post_id: 19997
published: "2026-10-02T09:53:08"
live_url: "https://bitcoinversus.tech/2026/10/02/ospython-013-inheritance-basics/"
series: "Open-Source Python"
pathway: python
lesson_number: "013"
featured_media_id: 19996
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-013-inheritance-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=RSl87lqOXDE"
---

# OSPython.013: Inheritance Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>Inheritance lets a new Python class reuse the useful parts of an existing class and then add or change behavior of its own.</strong></p>

<p class="wp-block-paragraph">In <a href="https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/">OSPython.012: Classes and Objects</a>, we created classes as blueprints. In this lesson, we connect two blueprints: a general <strong>parent class</strong> and a more specific <strong>child class</strong>.</p>

<h2 class="wp-block-heading">Start with a parent class</h2>
<pre class="wp-block-code"><code>class Vehicle:
    def move(self):
        return "Moving"</code></pre>
<p class="wp-block-paragraph"><code>Vehicle</code> is a simple general class. It has one method named <code>move()</code>.</p>

<h2 class="wp-block-heading">Create a child class</h2>
<pre class="wp-block-code"><code>class Car(Vehicle):
    pass

my_car = Car()
print(my_car.move())</code></pre>
<p class="wp-block-paragraph">The output is <code>Moving</code>. We never wrote <code>move()</code> inside <code>Car</code>. Python found it in the parent <code>Vehicle</code> class. That reuse is the basic idea of inheritance.</p>

<h2 class="wp-block-heading">Parent and child in plain English</h2>
<ul class="wp-block-list"><li><strong>Parent class:</strong> the more general class that provides reusable attributes or methods.</li><li><strong>Child class:</strong> a more specific class that inherits from the parent.</li><li><strong>Inheritance:</strong> the relationship that lets the child reuse the parent&#8217;s behavior.</li></ul>

<p class="wp-block-paragraph">A familiar example is <strong>Vehicle → Car</strong>. A car is a kind of vehicle, so a <code>Car</code> class can reuse general vehicle behavior while adding car-specific behavior.</p>

<h2 class="wp-block-heading">Add something new to the child</h2>
<pre class="wp-block-code"><code>class Vehicle:
    def move(self):
        return "Moving"

class Car(Vehicle):
    def honk(self):
        return "Beep!"

my_car = Car()

print(my_car.move())
print(my_car.honk())</code></pre>
<p class="wp-block-paragraph"><code>my_car</code> can use <code>move()</code> from its parent and <code>honk()</code> from its own class.</p>

<h2 class="wp-block-heading">Video: Creating Python subclasses</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/RSl87lqOXDE?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Corey Schafer demonstrates Python inheritance and the creation of subclasses.</em></figcaption></figure>

<h2 class="wp-block-heading">Override a parent method</h2>
<p class="wp-block-paragraph">A child does not have to keep every inherited behavior exactly the same. If the child defines a method with the same name, Python uses the child&#8217;s version for that child object.</p>
<pre class="wp-block-code"><code>class Vehicle:
    def sound(self):
        return "Vehicle sound"

class Car(Vehicle):
    def sound(self):
        return "Beep!"

my_car = Car()
print(my_car.sound())</code></pre>
<p class="wp-block-paragraph">The output is <code>Beep!</code>. This is called <strong>overriding</strong>: <code>Car</code> supplies its own version of <code>sound()</code>.</p>

<h2 class="wp-block-heading">Gaming example</h2>
<pre class="wp-block-code"><code>class Player:
    def move(self):
        return "Player moves"

class Runner(Player):
    def sprint(self):
        return "Runner sprints"

character = Runner()
print(character.move())
print(character.sprint())</code></pre>
<p class="wp-block-paragraph">A game can place behavior shared by many characters in <code>Player</code>, then put special behavior in classes such as <code>Runner</code>. This avoids rewriting the same basic action in every class.</p>

<h2 class="wp-block-heading">Simple Bitcoin mining example</h2>
<pre class="wp-block-code"><code>class Machine:
    def power_on(self):
        return "Power on"

class Miner(Machine):
    def start_mining(self):
        return "Mining started"

unit = Miner()
print(unit.power_on())
print(unit.start_mining())</code></pre>
<p class="wp-block-paragraph">A miner is a kind of machine. The child class can reuse a general machine action and add a mining-specific action. Keep the example simple: inheritance is the new concept here.</p>

<h2 class="wp-block-heading">Inheritance with __init__()</h2>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/">OSPython.012</a> introduced <code>__init__()</code> and <code>self</code>. A child class can reuse the parent&#8217;s initializer with <code>super()</code>.</p>
<pre class="wp-block-code"><code>class Player:
    def __init__(self, name):
        self.name = name

class Runner(Player):
    def __init__(self, name, speed):
        super().__init__(name)
        self.speed = speed

player = Runner("Alex", 10)

print(player.name)
print(player.speed)</code></pre>
<p class="wp-block-paragraph"><code>super().__init__(name)</code> asks the parent class to handle the part it already knows how to set up. The child then adds <code>speed</code>.</p>

<h2 class="wp-block-heading">When inheritance makes sense</h2>
<p class="wp-block-paragraph">Use inheritance when the child really <strong>is a kind of</strong> the parent: a car is a vehicle, a runner is a player, or a miner is a machine. Do not force unrelated things into an inheritance relationship just to reuse a few lines of code.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Forgetting to put the parent class inside the child&#8217;s parentheses.</li><li>Expecting a parent object to automatically gain methods that exist only on a child.</li><li>Overriding a method accidentally by reusing the same method name.</li><li>Forgetting <code>super()</code> when the child needs the parent&#8217;s initialization work.</li><li>Building a complicated class tree before the basic relationship is clear.</li></ul>

<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list"><li>Create a parent class named <code>Animal</code> with a method named <code>move()</code>.</li><li>Create a child class named <code>Dog</code> that inherits from <code>Animal</code>.</li><li>Create a <code>Dog</code> object and call the inherited <code>move()</code> method.</li><li>Add a new <code>bark()</code> method to <code>Dog</code>.</li><li>Override <code>move()</code> inside <code>Dog</code> and print the new result.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph">Inheritance lets a child class reuse behavior from a parent class. Start with a clear parent-child relationship, inherit what is shared, add what is unique, and override behavior only when the child genuinely needs a different version. The class fundamentals from <a href="https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/">OSPython.012</a> are the foundation for everything in this lesson.</p>
