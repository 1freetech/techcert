<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>JSON gives <a href="https://bitcoinversus.tech/2026/10/05/ospython-025-enums-named-constants-safer-choices-states-status-codes/">Python</a> programs a common text format for exchanging structured data with files, web services, command-line tools, and other applications.</strong> <strong>OSPython.026</strong> follows <a href="https://bitcoinversus.tech/2026/10/04/ospython-024-dataclasses-basics/"><strong>OSPython.024: Dataclasses Basics</strong></a> and <a href="https://bitcoinversus.tech/2026/10/05/ospython-025-enums-named-constants-safer-choices-states-status-codes/"><strong>OSPython.025: Enums and Named Constants</strong></a> by showing how structured Python values cross a program boundary as portable text. JSON is standardized as a lightweight, text-based data-interchange format by <a href="https://www.rfc-editor.org/rfc/rfc8259.html"><strong>RFC 8259</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=pTT7HMqDnJw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=pTT7HMqDnJw
</div><figcaption class="wp-element-caption"><em>Socratica — JSON in Python. Introduces JSON as a data format and demonstrates reading and writing JSON with Python.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Serialization: Python objects to JSON text</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Python's standard-library <a href="https://docs.python.org/3/library/json.html"><code>json</code> module</a> uses <code>json.dumps()</code> to serialize an object into a JSON-formatted string and <code>json.dump()</code> to write JSON to a file-like object. Dictionaries normally become JSON objects, lists and tuples become arrays, strings remain strings, numeric values become JSON numbers, <code>True</code>/<code>False</code> become <code>true</code>/<code>false</code>, and <code>None</code> becomes <code>null</code>; custom objects need an explicit conversion strategy rather than being assumed serializable.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=9N6a-VLBa2I","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=9N6a-VLBa2I
</div><figcaption class="wp-element-caption"><em>Corey Schafer — Working with JSON Data using the json Module. Demonstrates dumps, dump, loads, load, nested data, and JSON file handling.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code"><code>import json

interface = {
    "name": "eth0",
    "speed_gbps": 100,
    "up": True,
    "vlans": [5, 10],
}

payload = json.dumps(interface, indent=2)
print(payload)</code></pre><!-- /wp:code -->

<!-- wp:code --><pre class="wp-block-code"><code>with open("interface.json", "w", encoding="utf-8") as f:
    json.dump(interface, f, indent=2)</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Deserialization: JSON text back to Python</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>json.loads()</code> parses a JSON string into Python values, while <code>json.load()</code> reads JSON from a file-like object. Valid input can become dictionaries, lists, strings, integers, floats, booleans, or <code>None</code>; malformed input raises <code>json.JSONDecodeError</code>, so production code should treat external JSON as untrusted input and handle parsing failures deliberately rather than assuming the document is valid.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=KnAyziNnuI0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=KnAyziNnuI0
</div><figcaption class="wp-element-caption"><em>Microsoft Developer — Python for Beginners: JSON. Demonstrates consuming JSON in Python and treating parsed data as native Python objects.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code"><code>import json

raw = '{"name":"rack-12","temperature_c":31.4}'

try:
    record = json.loads(raw)
    print(record["temperature_c"])
except json.JSONDecodeError as exc:
    print(f"Invalid JSON: {exc}")</code></pre><!-- /wp:code -->

<!-- wp:code --><pre class="wp-block-code"><code>with open("interface.json", "r", encoding="utf-8") as f:
    restored = json.load(f)</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">APIs, validation, and structured models</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Web <a href="https://bitcoinversus.tech/2026/10/05/osntc-016-ipv6-addressing-neighbor-discovery-prefixes-slaac-ndp-routing-transition/"><strong>APIs and networked systems</strong></a> often return JSON, but parsing is only the first step: the program still has to verify required keys, expected types, ranges, and allowed values before using the data. A useful boundary pattern is JSON → validated dictionary/list → <a href="https://bitcoinversus.tech/2026/10/04/ospython-024-dataclasses-basics/"><strong>dataclass</strong></a> or domain object, with <a href="https://bitcoinversus.tech/2026/10/05/ospython-025-enums-named-constants-safer-choices-states-status-codes/"><strong>enums</strong></a> used for controlled states and <a href="https://bitcoinversus.tech/2026/10/03/ospython-023-type-hints-annotations-basics/"><strong>type hints</strong></a> used to document the expected in-memory shape.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=MztLZWibctI","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=MztLZWibctI
