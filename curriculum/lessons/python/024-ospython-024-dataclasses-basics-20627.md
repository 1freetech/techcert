---
title: "OSPython.024: Dataclasses Basics"
wordpress_post_id: 20627
source: BitcoinVersus.tech
published: 2026-10-04T03:27:20
modified: 2026-10-04T03:35:21
live_url: https://bitcoinversus.tech/2026/10/04/ospython-024-dataclasses-basics/
track: python
lesson_number: 24
raw_source: 024-ospython-024-dataclasses-basics-20627.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Python dataclasses reduce repetitive class boilerplate by generating common methods from a compact set of annotated fields.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>OSPython.024</strong> continues the Open-Source Python sequence after <a href="https://bitcoinversus.tech/2026/10/03/ospython-023-type-hints-annotations-basics/"><strong>OSPython.023: Type Hints and Annotations Basics</strong></a>. Dataclasses combine several earlier Python concepts: classes, decorators, type annotations, defaults, comparison behavior, and object representation.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">1. What a dataclass is</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <strong>dataclass</strong> is a normal Python class decorated with <code>@dataclass</code>. The decorator examines annotated fields and can automatically generate methods such as <code>__init__()</code>, <code>__repr__()</code>, and <code>__eq__()</code>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Python's standard-library <a href="https://docs.python.org/3/library/dataclasses.html"><strong>dataclasses documentation</strong></a> describes the feature as a way to add generated special methods to user-defined classes. Dataclasses were introduced in Python 3.7 and are specified in <a href="https://peps.python.org/pep-0557/"><strong>PEP 557</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Start with an ordinary class</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>class Miner:
    def __init__(self, model: str, hashrate_th: float, watts: int):
        self.model = model
        self.hashrate_th = hashrate_th
        self.watts = watts

    def __repr__(self):
        return (
            f"Miner(model={self.model!r}, "
            f"hashrate_th={self.hashrate_th!r}, watts={self.watts!r})"
        )</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The class is valid, but much of the code only stores fields and prints a useful representation. A dataclass can generate that repeated structure automatically.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">3. The same model as a dataclass</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>from dataclasses import dataclass

@dataclass
class Miner:
    model: str
    hashrate_th: float
    watts: int</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This definition automatically receives an initializer similar to:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>def __init__(self, model: str, hashrate_th: float, watts: int):
    self.model = model
    self.hashrate_th = hashrate_th
    self.watts = watts</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The generated implementation also includes a readable representation and equality behavior unless those features are disabled.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Python dataclasses from the beginning</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=5mMpM8zK4pY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=5mMpM8zK4pY
</div><figcaption class="wp-element-caption"><em>Tech With Tim — Python Data Classes Are AMAZING! Here's Why. Covers basic dataclass construction, defaults, class variables, inheritance, and InitVar concepts.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Dataclasses depend on type annotations for fields</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Dataclass fields are normally discovered from annotated class variables. This connects directly to <a href="https://bitcoinversus.tech/2026/10/03/ospython-023-type-hints-annotations-basics/"><strong>type hints and annotations</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>@dataclass
class Sensor:
    name: str
    temperature_c: float
    online: bool</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The annotations describe the intended field types, but normal Python runtime rules still apply. The dataclass decorator does not automatically perform full runtime type enforcement.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Defaults must come after required fields</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>@dataclass
class Rack:
    name: str
    power_kw: float
    online: bool = True</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>name</code> and <code>power_kw</code> are required constructor arguments. <code>online</code> defaults to <code>True</code>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>As with ordinary function parameters, fields without defaults cannot follow fields that already have defaults in the generated initializer.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">6. Mutable defaults require default_factory</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Lists, dictionaries, sets, and other mutable objects should normally be created separately for each instance rather than shared accidentally.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>from dataclasses import dataclass, field

@dataclass
class Rack:
    name: str
    alerts: list[str] = field(default_factory=list)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>default_factory=list</code> creates a fresh list for each <code>Rack</code> instance. This avoids the shared-mutable-state problem that would occur if multiple objects reused the same list.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">7. Generated repr makes objects easier to inspect</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>@dataclass
