---
title: "OSPython.032: Custom Log Formatting with logging.Formatter — Timestamps, Levels, Logger Names, and Message Layout"
status: published
wordpress_post_id: 22292
wordpress_status: publish
published: "2026-10-08T22:02:00"
live_url: "https://bitcoinversus.tech/2026/10/08/ospython-032-custom-log-formatting-logging-formatter-timestamps-levels-logger-names-message-layout/"
series: "Open Source Python"
certification: OSPython
pathway: python
lesson_number: "032"
lesson_topic: "Custom Log Formatting with logging.Formatter"
featured_media_id: 22299
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython032-cover-1200x630-2.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 22300
body_media_dimensions: "1200x700"
seo_title: "OSPython.032: Custom Log Formatting with logging.Formatter"
seo_description: "Learn Python logging.Formatter: format strings, timestamps, log levels, logger names, datefmt, style options, handler attachment, and troubleshooting."
---

<!-- wp:paragraph -->
<p><strong>Elementary overview:</strong> Python’s <code>logging.Formatter</code> controls the <strong>final layout of a log line</strong>. The logger creates the event, a handler sends it to a destination, and the formatter turns the record into readable text.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson continues the logging sequence from <a href="https://bitcoinversus.tech/2026/10/07/ospython-028-python-logging-basics/">OSPython.028: Python Logging Basics</a>, <a href="https://bitcoinversus.tech/2026/10/07/ospython-029-logging-to-files-with-filehandler/">OSPython.029: Logging to Files with FileHandler</a>, <a href="https://bitcoinversus.tech/2026/10/07/ospython-030-rotating-log-files-rotatingfilehandler/">OSPython.030: Rotating Log Files</a>, and <a href="https://bitcoinversus.tech/2026/10/08/ospython-031-time-based-log-rotation-timedrotatingfilehandler/">OSPython.031: Time-Based Log Rotation</a>. Here, the focus is simple: make each log line easy to scan, sort, and troubleshoot.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What You Should Learn</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What a <code>Formatter</code> does—and what it does not do.</li><li>How to show timestamps, severity, logger names, and messages.</li><li>How to attach a formatter to a handler.</li><li>How <code>datefmt</code> and formatter styles work.</li><li>How to keep console and file logs readable without overloading each line.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":22300,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython032-formatter-body-1200x700-2.jpg?w=1024" alt="Diagram showing a Python LogRecord passing through logging.Formatter to become readable log output" class="wp-image-22300" /><figcaption class="wp-element-caption"><em>A Formatter controls presentation: it turns LogRecord fields such as time, level, logger name, and message into the final text emitted by a handler.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>The Mental Model: Logger → Handler → Formatter → Output</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A logger creates a <code>LogRecord</code>. A handler decides where that record goes, such as the terminal or a file. The formatter decides how that accepted record looks when the handler emits it.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Formatter means presentation.</strong> It does not decide the event’s severity, and it does not choose the destination.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=b4Ms4wxJuPg","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=b4Ms4wxJuPg</div><figcaption class="wp-element-caption"><em>Teclado’s Python logging tutorial explains the relationship between loggers, handlers, and formatters.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Build a Useful First Format</strong></h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>import logging

formatter = logging.Formatter(
    "%(asctime)s | %(levelname)s | %(name)s | %(message)s"
)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>That format asks Python to include four pieces of context: the event time, severity level, logger name, and final message. A line might look like this:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>2026-10-08 19:22:41,104 | ERROR | app.database | Connection failed</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>The Fields Worth Learning First</strong></h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Field</th><th>Meaning</th><th>Why it helps</th></tr></thead><tbody><tr><td><code>%(asctime)s</code></td><td>Event time</td><td>Shows when the event occurred</td></tr><tr><td><code>%(levelname)s</code></td><td>DEBUG, INFO, WARNING, ERROR, or CRITICAL</td><td>Shows severity</td></tr><tr><td><code>%(name)s</code></td><td>Logger name</td><td>Shows which subsystem produced the record</td></tr><tr><td><code>%(message)s</code></td><td>Final event message</td><td>Shows what happened</td></tr><tr><td><code>%(lineno)d</code></td><td>Source line number</td><td>Useful when tracing where a record originated</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>Python exposes many more <code>LogRecord</code> fields, including <code>filename</code>, <code>funcName</code>, <code>process</code>, and <code>threadName</code>. Add them only when they improve diagnosis. A log line overloaded with fields can become harder to read than a smaller, consistent format.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Attach the Formatter to a Handler</strong></h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>import logging

