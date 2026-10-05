---
title: "OSPython.010: pip and Package Installation"
status: published
wordpress_post_id: 19757
published: "2026-10-01T08:12:41"
live_url: "https://bitcoinversus.tech/2026/10/01/ospython-010-pip-package-installation/"
series: "Open-Source Python"
certification: OSPython
lesson_number: "010"
featured_media_id: 19760
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-010-pip-package-installation-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=jnpC_Ib_lbc"
---

# OSPython.010: pip and Package Installation

**pip** is the standard package installer used to add Python packages to an environment.

This lesson follows OSPython.009: Virtual Environments. A virtual environment gives a project its own space; pip installs the packages the project needs inside it.

## The Basic Command

```text
python -m pip install requests
```

`python -m pip` runs pip through the selected Python interpreter. `install` is the action and `requests` is the package.

## Use the Package

```python
import requests
print(requests.__version__)
```

The beginner sequence is **install first, import second**.

## Video: Installing Python Packages With pip

https://www.youtube.com/watch?v=jnpC_Ib_lbc

## See What Is Installed

```text
python -m pip list
```

This displays packages installed in the current Python environment.

## Remove a Package

```text
python -m pip uninstall requests
```

## Gaming Example

A game utility may need a package another developer created. pip installs that package into the Python environment instead of requiring you to copy its files manually.

## Bitcoin Example

A small Bitcoin-related Python project might use an external package to make a web request to a public data service. pip handles installation; Python then imports the package.

## Practice

1. Activate a practice virtual environment.
2. Run `python -m pip list`.
3. Install `requests`.
4. Run the package list again.
5. Create a short file that imports `requests` and prints its version.

## Key Takeaway

pip installs and manages Python packages. Virtual environments keep project packages separate, while pip adds the packages each project needs.
