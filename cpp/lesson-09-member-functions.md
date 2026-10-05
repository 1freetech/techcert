---
title: "OSC++.009: Member Functions"
status: published
wordpress_post_id: 19567
published: "2026-09-30T11:16:38"
live_url: "https://bitcoinversus.tech/2026/09/30/cpp-lesson-9-member-functions/"
series: "C++ Lessons"
lesson_number: 009
featured_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/09/cpp-lesson-9-member-functions-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=vLnPwxZdW4Y&t=12881s"
---

# OSC++.009: Member Functions

A **member function** is a function that belongs to a class. It lets an object perform an action using the data stored inside that object.

## Game Score Example

```cpp
#include <iostream>

class Player {
public:
    int score;

    void showScore() {
        std::cout << "Score: " << score << "\n";
    }
};

int main() {
    Player hero;
    hero.score = 100;
    hero.showScore();
    return 0;
}
```

`showScore()` belongs to `Player`. The `hero` object calls it with `hero.showScore()`.

## Data and Actions Together

- `score` is data stored by the object.
- `showScore()` is an action the object can perform.
- The dot operator connects the object to its member.

## Bitcoin Mining Example

```cpp
class Miner {
public:
    bool running;

    void showStatus() {
        if (running) {
            std::cout << "Miner is on\n";
        } else {
            std::cout << "Miner is off\n";
        }
    }
};
```

## Sports Example

```cpp
class Team {
public:
    int points;

    void addPoint() {
        points = points + 1;
    }
};
```

## Video Reference

freeCodeCamp C++ Tutorial for Beginners — Object Functions section:

https://www.youtube.com/watch?v=vLnPwxZdW4Y&t=12881s

## Practice

1. Create a class named `Game`.
2. Add an integer named `lives`.
3. Add a member function named `showLives()`.
4. Create a `Game` object and set `lives` to 3.
5. Call `showLives()`.

## Key Takeaway

A member function is an action that belongs to a class. An object uses the dot operator to call that action.
