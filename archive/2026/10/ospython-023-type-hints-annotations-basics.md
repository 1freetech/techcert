---
title: "OSPython.023: Type Hints and Annotations Basics"
status: published
wordpress_post_id: 20393
published: "2026-10-03T23:07:51"
live_url: "https://bitcoinversus.tech/2026/10/03/ospython-023-type-hints-annotations-basics/"
series: "Open-Source Python"
pathway: python
lesson_number: "023"
featured_media_id: 20385
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython.023-type-hints-and-annotations-cover.png"
youtube_1: "https://www.youtube.com/watch?v=QORvB-_mbZ0"
youtube_2: "https://www.youtube.com/watch?v=RwH2UzC2rIo"
youtube_3: "https://www.youtube.com/watch?v=2xWhaALHTvU"
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Type hints let you describe what kind of data your Python code expects without changing Python into a statically typed language.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/03/ospython-022-context-managers-with-statement-basics/">OSPython.022: Context Managers and the with Statement Basics</a>. We are continuing the recent run of Python language features by adding something that makes larger programs easier to read, debug, and maintain: <strong>type annotations</strong>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Start with the smallest example</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>age: int = 25
name: str = "Ada"</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Read those lines in plain English:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><code>age: int</code> says that <code>age</code> is intended to hold an integer.</li><li><code>name: str</code> says that <code>name</code> is intended to hold a string.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The annotation appears after the variable name and a colon.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>variable_name: expected_type = value</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">The most important rule: a hint is not a runtime lock</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Python does <strong>not</strong> normally stop this assignment just because the annotation says <code>int</code>:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>age: int = 25
age = "twenty-five"</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The program may still run because annotations are primarily metadata for humans, editors, linters, and static type-checking tools. A checker can warn that a string is being assigned where an integer was expected.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Your code
   ↓
Type annotations
   ↓
Editor / static type checker
   ↓
Possible mismatch warning before execution</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Python's official <a href="https://docs.python.org/3/library/typing.html">typing documentation</a> explains that the runtime does not enforce function and variable type annotations. Tools such as type checkers, IDEs, and linters can use them instead.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Type hints and annotations from the ground up</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=QORvB-_mbZ0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=QORvB-_mbZ0
</div><figcaption class="wp-element-caption"><em>Tech With Tim — Python Typing: Type Hints &amp; Annotations. Covers variables, function annotations, collections, optional values, callable types, and static analysis.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Function parameter annotations</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Type hints become especially useful on functions because they tell the reader what should go in and what should come back out.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>def double_hashrate(hashrate: float) -&gt; float:
    return hashrate * 2</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Break it apart:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><code>hashrate: float</code> means the parameter is expected to be a floating-point number.</li><li><code>-&gt; float</code> means the function is expected to return a floating-point number.</li></ul><!-- /wp:list -->

<!-- wp:code --><pre class="wp-block-code"><code>input type                 return type
    ↓                           ↓
def double_hashrate(hashrate: float) -&gt; float:
    return hashrate * 2</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">More basic parameter examples</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>def greet(name: str) -&gt; str:
    return f"Hello, {name}"


def is_online(status_code: int) -&gt; bool:
    return status_code == 200


def log_message(message: str) -&gt; None:
    print(message)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>-&gt; None</code> is useful when a function performs an action but is not intended to return a meaningful value.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Collections can be annotated too</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Modern Python syntax can describe the type of the collection and the type stored inside it.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>miners: list[str] = ["S21", "S19", "A1566"]

power_draws: list[int] = [3500, 3250, 3420]

