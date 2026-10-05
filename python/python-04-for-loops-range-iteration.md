---
title: "OSPython.004: For Loops, Range, and Iteration"
status: published
wordpress_post_id: 18697
wordpress_status: publish
live_url: "https://bitcoinversus.tech/2026/09/27/python-4-for-loops-range-iteration/"
published: "2026-09-27T00:16:38"
series: "Python Tech Docs"
lesson_number: 4
youtube: "https://www.youtube.com/watch?v=K5KVEU3aaeQ"
---

# Python #4: For Loops, Range, and Iteration

Python loops repeat operations across collections. These examples connect iteration to Bitcoin mining, gaming, and sports.

## Bitcoin Miners

```python
miners = ["S21", "S21 Pro", "S19 XP"]
for miner in miners:
    print(miner)
```

## range()

```python
for rack_number in range(1, 6):
    print("Checking rack", rack_number)
```

`range(1, 6)` produces 1 through 5.

## Gaming Inventory

```python
inventory = ["pickaxe", "battery", "cooling kit", "ASIC miner"]
for item in inventory:
    print("Inventory item:", item)
```

## Sports Score

```python
quarter_scores = [7, 10, 3, 14]
total = 0
for points in quarter_scores:
    total += points
print("Final score:", total)
```

## Dictionary Iteration

```python
miner = {
    "model": "S21",
    "hashrate_th": 200,
    "status": "online"
}
for key, value in miner.items():
    print(key, value)
```

## Nested Loops

```python
for rack in range(1, 3):
    for miner_slot in range(1, 4):
        print("Rack", rack, "Miner", miner_slot)
```

## break

```python
temperatures = [62, 65, 71, 96, 68]
for temperature in temperatures:
    if temperature >= 90:
        print("High-temperature alert:", temperature)
        break
```

## Video Lesson

Programming with Mosh — Python Full Course for Beginners. For loops begin around 1:24:18.

https://www.youtube.com/watch?v=K5KVEU3aaeQ

## Practice

1. Loop through four ASIC miner models.
2. Use `range()` for rack numbers 1 through 10.
3. Loop through a game inventory.
4. Total four sports scoring periods.
5. Iterate through a miner dictionary with `items()`.
