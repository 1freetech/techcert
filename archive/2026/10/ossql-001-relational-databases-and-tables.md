---
title: "OSSQL.001: Relational Databases and Tables"
status: published
wordpress_post_id: 22722
published: "2026-10-09T13:00:49"
modified: "2026-10-09T13:02:40"
live_url: "https://bitcoinversus.tech/2026/10/09/ossql-001-relational-databases-and-tables/"
series: "Open Source SQL"
subject: sql
lesson_number: "001"
featured_media_id: 22716
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossql-001-feature-1200x630-1.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22717
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossql-001-body-1200x675-1.jpg"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=vHYeChEf2lA"
youtube_2: "https://www.youtube.com/watch?v=HXV3zeQKqGY"
youtube_3: "https://www.youtube.com/watch?v=OqjJjpjDRLc"
social_1: "https://twitter.com/tursodatabase/status/2106054567125532976"
seo_title: "OSSQL.001: Relational Databases and Tables"
seo_description: "Learn relational databases and SQL tables from the ground up: databases, rows, columns, data types, table structure, CREATE TABLE, examples, exercises, and answers."
no_text_boxes: true
youtube_minimum_met: 3
archive_format: "final Gutenberg source"
---

<!-- wp:paragraph -->
<p>A <strong>relational database</strong> stores structured information in named tables. Each table has columns that describe what kind of information is stored and rows that represent individual records. SQL is the language commonly used to define, read, change, and organize that data.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This first SQL lesson stays deliberately narrow. Before learning <code>SELECT</code>, filtering, joins, indexes, or transactions, you need a clean mental model of a <strong>database</strong>, a <strong>table</strong>, a <strong>row</strong>, a <strong>column</strong>, and a <strong>data type</strong>. Those five ideas are the foundation for everything that follows in the SQL track.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">1. What A Relational Database Is</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A database is an organized collection of data managed by software. A <strong>relational database management system</strong>, or RDBMS, organizes much of that data as relations. In everyday SQL work, a relation is usually represented as a table. PostgreSQL describes itself as a relational database management system and explains that a table is a named collection of rows with a fixed set of named columns.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This differs from a plain text file because the database engine understands the structure of the data. It can enforce data types, apply constraints, coordinate many users, recover transactions, build indexes, and answer queries without requiring an application to manually scan and parse every record.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Relational databases remain central to modern software even as applications become more distributed. BitcoinVersus.Tech recently covered <a href="https://bitcoinversus.tech/2026/10/04/coding-supabase-acquires-turso-to-give-every-ai-agent-its-own-database/">Supabase and Turso building database infrastructure for AI-created applications</a>. The scale and deployment model may change, but the basic idea of storing structured records in database tables remains important.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vHYeChEf2lA","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vHYeChEf2lA
</div><figcaption class="wp-element-caption"><em>Harvard CS50 SQL Lecture 0 begins with tables, spreadsheets, databases, SQLite, and the transition into SQL queries.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">2. Tables, Rows, And Columns</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A table has a name and a defined set of columns. Think of a table called <code>miners</code>. Each row could represent one mining machine. The columns could describe the machine's identifier, model, hashrate, power draw, and current status.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>miners

