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
<p><strong>Elementary overview:</strong> Python’s <code>logging.Formatter</code> controls <strong>what a log line looks like</strong>. The logger creates the event, a handler decides where that event goes, and the formatter turns the event’s <code>LogRecord</code> data into readable text. After <a href="https://bitcoinversus.tech/2026/10/07/ospython-028-python-logging-basics/">OSPython.028: Python Logging Basics</a>, <a href="https://bitcoinversus.tech/2026/10/07/ospython-029-logging-to-files-with-filehandler/">OSPython.029: Logging to Files with FileHandler</a>, <a href="https://bitcoinversus.tech/2026/10/07/ospython-030-rotating-log-files-rotatingfilehandler/">OSPython.030: Rotating Log Files</a>, and <a href="https://bitcoinversus.tech/2026/10/08/ospython-031-time-based-log-rotation-timedrotatingfilehandler/">OSPython.031: Time-Based Log Rotation</a>, this lesson focuses on one missing piece: making the output itself consistent and useful.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=b4Ms4wxJuPg","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=b4Ms4wxJuPg</div><figcaption class="wp-element-caption"><em>A focused Python logging tutorial covering loggers, handlers, and formatters.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22300,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython032-formatter-body-1200x700-2.jpg?w=1024" alt="Diagram showing a Python LogRecord passing through logging.Formatter to become readable log output" class="wp-image-22300" /><figcaption class="wp-element-caption"><em>A Formatter controls presentation: it turns LogRecord fields such as time, level, logger name, and message into the final text emitted by a handler.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>A Formatter Does Not Decide Whether a Message Exists</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A formatter is presentation logic. It does not decide whether a message is <code>INFO</code>, <code>WARNING</code>, or <code>ERROR</code>, and it does not decide whether that record should be written to a file. Those decisions belong to the logger and handler configuration. The formatter receives a <code>LogRecord</code> that already contains information such as the logger name, severity level, message, creation time, source filename, line number, function name, process information, and thread information. It selects the fields you want and combines them into the final output string.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The official Python Logging HOWTO describes <code>Formatter</code> objects as the part that controls the final order, structure, and contents of a log message. That separation matters because the same event can be formatted differently for different destinations. A console handler might use a short format, while a file handler might include timestamps, module names, and source-line details.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>The Simplest Useful Formatter</strong></h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>import logging

formatter = logging.Formatter(
    "%(asctime)s | %(levelname)s | %(message)s"
)
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The format string contains named fields from the <code>LogRecord</code>. <code>%(asctime)s</code> produces a human-readable time, <code>%(levelname)s</code> produces the severity name, and <code>%(message)s</code> contains the final log message. Python’s documentation uses the same basic idea in its formatter examples.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Common LogRecord Fields</strong></h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Field</th><th>Meaning</th><th>Typical use</th></tr></thead><tbody><tr><td><code>%(asctime)s</code></td><td>Formatted event time</td><td>When the event happened</td></tr><tr><td><code>%(levelname)s</code></td><td>DEBUG, INFO, WARNING, ERROR, or CRITICAL</td><td>Severity</td></tr><tr><td><code>%(name)s</code></td><td>Logger name</td><td>Which subsystem produced the event</td></tr><tr><td><code>%(message)s</code></td><td>Final log message</td><td>The event description</td></tr><tr><td><code>%(filename)s</code></td><td>Source filename</td><td>Debugging where code emitted the record</td></tr><tr><td><code>%(lineno)d</code></td><td>Source line number</td><td>Locating the call site</td></tr><tr><td><code>%(funcName)s</code></td><td>Function name</td><td>Tracing execution context</td></tr><tr><td><code>%(process)d</code></td><td>Process ID</td><td>Multi-process applications</td></tr><tr><td><code>%(threadName)s</code></td><td>Thread name</td><td>Multi-threaded applications</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>You do not need every field in every log. A beginner-friendly application format might use time, level, logger name, and message. Add filename, line number, process, or thread information only when it helps someone diagnose the system. More fields are not automatically better if they make ordinary logs difficult to scan.</p>
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
logger.warning("Response time is high")
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The key operation is <code>handler.setFormatter(formatter)</code>. A formatter belongs to the handler that emits the record. This means two handlers attached to the same logger can present the same event differently. That model fits naturally with the file handlers from <a href="https://bitcoinversus.tech/2026/10/07/ospython-029-logging-to-files-with-filehandler/">OSPython.029</a> and the rotating handlers from <a href="https://bitcoinversus.tech/2026/10/07/ospython-030-rotating-log-files-rotatingfilehandler/">OSPython.030</a> and <a href="https://bitcoinversus.tech/2026/10/08/ospython-031-time-based-log-rotation-timedrotatingfilehandler/">OSPython.031</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Use datefmt to Control the Timestamp</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>datefmt</code> argument controls how <code>%(asctime)s</code> is rendered. For example, <code>datefmt="%Y-%m-%d %H:%M:%S"</code> produces a timestamp such as <code>2026-10-08 22:00:46</code>. If you do not provide <code>datefmt</code>, Python uses its default logging time representation. The exact time zone behavior also matters: formatter time conversion uses local time by default unless you deliberately change the formatter’s converter.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Consistent timestamps become more important once logs are written to files, retained by <code>RotatingFileHandler</code>, or rolled over by <code>TimedRotatingFileHandler</code>. The timestamp inside each record tells you when the event occurred; the rotation policy controls how log files themselves are divided and retained.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Formatter Supports Three Format-String Styles</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Python’s <code>logging.Formatter</code> supports three styles for the formatter template: percent style (<code>%</code>), <code>str.format()</code>-style braces (<code>{</code>), and <code>string.Template</code>-style dollar signs (<code>$</code>). Percent style remains common in logging examples and is the default.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code># Default percent style
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
)
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>style</code> argument applies to the <strong>formatter template</strong>. It does not mean that calls such as <code>logger.info()</code> suddenly change to brace interpolation. Keeping those two concepts separate prevents a common source of confusion.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=A3FkYRN9qog","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=A3FkYRN9qog</div><figcaption class="wp-element-caption"><em>A compact Python logging walkthrough that includes handler formatters, filters, hierarchy, and configuration.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>basicConfig Can Format Simple Programs</strong></h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s | %(levelname)s | %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)

