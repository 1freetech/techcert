<!-- wp:paragraph -->
<p><strong><code>TimedRotatingFileHandler</code> rotates Python log files according to time instead of file size.</strong> It belongs to <code>logging.handlers</code> and is useful when an application should start a new log every hour, day, midnight, or selected weekday while retaining only a chosen number of older files. This lesson continues directly from <a href="https://bitcoinversus.tech/2026/10/07/ospython-028-python-logging-basics/"><strong>OSPython.028: Python Logging Basics</strong></a>, <a href="https://bitcoinversus.tech/2026/10/07/ospython-029-logging-to-files-with-filehandler/"><strong>OSPython.029: Logging to Files with FileHandler</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/07/ospython-030-rotating-log-files-rotatingfilehandler/"><strong>OSPython.030: Rotating Log Files with RotatingFileHandler</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=9L77QExPmI0","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=9L77QExPmI0
</div><figcaption class="wp-element-caption"><em>mCoding — Modern Python logging, including the logger/handler architecture that TimedRotatingFileHandler plugs into.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Time-Based Rotation vs. Size-Based Rotation</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><a href="https://docs.python.org/3/library/logging.handlers.html"><strong>Python’s logging.handlers documentation</strong></a> separates the two rotating handlers clearly: <code>RotatingFileHandler</code> rolls over when a file approaches <code>maxBytes</code>, while <code>TimedRotatingFileHandler</code> rolls over according to a time schedule. Use size-based rotation when disk-file size is the main limit; use time-based rotation when operators want predictable periods such as one log per day or one log per hour.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=wrpu-Qr_Yvk","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=wrpu-Qr_Yvk
</div><figcaption class="wp-element-caption"><em>Learning Software — Python logging and log rotation, including a dedicated TimedRotatingFileHandler section.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":21987,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-031-python-logging-code.jpg?w=1024" alt="Realistic code editor showing software code, representing Python logging configuration and timed log rotation." class="wp-image-21987" /><figcaption class="wp-element-caption"><em>Time-based rotation is configured in code through Python’s standard logging handlers. Photo via Unsplash.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Build a Daily TimedRotatingFileHandler</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The handler needs a filename plus its rotation schedule. In this example, <code>when="midnight"</code> requests daily rollover at midnight, <code>interval=1</code> means every one interval, <code>backupCount=7</code> keeps at most seven older rotated files, and <code>encoding="utf-8"</code> gives the file an explicit text encoding. The logger still needs a level, formatter, and attached handler exactly like the earlier logging lessons.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>import logging
from logging.handlers import TimedRotatingFileHandler

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

handler = TimedRotatingFileHandler(
    "app.log",
    when="midnight",
    interval=1,
    backupCount=7,
    encoding="utf-8",
)

formatter = logging.Formatter(
    "%(asctime)s %(levelname)s %(name)s: %(message)s"
)
handler.setFormatter(formatter)
logger.addHandler(handler)

