---
title: "OSSQL.003: WHERE — Filtering Rows With Conditions, AND, OR, and NOT"
status: published
wordpress_post_id: 23282
wordpress_status: publish
published: "2026-10-10T12:48:40"
modified: "2026-10-10T12:48:40"
live_url: "https://bitcoinversus.tech/2026/10/10/ossql-003-where-filtering-rows-conditions-and-or-not/"
series: "Open Source SQL"
certification: OSSQL
pathway: sql
lesson_number: "003"
lesson_topic: "WHERE"
featured_media_id: 23276
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossql003-where-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 23277
body_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/sql-where-query-wikimedia.png"
youtube:
  - "https://www.youtube.com/watch?v=SJF3uoIfsKY"
  - "https://www.youtube.com/watch?v=DAmH2f8LlB8"
social:
  - "https://www.reddit.com/r/learnSQL/comments/1taymbz/im_learning_sql_and_wrote_a_simple_beginner_guide/"
seo_title: "OSSQL.003: SQL WHERE, AND, OR, NOT and Row Filtering"
seo_description: "Learn SQL WHERE filtering with comparison operators, AND, OR, NOT, parentheses, text and numeric conditions, NULL handling, and beginner examples."
seo_schema_type: article
excerpt: "Learn the SQL WHERE clause: filter rows with comparisons, combine conditions with AND, OR, and NOT, use parentheses safely, and handle NULL correctly."
no_text_boxes: true
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong><code>WHERE</code> filters rows.</strong> Only rows whose condition evaluates as true remain in the result.</li><li><strong>Comparison operators create conditions.</strong> Common operators include <code>=</code>, <code>&lt;&gt;</code>, <code>&gt;</code>, <code>&lt;</code>, <code>&gt;=</code>, and <code>&lt;=</code>.</li><li><strong><code>AND</code>, <code>OR</code>, and <code>NOT</code> combine or reverse conditions.</strong></li><li><strong>Parentheses make mixed conditions safer and clearer.</strong></li><li><strong><code>NULL</code> needs <code>IS NULL</code> or <code>IS NOT NULL</code>, not ordinary equality.</strong></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>In <a href="https://bitcoinversus.tech/2026/10/09/ossql-002-select-choosing-columns-reading-rows-select-star-from/"><strong>OSSQL.002: SELECT</strong></a>, we learned how to choose columns and read rows from a table. The next foundation is controlling <em>which</em> rows are allowed into the result. SQL does that with the <code>WHERE</code> clause.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A useful beginner mental model is simple: <strong><code>SELECT</code> chooses columns; <code>FROM</code> identifies the table; <code>WHERE</code> keeps only rows that satisfy a condition.</strong> The official <a href="https://www.postgresql.org/docs/current/queries-table-expressions.html#QUERIES-WHERE"><strong>PostgreSQL documentation</strong></a> describes the <code>WHERE</code> clause as a filter applied to rows produced by the table expression.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=SJF3uoIfsKY","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=SJF3uoIfsKY
</div><figcaption class="wp-element-caption"><em>Amit Thinks demonstrates the SQL WHERE clause and basic row filtering with conditions.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Basic WHERE Pattern</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT column_name
FROM table_name
WHERE condition;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Suppose a table named <code>miners</code> contains many machines, but you only want the rows for machines that are online.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT model, hashrate_th
FROM miners
WHERE status = 'online';</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The database examines each candidate row. If the expression <code>status = 'online'</code> is true for that row, the row survives the filter. If it is false, the row is excluded.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":23277,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/sql-where-query-wikimedia.png?w=1024" alt="Diagram showing how SELECT, FROM, and WHERE filter rows from a single SQL database table" class="wp-image-23277" /><figcaption class="wp-element-caption"><em>A real SQL teaching illustration showing SELECT, FROM, and WHERE operating on a table. Source: Dew1978 / Wikimedia Commons, CC BY-SA 4.0.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Use = for Equality</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>SQL normally uses a single equals sign for equality tests inside a condition.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT name, city
FROM technicians
WHERE city = 'Tacoma';</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This is different from languages where <code>=</code> performs assignment and <code>==</code> performs comparison. SQL syntax depends on context: inside this <code>WHERE</code> condition, <code>=</code> asks whether two values are equal.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Comparison Operators Filter Numeric and Ordered Values</h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Operator</th><th>Meaning</th><th>Example</th></tr></thead><tbody><tr><td><code>=</code></td><td>Equal</td><td><code>WHERE rack = 4</code></td></tr><tr><td><code>&lt;&gt;</code></td><td>Not equal</td><td><code>WHERE status &lt;&gt; 'offline'</code></td></tr><tr><td><code>&gt;</code></td><td>Greater than</td><td><code>WHERE temperature_c &gt; 80</code></td></tr><tr><td><code>&lt;</code></td><td>Less than</td><td><code>WHERE power_kw &lt; 4</code></td></tr><tr><td><code>&gt;=</code></td><td>Greater than or equal</td><td><code>WHERE efficiency &gt;= 95</code></td></tr><tr><td><code>&lt;=</code></td><td>Less than or equal</td><td><code>WHERE errors &lt;= 2</code></td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>Some database systems also accept <code>!=</code> for “not equal,” but <code>&lt;&gt;</code> is the standard SQL form and is a good portable default for beginners.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Text Values Usually Need Quotes</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Character strings are normally written in single quotes.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT model
FROM miners
WHERE manufacturer = 'Bitmain';</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Numbers generally do not use quotes when the underlying column is numeric:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT model, hashrate_th
FROM miners
WHERE hashrate_th &gt; 200;</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">AND Requires Multiple Conditions to Be True</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use <code>AND</code> when a row must satisfy more than one requirement.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT model, hashrate_th, power_kw
FROM miners
WHERE hashrate_th &gt;= 200
  AND power_kw &lt; 4;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A row appears only if both comparisons are true. If the hashrate condition passes but the power condition fails, the row is filtered out.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">OR Requires at Least One Condition to Be True</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT name, role
