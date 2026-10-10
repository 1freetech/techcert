---
title: "OSJava.002: Primitive Types and Variables — byte, short, int, long, float, double, boolean, char, Literals, and Local Variables"
status: published
wordpress_post_id: 23186
wordpress_status: publish
published: "2026-10-10T09:34:13"
modified: "2026-10-10T09:34:13"
live_url: "https://bitcoinversus.tech/2026/10/10/osjava-002-primitive-types-variables-byte-short-int-long-float-double-boolean-char-literals-local-variables/"
series: "Open Source Java"
certification: OSJava
pathway: java
lesson_number: "002"
lesson_topic: "Primitive Types and Variables"
featured_media_id: 23178
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osjava002-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 23181
body_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/duke-star7-dev-java.png"
youtube:
  - "https://www.youtube.com/watch?v=sVIvhzEizEQ"
  - "https://www.youtube.com/watch?v=NtmULLvsABc"
social:
  - "https://www.reddit.com/r/JavaProgramming/comments/1t5126l/starting_java_training_with_zero_programming/"
seo_title: "OSJava.002: Java Primitive Types and Variables | Open Source Java"
seo_description: "Learn Java primitive types and variables: byte, short, int, long, float, double, boolean, char, literals, local-variable initialization, references, and var."
seo_schema_type: article
excerpt: "Learn Java’s eight primitive types, variable declarations, literals, local-variable initialization, primitive vs. reference values, and how var keeps Java statically typed."
no_text_boxes: true
top_section_heading: "Key Takeaways"
top_bullet_count: 3
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Java is statically typed:</strong> every variable has a type known to the compiler.</li><li><strong>Java has eight primitive types:</strong> <code>byte</code>, <code>short</code>, <code>int</code>, <code>long</code>, <code>float</code>, <code>double</code>, <code>boolean</code>, and <code>char</code>.</li><li><strong>Local variables do not receive automatic default values:</strong> assign them before reading them.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><strong>Java variables give names to values while Java types tell the compiler what kind of values those names may hold.</strong> After learning the source-code → compiler → bytecode → JVM path in <a href="https://bitcoinversus.tech/2026/10/08/osjava-001-what-is-java-source-code-bytecode-jvm-jdk-first-program/"><strong>OSJava.001: What Is Java?</strong></a>, the next foundation is learning how a Java program represents numbers, true/false values, characters, and references.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson stays deliberately fundamental. It focuses on declarations, assignment, literals, primitive types, local variables, and the basic distinction between primitive and reference values. Operators, control flow, methods, classes, and collections belong in later lessons.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=sVIvhzEizEQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=sVIvhzEizEQ
</div><figcaption class="wp-element-caption"><em>LinkedIn Learning introduces Java primitive data types and shows how values are stored in variables.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Variable Has a Type, a Name, and a Value</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Java is a <strong>statically typed</strong> language. A normal variable declaration identifies a type and a name, and it may also include an initial value. The official <a href="https://dev.java/learn/language/constructs/basics/primitive-types/"><strong>Dev.java primitive-types guide</strong></a> uses the same basic model: the compiler knows the variable’s type before the program runs.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int age = 25;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><li><code>int</code> is the type.</li><li><code>age</code> is the variable name.</li><li><code>25</code> is an integer literal used as the initial value.</li><li><code>=</code> performs assignment.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>You can also declare first and assign later:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int age;
age = 25;</code></pre>
<!-- /wp:code -->

