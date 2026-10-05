---
title: "OSC++.006: References and Pass by Reference"
source: "https://bitcoinversus.tech/2026/09/25/cpp-lesson-6-references-pass-by-reference/"
published: "2026-09-25T23:06:10"
wordpress_id: 18573
subject: "C++"
---

OSC++.006 continues from functions and parameters by introducing references and pass-by-reference.

```cpp
int value = 10;
int& reference = value;
reference = 25;
```

Pass by value receives an independent parameter value. Pass by reference can modify the caller's object:

```cpp
void addOne(int& number) { number++; }
```

Use a const reference for read-only access without the same kind of object copy:

```cpp
void printName(const std::string& name) {
    std::cout << name << '\n';
}
```

Reference: https://en.cppreference.com/w/cpp/language/reference

Video: https://www.youtube.com/watch?v=IzoFn3dfsPA
