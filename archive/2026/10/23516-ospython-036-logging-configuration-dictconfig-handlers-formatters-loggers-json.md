---
title: "OSPython.036: Logging Configuration with dictConfig — Handlers, Formatters, Loggers, and JSON"
wordpress_post_id: 23516
live_url: "https://bitcoinversus.tech/2026/10/11/ospython-036-logging-configuration-dictconfig-handlers-formatters-loggers-json/"
slug: "ospython-036-logging-configuration-dictconfig-handlers-formatters-loggers-json"
status: publish
featured_media_id: 23513
content_hash: "67b9d4bc7753aa510266a65523678a1cd4d2268e"
---

<!-- wp:paragraph --><p>Python’s logging system becomes easier to maintain when configuration is separated from application logic. <code>logging.config.dictConfig()</code> lets you define formatters, handlers, logger levels, propagation rules, and output destinations in one structured dictionary instead of scattering setup code across a program.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>This lesson continues the logging sequence after <a href="https://bitcoinversus.tech/2026/10/09/ospython-033-logging-filters-select-records-custom-rules/">OSPython.033: Logging Filters</a>, <a href="https://bitcoinversus.tech/2026/10/10/ospython-034-contextual-logging-with-loggeradapter-and-extra/">OSPython.034: Contextual Logging</a>, and <a href="https://bitcoinversus.tech/2026/10/10/ospython-035-logging-exceptions-exc-info-tracebacks-stack-info/">OSPython.035: Logging Exceptions</a>. The goal now is to configure the whole logging graph in one place.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Learning Objectives</h2><!-- /wp:heading -->
<!-- wp:list --><ul><li>Explain what <code>dictConfig()</code> configures.</li><li>Build formatter, handler, and logger sections correctly.</li><li>Understand the required <code>version</code> key.</li><li>Use <code>disable_existing_loggers</code> deliberately.</li><li>Route INFO and ERROR records to different handlers.</li><li>Load logging configuration from JSON safely.</li><li>Verify the active configuration with real log records.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2>Why Move Beyond basicConfig()</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>logging.basicConfig()</code> is useful for small scripts, but larger applications often need multiple handlers, different levels, file output, structured formatting, and separate logger namespaces. Writing all of that imperatively works, but it can become repetitive and difficult to audit.</p><!-- /wp:paragraph -->
<!-- wp:image {"id":23514,"sizeSlug":"large","linkDestination":"none"} --><figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-036-programming-laptop.jpg?w=1024" alt="Programming code displayed on a laptop screen" class="wp-image-23514" /><figcaption class="wp-element-caption"><em>Programming code on a laptop. Photo by Negative Space, public domain/CC0 via Wikimedia Commons.</em></figcaption></figure><!-- /wp:image -->
<!-- wp:paragraph --><p><code>dictConfig()</code> treats logging setup as data. That makes the configuration easier to inspect, test, reuse, serialize, and replace for different environments such as local development, staging, and production.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>The Smallest Useful dictConfig</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>import logging
import logging.config

CONFIG = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "standard": {
            "format": "%(asctime)s %(levelname)s %(name)s %(message)s"
        }
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "standard",
            "level": "INFO",
        }
    },
    "root": {
        "handlers": ["console"],
        "level": "INFO",
    },
}

