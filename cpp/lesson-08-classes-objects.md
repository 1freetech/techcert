---
title: "OSC++.008: Classes and Objects"
status: published
wordpress_post_id: 19543
published: "2026-09-30T01:22:23"
live_url: "https://bitcoinversus.tech/2026/09/30/cpp-lesson-8-classes-objects/"
series: "C++ Lessons"
lesson_number: 008
youtube: "https://www.youtube.com/watch?v=_8H2n0nDfd4"
---

# OSC++.008: Classes and Objects

A C++ **class** describes a kind of thing in a program. An **object** is one actual thing created from that class.

Think of a class as a character template in a game and an object as one character made from that template.

## Gaming Example

```cpp
#include <iostream>
#include <string>

class Player {
public:
    std::string name;
    int health;
};

int main() {
    Player hero;
    hero.name = "Alex";
    hero.health = 100;

    std::cout << hero.name << " has "
              << hero.health << " health.\n";

    return 0;
}
```

`Player` is the class. `hero` is an object.

## Class vs. Object

- **Class:** definition or template.
- **Object:** instance created from that class.
- **Member:** data or behavior belonging to the class.

## Bitcoin Mining Example

```cpp
class Miner {
public:
    std::string model;
    int hashrate;
};

Miner machine;
machine.model = "Miner A";
machine.hashrate = 200;
```

## Sports Example

```cpp
class Team {
public:
    std::string name;
    int score;
};

Team home;
home.name = "Home";
home.score = 21;
```

## Video Reference

Bro Code — C++ Classes & Objects Explained Easy

https://www.youtube.com/watch?v=_8H2n0nDfd4

## Practice

1. Create a class named `Game`.
2. Add a string named `title`.
3. Add an integer named `score`.
4. Create one `Game` object.
5. Give it a title and score and print them.

## Key Takeaway

A class defines a program-created type. An object is an instance of that type.
