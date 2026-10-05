---
title: "OSC++.007: Pointers and Memory Addresses"
status: published
wordpress_post_id: 18634
wordpress_status: publish
live_url: "https://bitcoinversus.tech/2026/09/26/c-lesson-7-pointers-and-memory-addresses/"
published: "2026-09-26T22:26:10"
series: "C++ Lessons"
lesson_number: 007
youtube: "https://www.youtube.com/watch?v=zuegQmMdy8M"
---

# OSC++.007: Pointers and Memory Addresses

OSC++.007 continues directly from references and pass-by-reference by introducing pointers and memory addresses. A pointer stores the memory address of another object. Pointers are fundamental to arrays, dynamic memory, data structures, APIs, and systems programming.

## Create and Dereference a Pointer

```cpp
int value = 42;
int* ptr = &value;
std::cout << *ptr << '\n';
```

`&value` obtains the address of `value`. The pointer stores that address. `*ptr` dereferences it and accesses the object.

## Modify Through a Pointer

```cpp
int value = 42;
int* ptr = &value;
*ptr = 100;
std::cout << value << '\n';
```

After the assignment, `value` is 100. The pointer gives the program another way to access the same integer in memory.

## Use nullptr

```cpp
int* ptr = nullptr;
if (ptr != nullptr) {
    std::cout << *ptr;
}
```

Do not dereference a pointer unless it refers to a valid object. Initializing a pointer to `nullptr` makes an intentionally empty pointer explicit and testable.

## Pointers and Functions

```cpp
void set_value(int* number) {
    if (number != nullptr) {
        *number = 75;
    }
}

int value = 10;
set_value(&value);
std::cout << value << '\n';
```

The function receives the address of `value`. Dereferencing `number` lets the function modify the original integer.

## Pointers and Arrays

```cpp
int numbers[] = {10, 20, 30};
int* ptr = numbers;

std::cout << *ptr << '\n';
std::cout << *(ptr + 1) << '\n';
```

In many expressions, an array can provide a pointer to its first element. Pointer arithmetic can then move between elements, but code must stay within valid array bounds.

## Dynamic Memory: Know the Risk

Pointers also appear in dynamic memory management. Modern C++ generally favors automatic storage and standard-library ownership tools such as containers and smart pointers instead of manually owning memory with raw pointers. When raw dynamic allocation is encountered, every allocation needs a clear lifetime and ownership plan to avoid leaks and invalid access.

## Video Lesson

freeCodeCamp.org — Pointers in C / C++ [Full Course]

https://www.youtube.com/watch?v=zuegQmMdy8M

The course covers working with pointers, pointer types, function arguments, arrays, dynamic memory, function pointers, and memory leaks.

## Practice

1. Create an integer and a pointer to it.
2. Print the integer's value through the pointer.
3. Change the integer by dereferencing the pointer.
4. Create another pointer initialized to `nullptr`.
5. Use an `if` check before attempting to dereference it.

## Reference

Use cppreference C++ language documentation for detailed language-reference material. The freeCodeCamp.org course provides a longer visual walkthrough of pointer mechanics and memory concepts.
