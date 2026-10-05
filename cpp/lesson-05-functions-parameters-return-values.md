---
title: "OSC++.005: Functions, Parameters, and Return Values"
date: "2026-09-24T21:11:15"
wordpress_post_id: 18458
live_url: "https://bitcoinversus.tech/2026/09/24/cpp-lesson-5-functions-parameters-return-values/"
slug: "cpp-lesson-5-functions-parameters-return-values"
categories:
  - computer programming
  - Information Technology
  - Tech Docs
  - technology
---

# OSC++.005: Functions, Parameters, and Return Values

C++ functions let you package a task into a reusable block of code. Instead of repeating the same math or logic throughout a program, you can give that operation a name, pass information into it through parameters, and return a result.

## A simple function

```cpp
int add(int a, int b) {
    return a + b;
}
```

Here, `int` is the return type, `add` is the function name, and `a` and `b` are parameters. The `return` statement sends the calculated value back to the code that called the function.

## Calling the function

```cpp
#include <iostream>

int add(int a, int b) {
    return a + b;
}

int main() {
    int total = add(12, 8);
    std::cout << total << '\n';
    return 0;
}
```

The values `12` and `8` are arguments. When the function runs, those arguments initialize the parameters `a` and `b`. The function returns `20`, which is stored in `total`.

## Parameters versus arguments

A parameter is the variable named in a function declaration or definition. An argument is the value or expression supplied when the function is called.

## A practical electrical example

```cpp
#include <iostream>

double power_kw(double volts, double amps) {
    return (volts * amps) / 1000.0;
}

int main() {
    double kw = power_kw(240.0, 20.0);
    std::cout << kw << " kW\n";
    return 0;
}
```

This function accepts voltage and current as parameters and returns calculated power in kilowatts. With 240 volts and 20 amps, the result is 4.8 kW for this simple DC or unity-power-factor example. Real AC power calculations may also require power factor and phase considerations.

## Functions that return nothing

```cpp
void show_status() {
    std::cout << "System online\n";
}
```

The `void` return type means the function does not return a value to its caller.

## Why functions matter

Functions make programs easier to organize, test, reuse, and troubleshoot. A larger application can separate calculations, hardware checks, user-interface behavior, networking, and other jobs into clearly named functions rather than placing everything inside `main()`.

## Quick practice

Create a function named `watts` that accepts voltage and current and returns watts. Then create another function named `is_over_limit` that accepts a measured value and a limit and returns a Boolean result.

## References

- https://en.cppreference.com/w/cpp/language/functions
- https://learn.microsoft.com/en-us/cpp/cpp/functions-cpp?view=msvc-170

---

**BitcoinVersus.Tech Editor's Note:**  
We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb

https://x.com/1BitcoinVersus/status/1937006164555993338

BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.
