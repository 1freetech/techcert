---
title: "OSC++.019: Pure Virtual Functions and Abstract Classes Basics"
status: published
wordpress_post_id: 20425
published: "2026-10-04T00:34:56"
live_url: "https://bitcoinversus.tech/2026/10/04/oscpp-019-pure-virtual-functions-abstract-classes-basics/"
series: "Open-Source C++"
pathway: cpp
lesson_number: "019"
featured_media_id: 20422
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osc.019-pure-virtual-functions-and-abstract-classes-cover.png"
youtube_1: "https://www.youtube.com/watch?v=wE0_F4LpGVc"
youtube_2: "https://www.youtube.com/watch?v=FA5bvYW4iUc"
youtube_3: "https://www.youtube.com/watch?v=XNHSSduMBbY"
canonical_archive: "1freetech/Bitcoinversus.tech/archive/2026/10/oscpp-019-pure-virtual-functions-abstract-classes-basics.md"
---

# OSC++.019: Pure Virtual Functions and Abstract Classes Basics

A pure virtual function says that every concrete derived class must provide a required behavior. A class with an unimplemented pure virtual function is an **abstract class** and cannot be instantiated directly.

This lesson follows **OSC++.018: Virtual Functions and Polymorphism Basics** and extends runtime polymorphism into interface-style class design.

## The syntax to recognize

```cpp
virtual void start() = 0;
```

The `= 0` is the pure specifier. It makes `start()` a pure virtual function.

## Smallest useful example

```cpp
#include <iostream>

class Machine {
public:
    virtual void start() = 0;
};

class Fan : public Machine {
public:
    void start() override {
        std::cout << "Fan starting\n";
    }
};

int main() {
    Fan fan;
    fan.start();
}
```

Output:

```text
Fan starting
```

`Machine` defines the contract. `Fan` fulfills it.

## Why the base class cannot be instantiated

This is invalid:

```cpp
Machine machine;
```

`Machine` is abstract because `start()` is still pure. An abstract class is useful as a base interface even though you cannot create a standalone `Machine` object.

Microsoft Learn reference: https://learn.microsoft.com/en-us/cpp/cpp/abstract-classes-cpp?view=msvc-170

## Pure virtual vs. ordinary virtual

| Declaration | Meaning |
|---|---|
| `virtual void start() { ... }` | Base supplies behavior that derived classes may override. |
| `virtual void start() = 0;` | Pure virtual requirement; a concrete derived class must satisfy it. |
| `void start() override` | Derived class asks the compiler to verify the override. |

## One interface, many implementations

```cpp
class Pump : public Machine {
public:
    void start() override {
        std::cout << "Pump starting\n";
    }
};

void start_machine(Machine& machine) {
    machine.start();
}
```

Now both `Fan` and `Pump` can be passed to `start_machine()` through the same `Machine` interface.

## Abstract does not mean empty

An abstract class may still have constructors, data members, ordinary functions, and regular virtual functions.

```cpp
#include <iostream>
#include <string>

class Machine {
protected:
    std::string name;

public:
    Machine(const std::string& machine_name)
        : name(machine_name) {}

    void show_name() const {
        std::cout << name << '\n';
    }

    virtual void start() = 0;
};
```

## Data-center example

```cpp
class Device {
public:
    virtual void report_status() const = 0;
    virtual ~Device() = default;
};

class Server : public Device {
public:
    void report_status() const override {
        std::cout << "Server: online\n";
    }
};

class CoolingUnit : public Device {
public:
    void report_status() const override {
        std::cout << "Cooling unit: running\n";
    }
};
```

Monitoring code can depend on the `Device` interface rather than one specific equipment type.

## ASIC-mining example

```cpp
class Miner {
public:
    virtual double hashrate_th() const = 0;
    virtual ~Miner() = default;
};

class S21 : public Miner {
public:
    double hashrate_th() const override {
        return 200.0;
    }
};
```

The base class defines the question—what is your hashrate?—while each miner model supplies its own answer.

## Why a virtual destructor matters

Polymorphic base classes should normally have a virtual destructor when objects may be destroyed through a base pointer:

```cpp
virtual ~Device() = default;
```

A pure virtual destructor is a special case: it can make a class abstract, but it still needs a definition.

## Videos

1. Portfolio Courses — Abstract Classes and Pure Virtual Functions  
   https://www.youtube.com/watch?v=wE0_F4LpGVc
2. LearningLad — C++ Pure Virtual Functions and Abstract Classes  
   https://www.youtube.com/watch?v=FA5bvYW4iUc
3. ProgrammingKnowledge — Pure Virtual Functions and Abstract Classes  
   https://www.youtube.com/watch?v=XNHSSduMBbY

## Practice

1. Create an abstract class named `Device`.
2. Add `virtual void status() const = 0;`.
3. Add a virtual default destructor.
4. Create `Router` and `ASICMiner` derived classes.
5. Override `status()` in both.
6. Write a function that accepts `const Device&` and calls `status()`.
7. Pass both concrete objects into the function.

## Key takeaway

A pure virtual function uses `= 0` to make behavior mandatory for concrete derived classes. Abstract base classes let a program define a common interface while each real device, machine, or object supplies its own implementation.