id | model       | hashrate_th | power_w | status
1  | S21         | 200         | 3500    | online
2  | S19j Pro    | 104         | 3068    | repair
3  | Avalon A11  | 78          | 3420    | online</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <strong>columns</strong> describe attributes shared by every row in that table. The <strong>rows</strong> contain the actual records. PostgreSQL's current table documentation notes that a table's columns have defined names and types while the number of rows can change as data is added or removed.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A table is not the same thing as a spreadsheet even though both can look like grids. A spreadsheet is primarily a document for interactive calculation and presentation. A relational table is part of a database system that applies a formal schema and can be queried, constrained, joined, indexed, and changed transactionally.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22717,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossql-001-body-1200x675-1.jpg?w=1024" alt="A student works at a database programming workstation with code and structured data visible on multiple screens." class="wp-image-22717" /><figcaption class="wp-element-caption"><em>Database work becomes easier when you can clearly separate the structure of a table from the individual records stored inside it. BitcoinVersus.Tech original editorial image.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">3. Columns Have Data Types</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Every column has a data type. The type tells the database what kind of value belongs in that column and what operations make sense for it. Common types include integers, decimal numbers, text, dates, timestamps, and Boolean values.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>id            INTEGER
model         TEXT
hashrate_th   NUMERIC
power_w       INTEGER
online        BOOLEAN</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Data types matter because structured data should carry meaning. A power value stored as an integer can participate in arithmetic. A date stored as a date can be sorted and compared as a date. A free-form text field is flexible, but that flexibility also means the database can enforce less about its contents.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is one reason database tables differ from loosely structured formats. <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-json-javascript-object-notation-structured-data/">JSON can also represent structured data</a>, but a relational table usually begins with a declared schema that tells the database exactly which columns exist and what types they accept.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">4. A Schema Describes Structure</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The word <strong>schema</strong> is used in several related ways, but at the beginner level it is useful to think of schema as the defined structure of the database: table names, column names, data types, and later constraints and relationships.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A schema gives the database a contract. If a column is intended to contain whole-number rack counts, the design should say so. If a field is meant to store a timestamp, the database should know that it is a timestamp rather than arbitrary text.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Good schema design does not mean predicting every future requirement. It means making today's data model explicit enough that programs and people can reason about it. Later lessons will add primary keys, foreign keys, constraints, normalization, indexes, and transactions to this foundation.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">5. Create A First Table</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>SQL uses <code>CREATE TABLE</code> to define a new table. The statement names the table, then lists its columns and their types inside parentheses.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>CREATE TABLE miners (
    id INTEGER,
    model TEXT,
    hashrate_th NUMERIC,
    power_w INTEGER,
    online BOOLEAN
);</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Read this statement from the outside inward. <code>CREATE TABLE miners</code> says to create a table named <code>miners</code>. Inside the parentheses, each line defines one column. The comma separates one column definition from the next. The semicolon ends the SQL statement.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This table is intentionally incomplete from a production-design perspective. It has no primary key constraint, no required fields, no validation rules, and no relationship to any other table. Those are later concepts. The goal here is simply to understand that SQL can define the shape of stored data.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The official <a href="https://www.postgresql.org/docs/current/ddl-basics.html">PostgreSQL table-basics documentation</a> uses the same pattern: a table name followed by column names and data types. PostgreSQL's tutorial also introduces relational concepts before moving into table creation, rows, queries, joins, and later features.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=HXV3zeQKqGY","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=HXV3zeQKqGY
</div><figcaption class="wp-element-caption"><em>freeCodeCamp's beginner SQL course covers databases, tables and keys before moving into SQL statements and schema design.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">6. Tables Can Represent Different Kinds Of Things</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A strong relational design usually separates different kinds of things into different tables instead of forcing everything into one giant table. A mining application might eventually have tables for <code>miners</code>, <code>sites</code>, <code>repairs</code>, and <code>measurements</code>. A web application might have <code>users</code>, <code>orders</code>, <code>products</code>, and <code>payments</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The database becomes relational when these tables can be connected through meaningful values and constraints. You will learn primary and foreign keys later in this track. For now, the important idea is simply that different tables can represent different entity types while still belonging to one database.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Modern services may hide much of the database administration behind APIs and managed platforms. BitcoinVersus.Tech's <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-an-api-application-programming-interface/">API explainer</a> is useful background because many applications talk to a backend service, which then reads and writes database tables on the application's behalf.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=OqjJjpjDRLc","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=OqjJjpjDRLc
</div><figcaption class="wp-element-caption"><em>IBM Technology — “What is a Relational Database?” A focused explanation of how relational databases organize structured data in tables and connect related information for querying.</em></figcaption></figure>
<!-- /wp:embed --><!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">7. Row Order Is Not Guaranteed</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A beginner mistake is to assume the database permanently stores rows in the order they were entered. SQL does not guarantee that. PostgreSQL explicitly notes that row order is unspecified unless a query requests sorting.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That means visual position is not identity. The row shown first today is not necessarily the row shown first tomorrow. Later, <code>ORDER BY</code> will give you explicit control over presentation order, and keys will give records stable identifiers.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/tursodatabase/status/2106054567125532976","type":"rich","providerNameSlug":"twitter","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-twitter wp-block-embed-twitter"><div class="wp-block-embed__wrapper">
https://twitter.com/tursodatabase/status/2106054567125532976
</div><figcaption class="wp-element-caption"><em>Turso's database announcement is a real-world reminder that SQL databases can range from tiny application-local stores to large managed systems while still relying on tables, schemas, rows, and queries.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">8. Build A Small Table Lab</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use any SQL environment you already have available, such as SQLite, PostgreSQL, or a trusted browser-based SQL playground. Create this table exactly as written:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>CREATE TABLE racks (
    rack_id INTEGER,
    room TEXT,
    capacity_kw NUMERIC,
    active BOOLEAN
);</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Before inserting anything, identify the structure in plain language. The table is named <code>racks</code>. It has four columns. Two columns represent whole-number or decimal numeric values, one represents text, and one represents a true-or-false state.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Now create a second table without copying the example. Use a subject you understand well: network switches, GPUs, books, vehicles, batteries, tools, or game characters. Give the table four or five columns and choose a sensible type for each column. The point is not to build a complete application yet. The point is to practice translating a real-world concept into a table definition.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">9. Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Confusing a database with a table:</strong> one database can contain many tables.</li><li><strong>Confusing a row with a column:</strong> a row is one record; a column is one attribute shared across records.</li><li><strong>Using text for everything:</strong> choose types that match the meaning of the data.</li><li><strong>Treating row position as identity:</strong> SQL does not promise permanent row order.</li><li><strong>Putting unrelated entities in one huge table:</strong> separate concepts usually deserve separate tables.</li><li><strong>Trying to learn every SQL command at once:</strong> first understand the data model; querying comes next.</li></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">10. Exercises</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Define database, table, row, column, and data type in one sentence each.</li><li>Design a table named <code>servers</code> with at least five columns.</li><li>Choose which columns in your <code>servers</code> table should be numeric, text, Boolean, or timestamp values.</li><li>Write a <code>CREATE TABLE</code> statement for a table named <code>batteries</code>.</li><li>Explain why a relational table is not simply a spreadsheet saved on a server.</li><li>Give an example of two different tables that might belong to the same application.</li><li>Explain why row order should not be used as a permanent identifier.</li><li>Find one field in a real system that would be badly represented as free-form text and choose a better data type.</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">11. Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What does RDBMS stand for?</li><li>In beginner SQL terms, what is a relation usually represented as?</li><li>What is the difference between a row and a column?</li><li>Why does a column have a data type?</li><li>What SQL command creates a table?</li><li>Does SQL guarantee the order of rows when no explicit sort is requested?</li><li>Can one database contain multiple tables?</li><li>What does a schema describe at a basic level?</li><li>Why is storing every value as text usually a poor design choice?</li><li>What is the next SQL skill after understanding relational tables in this curriculum?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">12. Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Relational Database Management System.</li><li>A table.</li><li>A row is one record; a column is one named attribute or field shared by the table's records.</li><li>The type constrains what values belong in the column and determines how the database can interpret and operate on them.</li><li><code>CREATE TABLE</code>.</li><li>No. Row order is unspecified unless the query explicitly requests sorting.</li><li>Yes.</li><li>The defined structure of the data, including tables, columns, types, and later constraints and relationships.</li><li>Because numbers, dates, Booleans, and other typed values have semantics and operations that arbitrary text does not provide reliably.</li><li><code>SELECT</code>, which retrieves data from tables.</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">13. Official Reference And Prior Reading</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.postgresql.org/docs/current/tutorial-sql.html">PostgreSQL Documentation — The SQL Language Tutorial</a></li><li><a href="https://www.postgresql.org/docs/current/ddl-basics.html">PostgreSQL Documentation — Table Basics</a></li><li><a href="https://bitcoinversus.tech/2026/10/04/coding-supabase-acquires-turso-to-give-every-ai-agent-its-own-database/">Supabase Acquires Turso to Give Every AI Agent Its Own Database</a></li><li><a href="https://bitcoinversus.tech/2026/10/08/it-what-is-json-javascript-object-notation-structured-data/">What Is JSON? How Software Stores and Exchanges Structured Data</a></li><li><a href="https://bitcoinversus.tech/2026/10/08/it-what-is-an-api-application-programming-interface/">What Is an API? How Software Talks to Software</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">14. What You Should Remember</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A relational database organizes structured data into tables. Tables contain rows and columns. Columns have names and data types. A schema defines the structure. SQL gives you commands for defining and working with that structure.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not worry yet about joins, optimization, transactions, or advanced schema design. The next canonical SQL lesson is <strong>OSSQL.002: SELECT</strong>, where the focus moves from defining a table to retrieving data from it.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">BitcoinVersus.Tech</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Editor's Note:</strong> SQL implementations differ in details. When syntax or supported data types differ between SQLite, PostgreSQL, MySQL, SQL Server, or another database engine, confirm the behavior against the documentation for the system you are using.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech publishes open technical education across programming, semiconductors, electronics, networking, robotics, data centers, operating systems, firmware, and infrastructure.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech provides educational information for general informational purposes.</p>
<!-- /wp:paragraph -->