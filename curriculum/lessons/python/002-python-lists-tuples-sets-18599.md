---
title: "OSPython.002: Lists, Tuples, and Sets"
wordpress_post_id: 18599
source: BitcoinVersus.tech
published: 2026-09-26T09:32:34
modified: 2026-09-30T20:08:39
live_url: https://bitcoinversus.tech/2026/09/26/python-lists-tuples-sets/
track: python
lesson_number: 2
raw_source: 002-python-lists-tuples-sets-18599.gutenberg.html
---

<!-- wp:paragraph --><p>The previous BitcoinVersus.tech Python lesson covered functions, parameters, and return values. This lesson moves into Python's core collection types: lists, tuples, and sets. Choosing the right collection makes code easier to understand and helps express whether data should be ordered, changeable, or unique.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Lists: ordered and mutable</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>miners = ["S21", "S19", "A1566"]
miners.append("M60")
miners[1] = "S19 XP"

print(miners)</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>A list is useful when you need an ordered collection that can change. You can add, remove, replace, index, and slice its items.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Tuples: ordered and immutable</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>rack_position = ("Row-A", 12, "Upper")

row, rack, position = rack_position
print(row)
print(rack)</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Tuples are sequences like lists, but the tuple itself cannot have its items reassigned after creation. Tuple unpacking is useful when a fixed group of values belongs together.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Sets: unique values</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>alerts = {"overheat", "offline", "overheat", "fan"}

print(alerts)
print("offline" in alerts)</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>A set stores unique elements and is useful for membership testing and removing duplicate values. Do not depend on a set to preserve a particular display or iteration order.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">A practical data-center example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>miners = ["S21-001", "S21-002", "S21-003"]
location = ("Building-1", "Row-C", "Rack-08")
faults = {"fan", "network", "fan"}

for miner in miners:
    print(f"{miner}: {location}")

print(f"Unique fault types: {faults}")</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Here, the list represents equipment that may change, the tuple represents a fixed location record, and the set removes duplicate fault categories automatically.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Which one should you use?</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>List:</strong> ordered data you expect to modify.</li><li><strong>Tuple:</strong> an ordered group whose structure should remain fixed.</li><li><strong>Set:</strong> unique values, membership checks, and set operations such as union or intersection.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Official reference</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><a href="https://docs.python.org/3/tutorial/datastructures.html">Python documentation: Data Structures</a></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong>Next step:</strong> dictionaries add key-value mappings, another essential Python structure for configuration data, telemetry, APIs, and application state.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=W8KRzm-HUcc","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=W8KRzm-HUcc
</div></figure>
<!-- /wp:embed -->