class Miner:
    model: str
    watts: int

miner = Miner("S21", 3500)
print(miner)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>A typical representation resembles:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Miner(model='S21', watts=3500)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The generated representation is especially useful during debugging, logging, tests, and interactive development.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">8. Equality compares dataclass fields</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>@dataclass
class Device:
    hostname: str
    rack: str

first = Device("node-01", "rack-a")
second = Device("node-01", "rack-a")

print(first == second)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>With the default <code>eq=True</code>, instances of the same dataclass are compared using their fields in definition order. The result above is <code>True</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Fields, defaults, post-init, frozen objects, and slots</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=CvQ7e6yUtnw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=CvQ7e6yUtnw
</div><figcaption class="wp-element-caption"><em>ArjanCodes — This Is Why Python Data Classes Are Awesome. Covers defaults, field configuration, __post_init__(), frozen dataclasses, keyword-only fields, match arguments, and slots.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">9. Custom methods still belong inside a dataclass</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A dataclass is still a regular class. Methods can implement behavior in addition to storing data.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>@dataclass
class Miner:
    model: str
    hashrate_th: float
    watts: int

    def efficiency_j_per_th(self) -&gt; float:
        return self.watts / self.hashrate_th</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The dataclass decorator removes repetitive setup code; it does not eliminate object-oriented design. The earlier <a href="https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/"><strong>Classes and Objects</strong></a> lesson remains the underlying foundation.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">10. __post_init__ handles derived initialization</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>When additional setup is required after the generated <code>__init__()</code> has assigned fields, <code>__post_init__()</code> provides a standard hook.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>@dataclass
class Miner:
    model: str
    hashrate_th: float
    watts: int
    efficiency: float = 0.0

    def __post_init__(self):
        self.efficiency = self.watts / self.hashrate_th</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This pattern is useful for validation, normalization, or deriving a value from constructor inputs. If a value should not appear as a normal constructor parameter, <code>field(init=False)</code> can be used deliberately.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">11. field() controls individual field behavior</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>from dataclasses import dataclass, field

@dataclass
class Account:
    username: str
    token: str = field(repr=False)</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>repr=False</code> keeps that field out of the generated representation. This can reduce accidental display of values, although sensitive secrets still require proper security controls beyond representation settings.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Other <code>field()</code> options can control initialization, comparison, hashing, keyword-only behavior, metadata, and defaults.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">12. frozen=True approximates read-only field assignment</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>@dataclass(frozen=True)
class FirmwareVersion:
    major: int
    minor: int
    patch: int</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>A frozen dataclass prevents normal reassignment of its fields after construction. It is useful for value-like objects whose identity should not change.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Important:</strong> <code>frozen=True</code> does not make every referenced object deeply immutable. A frozen dataclass can still contain a mutable object such as a list, and that list has its own mutability rules.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">13. order=True generates ordering methods</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>@dataclass(order=True)
class Reading:
    timestamp: int
    temperature_c: float</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>With <code>order=True</code>, ordering methods are generated using fields in definition order. This can support sorting when field order correctly represents the desired comparison semantics.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Automatic ordering should not be enabled simply because it is available. The field sequence must match the actual meaning of “less than” or “greater than” for the object.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Removing class boilerplate with dataclasses</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vBH6GRJ1REM","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vBH6GRJ1REM
</div><figcaption class="wp-element-caption"><em>mCoding — Python dataclasses will save you HOURS. Demonstrates how dataclasses reduce class boilerplate and compares the standard-library approach with related data-class patterns.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">14. slots=True can reduce instance overhead</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Modern dataclasses support <code>slots=True</code>, which generates a slotted class rather than storing arbitrary instance attributes in the usual instance dictionary.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>@dataclass(slots=True)
class SensorReading:
    sensor_id: str
    value: float</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Slots can reduce memory overhead and prevent accidental creation of undeclared attributes, but they also change class behavior and inheritance details. They should be introduced intentionally rather than treated as a universal optimization.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">15. asdict() converts nested dataclass state to dictionaries</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>from dataclasses import asdict, dataclass