FROM staff
WHERE role = 'Technician'
   OR role = 'Engineer';</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This keeps rows matching either role. <code>OR</code> expands a filter because more than one condition can qualify a row.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=DAmH2f8LlB8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=DAmH2f8LlB8
</div><figcaption class="wp-element-caption"><em>Scaler's beginner SQL lesson walks through WHERE filtering and how conditions shape the rows returned by a query.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">NOT Reverses a Condition</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>NOT</code> negates a Boolean condition.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT model, status
FROM miners
WHERE NOT status = 'offline';</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For a simple inequality, <code>status &lt;&gt; 'offline'</code> is often clearer. <code>NOT</code> becomes especially useful later with operators such as <code>IN</code>, <code>BETWEEN</code>, and <code>LIKE</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Use Parentheses When AND and OR Mix</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Mixed Boolean conditions are one of the easiest places for beginners to write a query that runs successfully but returns the wrong rows. Parentheses make your intent explicit.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT name, role, shift
FROM staff
WHERE (role = 'Technician' OR role = 'Engineer')
  AND shift = 'Night';</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This query means: keep night-shift rows, but only when the role is Technician or Engineer. Without parentheses, operator precedence can produce a different interpretation than the one you intended.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/learnSQL/comments/1taymbz/im_learning_sql_and_wrote_a_simple_beginner_guide/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/learnSQL/comments/1taymbz/im_learning_sql_and_wrote_a_simple_beginner_guide/
