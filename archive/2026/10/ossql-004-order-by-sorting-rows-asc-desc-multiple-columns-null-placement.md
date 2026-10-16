---
title: "OSSQL.004: ORDER BY — Sorting Rows With ASC, DESC, Multiple Columns, and NULL Placement"
status: published
wordpress_post_id: 25816
wordpress_status: publish
published: "2026-10-15T22:20:20"
modified: "2026-10-15T22:20:20"
live_url: "https://bitcoinversus.tech/2026/10/15/ossql-004-order-by-sorting-rows-asc-desc-multiple-columns-null-placement/"
series: "Open Source SQL"
certification: OSSQL
pathway: sql
lesson_number: "004"
lesson_topic: "ORDER BY"
featured_media_id: 25815
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossql-004-order-by-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
youtube:
  - "https://www.youtube.com/watch?v=uUO-ynRJKo0"
  - "https://www.youtube.com/watch?v=xqrwPJZpw68"
  - "https://www.youtube.com/watch?v=iYqT0BrZ_9Y"
  - "https://www.youtube.com/watch?v=7dJfYhGEsc8"
seo_title: "OSSQL.004: SQL ORDER BY, ASC, DESC and Multiple Columns"
seo_description: "Learn SQL ORDER BY with ASC, DESC, multiple sort columns, aliases, NULL placement, tie-breaking, and practical troubleshooting examples."
seo_schema_type: article
excerpt: "Learn SQL ORDER BY with ASC, DESC, multi-column sorting, aliases, NULL placement, stable tie-breaking, and beginner troubleshooting."
no_text_boxes: true
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong><code>ORDER BY</code> controls the order of rows returned by a query.</strong></li><li><strong><code>ASC</code> sorts ascending and is the default.</strong></li><li><strong><code>DESC</code> sorts descending.</strong></li><li><strong>Multiple sort columns provide tie-breakers.</strong></li><li><strong>Without <code>ORDER BY</code>, row order is not guaranteed.</strong></li><li><strong><code>NULL</code> placement can differ by database system, so explicit control is safer when it matters.</strong></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>In <a href="https://bitcoinversus.tech/2026/10/10/ossql-003-where-filtering-rows-conditions-and-or-not/"><strong>OSSQL.003: WHERE</strong></a>, we learned how to decide which rows survive a query. The next step is deciding what order those surviving rows should appear in. SQL uses <code>ORDER BY</code> for that job.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The official <a href="https://www.postgresql.org/docs/current/queries-order.html"><strong>PostgreSQL 18 documentation</strong></a> is explicit: if sorting is not requested, returned row order is unspecified and must not be relied on. <code>ORDER BY</code> is what makes a particular output ordering intentional.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=uUO-ynRJKo0","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=uUO-ynRJKo0
</div><figcaption class="wp-element-caption"><em>W3Schools introduces SQL ORDER BY, ascending and descending sorting, and multiple-column ordering.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Write a basic <code>ORDER BY</code> clause.</li><li>Explain the difference between <code>ASC</code> and <code>DESC</code>.</li><li>Sort by more than one column.</li><li>Use a second sort column as a tie-breaker.</li><li>Sort by a selected alias or expression where supported.</li><li>Recognize why results without <code>ORDER BY</code> should not be assumed to have a stable order.</li><li>Handle <code>NULL</code> placement deliberately when the database supports explicit <code>NULLS FIRST</code> or <code>NULLS LAST</code>.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Basic ORDER BY Pattern</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT column1, column2
FROM table_name
ORDER BY column1;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Suppose a table named <code>miners</code> contains model names and hashrates. This query returns the rows from lowest to highest hashrate because ascending order is the default:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT model, hashrate_th
FROM miners
ORDER BY hashrate_th;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You can write the same intent explicitly with <code>ASC</code>:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT model, hashrate_th
FROM miners
ORDER BY hashrate_th ASC;</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=xqrwPJZpw68","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=xqrwPJZpw68
</div><figcaption class="wp-element-caption"><em>This PostgreSQL beginner tutorial demonstrates ORDER BY with SELECT, ascending and descending sorting, and multiple columns.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">ASC Means Ascending</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>ASC</code> places smaller values before larger values. For numbers, that usually means low to high. For text, it follows the database's comparison and collation rules. For dates, earlier values normally come before later values.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT name, temperature_c
FROM racks
ORDER BY temperature_c ASC;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This is useful when you want to see the coolest racks first, the lowest prices first, the earliest timestamps first, or names in ascending text order.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">DESC Means Descending</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>DESC</code> reverses the direction. Larger values come before smaller ones, later dates can appear before earlier dates, and high measurements can be placed at the top of the result.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT model, hashrate_th
FROM miners
ORDER BY hashrate_th DESC;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A common operational query is to sort hottest equipment first so the most urgent rows appear at the top:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT rack_id, temperature_c
FROM racks
ORDER BY temperature_c DESC;</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">ORDER BY Works After Filtering</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>WHERE</code> and <code>ORDER BY</code> solve different problems. <code>WHERE</code> decides which rows remain; <code>ORDER BY</code> arranges the rows that remain.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT model, hashrate_th, status
FROM miners
WHERE status = 'online'
ORDER BY hashrate_th DESC;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This query first limits the result to online miners and then places the highest-hashrate machines first. That progression directly combines the filtering skills from OSSQL.003 with today's sorting clause.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=iYqT0BrZ_9Y","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=iYqT0BrZ_9Y
</div><figcaption class="wp-element-caption"><em>This SQL lesson demonstrates sorting one column, multiple columns, and combining ORDER BY with other query operations.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Sorting by Multiple Columns</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>You can list more than one sort expression. SQL sorts by the first expression, then uses the next expression to resolve ties within the first one.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT site, rack, temperature_c
FROM rack_readings
ORDER BY site ASC, rack ASC;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Rows are grouped into ascending site order. Within each site, rows are then ordered by rack. This gives the result a predictable hierarchy.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT manufacturer, model, hashrate_th
FROM miners
ORDER BY manufacturer ASC, hashrate_th DESC;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here, manufacturers are sorted ascending. Within each manufacturer, higher-hashrate models appear first. PostgreSQL documents this exact principle: later sort expressions break ties created by earlier expressions.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Tie-Breakers Matter</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If two rows have equal values for every expression in the <code>ORDER BY</code> list, their relative order can still be unspecified. Add a unique or nearly unique final sort key when repeatable ordering matters.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT miner_id, model, temperature_c
FROM miners
ORDER BY temperature_c DESC, miner_id ASC;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If two miners have the same temperature, <code>miner_id</code> becomes the tie-breaker. This is especially useful for reports, pagination, exports, dashboards, and automated tests where changing row order can create confusing results.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Sorting by an Alias</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Many SQL systems allow an output alias to be referenced in <code>ORDER BY</code>. PostgreSQL supports this for a standalone output column label.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT model,
       hashrate_th / power_kw AS th_per_kw
