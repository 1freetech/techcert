---
title: "OSPython.012: Classes and Objects"
status: published
wordpress_post_id: 19958
published: "2026-10-02T00:45:27"
live_url: "https://bitcoinversus.tech/2026/10/02/ospython-012-classes-objects/"
series: "Open-Source Python"
lesson_number: "012"
featured_media_id: 19955
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-012-classes-objects-cover.jpg"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=ZDa-Z5JzLYM"
reference: "https://docs.python.org/3/tutorial/classes.html"
---

# OSPython.012: Classes and Objects

**A class is a blueprint that describes what data and behavior a type of object should have. An object is one specific instance created from that class.**

Think of a class as a miner model specification. The specification can define fields such as a miner’s name, hashrate, and temperature. Each physical miner is a separate object with its own values. Python classes let us model that relationship directly in code.

## Why classes matter

Functions organize reusable actions, while classes organize related data and actions together. Review [OSPython.001: Functions, Parameters, and Return Values](https://bitcoinversus.tech/2026/09/24/python-functions-parameters-return-values/) if function definitions still feel unfamiliar.

A dictionary can hold one miner’s values, as introduced in [OSPython.003: Dictionaries and Key-Value Data](https://bitcoinversus.tech/2026/09/26/python-dictionaries-key-value-data/). A class goes further: it gives every miner object a consistent structure and can include methods that operate on its data.

## Create your first class

```python
class Miner:
    def __init__(self, name, hash_rate):
        self.name = name
        self.hash_rate = hash_rate
```

The keyword `class` begins a class definition. By convention, class names use capitalized words, so this class is named `Miner`.

The `__init__()` method runs when a new object is created. It receives the starting values and stores them on that object. The name `self` refers to the particular object currently being created or used.

### Create an object

```python
miner_1 = Miner("Satoshi", 100)

print(miner_1.name)
print(miner_1.hash_rate)
```

`miner_1` is an object—also called an instance—of the `Miner` class. Its `name` attribute contains `"Satoshi"`, and its `hash_rate` attribute contains `100`.

[Watch: Python OOP Tutorial 1: Classes and Instances — Corey Schafer](https://www.youtube.com/watch?v=ZDa-Z5JzLYM)

*Focus on the difference between a class blueprint and each object created from it.*

## Add behavior with a method

A method is a function defined inside a class. It describes an action an object can perform.

```python
class Miner:
    def __init__(self, name, hash_rate):
        self.name = name
        self.hash_rate = hash_rate

    def status(self):
        return f"{self.name}: {self.hash_rate} TH/s"
```

Call the method through the object:

```python
miner_1 = Miner("Satoshi", 100)
print(miner_1.status())
```

The output is:

```text
Satoshi: 100 TH/s
```

## One class, multiple objects

```python
miner_1 = Miner("Satoshi", 100)
miner_2 = Miner("Hal", 200)

print(miner_1.status())
print(miner_2.status())
```

Both objects follow the same `Miner` blueprint, but each object stores its own attributes. Changing `miner_1.hash_rate` does not automatically change `miner_2.hash_rate`.

## Attributes, methods, classes, and objects

- **Class:** the blueprint, such as `Miner`.
- **Object or instance:** one item created from the blueprint, such as `miner_1`.
- **Attribute:** data stored on an object, such as `name` or `hash_rate`.
- **Method:** behavior defined by the class, such as `status()`.
- **self:** the current object receiving a method call.

## Common beginner mistakes

- Forgetting `self` as the first parameter of an instance method.
- Writing `name = name` instead of `self.name = name`.
- Calling an instance method on the class without creating an object first.
- Using inconsistent indentation inside the class body.
- Confusing the class name `Miner` with the object variable `miner_1`.

## Practice: build a temperature alarm

Create a `Miner` class with `name` and `temperature` attributes. Add a method named `needs_attention()` that returns `True` when the temperature is greater than 80.

```python
class Miner:
    def __init__(self, name, temperature):
        self.name = name
        self.temperature = temperature

    def needs_attention(self):
        return self.temperature > 80
```

Create two miner objects with different temperatures. Print each miner’s name and the result of `needs_attention()`. Then place the class in its own module or package using the structure from [OSPython.011: Packages and __init__.py](https://bitcoinversus.tech/2026/10/01/ospython-011-packages-init-py/).

## Quick knowledge check

1. What is the difference between a class and an object?
2. When does `__init__()` run?
3. What does `self` represent?
4. What is the difference between an attribute and a method?

### Answers

1. A class is a blueprint; an object is one instance created from that blueprint.
2. It runs when a new object is created from the class.
3. The particular object currently being created or used.
4. An attribute stores data; a method defines behavior.

## Key takeaway

Use a class when several objects need the same structure and behavior. The class defines the pattern; each object keeps its own state.

## Reference

Continue with the official [Python tutorial on classes](https://docs.python.org/3/tutorial/classes.html).