logging.info("Application started")
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For a small script, <code>logging.basicConfig()</code> can define the format directly. Once an application has multiple handlers or destinations, explicit logger, handler, and formatter objects usually make the design easier to understand. The same principle applies to <a href="https://bitcoinversus.tech/2026/09/27/open-source-python-lesson-7-reading-and-writing-files/">reading and writing files</a>: simple programs can stay simple, while larger programs benefit from clearer separation of responsibilities.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.linkedin.com/posts/ingo-lange_python-activity-7052181587035115520-kz-S","type":"rich","providerNameSlug":"linkedin","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-linkedin wp-block-embed-linkedin"><div class="wp-block-embed__wrapper">https://www.linkedin.com/posts/ingo-lange_python-activity-7052181587035115520-kz-S</div><figcaption class="wp-element-caption"><em>A directly relevant Python post demonstrating how formatters add timestamps, log levels, and other context to logging output.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Common Formatting Mistakes</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Forgetting to attach the formatter:</strong> creating a <code>Formatter</code> object does nothing until a handler uses <code>setFormatter()</code>.</li><li><strong>Using the wrong placeholder type:</strong> <code>%(lineno)d</code> expects an integer, while most text fields use <code>s</code>.</li><li><strong>Mixing style syntax:</strong> a brace-style template requires <code>style="{"</code>; dollar style requires <code>style="$"</code>.</li><li><strong>Leaving out the message:</strong> a custom format that omits <code>%(message)s</code> can hide the event description entirely.</li><li><strong>Adding too much context:</strong> giant log lines can become harder to scan than smaller, consistent records.</li><li><strong>Adding duplicate handlers repeatedly:</strong> interactive sessions or repeatedly executed setup functions can produce duplicate log lines if the same logger receives handlers again and again.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Verification Exercise</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a logger named <code>inventory</code>.</li><li>Add a <code>StreamHandler</code>.</li><li>Create a formatter containing <code>asctime</code>, <code>levelname</code>, <code>name</code>, and <code>message</code>.</li><li>Set <code>datefmt</code> to <code>%Y-%m-%d %H:%M:%S</code>.</li><li>Attach the formatter to the handler with <code>setFormatter()</code>.</li><li>Emit one <code>INFO</code>, one <code>WARNING</code>, and one <code>ERROR</code> message.</li><li>Replace <code>%(name)s</code> with <code>%(filename)s:%(lineno)d</code> and compare the output.</li><li>Create a second formatter using brace style and confirm that the visible information remains equivalent.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What does logging.Formatter control?</strong> The structure and contents of the final rendered log message.</li><li><strong>Where does a formatter normally get attached?</strong> To a handler with <code>handler.setFormatter(formatter)</code>.</li><li><strong>What does <code>%(levelname)s</code> show?</strong> The text name of the log severity level.</li><li><strong>What does <code>%(name)s</code> show?</strong> The name of the logger that created the record.</li><li><strong>What does <code>datefmt</code> control?</strong> The rendering of <code>%(asctime)s</code>.</li><li><strong>Which formatter styles does Python support?</strong> Percent (<code>%</code>), brace (<code>{</code>), and dollar (<code>$</code>) styles.</li><li><strong>Does formatter style change how <code>logger.info()</code> interpolates its own message arguments?</strong> No. Formatter style applies to the formatter template.</li><li><strong>Why might two handlers use different formatters?</strong> Different destinations may need different amounts or structures of context.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Primary Technical References</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://docs.python.org/3/howto/logging.html">Python Documentation — Logging HOWTO</a></li><li><a href="https://docs.python.org/3/library/logging.html#formatter-objects">Python Documentation — Formatter Objects</a></li><li><a href="https://peps.python.org/pep-0282/">PEP 282 — A Logging System</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Elementary Review</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>A logger creates a record, a handler chooses a destination, and a formatter decides how that record looks.</strong> Start with a small format such as time, level, logger name, and message. Add source details only when they improve troubleshooting. Once the format is created, attach it to the handler and verify the real output rather than assuming the configuration is correct.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured artwork is a unique 1200×630 realistic programming scene created specifically for OSPython.032 and is not reused inside the lesson body. The separate 1200×700 body diagram teaches the LogRecord → Formatter → final output flow. Neon green is used only for the small <code>bitcoinversus.tech</code> tag at bottom-left.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->