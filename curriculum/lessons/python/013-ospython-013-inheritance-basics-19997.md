---
title: "OSPython.013: Inheritance Basics"
wordpress_post_id: 19997
source: BitcoinVersus.tech
published: 2026-10-02T09:53:08
modified: 2026-10-02T09:53:08
live_url: https://bitcoinversus.tech/2026/10/02/ospython-013-inheritance-basics/
track: python
lesson_number: 13
raw_source: 013-ospython-013-inheritance-basics-19997.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Inheritance lets a new Python class reuse the useful parts of an existing class and then add or change behavior of its own.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>In <a href="https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/">OSPython.012: Classes and Objects</a>, we created classes as blueprints. In this lesson, we connect two blueprints: a general <strong>parent class</strong> and a more specific <strong>child class</strong>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Start with a parent class</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>class Vehicle:
    def move(self):
        return "Moving"</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>Vehicle</code> is a simple general class. It has one method named <code>move()</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Create a child class</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>class Car(Vehicle):
    pass

my_car = Car()
print(my_car.move())</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The output is <code>Moving</code>. We never wrote <code>move()</code> inside <code>Car</code>. Python found it in the parent <code>Vehicle</code> class. That reuse is the basic idea of inheritance.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Parent and child in plain English</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>Parent class:</strong> the more general class that provides reusable attributes or methods.</li><li><strong>Child class:</strong> a more specific class that inherits from the parent.</li><li><strong>Inheritance:</strong> the relationship that lets the child reuse the parent's behavior.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>A familiar example is <strong>Vehicle → Car</strong>. A car is a kind of vehicle, so a <code>Car</code> class can reuse general vehicle behavior while adding car-specific behavior.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Add something new to the child</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>class Vehicle:
    def move(self):
        return "Moving"

class Car(Vehicle):
    def honk(self):
        return "Beep!"

my_car = Car()

print(my_car.move())
print(my_car.honk())</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>my_car</code> can use <code>move()</code> from its parent and <code>honk()</code> from its own class.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video: Creating Python subclasses</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=RSl87lqOXDE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=RSl87lqOXDE
</div><figcaption class="wp-element-caption"><em>Corey Schafer demonstrates Python inheritance and the creation of subclasses.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Override a parent method</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A child does not have to keep every inherited behavior exactly the same. If the child defines a method with the same name, Python uses the child's version for that child object.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>class Vehicle:
    def sound(self):
        return "Vehicle sound"

class Car(Vehicle):
    def sound(self):
        return "Beep!"

my_car = Car()
print(my_car.sound())</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The output is <code>Beep!</code>. This is called <strong>overriding</strong>: <code>Car</code> supplies its own version of <code>sound()</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Gaming example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>class Player:
    def move(self):
        return "Player moves"

class Runner(Player):
    def sprint(self):
        return "Runner sprints"

character = Runner()
print(character.move())
print(character.sprint())</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>A game can place behavior shared by many characters in <code>Player</code>, then put special behavior in classes such as <code>Runner</code>. This avoids rewriting the same basic action in every class.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Simple Bitcoin mining example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>class Machine:
    def power_on(self):
        return "Power on"

class Miner(Machine):
    def start_mining(self):
        return "Mining started"

unit = Miner()
print(unit.power_on())
print(unit.start_mining())</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>A miner is a kind of machine. The child class can reuse a general machine action and add a mining-specific action. Keep the example simple: inheritance is the new concept here.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Inheritance with __init__()</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/">OSPython.012</a> introduced <code>__init__()</code> and <code>self</code>. A child class can reuse the parent's initializer with <code>super()</code>.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>class Player:
    def __init__(self, name):
        self.name = name

class Runner(Player):
    def __init__(self, name, speed):
        super().__init__(name)
        self.speed = speed

player = Runner("Alex", 10)

print(player.name)
print(player.speed)</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>super().__init__(name)</code> asks the parent class to handle the part it already knows how to set up. The child then adds <code>speed</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">When inheritance makes sense</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Use inheritance when the child really <strong>is a kind of</strong> the parent: a car is a vehicle, a runner is a player, or a miner is a machine. Do not force unrelated things into an inheritance relationship just to reuse a few lines of code.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Forgetting to put the parent class inside the child's parentheses.</li><li>Expecting a parent object to automatically gain methods that exist only on a child.</li><li>Overriding a method accidentally by reusing the same method name.</li><li>Forgetting <code>super()</code> when the child needs the parent's initialization work.</li><li>Building a complicated class tree before the basic relationship is clear.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a parent class named <code>Animal</code> with a method named <code>move()</code>.</li><li>Create a child class named <code>Dog</code> that inherits from <code>Animal</code>.</li><li>Create a <code>Dog</code> object and call the inherited <code>move()</code> method.</li><li>Add a new <code>bark()</code> method to <code>Dog</code>.</li><li>Override <code>move()</code> inside <code>Dog</code> and print the new result.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Inheritance lets a child class reuse behavior from a parent class. Start with a clear parent-child relationship, inherit what is shared, add what is unique, and override behavior only when the child genuinely needs a different version. The class fundamentals from <a href="https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/">OSPython.012</a> are the foundation for everything in this lesson.</p><!-- /wp:paragraph -->