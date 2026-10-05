---
title: "OSPython.005: While Loops, Break, and Continue"
status: published
wordpress_post_id: 19191
wordpress_status: publish
live_url: "https://bitcoinversus.tech/2026/09/27/python-5-while-loops-break-continue/"
series: "Python Tech Docs"
lesson_number: 5
youtube: "https://www.youtube.com/watch?v=BTaPo33TBIM"
---

# Python #5: While Loops, Break, and Continue

Condition-controlled repetition with Bitcoin-mining, gaming, and sports examples.

## Bitcoin Mining: Cooldown Monitor
```python
temperature_c = 92
while temperature_c > 80:
    print("Cooling ASIC:", temperature_c, "C")
    temperature_c -= 3
print("Temperature back in range")
```

## Gaming: Health
```python
health = 30
while health > 0:
    print("Player health:", health)
    health -= 10
print("Game over")
```

## break
```python
attempt = 1
while True:
    print("Checking miner connection:", attempt)
    if attempt == 3:
        print("Miner connected")
        break
    attempt += 1
```

## continue
```python
player_number = 0
while player_number < 5:
    player_number += 1
    if player_number == 3:
        continue
    print("Process player", player_number)
```

## Sports: Overtime
```python
home_score = 24
away_score = 24
overtime = 1
while home_score == away_score:
    print("Overtime period:", overtime)
    home_score += 3
    overtime += 1
print("Final:", home_score, "-", away_score)
```

## Video
Real Python — How to Use break and continue in Python while Loops

https://www.youtube.com/watch?v=BTaPo33TBIM

## Practice
1. Write an ASIC-temperature loop.
2. Create a game-health loop.
3. Use break in a connection retry loop.
4. Use continue to skip one player.
5. Explain when while is preferable to for.