@dataclass
class Device:
    hostname: str
    online: bool

node = Device("node-01", True)
print(asdict(node))</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The result is a dictionary representation of dataclass fields:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>{'hostname': 'node-01', 'online': True}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This is convenient for structured processing, but serialization to JSON or another external format can still require additional conversion for dates, bytes, enums, custom objects, and other non-JSON-native values.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">16. replace() creates a modified copy</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>from dataclasses import dataclass, replace

@dataclass(frozen=True)
class Server:
    hostname: str
    rack: str

old = Server("node-01", "rack-a")
new = replace(old, rack="rack-b")</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>replace()</code> is useful when working with frozen or value-oriented dataclasses because it creates another instance with selected fields changed.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">17. Dataclasses and decorators</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>@dataclass</code> is itself a decorator. The syntax therefore connects directly to <a href="https://bitcoinversus.tech/2026/10/03/ospython-018-decorators-basics/"><strong>OSPython.018: Decorators Basics</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The decorator receives the class object, processes its annotations and options, and returns the resulting class with generated behavior attached.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">18. When a dataclass is a good fit</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>configuration records;</li><li>sensor readings;</li><li>API data models;</li><li>inventory records;</li><li>coordinates and measurements;</li><li>value objects;</li><li>test fixtures;</li><li>structured state passed between functions.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>A dataclass is especially useful when a class primarily represents structured data and only requires moderate behavior around that data.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">19. When a regular class may be clearer</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>construction requires complex lifecycle management;</li><li>most fields should not be public object state;</li><li>behavior matters far more than stored data;</li><li>custom descriptors or metaclass behavior dominate the design;</li><li>automatic field-based equality or representation would be misleading.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Dataclasses are a tool for reducing boilerplate, not a replacement for ordinary classes.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">20. Practical data-center example</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>from dataclasses import dataclass, field

@dataclass
class RackTelemetry:
    rack: str
    power_kw: float
    inlet_temp_c: float
    alarms: list[str] = field(default_factory=list)

    def overloaded(self, limit_kw: float) -&gt; bool:
        return self.power_kw &gt; limit_kw</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The model stores telemetry as typed fields, avoids a shared default alarm list, receives generated initialization and representation methods, and still contains domain-specific behavior.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Practice exercise</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Define a dataclass named <code>SwitchPort</code> with these fields:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><code>port_id: int</code></li><li><code>description: str</code></li><li><code>enabled: bool = True</code></li><li><code>vlans: list[int]</code> using a safe default factory</li></ul><!-- /wp:list -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create two independent instances.</li><li>Add VLAN 10 to the first instance only.</li><li>Print both instances and confirm that the second VLAN list remains empty.</li><li>Add a method named <code>disable()</code> that sets <code>enabled</code> to <code>False</code>.</li><li>Explain why <code>default_factory=list</code> is preferable to a shared list default.</li><li>Convert one instance with <code>asdict()</code> and inspect the resulting dictionary.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What does @dataclass generate by default?</strong><br>Common methods including an initializer, representation, and equality behavior based on annotated fields.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. Do dataclass type annotations enforce runtime types automatically?</strong><br>No. They describe intended field types and can support static analysis, but ordinary runtime type rules still apply.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. Why use field(default_factory=list) for a list field?</strong><br>It creates a new list for each instance instead of sharing one mutable list across instances.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. What is __post_init__ used for?</strong><br>Additional initialization, validation, or derived setup after the generated initializer assigns fields.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. What does frozen=True do?</strong><br>It prevents normal reassignment of dataclass fields after construction, while not guaranteeing deep immutability of objects referenced by those fields.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>6. What does asdict() do?</strong><br>It creates a dictionary representation of dataclass field data, recursively handling nested dataclasses.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>7. Are dataclasses replacements for all normal classes?</strong><br>No. They are most useful when a class primarily represents structured data and benefits from generated boilerplate methods.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Dataclasses turn annotated fields into useful class structure.</strong> They reduce repetitive initialization, representation, and comparison code while remaining ordinary Python classes that can contain methods, validation, inheritance, and domain behavior.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->