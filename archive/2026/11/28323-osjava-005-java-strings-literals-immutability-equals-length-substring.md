---
lesson_id: "OSJava.005"
track: "Open Source Java Programming"
level: "Super-Fundamentals"
wordpress_post_id: 28323
title: "OSJava.005: Java Strings — Literals, Immutability, equals(), length(), and substring()"
permalink: "https://bitcoinversus.tech/2026/11/01/osjava-005-java-strings-literals-immutability-equals-length-substring/"
published_date: "2026-11-01"
wordpress_category_ids: [44329, 5812, 2509703, 6]
featured_media_id: 28317
featured_dimensions: "1200x630"
featured_style: "realistic editorial photo"
featured_person: "Fictional adult South Asian male Java programmer, 20s–30s"
in_story_media_count: 3
in_story_media:
  - "YouTube P9hEmbfdiuc: Bro Code Java String methods"
  - "YouTube AoUVdLWLFQw: Coding with John equals() versus =="
  - "YouTube Ntl3DxhyrQQ: Bro Code useful Java String methods"
youtube_embed_qa: "WordPress view renders 3 native YouTube iframe players with captions; independent playback not verified."
youtube_playback_verified: false
mobile_render_verified: false
code_blocks_count: 0
plain_unboxed_code_examples_count: 5
code_qa: "StringLab.java compiled and executed with javac 21.0.12.1; output matched lesson."
internal_link_count: 7
decorative_text_box_blocks: 0
primary_sources:
  - "https://dev.java/learn/language/constructs/numbers-strings/strings/"
  - "https://docs.oracle.com/en/java/javase/26/docs/api/java.base/java/lang/String.html"
  - "https://docs.oracle.com/en/java/javase/18/text-blocks/index.html"
numbering_reconciliation: "OSJava.004 Control Flow (post 28319) published first during a concurrent process; Strings post 28323 renumbered to OSJava.005."
qa_status: "Published WordPress 28323, 1200x630 featured media 28317, 3 native YouTube iframe players and captions, code output compiled, Gutenberg readback; actual playback and mobile screenshots not independently verified."
next_java_lesson_id: "OSJava.006"
next_main_rotation_subject: "javascript"
---

