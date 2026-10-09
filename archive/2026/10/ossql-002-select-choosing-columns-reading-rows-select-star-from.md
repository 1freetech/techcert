---
title: "OSSQL.002: SELECT — Choosing Columns, Reading Rows, SELECT *, and FROM"
status: published
wordpress_post_id: 22809
live_url: "https://bitcoinversus.tech/2026/10/09/ossql-002-select-choosing-columns-reading-rows-select-star-from/"
slug: "ossql-002-select-choosing-columns-reading-rows-select-star-from"
featured_media_id: 22807
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossql-002-select-cover.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 22808
body_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossql-002-select-body.jpg"
body_media_dimensions: "1200x675"
youtube_url: "https://www.youtube.com/watch?v=xfHqi11gjyg"
youtube_video_id: "xfHqi11gjyg"
youtube_rendered_iframe: true
social_url: "https://www.reddit.com/r/SQL/comments/xq89ip/"
no_text_boxes: true
classic_content: false
seo_title: "OSSQL.002: SELECT — Choosing Columns, SELECT * and FROM"
seo_description: "Learn SQL SELECT from the beginning: result sets, select lists, choosing columns, SELECT *, FROM, expressions, duplicate values, and basic query-reading habits."
excerpt: "OSSQL.002 teaches the SQL SELECT statement: result sets, select lists, choosing columns, SELECT *, FROM, expressions, duplicate values, row-order assumptions, and basic query reading."
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><code>SELECT</code> is the SQL statement used to ask a database for data.</strong> A basic query says which values you want returned and, usually, which table those values should come from. The database evaluates the query and gives you a result set containing zero or more rows.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/09/ossql-001-relational-databases-and-tables/"><strong>OSSQL.001: Relational Databases and Tables</strong></a>. That lesson introduced rows, columns, tables, keys, and relational structure. OSSQL.002 now focuses on retrieving data with <code>SELECT</code>. Filtering with <code>WHERE</code> is intentionally left for the next SQL lesson.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What a <code>SELECT</code> statement returns.</li><li>How the select list controls which columns appear in the result.</li><li>How <code>FROM</code> identifies the table or source being queried.</li><li>How to retrieve one column or several columns.</li><li>What <code>SELECT *</code> means.</li><li>Why explicitly naming columns is often clearer than using <code>*</code>.</li><li>How <code>SELECT</code> can evaluate expressions as well as stored columns.</li><li>Why returned row order should not be assumed without an ordering clause.</li><li>Why a normal <code>SELECT</code> reads data rather than changing stored rows.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">SELECT Produces A Result Set</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The SQLite documentation describes <code>SELECT</code> as the statement used to query a database and notes that its result contains zero or more rows with a fixed number of result columns. PostgreSQL similarly defines <code>SELECT</code> as a command that retrieves rows from tables or views.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Think of a result set as a temporary answer produced by the query. If a table named <code>customers</code> contains columns such as <code>customer_id</code>, <code>name</code>, <code>city</code>, and <code>email</code>, a query can choose only the parts needed for the current task.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Select List Chooses Output Columns</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The expressions written between <code>SELECT</code> and <code>FROM</code> form the <strong>select list</strong>. In a simple query such as <code>SELECT name FROM customers;</code>, the result has one output column: <code>name</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>To return more than one column, separate them with commas. For example, <code>SELECT name, city FROM customers;</code> asks for two output columns for each returned row.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The order of expressions in the select list also controls the order of the output columns. <code>SELECT city, name FROM customers;</code> produces a result with <code>city</code> before <code>name</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=xfHqi11gjyg","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=xfHqi11gjyg
</div><figcaption class="wp-element-caption"><em>Giraffe Academy — “Basic Queries | SQL | Tutorial 10.” This focused lesson demonstrates <code>SELECT *</code>, selecting named columns, and the basic <code>SELECT ... FROM ...</code> query shape.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22808,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossql-002-select-body.jpg" alt="Four developers collaborating around a laptop in a cozy modern technology workspace." class="wp-image-22808" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech lesson image for OSSQL.002.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">FROM Identifies The Data Source</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In a table query, <code>FROM</code> identifies the source relation. The query <code>SELECT name FROM customers;</code> can be read as: return the <code>name</code> column from the table named <code>customers</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This distinction matters because the database needs to know both <strong>what</strong> values to produce and <strong>where</strong> those values come from. The select list answers the first question; the <code>FROM</code> clause answers the second.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Later lessons will expand <code>FROM</code> to cover joins, aliases, subqueries, and other sources. For now, use one table and make the relationship between the requested columns and their table explicit.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/SQL/comments/xq89ip/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/SQL/comments/xq89ip/
</div><figcaption class="wp-element-caption"><em>r/SQL discussion: developers discuss the practical relationship between writing the <code>SELECT</code> list and identifying the source table with <code>FROM</code>.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What SELECT * Means</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The asterisk is a wildcard in the select list. <code>SELECT * FROM customers;</code> requests all columns made available by that table source.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is convenient when exploring a small table or learning its shape. It can also be useful during quick troubleshooting when you genuinely need every column.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For application code and long-lived queries, explicitly naming the columns you need is often clearer. A query such as <code>SELECT customer_id, name, city FROM customers;</code> documents its intended output and does not automatically begin returning newly added table columns later. Requesting fewer columns can also reduce unnecessary data transfer when a table is wide.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">SELECT Can Return Expressions</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The select list is not limited to stored column names. SQL can evaluate expressions. For example, <code>SELECT 2 + 2;</code> returns a calculated value even without reading a table.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>When a table is present, expressions can be based on column values. A later lesson will cover aliases and more useful expression patterns. The important idea for now is that <code>SELECT</code> describes the values that should appear in the query result, whether those values come directly from columns or are computed.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">SELECT Normally Reads Instead Of Modifying</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A normal introductory <code>SELECT</code> is a read operation. SQLite's language reference explicitly notes that a <code>SELECT</code> statement does not make changes to the database. This makes <code>SELECT</code> the natural first SQL statement to practice after learning table structure.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>SQL also has statements such as <code>INSERT</code>, <code>UPDATE</code>, and <code>DELETE</code> that change stored data. Those are different operations and deserve their own lessons and safety habits.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Returned Rows Can Include Duplicates</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If several source rows contain the same selected value, a normal <code>SELECT</code> can return that value more than once. Suppose five customer rows contain the city <code>Seattle</code>. A simple <code>SELECT city FROM customers;</code> can therefore contain several rows whose visible result is the same city name.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not assume that querying a single column automatically produces a unique list. SQL has tools for duplicate handling, but those are separate concepts from the basic <code>SELECT</code> operation introduced here.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Do Not Assume Row Order</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A result can look consistently ordered during testing and still have no guaranteed order. PostgreSQL and SQLite both document that explicit ordering is a separate part of query behavior. Without an ordering clause, the database may return rows in whatever sequence its execution plan produces.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For this lesson, simply remember: <strong>retrieving rows and ordering rows are different jobs.</strong> A later SQL lesson will cover <code>ORDER BY</code> directly.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read A Basic SELECT From Left To Right</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The query <code>SELECT customer_id, name FROM customers;</code> can be read in plain language as: “return the customer ID and name columns from the customers table.”</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The SQL engine's internal logical processing is more nuanced than the written left-to-right order, but beginners should first become fluent in recognizing the visible statement structure: <code>SELECT</code>, output expressions, <code>FROM</code>, and the source table.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Forgetting the table source:</strong> if a selected column belongs to a table, the query normally needs the appropriate <code>FROM</code> source.</li><li><strong>Misspelling a column name:</strong> verify the table schema instead of guessing.</li><li><strong>Requesting every column automatically:</strong> use <code>*</code> when it genuinely fits, not as a permanent substitute for understanding the schema.</li><li><strong>Expecting SELECT to remove duplicates:</strong> ordinary selection can preserve repeated values.</li><li><strong>Assuming row order:</strong> visible order during one run is not a guarantee.</li><li><strong>Mixing filtering into this concept too early:</strong> first become comfortable selecting columns and reading results; <code>WHERE</code> comes next.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Use the table you created or practiced with in OSSQL.001.</li><li>Run a query that selects one named column.</li><li>Run a query that selects two named columns.</li><li>Reverse those two column names and observe the output-column order.</li><li>Run <code>SELECT *</code> against the same table and compare the result.</li><li>Write a query that selects only the columns you would actually need for a simple contact list.</li><li>Run <code>SELECT 2 + 2;</code> and observe that <code>SELECT</code> can produce an expression result without reading a stored column.</li><li>Look for repeated values in one selected column and confirm that duplicates can appear.</li><li>Run the same query more than once, but do not treat the visible row sequence as guaranteed ordering.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is <code>SELECT</code> used for?</strong> Retrieving or computing values that form a query result.</li><li><strong>What is the select list?</strong> The expressions between <code>SELECT</code> and <code>FROM</code> that define the output columns.</li><li><strong>What does <code>FROM</code> identify?</strong> The table or other data source used by the query.</li><li><strong>What does <code>SELECT *</code> request?</strong> All columns available from the source in that select context.</li><li><strong>Why explicitly name columns?</strong> It makes the intended result clearer and avoids returning unnecessary or newly added columns automatically.</li><li><strong>Can SELECT compute values?</strong> Yes. The select list can contain expressions as well as stored columns.</li><li><strong>Does a normal SELECT modify stored rows?</strong> No; introductory SELECT queries read or compute results.</li><li><strong>Does SELECT automatically remove duplicate values?</strong> No.</li><li><strong>Can you rely on row order without an ordering clause?</strong> No.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.postgresql.org/docs/current/sql-select.html"><strong>PostgreSQL Documentation — SELECT</strong></a></li><li><a href="https://www.postgresql.org/docs/current/queries.html"><strong>PostgreSQL Documentation — Queries</strong></a></li><li><a href="https://www.sqlite.org/lang_select.html"><strong>SQLite Documentation — SELECT</strong></a></li><li><a href="https://www.giraffeacademy.com/databases/sql/basic-queries/"><strong>Giraffe Academy — SQL Basic Queries</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><code>SELECT</code> asks a database to return values.</strong> Name the columns or expressions you want after <code>SELECT</code>, identify the source with <code>FROM</code>, use <code>*</code> only when retrieving every column genuinely makes sense, and never confuse the visible order of returned rows with guaranteed ordering.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The next SQL curriculum lesson is <strong>OSSQL.003: WHERE</strong>, which will introduce filtering rows by conditions.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is original artwork created specifically for OSSQL.002 and is not reused in the body. The lesson uses a separate original body image and native responsive Gutenberg media embeds.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->