</div><figcaption class="wp-element-caption"><em>A recent learnSQL discussion focuses on beginner WHERE filtering, common mistakes, NULL handling, and practicing conditions with real examples.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">NULL Is Not Tested With =</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>NULL</code> represents a missing or unknown value, so ordinary equality is not the correct test. Use <code>IS NULL</code> or <code>IS NOT NULL</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT name, phone
FROM technicians
WHERE phone IS NULL;</code></pre>
<!-- /wp:code -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT name, phone
FROM technicians
WHERE phone IS NOT NULL;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <a href="https://www.sqlite.org/lang_select.html#whereclause"><strong>SQLite SELECT documentation</strong></a> also describes <code>WHERE</code> as filtering input rows based on the result of its expression. SQL's three-valued logic around <code>NULL</code> becomes more important as queries grow, so learning the correct test now prevents many confusing results later.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">WHERE Filters Rows, Not Columns</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This distinction connects directly to <a href="https://bitcoinversus.tech/2026/10/09/ossql-002-select-choosing-columns-reading-rows-select-star-from/"><strong>OSSQL.002</strong></a>. <code>SELECT</code> determines which columns appear in the result, while <code>WHERE</code> determines which rows survive.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT name, city
FROM technicians
WHERE certification = 'OSNTC';</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>certification</code> column does not have to appear in the final <code>SELECT</code> list for SQL to use it as a filter. A query can filter on one column while returning different columns.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Start With a Simple Condition and Add One Piece at a Time</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When a filter becomes confusing, reduce it. Run one condition first. Check the result. Add the next condition. This method is usually faster than staring at a long <code>WHERE</code> clause and guessing which part is wrong.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT *
FROM miners
WHERE status = 'online';</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Then add another condition:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>SELECT *
FROM miners
WHERE status = 'online'
  AND temperature_c &lt; 80;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If your editor colors SQL keywords, identifiers, strings, and numbers differently, that is <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>syntax highlighting</strong></a>. The color does not change SQL behavior, but it can make a long condition easier to inspect.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Using <code>==</code> for equality:</strong> ordinary SQL equality uses <code>=</code>.</li><li><strong>Forgetting quotes around text:</strong> string literals normally use single quotes.</li><li><strong>Quoting every number automatically:</strong> numeric columns should normally be compared with numeric literals.</li><li><strong>Mixing AND and OR without parentheses:</strong> the query may be valid but mean something different.</li><li><strong>Writing <code>= NULL</code>:</strong> use <code>IS NULL</code>.</li><li><strong>Assuming WHERE chooses columns:</strong> it filters rows.</li><li><strong>Adding many conditions before testing:</strong> build complex filters incrementally.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Start with the sample table structure from <a href="https://bitcoinversus.tech/2026/10/09/ossql-001-relational-databases-and-tables/"><strong>OSSQL.001: Relational Databases and Tables</strong></a> or create a small table with at least five rows.</li><li>Write a query that filters one text column with <code>=</code>.</li><li>Write a query that filters one numeric column with <code>&gt;</code>.</li><li>Combine two conditions with <code>AND</code>.</li><li>Combine two conditions with <code>OR</code>.</li><li>Write a mixed <code>AND</code>/<code>OR</code> filter and add parentheses.</li><li>Add one row containing <code>NULL</code> and find it with <code>IS NULL</code>.</li><li>Filter on a column that you do not include in the <code>SELECT</code> list.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What does WHERE filter?</strong> Rows.</li><li><strong>Which operator tests ordinary equality?</strong> <code>=</code>.</li><li><strong>What does AND require?</strong> All combined conditions must be true.</li><li><strong>What does OR require?</strong> At least one combined condition must be true.</li><li><strong>Why use parentheses?</strong> To make grouping and intended Boolean logic explicit.</li><li><strong>How do you test for a missing SQL value?</strong> With <code>IS NULL</code> or <code>IS NOT NULL</code>.</li><li><strong>Does a column used in WHERE have to appear in SELECT?</strong> No.</li><li><strong>What is a reliable debugging method for a long filter?</strong> Start with one condition and add conditions one at a time while checking results.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><code>WHERE</code> is SQL's basic row filter.</strong> Write a condition, use comparison operators to test values, combine conditions with <code>AND</code>, <code>OR</code>, or <code>NOT</code>, and use parentheses when logic becomes mixed. Remember that <code>NULL</code> requires its own <code>IS NULL</code> syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next SQL Lesson</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The next SQL lesson will continue filtering with <strong>ORDER BY</strong>, showing how to sort the rows that survive a query.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is a unique 1200×630 photorealistic SQL workspace created specifically for OSSQL.003 and is not reused inside the lesson. The separate body image is a real SQL teaching image from Wikimedia Commons.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->