rack_power: dict[str, int] = {
    "rack-a": 12000,
    "rack-b": 11500,
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Read them as:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><code>list[str]</code> — a list whose items are strings.</li><li><code>list[int]</code> — a list whose items are integers.</li><li><code>dict[str, int]</code> — a dictionary with string keys and integer values.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Tuples and sets</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>coordinates: tuple[int, int] = (10, 25)

active_ips: set[str] = {
    "10.0.0.10",
    "10.0.0.11",
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The same idea applies: the outer name tells you the container, and the type inside the brackets tells you what the container is expected to hold.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Basic annotations through advanced typing</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=RwH2UzC2rIo","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=RwH2UzC2rIo
</div><figcaption class="wp-element-caption"><em>Corey Schafer — Python Type Hints: From Basic Annotations to Advanced Generics. This gives a broader view of how type hints scale from simple variables and functions into larger projects.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">One value can sometimes have more than one valid type</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Suppose a function accepts either an integer ID or a string ID. You can describe that with a union:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>def find_device(device_id: int | str) -&gt; str:
    return f"Searching for {device_id}"</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>int | str</code> means <strong>integer or string</strong>.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>device_id
   │
   ├── int
   └── str</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Older Python code may express the same idea with <code>Union[int, str]</code> from the <code>typing</code> module. When maintaining existing code, you may see both styles.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Optional values and None</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A value that may be a string or may be absent can be written as:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>serial_number: str | None = None</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Later the program may assign a real serial number:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>serial_number = "ABC12345"</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Again, older code may use <code>Optional[str]</code>. Conceptually, both describe a value that can be a string or <code>None</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Type aliases make long annotations easier to read</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>If the same complicated type appears repeatedly, give it a useful name.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>PowerReading = tuple[str, float]


def read_power() -&gt; PowerReading:
    return ("rack-a", 11.8)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The name <code>PowerReading</code> communicates intent better than repeating the entire structure everywhere.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">What a static type checker can catch</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Imagine this function:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>def calculate_kw(amps: float, volts: float) -&gt; float:
    return amps * volts / 1000</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Then somebody accidentally calls it like this:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>calculate_kw("40 amps", 240.0)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The first argument is a string even though the function says it expects a float. Python itself may only complain once the incompatible operation occurs at runtime, but a static checker can often flag the mismatch earlier.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>That is the value of type hints in larger systems: they turn some mistakes into visible warnings before a production path executes them.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Static checking with mypy</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=2xWhaALHTvU","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=2xWhaALHTvU
</div><figcaption class="wp-element-caption"><em>Real Python — Type-Checking Python Programs With Type Hints and mypy. This demonstrates how a separate static checker can use annotations to find potential type mistakes.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Type hints also improve editor assistance</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Editors and language servers can use annotations to understand what an object is expected to be. That can improve autocomplete, parameter hints, navigation, and warnings.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>def efficiency(hashrate_th: float, watts: float) -&gt; float:
    return watts / hashrate_th</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>A reader can immediately see that both inputs and the output are numeric, even before reading the function body.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Annotations are documentation that stays close to the code</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Compare these two functions:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>def update_device(device, online):
    ...


def update_device(device: str, online: bool) -&gt; None:
    ...</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The second version gives you useful information immediately:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><code>device</code> should be a string.</li><li><code>online</code> should be a Boolean.</li><li>The function is not intended to return a meaningful value.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Do not annotate everything just because you can</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Type hints should make code clearer, not harder to read. This is useful:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>def get_temperature(sensor_id: str) -&gt; float:
    ...</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>An enormous deeply nested annotation can become harder to understand than the code itself. When a type gets complicated, consider a type alias, a named class, or another clearer design.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">A practical data-center example</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>def rack_status(
    rack_name: str,
    power_kw: float,
    temperatures: list[float],
    alarm: str | None = None,
) -&gt; dict[str, object]:
    return {
        "rack": rack_name,
        "power_kw": power_kw,
        "temperatures": temperatures,
        "alarm": alarm,
    }</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Before reading the body, you already know the expected shape of the inputs. That is valuable when multiple technicians, engineers, or automated systems touch the same codebase.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Annotations can be inspected</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Function annotations are available to Python as metadata. For example:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>def add(a: int, b: int) -&gt; int:
    return a + b

print(add.__annotations__)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>You do not need to use this often as a beginner. It simply proves an important idea: annotations are information attached to the function.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Where the typing module fits</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Built-in syntax handles many common cases now, but the <code>typing</code> module provides additional tools for describing more complex interfaces and data structures.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Python's original standardized type-hinting design is documented in <a href="https://peps.python.org/pep-0484/">PEP 484</a>. You do not need to memorize the PEP; it is useful as a reference for understanding where modern Python type hints came from.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Thinking a type hint automatically prevents the wrong value at runtime.</li><li>Assuming annotations make Python behave like Java or C++ at runtime.</li><li>Using a very broad type such as <code>object</code> everywhere and losing useful information.</li><li>Writing annotations so complicated that nobody can quickly understand them.</li><li>Forgetting that <code>None</code> must be included when a value can legitimately be absent.</li><li>Confusing a type checker warning with a Python runtime exception.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Annotate a variable named <code>hostname</code> as a string.</li><li>Annotate a variable named <code>port</code> as an integer.</li><li>Write a function that accepts two floats and returns a float.</li><li>Create a <code>list[str]</code> containing three server names.</li><li>Create a <code>dict[str, int]</code> mapping rack names to power readings.</li><li>Write one value that can be either a string or <code>None</code>.</li><li>Explain why a type hint does not automatically enforce the type at runtime.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What does <code>name: str</code> mean?</strong><br>It says that <code>name</code> is intended to contain a string.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. What does <code>-&gt; bool</code> mean on a function?</strong><br>The function is expected to return a Boolean value.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. Does Python automatically reject every value that violates a type hint?</strong><br>No. Type hints are not normally runtime enforcement.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. What does <code>str | None</code> mean?</strong><br>The value may be a string or <code>None</code>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. Why use a static type checker?</strong><br>It can analyze annotations and warn about many mismatched types before the affected code runs.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Type hints describe the data your Python code expects. They improve readability and give editors and static analysis tools more information, but they do not normally enforce types at runtime.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Remember the visual:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Python code
   ↓
Type annotations describe intent
   ↓
Humans + editors + type checkers understand more
   ↓
Many mistakes become easier to spot earlier</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><em>Display note: all examples in this lesson are plain code blocks and educational diagrams. They are not simulated VS Code, Windows, or Linux terminals, so no terminal color palette has been invented or represented.</em></p><!-- /wp:paragraph -->