logger = logging.getLogger("api")
logger.setLevel(logging.INFO)

handler = logging.StreamHandler()

formatter = logging.Formatter(
    "%(asctime)s | %(levelname)-8s | %(name)s | %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)

handler.setFormatter(formatter)
logger.addHandler(handler)

logger.info("Server started")
logger.warning("Response time is high")</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The key line is <code>handler.setFormatter(formatter)</code>. The formatter belongs to the handler that emits the record. That means two handlers attached to the same logger can use different layouts.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Control Timestamps with datefmt</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>datefmt</code> changes how <code>%(asctime)s</code> is displayed. Without a custom date format, Python’s default formatter uses a date-and-time representation with milliseconds. Python uses local time by default for formatter timestamps unless you deliberately change the formatter’s time converter.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>formatter = logging.Formatter(
    "%(asctime)s | %(levelname)s | %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For operations work, consistency matters more than decoration. Pick a timestamp format that is easy to compare across terminal output, log files, services, and incident timelines.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Choose a Formatter Style</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>logging.Formatter</code> supports three template styles: percent (<code>%</code>), brace (<code>{</code>), and dollar (<code>$</code>). Percent style is the default and remains the most common in Python logging examples.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code># Percent style — default
logging.Formatter(
    "%(levelname)s | %(name)s | %(message)s"
)

# Brace style
logging.Formatter(
    "{levelname} | {name} | {message}",
    style="{",
)

# Dollar style
logging.Formatter(
    "$levelname | $name | $message",
    style="$",
)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>style</code> option changes the formatter template, not the way arguments passed to calls such as <code>logger.info()</code> are merged into the event message.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=zhtZa3Ibd_o","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=zhtZa3Ibd_o</div><figcaption class="wp-element-caption"><em>Software Testing Mentor demonstrates advanced Python logging with loggers, handlers, and formatters.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>For Small Scripts: basicConfig</strong></h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s | %(levelname)s | %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)

logging.info("Application started")</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For a small script, <code>logging.basicConfig()</code> can define the format directly. Once an application has several destinations or different severity requirements, explicit logger, handler, and formatter objects are easier to reason about.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.linkedin.com/posts/ingo-lange_python-activity-7052181587035115520-kz-S","type":"rich","providerNameSlug":"linkedin","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-linkedin wp-block-embed-linkedin"><div class="wp-block-embed__wrapper">https://www.linkedin.com/posts/ingo-lange_python-activity-7052181587035115520-kz-S</div><figcaption class="wp-element-caption"><em>A directly relevant Python logging example showing formatters used to add timestamps, log levels, and other context.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>One Logger, Two Different Formats</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A console usually benefits from a compact format, while a file may need more troubleshooting context. Because formatters attach to handlers, both can receive the same record and present it differently.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>console_handler = logging.StreamHandler()
file_handler = logging.FileHandler("app.log")

console_handler.setFormatter(
    logging.Formatter("%(levelname)s | %(message)s")
)

file_handler.setFormatter(
    logging.Formatter(
        "%(asctime)s | %(levelname)s | %(name)s | %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )
)</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This pattern connects directly to <a href="https://bitcoinversus.tech/2026/10/07/ospython-029-logging-to-files-with-filehandler/">FileHandler</a>, <a href="https://bitcoinversus.tech/2026/10/07/ospython-030-rotating-log-files-rotatingfilehandler/">RotatingFileHandler</a>, and <a href="https://bitcoinversus.tech/2026/10/08/ospython-031-time-based-log-rotation-timedrotatingfilehandler/">TimedRotatingFileHandler</a>. Rotation controls how files are managed; the formatter controls what each line looks like.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Common Formatter Mistakes</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Creating a formatter but never attaching it:</strong> use <code>handler.setFormatter()</code>.</li><li><strong>Expecting Formatter to filter records:</strong> filtering and formatting are separate jobs.</li><li><strong>Mixing template styles:</strong> brace syntax requires <code>style="{"</code>; dollar syntax requires <code>style="$"</code>.</li><li><strong>Leaving out <code>message</code>:</strong> a custom format can accidentally hide the event text.</li><li><strong>Adding too much context:</strong> every extra field increases visual noise.</li><li><strong>Adding handlers repeatedly:</strong> duplicate handlers can create duplicate log lines.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Troubleshooting Checklist</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Confirm the handler is actually attached to the logger.</li><li>Confirm the formatter is attached to the handler.</li><li>Check logger and handler levels separately.</li><li>Verify that every placeholder exists on the <code>LogRecord</code>.</li><li>Check that the chosen <code>style</code> matches the template syntax.</li><li>If lines are duplicated, inspect logger hierarchy and repeated handler setup.</li><li>Test the real emitted output instead of assuming the configuration is correct.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Lab</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a logger named <code>inventory</code>.</li><li>Add a <code>StreamHandler</code>.</li><li>Create a formatter with <code>asctime</code>, <code>levelname</code>, <code>name</code>, and <code>message</code>.</li><li>Add <code>datefmt="%Y-%m-%d %H:%M:%S"</code>.</li><li>Attach the formatter with <code>setFormatter()</code>.</li><li>Emit INFO, WARNING, and ERROR messages.</li><li>Add <code>filename</code> and <code>lineno</code>, then decide whether the extra detail improves readability.</li><li>Create a second handler with a shorter format and compare the two outputs.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What does logging.Formatter control?</strong> The final rendered layout of a log record.</li><li><strong>Where is a formatter normally attached?</strong> To a handler with <code>handler.setFormatter(formatter)</code>.</li><li><strong>What does %(asctime)s show?</strong> A formatted timestamp for the record.</li><li><strong>What does %(levelname)s show?</strong> The textual severity level.</li><li><strong>What does %(name)s show?</strong> The name of the logger that produced the record.</li><li><strong>Does formatter style change logger.info() message interpolation?</strong> No. It changes the formatter template.</li><li><strong>Can two handlers use different formatters?</strong> Yes.</li><li><strong>Why might logs appear twice?</strong> One common cause is duplicate handlers or logger propagation, which is covered more deeply in the next lesson.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Primary Technical References</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://docs.python.org/3/library/logging.html#formatter-objects">Python Documentation — Formatter Objects</a></li><li><a href="https://docs.python.org/3/howto/logging.html">Python Documentation — Logging HOWTO</a></li><li><a href="https://docs.python.org/3/howto/logging-cookbook.html">Python Documentation — Logging Cookbook</a></li><li><a href="https://peps.python.org/pep-0282/">PEP 282 — A Logging System</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Elementary Review</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Logger creates the record. Handler chooses the destination. Formatter chooses the presentation.</strong> For a strong beginner format, start with time, severity, logger name, and message. Keep it consistent before adding more fields.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Next Python Lesson</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>OSPython.033: Logger Hierarchy and Propagation</strong> will explain parent and child logger names, propagation, handler inheritance, and why duplicate log lines sometimes appear.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured artwork is a unique 1200×630 realistic programming scene created specifically for OSPython.032 and is not reused inside the lesson body. The separate body diagram explains the LogRecord → Formatter → output flow. Neon green is limited to the small <code>bitcoinversus.tech</code> tag at bottom-left.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->