</div><figcaption class="wp-element-caption"><em>Harvard CS50P — Lecture 4: Libraries. The API, requests, and JSON section demonstrates receiving JSON from a web API and working with the parsed Python data.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code"><code>from dataclasses import dataclass
from enum import StrEnum

class Role(StrEnum):
    ACCESS = "access"
    CORE = "core"

@dataclass(frozen=True)
class Switch:
    name: str
    ports: int
    role: Role

raw = '{"name":"sw-01","ports":48,"role":"access"}'
data = json.loads(raw)

if not isinstance(data.get("ports"), int):
    raise ValueError("ports must be an integer")

switch = Switch(
    name=str(data["name"]),
    ports=data["ports"],
    role=Role(data["role"]),
)</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Command-line validation</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>python -m json.tool interface.json</code></pre><!-- /wp:code -->

<!-- wp:list --><ul class="wp-block-list"><li><code>json.dumps(obj)</code> → Python object to JSON string.</li><li><code>json.dump(obj, file)</code> → Python object to JSON file.</li><li><code>json.loads(text)</code> → JSON string to Python object.</li><li><code>json.load(file)</code> → JSON file to Python object.</li><li><code>python -m json.tool file.json</code> → validate and pretty-print JSON from the command line.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Common mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>confusing <code>dump()</code> with <code>dumps()</code> or <code>load()</code> with <code>loads()</code>;</li><li>treating a JSON-formatted string as if it were already a Python dictionary;</li><li>assuming every Python type can be serialized automatically;</li><li>trusting API keys and value types without validation;</li><li>writing multiple top-level objects to one file with repeated <code>json.dump()</code> calls instead of storing a list or another valid JSON structure;</li><li>depending on formatting such as whitespace or key order as if it changed the meaning of the JSON data.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Practice exercise</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Create a dictionary for a data-center rack with <code>rack_id</code>, <code>power_kw</code>, <code>online</code>, and a list of <code>devices</code>.</li><li>Serialize it with <code>json.dumps(..., indent=2)</code>.</li><li>Write it to <code>rack.json</code> with <code>json.dump()</code>.</li><li>Read the file back with <code>json.load()</code>.</li><li>Reject the record if <code>power_kw</code> is not an <code>int</code> or <code>float</code>.</li><li>Add a <code>Role</code> enum and convert the raw JSON role string into an enum member.</li><li>Run <code>python -m json.tool rack.json</code> and verify that the file is valid JSON.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check + answers</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>What does serialization mean?</strong> Converting in-memory data into a transport or storage representation such as JSON text.</li><li><strong>What is the difference between <code>dumps()</code> and <code>dump()</code>?</strong> <code>dumps()</code> returns a string; <code>dump()</code> writes to a file-like object.</li><li><strong>What is the difference between <code>loads()</code> and <code>load()</code>?</strong> <code>loads()</code> parses a string, bytes, or byte array; <code>load()</code> reads from a file-like object.</li><li><strong>What exception commonly indicates invalid JSON syntax?</strong> <code>json.JSONDecodeError</code>.</li><li><strong>Why is parsing not the same as validation?</strong> Parsing proves that the JSON syntax can be decoded; validation checks whether the resulting values match the application's required structure and rules.</li><li><strong>Why convert JSON into dataclasses or domain objects?</strong> Structured objects make required fields, types, and controlled states easier to reason about than loosely shaped dictionaries alone.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Useful prior lessons</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/04/ospython-024-dataclasses-basics/"><strong>OSPython.024: Dataclasses Basics</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/05/ospython-025-enums-named-constants-safer-choices-states-status-codes/"><strong>OSPython.025: Enums and Named Constants</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/03/ospython-023-type-hints-annotations-basics/"><strong>OSPython.023: Type Hints and Annotations Basics</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/"><strong>OSPython.012: Classes and Objects</strong></a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>JSON is a boundary format, not a replacement for a good internal data model.</strong> Use <code>dumps</code>/<code>dump</code> to serialize, <code>loads</code>/<code>load</code> to deserialize, and validate external data before converting it into the typed structures used by the rest of the program.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->