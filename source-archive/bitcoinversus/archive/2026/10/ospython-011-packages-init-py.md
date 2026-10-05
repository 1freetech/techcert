---
title: "OSPython.011: Packages and __init__.py"
status: published
wordpress_post_id: 19840
published: "2026-10-01T12:38:50"
live_url: "https://bitcoinversus.tech/2026/10/01/ospython-011-packages-init-py/"
series: "Open-Source Python"
lesson_number: "011"
featured_media_id: 19843
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-011-packages-init-py-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=cONc0NcKE7s"
---

# OSPython.011: Packages and __init__.py

A Python **package** organizes related modules together under one package name.

## Package vs. Module

A module can be a single Python file such as `player.py`. A package groups related modules.

```
game/
    __init__.py
    player.py
    scores.py
main.py
```

## What Does __init__.py Do?

In a regular Python package, `__init__.py` identifies the directory as a package and can contain initialization code. For a beginner project it can simply be empty.

## Video

https://www.youtube.com/watch?v=cONc0NcKE7s

## Import From a Package

```python
# game/player.py
def show_player(name):
    print("Player:", name)
```

```python
# main.py
from game import player
player.show_player("Satoshi")
```

## Gaming Example

A game package might contain `player.py`, `scores.py`, and `maps.py`, keeping related code together.

## Bitcoin Mining Example

A simple `miner` package could contain `temperature.py`, `hashrate.py`, and `status.py`.

## Packages You Create vs. Packages You Install

OSPython.010 used `pip` to install packages. This lesson introduces the structure used to organize your own reusable Python code.

## Practice

1. Create a folder named `game`.
2. Add an empty `__init__.py`.
3. Create `player.py` with a simple function.
4. Create `main.py` outside the package.
5. Import `player` from `game` and call the function.

## Key Takeaway

A module is a Python file; a package organizes related modules under one name. Regular packages commonly contain `__init__.py`.