<!-- wp:image {"id":23181,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/duke-star7-dev-java.png?w=369" alt="Duke, the open-source Java mascot, holding the Star7 handheld device" class="wp-image-23181" /><figcaption class="wp-element-caption"><em>Duke, the open-source Java mascot, shown with the Star7 device from Java’s early history. Source: Dev.java / Oracle.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Eight Primitive Types</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A primitive type is built into the Java language. Primitive values are not objects created from a class. Java defines eight primitive types.</p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Type</th><th>Typical use</th><th>Example</th></tr></thead><tbody><tr><td><code>byte</code></td><td>Small signed integers</td><td><code>byte level = 100;</code></td></tr><tr><td><code>short</code></td><td>Smaller-range signed integers</td><td><code>short year = 2026;</code></td></tr><tr><td><code>int</code></td><td>General whole numbers</td><td><code>int count = 42;</code></td></tr><tr><td><code>long</code></td><td>Larger whole numbers</td><td><code>long population = 8_000_000_000L;</code></td></tr><tr><td><code>float</code></td><td>32-bit floating point</td><td><code>float ratio = 1.5F;</code></td></tr><tr><td><code>double</code></td><td>64-bit floating point</td><td><code>double price = 19.99;</code></td></tr><tr><td><code>boolean</code></td><td><code>true</code> or <code>false</code></td><td><code>boolean online = true;</code></td></tr><tr><td><code>char</code></td><td>Single UTF-16 code unit</td><td><code>char grade = 'A';</code></td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>For most beginner whole-number work, <code>int</code> is the normal starting point. For most beginner decimal work, <code>double</code> is the normal starting point. The smaller integer types and <code>float</code> matter, but they should be chosen for a reason rather than simply because a value currently looks small.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primitive Values and Reference Values Are Different Categories</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Primitive types hold primitive values. Reference types refer to objects or arrays. For example, <code>String</code> is not one of Java’s eight primitive types; it is a class in <code>java.lang</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int score = 9000;          // primitive
String player = "Amina";   // reference type</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This distinction becomes important later when you study objects, methods, <code>null</code>, arrays, collections, parameter passing, and memory behavior. For now, remember the simplest rule: <strong>the eight language keywords in the table are primitive types; classes such as <code>String</code> are reference types.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Literals Are Values Written Directly in Source Code</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A literal is a source-code representation of a fixed value. In the following declarations, <code>42</code>, <code>2.5</code>, <code>true</code>, and <code>'J'</code> are literals.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int answer = 42;
double voltage = 2.5;
boolean ready = true;
char initial = 'J';</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Some numeric literals need suffixes. A large integer literal intended as a <code>long</code> commonly uses uppercase <code>L</code>. A <code>float</code> literal commonly uses <code>F</code>. Uppercase suffixes are easier to read than lowercase forms.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>long distance = 9_000_000_000L;
float efficiency = 0.95F;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Underscores can make long numeric literals easier to read. They do not change the numeric value.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Local Variables Must Be Assigned Before Use</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A local variable is declared inside a method or block and stores temporary state for that execution path. Unlike fields, a local variable does <strong>not</strong> receive an automatic default value that you can safely read. The compiler requires definite assignment before use.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>public class Demo {
    public static void main(String[] args) {
        int temperature;
        temperature = 72;
        System.out.println(temperature);
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If the print statement came before the assignment, the code would fail to compile because the local variable may not have been initialized. This compile-time check prevents a large class of accidental reads of unknown local state.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=NtmULLvsABc","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=NtmULLvsABc
</div><figcaption class="wp-element-caption"><em>Coder Army walks through variables, identifiers, primitive data types, literals, and declaration basics in Java.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Fields Do Receive Default Values</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Fields belong to a class or object rather than to a temporary local scope. Java supplies default values for fields when no explicit initializer is provided. Numeric primitive fields default to zero-equivalent values, <code>boolean</code> defaults to <code>false</code>, <code>char</code> defaults to the zero character, and reference fields default to <code>null</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is one reason it is important to distinguish a field from a local variable. The syntax can look similar, but initialization rules differ.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Java 27 Is Still Statically Typed Even When You Use var</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Modern Java supports local-variable type inference with <code>var</code> in allowed local contexts. That does <strong>not</strong> make Java dynamically typed. The compiler infers a concrete static type from the initializer.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>var count = 42;       // inferred as int
var name = "Duke";   // inferred as String</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Oracle’s <a href="https://docs.oracle.com/en/java/javase/27/language/index.html"><strong>Java SE 27 language documentation</strong></a> continues to document local variable type inference alongside newer language features. Use <code>var</code> when the inferred type remains clear; explicit types are often easier for beginners while learning the language.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/JavaProgramming/comments/1t5126l/starting_java_training_with_zero_programming/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/JavaProgramming/comments/1t5126l/starting_java_training_with_zero_programming/
</div><figcaption class="wp-element-caption"><em>A beginner Java discussion emphasizes variables, data types, and control flow as the fundamentals to learn before moving into object-oriented topics.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Complete Beginner Example</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>public class PrimitiveTypesDemo {
    public static void main(String[] args) {
        byte rackUnits = 42;
        short year = 2026;
        int miners = 10000;
        long hashes = 9_000_000_000L;
        float utilization = 0.95F;
        double price = 19.99;
        boolean online = true;
        char grade = 'A';
        String site = "North Campus";

        System.out.println(site);
        System.out.println(miners);
        System.out.println(price);
        System.out.println(online);
        System.out.println(grade);
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The example intentionally mixes all eight primitive types with one reference type, <code>String</code>. Notice that each declaration ends with a semicolon. If your editor colors types, names, literals, and keywords differently, that is <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>syntax highlighting</strong></a>; the colors help humans read the program but do not change Java’s rules.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Using double quotes for a char:</strong> <code>"A"</code> is a <code>String</code>; <code>'A'</code> is a <code>char</code>.</li><li><strong>Forgetting an <code>L</code> on a very large long literal:</strong> the unsuffixed integer literal may be outside the <code>int</code> range before assignment is considered.</li><li><strong>Forgetting <code>F</code> for a float literal:</strong> decimal floating-point literals are normally <code>double</code> by default.</li><li><strong>Reading an uninitialized local variable:</strong> the compiler rejects it.</li><li><strong>Calling String a primitive:</strong> <code>String</code> is a class and therefore a reference type.</li><li><strong>Assuming var means dynamic typing:</strong> the compiler still assigns one static type.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Java’s explicit type system is also one reason compilers, IDEs, and analysis tools can catch many mistakes before a program runs. That same ecosystem of static analysis and program understanding appears in more advanced Java tooling, including the kind of code-analysis work discussed in <a href="https://bitcoinversus.tech/2026/10/10/ibm-red-hat-lightwell-400-java-security-flaws/"><strong>IBM and Red Hat Fix 400 Hidden Java Security Flaws</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a file named <code>PrimitiveTypesDemo.java</code>.</li><li>Declare one variable for each primitive type.</li><li>Print at least four of the values.</li><li>Change one <code>int</code> to a <code>long</code> and add an uppercase <code>L</code> suffix to its literal.</li><li>Create a local variable without assigning it, try to print it, and read the compiler error.</li><li>Change <code>char grade = 'A';</code> to <code>String grade = "A";</code> and explain the type difference.</li><li>Replace one obvious local declaration with <code>var</code> and explain what type the compiler inferred.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>How many primitive types does Java define?</strong> Eight.</li><li><strong>Name them.</strong> <code>byte</code>, <code>short</code>, <code>int</code>, <code>long</code>, <code>float</code>, <code>double</code>, <code>boolean</code>, and <code>char</code>.</li><li><strong>Is String primitive?</strong> No. <code>String</code> is a reference type.</li><li><strong>What is a literal?</strong> A value written directly in source code, such as <code>42</code>, <code>true</code>, or <code>'A'</code>.</li><li><strong>Do local variables receive automatic default values?</strong> No. They must be definitely assigned before use.</li><li><strong>Do fields receive default values?</strong> Yes, when no explicit initializer is supplied.</li><li><strong>Does var make Java dynamically typed?</strong> No. The compiler infers a static type.</li><li><strong>Which primitive type usually stores ordinary whole numbers?</strong> <code>int</code>.</li><li><strong>Which primitive type usually stores ordinary decimal values?</strong> <code>double</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>A variable has a type and a name; an assignment gives it a value.</strong> Java’s eight primitive types cover integer numbers, floating-point numbers, true/false state, and character data. Reference types such as <code>String</code> are a different category. Local variables must be assigned before use, while fields receive defaults.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next Java Lesson</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>OSJava.003: Expressions, Statements, and Blocks</strong> will build on these values and variables by showing how Java combines them into executable program structure.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured artwork is a unique 1200×630 realistic color-pencil illustration created specifically for this lesson and is not reused in the body. The separate body image is the open-source Duke mascot image from Dev.java.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->