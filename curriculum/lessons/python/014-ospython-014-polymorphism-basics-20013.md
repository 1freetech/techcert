---
title: "OSPython.014: Polymorphism Basics"
wordpress_post_id: 20013
source: BitcoinVersus.tech
published: 2026-10-02T10:24:44
modified: 2026-10-02T10:32:56
live_url: https://bitcoinversus.tech/2026/10/02/ospython-014-polymorphism-basics/
track: python
lesson_number: 14
raw_source: 014-ospython-014-polymorphism-basics-20013.gutenberg.html
---

<p class="has-large-font-size wp-block-paragraph"><strong>Polymorphism means “many forms.” In Python, it lets the same method name or operation work with different kinds of objects.</strong></p>
<p class="wp-block-paragraph">In <a href="https://bitcoinversus.tech/2026/10/02/ospython-013-inheritance-basics/">OSPython.013: Inheritance Basics</a>, we learned that child classes can inherit and override behavior. Polymorphism builds directly on that idea: different objects can respond to the same method call in their own way.</p>
<h2 class="wp-block-heading">One method name, different results</h2>
<pre class="wp-block-code"><code>class Dog:
    def speak(self):
        return "Woof!"

class Cat:
    def speak(self):
        return "Meow!"

dog = Dog()
cat = Cat()

print(dog.speak())
print(cat.speak())</code></pre>
<p class="wp-block-paragraph">Both objects understand <code>speak()</code>, but each gives a different result. That is the basic idea: one common operation, multiple forms of behavior.</p>
<h2 class="wp-block-heading">Video 1: Polymorphism, overriding, and duck typing</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube">
<div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block"><span class="embed-youtube" style="text-align:center;display: block"><span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=1GhmBi8etAk?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span></span></span>
</div><figcaption class="wp-element-caption"><em>This dedicated Python tutorial covers polymorphism, method overriding, method overloading, and duck typing.</em></figcaption></figure>
<h2 class="wp-block-heading">Polymorphism with inheritance</h2>
<pre class="wp-block-code"><code>class Animal:
    def speak(self):
        return "Some sound"

class Dog(Animal):
    def speak(self):
        return "Woof!"

class Cat(Animal):
    def speak(self):
        return "Meow!"</code></pre>
<p class="wp-block-paragraph"><code>Dog</code> and <code>Cat</code> both inherit from <code>Animal</code>, then override <code>speak()</code>. The same method name now has a form appropriate to each child class.</p>
<h2 class="wp-block-heading">Put different objects in one loop</h2>
<pre class="wp-block-code"><code>animals = [Dog(), Cat()]

for animal in animals:
    print(animal.speak())</code></pre>
<p class="wp-block-paragraph">The loop does not need separate instructions for dogs and cats. It simply asks each object to <code>speak()</code>. Python uses the method belonging to that object.</p>
<h2 class="wp-block-heading">Video 2: Polymorphism explained</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube">
<div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block"><span class="embed-youtube" style="text-align:center;display: block"><span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=X6CwumpVz1s?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span></span></span>
</div><figcaption class="wp-element-caption"><em>CodeLucky focuses directly on Python polymorphism, method overriding, and duck typing.</em></figcaption></figure>
<h2 class="wp-block-heading">Gaming example</h2>
<pre class="wp-block-code"><code>class Player:
    def attack(self):
        return "Basic attack"

class Warrior(Player):
    def attack(self):
        return "Sword attack"

class Mage(Player):
    def attack(self):
        return "Magic attack"

team = [Warrior(), Mage()]

for player in team:
    print(player.attack())</code></pre>
<p class="wp-block-paragraph">The game loop can call <code>attack()</code> on every player without needing to know the exact character type first. Each class supplies the behavior that makes sense for it.</p>
<h2 class="wp-block-heading">Simple Bitcoin mining example</h2>
<pre class="wp-block-code"><code>class Machine:
    def status(self):
        return "Machine online"

class AirMiner(Machine):
    def status(self):
        return "Air-cooled miner online"

class HydroMiner(Machine):
    def status(self):
        return "Hydro miner online"

machines = [AirMiner(), HydroMiner()]

for machine in machines:
    print(machine.status())</code></pre>
<p class="wp-block-paragraph">The monitoring loop uses one simple <code>status()</code> call. Each machine type can return its own message. The new concept is polymorphism—not advanced mining telemetry.</p>
<h2 class="wp-block-heading">Duck typing</h2>
<p class="wp-block-paragraph">Python can also use polymorphism without a shared parent class. If an object provides the method your code needs, Python can often use it. This style is commonly called <strong>duck typing</strong>.</p>
<pre class="wp-block-code"><code>class Phone:
    def play(self):
        return "Playing on phone"

class Console:
    def play(self):
        return "Playing on console"

def start_game(device):
    print(device.play())

start_game(Phone())
start_game(Console())</code></pre>
<p class="wp-block-paragraph"><code>start_game()</code> does not ask whether the object is a phone or console. It only uses the <code>play()</code> behavior that both objects provide.</p>
<h2 class="wp-block-heading">Video 3: Polymorphism in Python</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube">
<div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block"><span class="embed-youtube" style="text-align:center;display: block"><span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=HFW7eA9wUxY?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span></span></span>
</div><figcaption class="wp-element-caption"><em>SDET-QA’s Python polymorphism tutorial reinforces polymorphic functions, method overriding, inheritance, and duck typing.</em></figcaption></figure>
<h2 class="wp-block-heading">Polymorphism vs. inheritance</h2>
<ul class="wp-block-list">
<li><strong>Inheritance</strong> describes a relationship between classes and lets a child reuse a parent’s behavior.</li>
<li><strong>Overriding</strong> lets a child replace an inherited method with its own version.</li>
<li><strong>Polymorphism</strong> lets code use a common operation while different objects provide different behavior.</li>
<li><strong>Duck typing</strong> can provide polymorphic behavior even when the classes do not share a parent.</li>
</ul>
<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list">
<li>Thinking every polymorphic example must use inheritance.</li>
<li>Giving child methods different names when the goal is to share one common interface.</li>
<li>Forgetting that the object determines which overridden method runs.</li>
<li>Building complicated class trees when two simple classes would explain the idea better.</li>
</ul>
<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list">
<li>Create classes named <code>BasketballPlayer</code> and <code>FootballPlayer</code>.</li>
<li>Give both classes a method named <code>play()</code>.</li>
<li>Return a different message from each version of <code>play()</code>.</li>
<li>Put one object from each class into a list.</li>
<li>Loop through the list and call <code>play()</code> without checking the object type.</li>
</ol>
<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph">Polymorphism lets one piece of code work with different objects through a shared operation. The object itself supplies the appropriate behavior. If inheritance or method overriding feels unclear, review <a href="https://bitcoinversus.tech/2026/10/02/ospython-013-inheritance-basics/">OSPython.013</a> before moving forward.</p>