<!-- wp:paragraph --><p><strong>Java strings represent sequences of text as objects, not primitive variables.</strong> Whether a program reads a device identifier, checks an account name, parses logs, or formats a message, the <code>java.lang.String</code> class supplies tools for manipulating that text. In OSJava.005 you will build practical string values, distinguish object identity from text equality, and run one verified example using string methods.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson follows <a href="https://bitcoinversus.tech/2026/11/01/osjava-004-control-flow-if-switch-for-while-do-while-break-continue/">OSJava.004: Java Control Flow</a> and builds on <a href="https://bitcoinversus.tech/2026/10/14/osjava-003-expressions-statements-blocks/">OSJava.003: Expressions, Statements, and Blocks</a>, which introduced executable expressions, and <a href="https://bitcoinversus.tech/2026/10/10/osjava-002-primitive-types-variables-byte-short-int-long-float-double-boolean-char-literals-local-variables/">OSJava.002: Primitive Types and Variables</a>, which distinguished primitive values from variable declarations. Revisit <a href="https://bitcoinversus.tech/2026/10/08/osjava-001-what-is-java-source-code-bytecode-jvm-jdk-first-program/">OSJava.001: The JDK, Bytecode, and JVM</a> if you need a refresher on compiling a Java class.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Create Java strings from literals and understand why they are reference types.</li><li>Distinguish <code>equals()</code>, <code>equalsIgnoreCase()</code>, and <code>==</code>.</li><li>Read text with <code>length()</code>, <code>charAt()</code>, <code>indexOf()</code>, and <code>substring()</code>.</li><li>Explain <code>String</code> immutability and why methods return new text values.</li><li>Recognize UTF-16 code-unit length versus Unicode code-point count.</li><li>Compile, run, and extend a Java string-handling diagnostic lab.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">1. String objects and literals</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <code>String</code> is a class in <code>java.lang</code>, so Java programs use it without an explicit import. A text literal is enclosed in double quotation marks: <code>"ASIC-S21"</code>. Single quotation marks denote a single <code>char</code> such as <code>'A'</code>, which is not the same type. A variable declared <code>String model</code> stores a reference to a string object; it is not an array of mutable characters. The <a href="https://dev.java/learn/language/constructs/numbers-strings/strings/">official Dev.java Strings lesson</a> explains that Java treats literals as string objects and their values are immutable.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">String model = &quot;ASIC-S21&quot;;
String note = &quot;Status: &quot; + model;
char first = model.charAt(0);
System.out.println(note);    // Status: ASIC-S21
System.out.println(first);   // A</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Concatenation with <code>+</code> builds a resulting string. This is useful for compact human-readable diagnostics, but do not build complex SQL statements with concatenated untrusted input. Java's <code>String</code> and JavaScript's string primitive share many text operations yet differ in type rules; compare <a href="https://bitcoinversus.tech/2026/10/10/osjavascript-002-values-primitive-types-string-number-boolean-null-undefined-bigint-symbol-typeof/">OSJavaScript.002: Values and Primitive Types</a> when moving between languages.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Reading strings with methods</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The <code>length()</code> method reports how many UTF-16 code units a string contains. <code>charAt(0)</code> returns the first UTF-16 code unit, because indexing begins at zero. <code>indexOf("S21")</code> finds the starting index of that text or returns <code>-1</code> if absent. <code>substring(begin, end)</code> returns the region starting at <code>begin</code> and stopping <em>before</em> <code>end</code>; the end index is exclusive. Out-of-range positions throw an exception rather than returning a blank character.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">String model = &quot;ASIC-S21&quot;;
System.out.println(model.length());       // 8
System.out.println(model.charAt(0));      // A
System.out.println(model.indexOf(&quot;S21&quot;)); // 5
System.out.println(model.substring(0, 4)); // ASIC
System.out.println(model.contains(&quot;S21&quot;)); // true</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>For real-world input, test ranges and blank strings before indexing. The <a href="https://docs.oracle.com/en/java/javase/26/docs/api/java.base/java/lang/String.html">Java String API documentation</a> defines the exact method contracts. Counting human-visible symbols is a separate problem: some Unicode code points use two UTF-16 code units, and combinations of code points can display as one grapheme.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=P9hEmbfdiuc","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=P9hEmbfdiuc
</div><figcaption class="wp-element-caption"><em>Bro Code demonstrates useful Java String methods, including length, character lookup, case conversion, trimming, and replacement.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">3. String content versus reference identity</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use <code>equals()</code> for content equality. By contrast, <code>==</code> tests whether two reference variables identify the same object, not whether the text matches. Some literals are interned, which can make a mistaken <code>==</code> comparison appear to work in a small demonstration. The correct choice for ordinary text comparison is <code>equals()</code>; choose <code>equalsIgnoreCase()</code> only when a case-insensitive comparison is actually required.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">String a = &quot;ready&quot;;
String b = new String(&quot;ready&quot;);
System.out.println(a.equals(b));   // true
System.out.println(a == b);        // false
String nullable = null;
System.out.println(&quot;ready&quot;.equals(nullable)); // false</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Calling <code>nullable.equals("ready")</code> when <code>nullable</code> is <code>null</code> throws a <code>NullPointerException</code>. A constant on the left of <code>equals()</code> avoids that particular failure. When comparing labels that may differ by language or locale, do not assume that ignoring case implements every human-language equivalence. The boolean conditions used in <a href="https://bitcoinversus.tech/2026/11/01/osgo-004-control-flow-if-switch-for-range-break-continue/">OSGo.004: Control Flow</a> are conceptually similar, but Java reference comparison has its own rules.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=AoUVdLWLFQw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=AoUVdLWLFQw
</div><figcaption class="wp-element-caption"><em>Coding with John explains the difference between Java reference identity with == and actual String content equality with equals().</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Immutability, cleanup, and replacement</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Once a Java <code>String</code> object is created, its text cannot be changed in place. A method such as <code>replace()</code>, <code>toUpperCase()</code>, or <code>strip()</code> returns a string result; assign that result if the cleaned version is needed later. The original object remains unchanged. <code>strip()</code> is available in Java 11 and newer; <code>trim()</code> predates it and uses a narrower whitespace definition. For repeated incremental editing, the mutable <code>StringBuilder</code> class is frequently more appropriate than repeatedly concatenating inside a large loop.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">String raw = &quot; ASIC-S21 &quot;;
String clean = raw.strip();
String revised = clean.replace(&quot;S21&quot;, &quot;S19&quot;);
System.out.println(raw);     // still contains spaces
System.out.println(clean);   // ASIC-S21
System.out.println(revised); // ASIC-S19</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>For multiline text, modern Java offers text blocks with triple double quotes on Java 15 and newer. They reduce the escape sequences required for embedded HTML, configuration, and other formatted data; see <a href="https://docs.oracle.com/en/java/javase/18/text-blocks/index.html">Oracle's text-block programming guide</a>. The lesson on <a href="https://bitcoinversus.tech/2026/10/09/oshtml-001-document-structure-doctype-html-head-body-metadata-first-page/">HTML document structure</a> offers an example of the sort of text developers may need to embed without losing its formatting.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Ntl3DxhyrQQ","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Ntl3DxhyrQQ
</div><figcaption class="wp-element-caption"><em>Bro Code offers a second practical demonstration of String methods, including comparisons, cleanup, searches, and immutable replacement results.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Complete Java lab: normalize a miner identifier</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Create a file named <code>StringLab.java</code> and enter the complete program below. It begins with a padded equipment identifier, removes surrounding whitespace, compares equivalent text, extracts a model prefix, and demonstrates why replacing part of a string does not modify the original. The final two lines contrast Java's UTF-16 code-unit count with a Unicode code-point count.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">public class StringLab {
    public static void main(String[] args) {
        String device = &quot; ASIC-S21 &quot;;
        String clean = device.strip();
        String target = new String(&quot;ASIC-S21&quot;);
        System.out.println(&quot;clean: &quot; + clean);
        System.out.println(&quot;same text: &quot; + clean.equals(target));
        System.out.println(&quot;same object: &quot; + (clean == target));
        System.out.println(&quot;prefix: &quot; + clean.substring(0, 4));
        System.out.println(&quot;length: &quot; + clean.length());
        System.out.println(&quot;first letter: &quot; + clean.charAt(0));
        System.out.println(&quot;changed copy: &quot; + clean.replace(&quot;S21&quot;, &quot;S19&quot;));
        System.out.println(&quot;original: &quot; + clean);
        String symbol = &quot;🔧&quot;;
        System.out.println(&quot;UTF-16 units: &quot; + symbol.length());
        System.out.println(&quot;code points: &quot; +
            symbol.codePointCount(0, symbol.length()));
    }
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Compile and execute on Java 11 or newer with <code>javac StringLab.java</code> followed by <code>java StringLab</code>. This exact example was compiled and executed using <strong>OpenJDK 21.0.12</strong>; the console output was:</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">clean: ASIC-S21
same text: true
same object: false
prefix: ASIC
length: 8
first letter: A
changed copy: ASIC-S19
original: ASIC-S21
UTF-16 units: 2
code points: 1</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>The first comparison is true because the normalized label and target have the same text. The identity comparison is false because the target was explicitly constructed as a different object. The substring ends before index 4, and the wrench symbol occupies two UTF-16 code units while representing one code point. Neither count necessarily measures user-perceived grapheme clusters in arbitrary Unicode text.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">6. Common mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Using <code>==</code> to compare text values instead of <code>equals()</code>.</li><li>Using <code>charAt(length())</code> even though the last valid index is <code>length() - 1</code>.</li><li>Expecting <code>replace()</code> or <code>strip()</code> to mutate an existing String object.</li><li>Confusing <code>length()</code> with a count of displayed symbols or all Unicode graphemes.</li><li>Ignoring <code>null</code> input before calling instance methods.</li><li>Treating a missing <code>indexOf()</code> result, <code>-1</code>, as a valid substring starting index.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Mini lab and exercises</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Change the identifier to <code>" ASIC-S19 "</code> and predict all eight ordinary string-processing output lines before compiling.</li><li>Add a <code>startsWith("ASIC")</code> test after normalization and print its boolean result.</li><li>Create a label <code>"s21"</code> and compare it with <code>"S21"</code> using both <code>equals()</code> and <code>equalsIgnoreCase()</code>.</li><li>Use <code>indexOf('-')</code> and <code>substring()</code> to extract the model name after the hyphen.</li><li>Explain in one sentence why calling <code>clean.replace("S21","S19")</code> without saving the return value leaves <code>clean</code> unchanged.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check and answers</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Is Java <code>String</code> a primitive type?</li><li>What does <code>"abc".substring(1, 3)</code> return?</li><li>What is the difference between <code>equals()</code> and <code>==</code> for strings?</li><li>What index indicates <code>indexOf()</code> did not find a match?</li><li>Why can <code>length()</code> report two for one emoji?</li><li>Does assigning <code>text = text.strip()</code> mutate the original string object?</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answers:</strong> (1) No, it is an object/reference type. (2) <code>"bc"</code>. (3) Content equality versus reference identity. (4) <code>-1</code>. (5) Java uses UTF-16 code units; supplementary code points occupy a surrogate pair. (6) No; the variable points to the method's returned value, while the original object's characters remain immutable.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Sources and next lesson</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Primary technical references: <a href="https://dev.java/learn/language/constructs/numbers-strings/strings/">Dev.java — Strings</a>; <a href="https://docs.oracle.com/en/java/javase/26/docs/api/java.base/java/lang/String.html">Oracle's String API</a>; and <a href="https://docs.oracle.com/en/java/javase/18/text-blocks/index.html">Oracle's text-block guide</a>. OSJava.006 can introduce array creation and indexing; the full Open CERT subject rotation advances next to <strong>JavaScript</strong>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="BitcoinVersus.Tech original Bitcoin donation QR for 5000 satoshis" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open the lesson on a larger screen and scan the QR code with a compatible Bitcoin wallet. Verify the destination address before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->