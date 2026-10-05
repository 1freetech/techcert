# OSPython.007: Reading and Writing Files

- Published: 2026-09-27
- Presentation update: 2026-09-27 — removed boxed code formatting to prevent narrow-screen overflow; code text preserved.
- WordPress Post ID: 19287
- Live URL: https://bitcoinversus.tech/2026/09/27/open-source-python-lesson-7-reading-and-writing-files/
- Series: Open-Source Python
- Subject: Computer Programming / Python / File I/O
- Video reference: https://www.youtube.com/watch?v=BRrem1k3904

OSPython.007 introduces file input and output. After learning exceptions in Lesson #6, the next practical step is saving information to disk and reading it back.

## Open a file safely

Python's `with` statement is a clean way to work with files because the file is closed when the block finishes.

with open("notes.txt", "w", encoding="utf-8") as file:
    file.write("Hello from Python!\n")

## Read the file

with open("notes.txt", "r", encoding="utf-8") as file:
    text = file.read()

print(text)

The mode `r` reads a file. The mode `w` writes a file and replaces existing contents. The mode `a` appends new information to the end.

## Append another line

with open("notes.txt", "a", encoding="utf-8") as file:
    file.write("Second line\n")

## Technician exercise

Create a small equipment log. Write a device name and status to `equipment.txt`, append a second device, then read the entire file and print it. This same basic pattern can later support logs, configuration files, test results, and automation scripts.

## Video reference

Python File Handling for Beginners by Dave Gray demonstrates reading, writing, appending, and use of the `with` statement.

## Key takeaway

Use `with open(...)` to manage a file, choose the correct mode for reading or writing, and keep the first programs small enough that you can inspect the resulting file yourself.
