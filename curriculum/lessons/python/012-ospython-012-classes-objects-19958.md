---
title: "OSPython.012: Classes and Objects"
wordpress_post_id: 19958
source: BitcoinVersus.tech
published: 2026-10-02T00:45:27
modified: 2026-10-02T00:45:27
live_url: https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/
track: python
lesson_number: 12
raw_source: 012-ospython-012-classes-objects-19958.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} -->
<p class="has-large-font-size"><strong>A class is a blueprint that describes what data and behavior a type of object should have. An object is one specific instance created from that class.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Think of a class as a miner model specification. The specification can define fields such as a miner’s name, hashrate, and temperature. Each physical miner is a separate object with its own values. Python classes let us model that relationship directly in code.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why classes matter</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Functions organize reusable actions, while classes organize related data and actions together. Review <a href="https://bitcoinversus.tech/2026/09/24/python-functions-parameters-return-values/">OSPython.001: Functions, Parameters, and Return Values</a> if function definitions still feel unfamiliar.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A dictionary can hold one miner’s values, as introduced in <a href="https://bitcoinversus.tech/2026/09/26/python-dictionaries-key-value-data/">OSPython.003: Dictionaries and Key-Value Data</a>. A class goes further: it gives every miner object a consistent structure and can include methods that operate on its data.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Create your first class</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>class Miner:
    def __init__(self, name, hash_rate):
        self.name = name
        self.hash_rate = hash_rate</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The keyword <code>class</code> begins a class definition. By convention, class names use capitalized words, so this class is named <code>Miner</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The <code>__init__()</code> method runs when a new object is created. It receives the starting values and stores them on that object. The name <code>self</code> refers to the particular object currently being created or used.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Create an object</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>miner_1 = Miner("Satoshi", 100)

print(miner_1.name)
print(miner_1.hash_rate)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>miner_1</code> is an object—also called an instance—of the <code>Miner</code> class. Its <code>name</code> attribute contains <code>"Satoshi"</code>, and its <code>hash_rate</code> attribute contains <code>100</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ZDa-Z5JzLYM","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ZDa-Z5JzLYM
</div><figcaption class="wp-element-caption"><em>Python OOP Tutorial 1: Classes and Instances — Corey Schafer. Focus on the difference between a class blueprint and each object created from it.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Add behavior with a method</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A method is a function defined inside a class. It describes an action an object can perform.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>class Miner:
    def __init__(self, name, hash_rate):
        self.name = name
        self.hash_rate = hash_rate

    def status(self):
        return f"{self.name}: {self.hash_rate} TH/s"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Call the method through the object:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>miner_1 = Miner("Satoshi", 100)
print(miner_1.status())</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The output is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Satoshi: 100 TH/s</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">One class, multiple objects</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>miner_1 = Miner("Satoshi", 100)
miner_2 = Miner("Hal", 200)

print(miner_1.status())
print(miner_2.status())</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Both objects follow the same <code>Miner</code> blueprint, but each object stores its own attributes. Changing <code>miner_1.hash_rate</code> does not automatically change <code>miner_2.hash_rate</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Attributes, methods, classes, and objects</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Class:</strong> the blueprint, such as <code>Miner</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Object or instance:</strong> one item created from the blueprint, such as <code>miner_1</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Attribute:</strong> data stored on an object, such as <code>name</code> or <code>hash_rate</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Method:</strong> behavior defined by the class, such as <code>status()</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>self:</strong> the current object receiving a method call.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common beginner mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Forgetting <code>self</code> as the first parameter of an instance method.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Writing <code>name = name</code> instead of <code>self.name = name</code>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Calling an instance method on the class without creating an object first.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Using inconsistent indentation inside the class body.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Confusing the class name <code>Miner</code> with the object variable <code>miner_1</code>.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice: build a temperature alarm</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Create a <code>Miner</code> class with <code>name</code> and <code>temperature</code> attributes. Add a method named <code>needs_attention()</code> that returns <code>True</code> when the temperature is greater than 80.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>class Miner:
    def __init__(self, name, temperature):
        self.name = name
        self.temperature = temperature

    def needs_attention(self):
        return self.temperature &gt; 80</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Create two miner objects with different temperatures. Print each miner’s name and the result of <code>needs_attention()</code>. Then place the class in its own module or package using the structure from <a href="https://bitcoinversus.tech/2026/10/01/ospython-011-packages-init-py/">OSPython.011: Packages and __init__.py</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Quick knowledge check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>What is the difference between a class and an object?</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>When does <code>__init__()</code> run?</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>What does <code>self</code> represent?</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>What is the difference between an attribute and a method?</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:details -->
<details class="wp-block-details"><summary>Check your answers</summary><!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>A class is a blueprint; an object is one instance created from that blueprint.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>It runs when a new object is created from the class.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>The particular object currently being created or used.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>An attribute stores data; a method defines behavior.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list --></details>
<!-- /wp:details -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use a class when several objects need the same structure and behavior. The class defines the pattern; each object keeps its own state.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Reference</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Continue with the official <a href="https://docs.python.org/3/tutorial/classes.html">Python tutorial on classes</a>.</p>
<!-- /wp:paragraph -->