FROM miners
ORDER BY th_per_kw DESC;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This query calculates a result column named <code>th_per_kw</code> and then sorts by that calculated output. Alias rules can vary around more complex expressions, so use your database's documentation when the expression becomes advanced.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">NULL Placement Needs Attention</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>NULL</code> represents a missing or unknown value, and databases do not all treat its default sort position the same way. PostgreSQL supports explicit <code>NULLS FIRST</code> and <code>NULLS LAST</code> modifiers. Current SQLite also supports those modifiers, but its default NULL behavior differs from PostgreSQL.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT name, last_service_date
FROM equipment
ORDER BY last_service_date ASC NULLS LAST;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This is clearer than relying on a database-specific default when the location of missing values matters to the result.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=7dJfYhGEsc8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=7dJfYhGEsc8
</div><figcaption class="wp-element-caption"><em>This SQL ORDER BY walkthrough covers ascending, descending, multiple-column sorting, and sorting text, numeric, and date values.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Do Not Trust Natural Row Order</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A table may appear to return rows in insertion order during one test, then return them differently after an index change, database update, query-plan change, maintenance operation, or different execution path. PostgreSQL and <a href="https://www.sqlite.org/lang_select.html"><strong>SQLite</strong></a> both document that row order is undefined when no <code>ORDER BY</code> controls it.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The technician-level rule is simple: <strong>if row order matters to the meaning of the result, write the sort explicitly.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">ORDER BY and Performance</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sorting can require the database to compare many rows and build an ordered result. PostgreSQL notes that a matching B-tree index may sometimes provide rows in the requested order without a separate sort step. Whether an index or explicit sort is faster depends on the query and how much data must be read.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a beginner, the priority is correctness. First write the query so it returns the intended rows in the intended order. Later lessons can examine indexing and query plans in more depth.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Assuming rows already have a permanent order:</strong> without <code>ORDER BY</code>, do not rely on it.</li><li><strong>Forgetting that ASC is the default:</strong> <code>ORDER BY temperature_c</code> means ascending unless another direction is specified.</li><li><strong>Applying DESC to the wrong column:</strong> each sort expression controls its own direction.</li><li><strong>Using only one sort key when ties matter:</strong> add a second or third key when stable ordering is important.</li><li><strong>Assuming NULL sorts identically everywhere:</strong> check the database or specify placement explicitly.</li><li><strong>Confusing filtering and sorting:</strong> <code>WHERE</code> removes rows; <code>ORDER BY</code> rearranges rows.</li><li><strong>Using column positions carelessly:</strong> some systems allow <code>ORDER BY 1</code>, but explicit column names are usually easier to maintain.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hands-On Exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use the same small practice database from <a href="https://bitcoinversus.tech/2026/10/09/ossql-001-relational-databases-and-tables/"><strong>OSSQL.001: Relational Databases and Tables</strong></a> and the column-selection skills from <a href="https://bitcoinversus.tech/2026/10/09/ossql-002-select-choosing-columns-reading-rows-select-star-from/"><strong>OSSQL.002: SELECT</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Return all rows sorted by one numeric column ascending.</li><li>Run the same query descending.</li><li>Sort a text column alphabetically.</li><li>Sort a date column newest first.</li><li>Filter the rows with <code>WHERE</code>, then sort the remaining rows.</li><li>Sort by two columns and explain which one is the tie-breaker.</li><li>Add a unique ID as the final tie-breaker.</li><li>If your database supports it, sort a nullable column with explicit <code>NULLS LAST</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What clause controls the order of returned rows?</li><li>What sort direction is used when neither ASC nor DESC is written?</li><li>What does DESC do?</li><li>How are multiple ORDER BY expressions used?</li><li>Why can a unique final sort key be useful?</li><li>Does WHERE sort rows?</li><li>Can a query's apparent natural order be relied on without ORDER BY?</li><li>Why might NULLS FIRST or NULLS LAST be preferable to accepting a default?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><code>ORDER BY</code>.</li><li>Ascending order, <code>ASC</code>.</li><li>It sorts that expression in descending order.</li><li>The first expression sorts the main groups; later expressions resolve ties from earlier ones.</li><li>It makes equal-value rows resolve into a repeatable order.</li><li>No. <code>WHERE</code> filters rows.</li><li>No. Without <code>ORDER BY</code>, row order is not guaranteed.</li><li>Because default NULL placement differs across database systems and explicit intent is easier to understand and maintain.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><code>ORDER BY</code> is SQL's row-sorting clause.</strong> Use <code>ASC</code> for low-to-high or earlier-to-later order, <code>DESC</code> for the reverse, and add more sort expressions when you need tie-breakers. If the order matters, do not trust the database to choose it for you.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next SQL Lesson</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The next SQL lesson will introduce <strong>LIMIT and OFFSET</strong>, showing how to return only part of an ordered result and why deterministic sorting becomes especially important for pagination.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.postgresql.org/docs/current/queries-order.html"><strong>PostgreSQL 18 — Sorting Rows (ORDER BY)</strong></a></li><li><a href="https://www.sqlite.org/lang_select.html"><strong>SQLite — SELECT and ORDER BY</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech provides technical education and analysis for informational purposes only.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->