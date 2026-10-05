---
title: "OSPython.008: Modules and Imports"
wordpress_post_id: 19656
source: BitcoinVersus.tech
published: 2026-09-30T20:43:37
modified: 2026-09-30T20:43:37
live_url: https://bitcoinversus.tech/2026/09/30/ospython-008-modules-imports/
track: python
lesson_number: 8
raw_source: 008-ospython-008-modules-imports-19656.gutenberg.html
---

<!-- wp:paragraph -->
<p><strong>OSPython.008</strong> introduces modules and imports. The goal is to reuse a function without copying it into every script. Begin with <a href="https://bitcoinversus.tech/2026/09/24/python-functions-parameters-return-values/">OSPython.001: Functions, Parameters, and Return Values</a> and <a href="https://bitcoinversus.tech/2026/09/27/open-source-python-lesson-7-reading-and-writing-files/">OSPython.007: Reading and Writing Files</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What Is a Module?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A Python source module is a <code>.py</code> file containing definitions and statements. An import makes its tools available to another program. Python also includes standard-library modules, so common tasks do not always require installing a package.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Import a Built-In Tool</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>import math</code><br><code>&nbsp;</code><br><code>print(math.sqrt(25))</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Run the example in a Python 3 script. The output is <strong>5.0</strong>. The name <code>math</code> identifies the module; <code>sqrt</code> is the function being called. Keeping the module name visible helps a reader identify where the function comes from.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Import One Function</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>from math import sqrt</code><br><code>&nbsp;</code><br><code>print(sqrt(25))</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The result is still <strong>5.0</strong>. Here, <code>sqrt</code> is available directly. You can also use an alias, such as <code>import math as m</code>, then call <code>m.sqrt(25)</code>. Avoid <code>from math import *</code> in beginner scripts because it obscures which names were imported.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Watch the import walkthrough below, then build your own small module in the next exercise. The instructor’s tutorial number is separate from the OSPython lesson sequence.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=CqvZ3vGoGs0","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=CqvZ3vGoGs0
</div><figcaption class="wp-element-caption"><em>Corey Schafer demonstrates importing modules and exploring Python’s standard library.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Create an Equipment Module</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Make a practice folder. Inside it, create a file named <strong>equipment.py</strong> and enter the following function:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>def watts(volts, amps):</code><br><code>&nbsp;&nbsp;&nbsp;&nbsp;return volts * amps</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a simple DC load, power in watts equals voltage multiplied by current. The same multiplication gives apparent power in volt-amperes for AC; real AC power also depends on power factor. Keep the exercise focused on the stated DC calculation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In the same folder, create <strong>report.py</strong>:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><code>import equipment</code><br><code>&nbsp;</code><br><code>print(equipment.watts(120, 2))</code></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>From that folder, run <code>python report.py</code>, or use <code>python3 report.py</code> if that is your Python 3 command. The result should be <strong>240</strong>, representing watts for the DC example. Import the name <code>equipment</code>, without the <code>.py</code> extension.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Keep the Files Easy to Find</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For the exercise, place both files beside one another. Check the spelling and ensure the saved filenames end in <code>.py</code>, rather than <code>.py.txt</code>. If you edit equipment.py during an interactive session, restart the interpreter before checking the changed function. Avoid naming a practice file <code>math.py</code>, which can hide the standard module.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Change the report to calculate power for a <strong>24 V DC load drawing 3 A</strong>. Predict the result before running it. Then create a second report that imports the same equipment module. You should not need to copy the function into that report.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Expected result:</strong> <code>equipment.watts(24, 3)</code> returns <strong>72</strong>. Explain which file defines the calculation and which file calls it.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A module lets several scripts share a tool. Start with one clear function, one module, and one report. Reuse the function rather than maintaining separate copies.</p>
<!-- /wp:paragraph -->