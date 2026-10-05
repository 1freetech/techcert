---
title: "OSPython.018: Decorators Basics"
wordpress_post_id: 20214
source: BitcoinVersus.tech
published: 2026-10-03T07:31:59
modified: 2026-10-03T07:31:59
live_url: https://bitcoinversus.tech/2026/10/03/ospython-018-decorators-basics/
track: python
lesson_number: 18
raw_source: 018-ospython-018-decorators-basics-20214.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>A decorator wraps a function so you can add behavior without rewriting the function itself.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>That sounds advanced, but the basic idea is simple: take a function, put another function around it, and return the wrapped version.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Start with the smallest useful example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>def announce(func):
    def wrapper():
        print("Starting...")
        func()
        print("Finished.")
    return wrapper

@announce
def greet():
    print("Hello!")

greet()</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Output:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>Starting...
Hello!
Finished.</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>@announce</code> tells Python to pass <code>greet</code> into the <code>announce()</code> decorator and replace <code>greet</code> with the returned wrapper.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Python decorators from the ground up</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=FsAPt_9Bf3U","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=FsAPt_9Bf3U
</div><figcaption class="wp-element-caption"><em>Corey Schafer builds decorators step by step and shows why the wrapper pattern works.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">What the @ syntax really means</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>This:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>@announce
def greet():
    print("Hello!")</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>is essentially a cleaner way to write:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>def greet():
    print("Hello!")

greet = announce(greet)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The <code>@</code> form is easier to read once you recognize what Python is doing.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Decorating functions that take arguments</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A wrapper often needs to accept whatever arguments the original function receives. <code>*args</code> and <code>**kwargs</code> make that possible.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>def announce(func):
    def wrapper(*args, **kwargs):
        print("Starting...")
        result = func(*args, **kwargs)
        print("Finished.")
        return result
    return wrapper

@announce
def add(a, b):
    return a + b

print(add(2, 3))</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Output:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>Starting...
Finished.
5</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: A focused decorators lesson</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=tfCz563ebsU","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=tfCz563ebsU
</div><figcaption class="wp-element-caption"><em>Tech With Tim explains how decorators modify function behavior without changing the original function body.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Preserve the original function's information</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A wrapper is technically a new function. Without help, metadata such as the original function name can be lost. Python's <code>functools.wraps</code> is the standard fix.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>from functools import wraps

def announce(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        print("Starting...")
        return func(*args, **kwargs)
    return wrapper</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>For real projects, using <code>@wraps(func)</code> inside your decorator is a good habit.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Where decorators are useful</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>Logging:</strong> record when a function runs.</li><li><strong>Timing:</strong> measure how long work takes.</li><li><strong>Authentication:</strong> check permission before a protected action.</li><li><strong>Caching:</strong> reuse a previous result instead of recalculating it.</li><li><strong>Validation:</strong> check inputs before the main function runs.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">A simple timer decorator</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>from functools import wraps
from time import perf_counter

def timer(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = perf_counter()
        result = func(*args, **kwargs)
        elapsed = perf_counter() - start
        print(f"{func.__name__}: {elapsed:.6f} seconds")
        return result
    return wrapper

@timer
def work():
    return sum(range(100000))

work()</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The useful part is separation: <code>work()</code> contains the work, while <code>@timer</code> handles timing.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Common decorators you will see in Python</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=JgxCY-tbWHA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=JgxCY-tbWHA
</div><figcaption class="wp-element-caption"><em>Tech With Tim demonstrates practical decorators including property, staticmethod, classmethod, caching, and dataclass-related patterns.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">How this connects to the previous lesson</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/03/ospython-017-class-variables-instance-variables/">OSPython.017: Class Variables and Instance Variables</a> separated data that belongs to the class from data that belongs to each object. Decorators are another Python tool for organizing behavior cleanly instead of repeating the same logic everywhere.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Calling the decorated function while defining the decorator instead of passing the function itself.</li><li>Forgetting to return the wrapper.</li><li>Forgetting to return the original function's result from the wrapper.</li><li>Writing a wrapper with no <code>*args</code> or <code>**kwargs</code> when the original function needs arguments.</li><li>Skipping <code>functools.wraps</code> in reusable decorators.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a function named <code>hello(name)</code>.</li><li>Create a decorator named <code>log_call</code>.</li><li>Make the wrapper print <code>Calling function...</code> before the original function runs.</li><li>Use <code>*args</code> and <code>**kwargs</code>.</li><li>Add <code>@log_call</code> above <code>hello</code>.</li><li>Call <code>hello("Ada")</code> and verify both messages appear.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>A decorator takes a callable, adds or changes behavior around it, and returns a callable.</strong> The <code>@decorator</code> syntax makes that wrapping relationship easy to see.</p><!-- /wp:paragraph -->