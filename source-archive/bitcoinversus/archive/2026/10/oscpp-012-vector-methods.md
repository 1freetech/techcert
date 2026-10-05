---
title: "OSC++.012: Vector Methods"
status: published
wordpress_post_id: 19825
published: "2026-10-01T12:10:13"
live_url: "https://bitcoinversus.tech/2026/10/01/cpp-lesson-012-vector-methods/"
series: "Open-Source C++"
lesson_number: "012"
featured_media_id: 19827
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-012-vector-methods-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=BtVeU0k-TeE"
---

# OSC++.012: Vector Methods

A C++ vector can hold multiple values. This lesson follows OSC++.010 (Arrays and Vectors) and OSC++.011 (Range-Based For Loops) by teaching four everyday vector methods.

## push_back(): Add an Item

```cpp
std::vector<int> scores = {21, 34, 55};
scores.push_back(89);
```

`push_back()` adds an item to the end.

## Video

https://www.youtube.com/watch?v=BtVeU0k-TeE

## pop_back(): Remove the Last Item

```cpp
scores.pop_back();
```

`pop_back()` removes the last element. Only call it when the vector is not empty.

## size(): Count Items

```cpp
std::cout << scores.size();
```

`size()` returns the number of elements.

## empty(): Check for Items

```cpp
if (scores.empty()) {
    std::cout << "No scores yet";
}
```

`empty()` returns true when the vector has no elements.

## Gaming Example

```cpp
std::vector<int> lapTimes;
lapTimes.push_back(72);
lapTimes.push_back(68);
std::cout << "Laps: " << lapTimes.size();
```

## Bitcoin Mining Example

```cpp
std::vector<int> minerTemps;
minerTemps.push_back(61);
minerTemps.push_back(64);
minerTemps.push_back(63);
```

A simple monitoring program can add temperature readings as they arrive.

## Practice

1. Create a vector with three numbers.
2. Add a fourth with `push_back()`.
3. Print `size()`.
4. Remove the last item with `pop_back()`.
5. Check the vector with `empty()`.

## Key Takeaway

`push_back()` adds, `pop_back()` removes the last item, `size()` counts, and `empty()` checks whether the vector contains anything.
