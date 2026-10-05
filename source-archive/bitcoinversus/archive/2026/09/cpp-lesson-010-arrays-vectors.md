---
title: "OSC++.010: Arrays and Vectors"
status: published
wordpress_post_id: 19580
published: "2026-09-30T11:30:53"
live_url: "https://bitcoinversus.tech/2026/09/30/cpp-lesson-010-arrays-vectors/"
series: "C++ Lessons"
lesson_number: "010"
featured_image: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/09/cpp-lesson-010-arrays-vectors-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=vLnPwxZdW4Y&t=4425s"
---

# OSC++.010: Arrays and Vectors

An **array** and a **vector** both let a C++ program keep several values together. A basic array has a fixed size, while a vector can grow or shrink.

## Start With Four Scores

```cpp
#include <iostream>

int main() {
    int scores[4] = {10, 20, 30, 40};
    std::cout << scores[0] << "\n";
    std::cout << scores[1] << "\n";
    return 0;
}
```

C++ indexes begin at zero.

## Video: See Arrays in C++

The embedded freeCodeCamp beginner course reaches its arrays section at about 1:13:45:

https://www.youtube.com/watch?v=vLnPwxZdW4Y&t=4425s

## A Vector Can Grow

```cpp
#include <iostream>
#include <vector>

int main() {
    std::vector<int> scores = {10, 20, 30};
    scores.push_back(40);
    std::cout << scores[3] << "\n";
    return 0;
}
```

The vector begins with three values and `push_back(40)` adds a fourth.

## Gaming Example

```cpp
#include <string>
#include <vector>

std::vector<std::string> players = {"Solo", "Rex", "Nova"};
players.push_back("Zed");
```

## Bitcoin Mining Example

```cpp
int minerTemperatures[4] = {61, 63, 60, 64};
std::cout << minerTemperatures[0] << "\n";
```

## Array or Vector?

- **Array:** fixed number of values.
- **Vector:** list that can grow or shrink.
- **Both:** individual items are accessed with an index beginning at zero.

## Practice

1. Create an integer array containing four basketball scores.
2. Print the first and fourth scores.
3. Create a vector containing three game titles.
4. Add one more title with `push_back()`.
5. Print the new fourth title.

## Key Takeaway

Arrays and vectors keep multiple values together. A basic array has a fixed size. A vector can change size.
