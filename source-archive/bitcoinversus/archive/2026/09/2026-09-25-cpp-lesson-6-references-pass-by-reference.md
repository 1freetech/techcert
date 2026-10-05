---
title: "OSC++.006: References and Pass by Reference"
date: "2026-09-25T23:06:10"
status: "publish"
wordpress_post_id: 18573
live_url: "https://bitcoinversus.tech/2026/09/25/cpp-lesson-6-references-pass-by-reference/"
categories:
  - Computer Programming
  - Information Technology
  - Tech Docs
  - Technology
---

# OSC++.006: References and Pass by Reference

OSC++.006 continues directly from Lesson 5's functions and parameters by introducing references and pass-by-reference. References let a function work with an existing object instead of receiving a separate copy.

## What is a reference?

```cpp
int value = 10;
int& reference = value;

reference = 25;
// value is now 25
```

The `&` in the declaration makes `reference` an lvalue reference to `value`. Changing the referenced object through that reference changes the original object.

## Pass by value

```cpp
void addOne(int number) {
    number++;
}
```

Here, the function receives its own parameter value. Changing `number` does not change the caller's original integer.

## Pass by reference

```cpp
void addOne(int& number) {
    number++;
}

int main() {
    int count = 5;
    addOne(count);
    // count is now 6
}
```

With `int&`, the function parameter refers to the caller's object. This is useful when a function is intentionally supposed to modify an argument.

## Read-only references with const

```cpp
void printName(const std::string& name) {
    std::cout << name << '\n';
}
```

A `const` reference can avoid an unnecessary copy while preventing the function from modifying the object through that reference. This pattern is common when passing strings, containers, and other objects that may be more expensive to copy than a small primitive value.

## Practical example

```cpp
#include <iostream>

void updateTemperature(double& temperature, double adjustment) {
    temperature += adjustment;
}

int main() {
    double sensorReading = 72.5;
    updateTemperature(sensorReading, -2.0);

    std::cout << sensorReading << '\n';
    return 0;
}
```

The function changes the original `sensorReading`, so the program prints `70.5`.

## Reference material

https://en.cppreference.com/w/cpp/language/reference

## Video lesson

https://www.youtube.com/watch?v=IzoFn3dfsPA

**Key takeaway:** pass by value creates an independent parameter value, a non-const reference can let a function modify the original object, and a const reference provides read-only access without requiring the same kind of object copy.
