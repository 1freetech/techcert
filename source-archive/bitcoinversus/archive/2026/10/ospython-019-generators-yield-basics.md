---
title: "OSPython.019: Generators and yield Basics"
status: published
wordpress_post_id: 20247
published: "2026-10-03T10:29:25"
live_url: "https://bitcoinversus.tech/2026/10/03/ospython-019-generators-yield-basics/"
series: "Open-Source Python"
pathway: python
lesson_number: "019"
featured_media_id: 20246
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython.019-generators-and-yield-cover.png"
youtube_1: "https://www.youtube.com/watch?v=bD05uGo_sVI"
youtube_2: "https://www.youtube.com/watch?v=u3T7hmLthUU"
youtube_3: "https://www.youtube.com/watch?v=tmeKsb2Fras"
---

# OSPython.019: Generators and yield Basics

A generator produces values one at a time instead of building the whole sequence in memory first.

## Start with the smallest generator

```python
def count_to_three():
    yield 1
    yield 2
    yield 3

for number in count_to_three():
    print(number)
```

The key word is `yield`. It produces a value and pauses the generator so execution can continue later.

## Video 1: Generators and their benefits

https://www.youtube.com/watch?v=bD05uGo_sVI

Corey Schafer demonstrates generators, why they are useful, and their memory benefits.

## return vs. yield

`return` finishes a function. `yield` produces a value and pauses the generator.

```python
def normal_function():
    return 10

def generator_function():
    yield 10
```

## Use next() to see the pause

```python
def letters():
    yield "A"
    yield "B"
    yield "C"

items = letters()
print(next(items))
print(next(items))
print(next(items))
```

## Video 2: Generators explained step by step

https://www.youtube.com/watch?v=u3T7hmLthUU

Tech With Tim connects iterators, next(), generator functions, and generator comprehensions.

## Generate values with a loop

```python
def squares(limit):
    for number in range(limit):
        yield number * number

for value in squares(5):
    print(value)
```

## Why generators can save memory

A list comprehension creates every result immediately:

```python
squares_list = [n * n for n in range(1_000_000)]
```

A generator expression produces values lazily:

```python
squares_generator = (n * n for n in range(1_000_000))
```

## Video 3: Lazy sequences and generator pipelines

https://www.youtube.com/watch?v=tmeKsb2Fras

mCoding shows generators as lazy sequences and demonstrates generator expressions, file processing, and pipelines.

## A practical file-processing pattern

```python
def nonempty_lines(path):
    with open(path, "r", encoding="utf-8") as file:
        for line in file:
            line = line.strip()
            if line:
                yield line
```

## A generator is usually consumed once

```python
numbers = (n for n in range(3))
print(list(numbers))
print(list(numbers))
```

The first conversion produces `[0, 1, 2]`; the second produces `[]` because the generator has been consumed.

## Previous lesson

OSPython.018: Decorators Basics
https://bitcoinversus.tech/2026/10/03/ospython-018-decorators-basics/

## Common beginner mistakes

- Expecting a generator call to immediately produce all values.
- Using return when you mean to yield multiple values.
- Calling next() after exhaustion without handling StopIteration.
- Trying to reuse a consumed generator.
- Converting to a list immediately when lazy processing is the goal.

## Quick practice

1. Create `even_numbers(limit)`.
2. Loop from 0 to limit - 1.
3. Yield only even numbers.
4. Print them with a for loop.
5. Create a generator expression.
6. Call next() twice.

## Key takeaway

`yield` turns a function into a generator function. Generators produce values on demand, remember where they paused, and are useful when an entire sequence does not need to live in memory at once.
