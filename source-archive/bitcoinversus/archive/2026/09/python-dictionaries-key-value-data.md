---
title: "OSPython.003: Dictionaries and Key-Value Data"
status: published
wordpress_post_id: 18668
wordpress_status: publish
live_url: "https://bitcoinversus.tech/2026/09/26/python-dictionaries-key-value-data/"
published: "2026-09-26T22:32:31"
series: "Python Tech Docs"
youtube: "https://www.youtube.com/watch?v=_uQrJ0TkZlc"
---

# Python: Dictionaries and Key-Value Data

Python dictionaries store information as key-value pairs. They are useful when a program needs to look up a value by a meaningful name instead of only by a numeric position. That makes dictionaries a natural fit for Bitcoin miner telemetry, game-character statistics, sports data, and many everyday applications.

## Create a Dictionary

```python
miner = {
    "model": "S21",
    "hashrate_th": 200,
    "efficiency_j_th": 17.5,
    "status": "online"
}

print(miner["model"])
print(miner["hashrate_th"])
```

Each key identifies a value. Here, `"model"` points to `"S21"`, while `"hashrate_th"` points to `200`.

## Read and Update Values

```python
miner["status"] = "maintenance"
miner["temperature_c"] = 68
```

Assigning to an existing key updates it. Assigning to a new key adds another pair.

## Use get() for Safer Lookups

```python
fan_speed = miner.get("fan_rpm", "not reported")
print(fan_speed)
```

A missing square-bracket lookup raises `KeyError`; `get()` can return a fallback.

## Gaming Example: Character Stats

```python
player = {
    "name": "Nova",
    "level": 12,
    "health": 95,
    "inventory_slots": 24
}
player["health"] -= 15
```

## Sports Example: Player Records

```python
quarterback = {
    "name": "QB1",
    "passing_yards": 312,
    "touchdowns": 3,
    "interceptions": 0
}

for stat, value in quarterback.items():
    print(stat, value)
```

## Nested Dictionaries

```python
mining_farm = {
    "rack_01": {"miners": 48, "online": 46},
    "rack_02": {"miners": 48, "online": 48}
}

print(mining_farm["rack_01"]["online"])
```

Nested dictionaries can represent racks, teams, game worlds, media libraries, or other structured records.

## Video Lesson

Programming with Mosh — Python Full Course for Beginners. The dictionaries chapter begins around 2:18:21 and is followed by an emoji-converter exercise.

https://www.youtube.com/watch?v=_uQrJ0TkZlc

## Practice

1. Create a dictionary for one Bitcoin miner with model, hashrate, efficiency, and status.
2. Add a temperature key.
3. Use `get()` for a key that may not exist.
4. Create either a game-character or sports-player dictionary.
5. Loop through it with `items()`.

## Key Takeaway

Lists are ideal when position and sequence matter. Dictionaries are ideal when values should be identified by meaningful keys. Real programs frequently combine both structures.
