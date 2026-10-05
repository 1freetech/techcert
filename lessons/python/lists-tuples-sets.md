---
title: "OSPython.002: Lists, Tuples, and Sets"
date: "2026-09-26T09:32:34"
status: "publish"
wordpress_post_id: 18599
live_url: "https://bitcoinversus.tech/2026/09/26/python-lists-tuples-sets/"
categories:
  - Computer Programming
  - Information Technology
  - Tech Docs
  - Technology
---

# Python: Lists, Tuples, and Sets

The previous BitcoinVersus.tech Python lesson covered functions, parameters, and return values. This lesson moves into Python's core collection types: lists, tuples, and sets.

## Lists: ordered and mutable

```python
miners = ["S21", "S19", "A1566"]
miners.append("M60")
miners[1] = "S19 XP"
print(miners)
```

A list is useful when you need an ordered collection that can change.

## Tuples: ordered and immutable

```python
rack_position = ("Row-A", 12, "Upper")
row, rack, position = rack_position
print(row)
print(rack)
```

Tuples are sequences like lists, but the tuple itself cannot have its items reassigned after creation.

## Sets: unique values

```python
alerts = {"overheat", "offline", "overheat", "fan"}
print(alerts)
print("offline" in alerts)
```

A set stores unique elements and is useful for membership testing and removing duplicate values.

## A practical data-center example

```python
miners = ["S21-001", "S21-002", "S21-003"]
location = ("Building-1", "Row-C", "Rack-08")
faults = {"fan", "network", "fan"}

for miner in miners:
    print(f"{miner}: {location}")

print(f"Unique fault types: {faults}")
```

Here, the list represents equipment that may change, the tuple represents a fixed location record, and the set removes duplicate fault categories automatically.

## Which one should you use?

- **List:** ordered data you expect to modify.
- **Tuple:** an ordered group whose structure should remain fixed.
- **Set:** unique values, membership checks, and set operations such as union or intersection.

## Official reference

https://docs.python.org/3/tutorial/datastructures.html

**Next step:** dictionaries add key-value mappings, another essential Python structure for configuration data, telemetry, APIs, and application state.
