---
title: "JavaScript Lesson 1: Variables, const, let, and Scope"
date: "2026-09-25T14:49:57"
status: "publish"
wordpress_post_id: 18526
live_url: "https://bitcoinversus.tech/2026/09/25/javascript-lesson-1-variables-const-let-and-scope/"
categories:
  - Computer Programming
  - Information Technology
  - Tech Docs
  - Technology
series: "JavaScript"
lesson: 1
---

# JavaScript Lesson 1: Variables, const, let, and Scope

**JavaScript Lesson 1** starts a numbered BitcoinVersus.Tech JavaScript training series with the most useful building block: variables. Modern JavaScript primarily uses `const` and `let` to give values clear names and control whether those bindings can be reassigned.

## const vs. let

Use `const` when the variable should not be reassigned. Use `let` when its value must change later. MDN recommends this same practical rule. Avoid `var` in new code unless you specifically need its older function-scoping behavior.

```javascript
const minerModel = "S21";
let temperatureC = 62;

temperatureC = 64;

console.log(minerModel);
console.log(temperatureC);
```

## Why scope matters

`let` and `const` are block-scoped. A name declared inside an `if` statement, loop, or other block is not automatically available outside that block.

```javascript
const online = true;

if (online) {
  const status = "Miner online";
  console.log(status);
}

// console.log(status); // ReferenceError
```

## Practical exercise

Open your browser developer console. Create a constant named `siteName`, a variable named `activeMiners`, then increase `activeMiners` by one. Finally, print both values with `console.log()`.

## Reference and video

MDN JavaScript variables guide:
https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Scripting/Variables

Video lesson on `var`, `let`, `const`, and scope:
https://www.youtube.com/watch?v=_E96W6ivHng

**Next:** JavaScript Lesson 2 will build on this foundation with data types, operators, and type checking.