logging.config.dictConfig(CONFIG)
logger = logging.getLogger(__name__)
logger.info("Logging is configured")</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>version</code> key is required by the configuration schema. Today the documented value is <code>1</code>. The formatter is named <code>standard</code>, the handler is named <code>console</code>, and the root logger sends records to that handler at INFO and above.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=9L77QExPmI0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">[youtube https://www.youtube.com/watch?v=9L77QExPmI0]</div><figcaption class="wp-element-caption"><em>mCoding’s modern Python logging tutorial explains dictConfig, handlers, formatters, structured configuration, and production logging patterns.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2>Formatters Define Record Layout</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The <code>formatters</code> section defines how a <code>LogRecord</code> becomes readable output. A formatter can include timestamps, levels, logger names, process IDs, filenames, line numbers, or custom contextual fields. Formatter names are local configuration identifiers; handlers refer to them by those names.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>"formatters": {
    "detailed": {
        "format": (
            "%(asctime)s %(levelname)s %(name)s "
            "%(filename)s:%(lineno)d %(message)s"
        )
    }
}</code></pre><!-- /wp:code -->
<!-- wp:heading --><h2>Handlers Decide Where Records Go</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Handlers determine the destination. A <code>StreamHandler</code> can write to standard output or standard error. A <code>FileHandler</code> writes to a file. Rotating handlers from earlier lessons can also be referenced by class name inside a dictionary configuration.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>"handlers": {
    "console": {
        "class": "logging.StreamHandler",
        "formatter": "detailed",
        "level": "INFO",
        "stream": "ext://sys.stdout",
    },
    "errors": {
        "class": "logging.FileHandler",
        "formatter": "detailed",
        "level": "ERROR",
        "filename": "errors.log",
        "encoding": "utf-8",
    },
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The special <code>ext://sys.stdout</code> syntax tells the logging configuration system to resolve an existing Python object instead of treating the value as an ordinary string.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Loggers Connect Names to Handlers</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The <code>loggers</code> section controls named logger namespaces. A service can give <code>app.api</code> and <code>app.worker</code> different handlers or levels while still sharing common formatting. Logger hierarchy still applies, so propagation must be deliberate.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>"loggers": {
    "app.api": {
        "handlers": ["console", "errors"],
        "level": "DEBUG",
        "propagate": False,
    }
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Setting <code>propagate</code> to <code>False</code> prevents a record handled by <code>app.api</code> from also traveling upward to ancestor handlers and appearing twice. Duplicate output is one of the most common signs that logger hierarchy was configured without checking propagation.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=b4Ms4wxJuPg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">[youtube https://www.youtube.com/watch?v=b4Ms4wxJuPg]</div><figcaption class="wp-element-caption"><em>Teclado explains the relationship between Python loggers, handlers, and formatters—the same objects dictConfig connects declaratively.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2>Use disable_existing_loggers Carefully</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>disable_existing_loggers</code> deserves deliberate attention. If set to <code>True</code>, loggers that already exist and are not explicitly covered by the new configuration may be disabled. That can unexpectedly silence messages from libraries. Setting it to <code>False</code> is often safer when an application depends on third-party packages whose loggers should continue to operate.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Load Configuration From JSON</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A dictionary can be created directly in Python, but it can also come from JSON because JSON objects map naturally to Python dictionaries. This allows operations teams to change levels or destinations without editing application code.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>import json
import logging.config
from pathlib import Path

config_path = Path("logging.json")
with config_path.open("r", encoding="utf-8") as handle:
    config = json.load(handle)

logging.config.dictConfig(config)</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Do not treat external configuration as automatically trustworthy. Validate file location, deployment ownership, expected keys, handler destinations, and permissions. A logging configuration can control file paths and importable classes, so configuration changes deserve the same operational discipline as other application settings.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><em>Related social discussion:</em> <a href="https://bsky.app/profile/emilyriederer.bsky.social/post/3kstupk7dj32x">Emily Riederer recommends the mCoding logging tutorial</a> for its modern mental model, best practices, and customization.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Production Example: Console Plus Error File</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>CONFIG = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "standard": {
            "format": "%(asctime)s %(levelname)s %(name)s %(message)s"
        }
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "standard",
            "level": "INFO",
            "stream": "ext://sys.stdout",
        },
        "errors": {
            "class": "logging.FileHandler",
            "formatter": "standard",
            "level": "ERROR",
            "filename": "errors.log",
            "encoding": "utf-8",
        },
    },
    "root": {
        "handlers": ["console", "errors"],
        "level": "DEBUG",
    },
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>With this setup, INFO and WARNING records appear on the console. ERROR and CRITICAL records appear on the console and are also written to <code>errors.log</code>. DEBUG records pass the root logger’s level test but are rejected by both handlers because their handler thresholds are higher. Logger level and handler level are separate gates.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Verification Checklist</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li>Emit one DEBUG record and confirm whether any handler accepts it.</li><li>Emit one INFO record and verify the console output.</li><li>Emit one ERROR record and verify both console and file output.</li><li>Check that the formatter includes the expected timestamp, level, logger name, and message.</li><li>Create a child logger and verify whether propagation causes duplicate output.</li><li>Temporarily change a handler level and confirm that routing changes as expected.</li><li>Restart the program and verify that the configuration is loaded consistently.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Common Failure Modes</h2><!-- /wp:heading -->
<!-- wp:list --><ul><li><strong>Unknown formatter name:</strong> a handler references a formatter key that does not exist.</li><li><strong>Unknown handler name:</strong> a logger references a handler key that does not exist.</li><li><strong>Wrong class path:</strong> the configured handler class cannot be imported.</li><li><strong>Duplicate records:</strong> a child logger handles a record and then propagates it to an ancestor with another handler.</li><li><strong>Silent libraries:</strong> <code>disable_existing_loggers=True</code> disables loggers you expected to keep.</li><li><strong>Missing file permissions:</strong> a file handler cannot open or create its target file.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2>Hands-On Lab</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li>Create a new Python file and import <code>logging</code> and <code>logging.config</code>.</li><li>Define one formatter named <code>standard</code>.</li><li>Create a console handler at INFO.</li><li>Create a file handler at ERROR.</li><li>Configure the root logger at DEBUG.</li><li>Emit DEBUG, INFO, WARNING, ERROR, and CRITICAL records.</li><li>Explain why each record does or does not appear in each destination.</li><li>Move the dictionary into a JSON file and load it with <code>json.load()</code>.</li><li>Create a named logger with <code>propagate=False</code> and confirm that duplicate messages disappear.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Knowledge Check</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li>What module contains <code>dictConfig()</code>?</li><li>What value is normally used for the required <code>version</code> key?</li><li>What is the difference between a formatter and a handler?</li><li>Why can <code>propagate=True</code> produce duplicate messages?</li><li>Why can <code>disable_existing_loggers=True</code> be risky?</li><li>Can JSON be used as a source for a logging configuration dictionary?</li><li>If the root logger is DEBUG but a handler is INFO, will a DEBUG record reach that handler?</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Answer Guide</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li><code>logging.config</code>.</li><li><code>1</code>.</li><li>A formatter defines record layout; a handler decides where records are emitted and can impose its own level.</li><li>The child logger’s handlers may emit the record and then ancestor handlers can emit the same record again.</li><li>It may disable third-party or previously created loggers that are not explicitly named in the configuration.</li><li>Yes. JSON objects can be loaded into Python dictionaries and passed to <code>dictConfig()</code>.</li><li>No. The handler rejects it because DEBUG is below the handler’s INFO threshold.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><code>dictConfig()</code> turns logging setup into a structured configuration graph. Formatters define representation, handlers define destinations, loggers define namespaces and routing, and levels determine which records survive each stage.</strong></p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>References</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Primary references: <a href="https://docs.python.org/3/library/logging.config.html">Python documentation — Logging Configuration</a> and <a href="https://docs.python.org/3/howto/logging-cookbook.html">Python Logging Cookbook</a>.</p><!-- /wp:paragraph -->
<!-- wp:separator --><hr class="wp-block-separator has-alpha-channel-opacity" /><!-- /wp:separator -->
<!-- wp:heading {"level":3} --><h3>BitcoinVersus.Tech</h3><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>Advertisement</strong></p><!-- /wp:paragraph -->
<!-- wp:shortcode -->[tweet https://twitter.com/1BitcoinVersus/status/1937006164555993338]<!-- /wp:shortcode -->
<!-- wp:paragraph --><p><strong><em><sup>BitcoinVersus.Tech Editor's Note:</sup></em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em><sup>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our independent technical education work, please donate Bitcoin here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</sup></em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This lesson is for informational and educational purposes.</em></p><!-- /wp:paragraph -->