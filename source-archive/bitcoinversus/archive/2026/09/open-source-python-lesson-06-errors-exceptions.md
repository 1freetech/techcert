---
title: "OSPython.006: Errors, Exceptions, Try, Except, Else, and Finally"
status: published
wordpress_post_id: 19197
live_url: "https://bitcoinversus.tech/2026/09/27/open-source-python-lesson-6-errors-exceptions/"
series: "Open-Source Python"
lesson_number: 6
youtube: "https://www.youtube.com/watch?v=_uQrJ0TkZlc"
---

# OSPython.006: Errors, Exceptions, Try, Except, Else, and Finally

Exception handling using Bitcoin-mining telemetry, gaming input, and sports-stat examples.

## Bitcoin Mining
```python
raw_hashrate = "offline"
try:
    hashrate_th = float(raw_hashrate)
    print("Hashrate:", hashrate_th, "TH/s")
except ValueError:
    print("Miner returned non-numeric hashrate data")
```

## Gaming
```python
choice = "turbo"
try:
    selected_slot = int(choice)
except ValueError:
    print("Inventory slot must be a number")
```

## Sports
```python
points = 24
games_played = 0
try:
    average = points / games_played
except ZeroDivisionError:
    print("Average unavailable until a game is played")
```

## else and finally
```python
temperature = "72"
try:
    temperature_c = int(temperature)
except ValueError:
    print("Invalid temperature")
else:
    print("Valid telemetry:", temperature_c, "C")
finally:
    print("Telemetry check complete")
```

## Video
Programming with Mosh — Python Full Course for Beginners. Exceptions chapter begins around 2:53:42.

https://www.youtube.com/watch?v=_uQrJ0TkZlc

## Practice
1. Handle invalid ASIC hashrate telemetry.
2. Protect numeric game input.
3. Handle division by zero in a sports average.
4. Add an else block.
5. Add a finally cleanup block.