logger.info("Application started")</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=jxmzY9soFXg","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=jxmzY9soFXg
</div><figcaption class="wp-element-caption"><em>Corey Schafer — Advanced Python logging with loggers, handlers, and formatters, the same structure used in the timed-rotation example.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Understand when, interval, backupCount, utc, and atTime</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>when</code> value can represent seconds (<code>S</code>), minutes (<code>M</code>), hours (<code>H</code>), days (<code>D</code>), weekdays (<code>W0</code> through <code>W6</code>), or <code>midnight</code>. Python calculates rollover from <code>when × interval</code>; weekday rotation ignores the numeric interval for choosing the weekday. By default times are local, while <code>utc=True</code> switches rollover calculations to UTC. For midnight or weekday schedules, <code>atTime</code> can supply a specific <code>datetime.time</code>. With nonzero <code>backupCount</code>, Python deletes the oldest rotated files when the retained count is exceeded.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=urrfJgHwIJA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=urrfJgHwIJA
</div><figcaption class="wp-element-caption"><em>Tech With Tim — Python logging levels, files, custom loggers, handlers, and formatters for understanding how rotation settings fit into a real logging configuration.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Rollover Happens When a Log Record Is Emitted</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A critical troubleshooting detail is that <code>TimedRotatingFileHandler</code> does not wake up on its own like a separate scheduler. Python’s documentation states that subsequent rollover calculation occurs when rollover happens, and rollover itself happens only while the handler is emitting output. A program configured for one-minute rotation but producing messages only every five minutes can therefore show gaps between rotated filenames. This also explains why a short script launched periodically by <a href="https://bitcoinversus.tech/2026/10/07/linux-systemd-timers-safer-inspectable-alternative-cron/"><strong>systemd timers or cron-style automation</strong></a> may behave differently from a continuously running service.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=OyKYVnNeFSE","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=OyKYVnNeFSE
</div><figcaption class="wp-element-caption"><em>Otávio Miranda — Python logging architecture from basic to advanced, including handlers and the LogRecord path that ultimately triggers handler output.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:embed {"url":"https://www.reddit.com/r/learnpython/comments/q00tbs/logging_and_file_rotation/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/learnpython/comments/q00tbs/logging_and_file_rotation/
</div><figcaption class="wp-element-caption"><em>A directly relevant learnpython discussion about TimedRotatingFileHandler behaving differently in long-running scripts versus scripts launched periodically by cron.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Basic Troubleshooting</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If rotation does not occur, first confirm that the program is still running and actually emits a log record after the scheduled rollover time. Then check write/rename permissions, verify that only the intended process owns the file, inspect <code>when</code>, <code>interval</code>, <code>utc</code>, and <code>atTime</code>, and remember that changing the configured interval can leave older files behind because retention deletion depends on the interval and sortable date/time suffixes. Keep custom <code>namer</code> functions simple and preserve sortable time information if <code>backupCount</code> should reliably remove the oldest files.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=9fqGtdRJWMM","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=9fqGtdRJWMM
</div><figcaption class="wp-element-caption"><em>Ferds the NetDev — Practical Python logging and rotating-file-handler behavior for troubleshooting rollover and retention.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Exercise</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a logger with <code>TimedRotatingFileHandler</code>.</li><li>Set <code>when="S"</code>, <code>interval=10</code>, and <code>backupCount=3</code> for a quick lab.</li><li>Write one INFO message every two seconds for about one minute.</li><li>Inspect the directory and identify the active log plus the timestamped backups.</li><li>Change <code>utc=True</code> and repeat the test.</li><li>Return the handler to a practical production interval after the lab.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What makes TimedRotatingFileHandler different from RotatingFileHandler?</strong> It rotates according to time rather than a maximum file size.</li><li><strong>What does <code>when="midnight"</code> mean?</strong> The handler schedules rollover around midnight, or around <code>atTime</code> when that option is supplied.</li><li><strong>What does <code>backupCount=7</code> do?</strong> It keeps at most seven older rotated files under the handler’s normal retention rules.</li><li><strong>What does <code>utc=True</code> change?</strong> Rollover calculations use UTC rather than local time.</li><li><strong>Does the handler rotate if the application produces no new log records?</strong> Not at the scheduled instant by itself; rollover is checked when output is emitted.</li><li><strong>Why should timestamp suffixes remain sortable?</strong> TimedRotatingFileHandler uses the dated filenames when deciding which old backups to delete.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Prior Python Lessons</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/07/ospython-028-python-logging-basics/"><strong>OSPython.028: Python Logging Basics</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/07/ospython-029-logging-to-files-with-filehandler/"><strong>OSPython.029: Logging to Files with FileHandler</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/07/ospython-030-rotating-log-files-rotatingfilehandler/"><strong>OSPython.030: Rotating Log Files with RotatingFileHandler</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Featured image: realistic code photograph via Unsplash, cropped to exactly 1200×630. Body image: separate realistic code-editor photograph via Unsplash. Primary technical reference: current Python logging.handlers documentation. Every YouTube video in this lesson is distinct; the Reddit embed is directly about TimedRotatingFileHandler time-based rollover behavior.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Support and donation options are available through BitcoinVersus.Tech.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech is not a financial advisor. Content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->