---
title: "OSPython.018: Decorators Basics"
status: published
wordpress_post_id: 20214
published: "2026-10-03T07:31:59"
live_url: "https://bitcoinversus.tech/2026/10/03/ospython-018-decorators-basics/"
series: "Open-Source Python"
pathway: python
lesson_number: "018"
featured_media_id: 20213
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython.018-decorators-basics-cover.png"
youtube_1: "https://www.youtube.com/watch?v=FsAPt_9Bf3U"
youtube_2: "https://www.youtube.com/watch?v=tfCz563ebsU"
youtube_3: "https://www.youtube.com/watch?v=JgxCY-tbWHA"
---

# OSPython.018: Decorators Basics

A decorator wraps a function so you can add behavior without rewriting the function itself.

## Start with the smallest useful example

```python
def announce(func):
    def wrapper():
        print("Starting...")
        func()
        print("Finished.")
    return wrapper

@announce
def greet():
    print("Hello!")

greet()
```

Output:

```text
Starting...
Hello!
Finished.
```

`@announce` passes `greet` into the decorator and replaces it with the returned wrapper.

## Video 1: Python decorators from the ground up

https://www.youtube.com/watch?v=FsAPt_9Bf3U

Corey Schafer builds decorators step by step and shows why the wrapper pattern works.

## What the @ syntax really means

```python
@announce
def greet():
    print("Hello!")
```

is essentially:

```python
def greet():
    print("Hello!")

greet = announce(greet)
```

## Decorating functions that take arguments

```python
def announce(func):
    def wrapper(*args, **kwargs):
        print("Starting...")
        result = func(*args, **kwargs)
        print("Finished.")
        return result
    return wrapper

@announce
def add(a, b):
    return a + b

print(add(2, 3))
```

## Video 2: A focused decorators lesson

https://www.youtube.com/watch?v=tfCz563ebsU

Tech With Tim explains how decorators modify function behavior without changing the original function body.

## Preserve the original function's information

```python
from functools import wraps

def announce(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        print("Starting...")
        return func(*args, **kwargs)
    return wrapper
```

Using `@wraps(func)` is a good habit in reusable decorators.

## Where decorators are useful

- Logging
- Timing
- Authentication
- Caching
- Validation

## A simple timer decorator

```python
from functools import wraps
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

work()
```

## Video 3: Common decorators you will see in Python

https://www.youtube.com/watch?v=JgxCY-tbWHA

Tech With Tim demonstrates practical decorators including property, staticmethod, classmethod, caching, and dataclass-related patterns.

## How this connects to the previous lesson

OSPython.017: Class Variables and Instance Variables:
https://bitcoinversus.tech/2026/10/03/ospython-017-class-variables-instance-variables/

## Common beginner mistakes

- Calling the decorated function while defining the decorator instead of passing the function itself.
- Forgetting to return the wrapper.
- Forgetting to return the original function's result.
- Omitting `*args` and `**kwargs` when the original function needs arguments.
- Skipping `functools.wraps` in reusable decorators.

## Quick practice

1. Create `hello(name)`.
2. Create a `log_call` decorator.
3. Print `Calling function...` before the original function runs.
4. Use `*args` and `**kwargs`.
5. Add `@log_call` above `hello`.
6. Call `hello("Ada")`.

## Key takeaway

A decorator takes a callable, adds or changes behavior around it, and returns a callable. The `@decorator` syntax makes that wrapping relationship easy to see.
