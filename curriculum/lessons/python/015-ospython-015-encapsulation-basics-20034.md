---
title: "OSPython.015: Encapsulation Basics"
wordpress_post_id: 20034
source: BitcoinVersus.tech
published: 2026-10-02T11:05:17
modified: 2026-10-02T11:05:17
live_url: https://bitcoinversus.tech/2026/10/02/ospython-015-encapsulation-basics/
track: python
lesson_number: 15
raw_source: 015-ospython-015-encapsulation-basics-20034.gutenberg.html
---


<!-- wp:paragraph {"fontSize":"large"} -->
<p class="has-large-font-size"><strong>Encapsulation keeps an object’s data and the code that manages that data together. In Python, it is less about absolute access control and more about designing a clear, safe interface for changing object state.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In <a href="https://bitcoinversus.tech/2026/10/02/ospython-014-polymorphism-basics/">OSPython.014: Polymorphism Basics</a>, we saw different objects respond to the same method name in different ways. Encapsulation focuses on a different question: <em>how should outside code interact with the data inside one object?</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Start with a simple class</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>class Miner:
    def __init__(self, model, temperature):
        self.model = model
        self.temperature = temperature

miner = Miner("S21", 72)

print(miner.model)
print(miner.temperature)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Both attributes are public, so code outside the class can read or replace them directly. That is simple, but it also means nothing stops another part of the program from assigning an impossible value such as <code>-500</code> degrees.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 1: Public, protected, and private members</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=rmAl3fSzJHA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=rmAl3fSzJHA
</div><figcaption class="wp-element-caption"><em>CodeLucky explains Python encapsulation, public/protected/private naming, name mangling, and the property decorator.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Python uses naming conventions</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Python does not enforce access modifiers exactly like languages such as Java or C++. Instead, Python relies heavily on naming conventions.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><code>name</code> — public attribute; normal outside access is expected.</li><li><code>_name</code> — protected-style convention; outside code <em>can</em> access it, but the leading underscore says “treat this as internal.”</li><li><code>__name</code> — private-style name that triggers name mangling inside the class.</li></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code>class Wallet:
    def __init__(self, owner, balance):
        self.owner = owner
        self._network = "Bitcoin"
        self.__balance = balance

wallet = Wallet("Alex", 2500)

print(wallet.owner)
print(wallet._network)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>owner</code> is public. <code>_network</code> is still accessible, but its underscore signals that callers should avoid depending on it directly. The double-underscore attribute behaves differently.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Double underscores and name mangling</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When an attribute begins with two underscores, Python rewrites its internal name. This is called <strong>name mangling</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>class Wallet:
    def __init__(self, balance):
        self.__balance = balance

wallet = Wallet(2500)

# This raises AttributeError:
# print(wallet.__balance)

# Python internally mangles the name:
print(wallet._Wallet__balance)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Name mangling makes accidental access harder, but it is not a security boundary. A determined caller can still reach the mangled attribute. The main goal is API design: clearly communicate which values outside code should use directly and which values the class should manage itself.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 2: Encapsulation with @property</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=s-qSfCci_uk","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=s-qSfCci_uk
</div><figcaption class="wp-element-caption"><em>Sumantra Codes demonstrates encapsulation, name mangling, properties, setters, and validation in Python classes.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Use a property to control updates</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A property lets callers use normal attribute syntax while the class runs logic behind the scenes.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>class Miner:
    def __init__(self, model, temperature):
        self.model = model
        self._temperature = temperature

    @property
    def temperature(self):
        return self._temperature

    @temperature.setter
    def temperature(self, value):
        if value &lt; -40 or value &gt; 120:
            raise ValueError("Temperature is outside the allowed range")
        self._temperature = value

miner = Miner("S21", 72)

print(miner.temperature)
miner.temperature = 78
print(miner.temperature)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Outside code still writes <code>miner.temperature = 78</code>, but the setter gets a chance to validate the new value first. That is a practical form of encapsulation: the class protects its own rules.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why properties are useful</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Validate values before saving them.</li><li>Prevent invalid object state.</li><li>Expose a clean interface without forcing callers to use <code>get_...</code> and <code>set_...</code> methods everywhere.</li><li>Change the internal implementation later without changing the code that uses the class.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A game example</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>class Player:
    def __init__(self, health):
        self._health = 0
        self.health = health

    @property
    def health(self):
        return self._health

    @health.setter
    def health(self, value):
        if value &lt; 0:
            self._health = 0
        elif value &gt; 100:
            self._health = 100
        else:
            self._health = value

player = Player(100)
player.health = 135
print(player.health)   # 100

player.health = -10
print(player.health)   # 0</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The class owns the health rules. Other parts of the game can request a new health value, but the <code>Player</code> object decides what values are valid.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 3: Getters, setters, and the property decorator</h2>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=KxAlb5URg5g","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=KxAlb5URg5g
</div><figcaption class="wp-element-caption"><em>Matt Macarty focuses on Python’s property decorator and how getters and setters support encapsulation.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Encapsulation is not “make everything private”</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Good encapsulation is selective. A class should expose the operations that callers actually need while keeping implementation details behind a stable interface.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>class MiningRig:
    def __init__(self, name):
        self.name = name
        self._online = False

    def start(self):
        self._online = True

    def stop(self):
        self._online = False

    @property
    def online(self):
        return self._online

rig = MiningRig("Rack-A1")
rig.start()

print(rig.name)
print(rig.online)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Callers can start and stop the rig through methods and read its current status through a property. They do not need to know how the internal state is stored.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common beginner mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Assuming <code>_name</code> is truly inaccessible from outside the class.</li><li>Assuming <code>__name</code> creates strong security. It mainly triggers name mangling.</li><li>Writing getters and setters that add no validation or behavior when a normal public attribute would be simpler.</li><li>Changing internal attributes directly from unrelated code instead of using the class interface.</li><li>Forgetting to use a backing attribute such as <code>_temperature</code> inside a property setter, which can accidentally cause recursion.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a <code>Battery</code> class with a protected-style <code>_charge</code> attribute.</li><li>Create a <code>charge</code> property that returns the current percentage.</li><li>Add a setter that accepts only values from 0 through 100.</li><li>Raise <code>ValueError</code> for values outside that range.</li><li>Create one object, set valid and invalid values, and observe the results.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Encapsulation gives an object responsibility for protecting its own state and presenting a clean interface to the rest of the program. Python usually does this with naming conventions, name mangling, methods, and especially properties. Review <a href="https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/">OSPython.012: Classes and Objects</a>, <a href="https://bitcoinversus.tech/2026/10/02/ospython-013-inheritance-basics/">OSPython.013: Inheritance Basics</a>, and <a href="https://bitcoinversus.tech/2026/10/02/ospython-014-polymorphism-basics/">OSPython.014: Polymorphism Basics</a> if you want the full OOP progression in order.</p>
<!-- /wp:paragraph -->
