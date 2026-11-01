---
lesson_id: "OSJava.004"
track: "Open Source Java Programming"
level: "Super-Fundamentals"
wordpress_post_id: 28319
title: "OSJava.004: Control Flow — if, switch, for, while, do-while, break, and continue"
permalink: "https://bitcoinversus.tech/2026/11/01/osjava-004-control-flow-if-switch-for-while-do-while-break-continue/"
published_date: "2026-11-01"
categories: [44329, 5812, 2509703, 6]
featured_media_id: 28314
featured_image_dimensions: "1200x630"
featured_image_source: "USER SUPPLIED attachment 6218F3FC-9D58-463F-809D-FEC549F07AF8.jpeg"
featured_image_transformation: "Uploaded actual user image unaltered, then created 1200x630 cropped version by WordPress image service; no newly generated replacement image"
cover_roster_exception: "Explicit user preference for provided Black woman programmer painting overrides prospective next South Asian male/realistic-photo cover slot for this post only; do not consume that scheduled demographic/style slot."
media_count_in_story: 3
media:
  - "YouTube 7SEaME7ekMA: Java if/else and switch tutorial"
  - "YouTube ZjHJrmYknrk: Java while and do-while tutorial by Bro Code"
  - "YouTube vOmZ4JFhRds: Java for loops tutorial by Bro Code"
saved_blocks: "Three canonical Gutenberg core/embed blocks, with wrapper newlines and captions below videos; eight transparent unboxed pre/code HTML examples including tested output; no decorative Group/Cover text boxes."
media_render_qa: "Fresh published WordPress view confirms three separate YouTube iframes, captions and cover; actual video playback in external browser unverified."
code_qa: "Entire sample Main.java compiled and executed successfully with OpenJDK 21.0.12.1, class file version 65.0. Expected output verified."
internal_link_count: 5
primary_sources:
  - "https://dev.java/learn/language-basics/controlling-flow/"
  - "https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html"
  - "https://docs.oracle.com/en/java/javase/21/language/switch-expressions-and-statements.html"
previous_java_lesson: "OSJava.003"
next_java_lesson: "OSJava.005"
next_main_rotation_subject: "javascript"
next_main_rotation_lesson_number: 4
qa_limitations: "WordPress saved and rendered content confirmed, no external browser video playback or mobile screenshots available."
---

<!-- wp:heading --><h2 class="wp-block-heading">Java Control Flow: Decisions, Loops, and Safe Exit Conditions</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A Java program usually runs statements in sequence. <strong>Control-flow statements</strong> change that order: a conditional decides which work happens, a loop repeats work, and branching statements stop or skip portions of a loop. In this lesson, you will use <code>if</code>, <code>else if</code>, <code>switch</code>, <code>for</code>, <code>while</code>, <code>do-while</code>, <code>break</code>, and <code>continue</code>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is <strong>OSJava.004</strong> in Open CERT’s complete subject rotation. It follows <a href="https://bitcoinversus.tech/2026/10/14/osjava-003-expressions-statements-blocks/">OSJava.003: Expressions, Statements, and Blocks</a>. Review <a href="https://bitcoinversus.tech/2026/10/10/osjava-002-primitive-types-variables-byte-short-int-long-float-double-boolean-char-literals-local-variables/">OSJava.002: Primitive Types</a> and <a href="https://bitcoinversus.tech/2026/10/08/osjava-001-what-is-java-source-code-bytecode-jvm-jdk-first-program/">OSJava.001: Your First Program</a> if variables, <code>boolean</code> values, braces, or <code>javac</code> are unfamiliar.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Write an <code>if / else if / else</code> decision using boolean expressions.</li><li>Compare classic colon-style and modern arrow-style <code>switch</code> cases.</li><li>Identify when <code>for</code>, <code>while</code>, <code>do-while</code>, or enhanced <code>for</code> is appropriate.</li><li>Use <code>continue</code> to skip an iteration and <code>break</code> to exit a loop.</li><li>Compile a complete Java program that evaluates simulated equipment temperatures.</li><li>Distinguish Java loop behavior from other languages without copying their syntax.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">1. Choose a branch with if and else</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Java requires a <strong>boolean condition inside parentheses</strong>. The first true branch runs; following branches are skipped. The threshold values below are illustrative classroom values, not a safe operating specification for any real machine.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.5;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,Consolas,monospace;font-size:0.94em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,Consolas,monospace">int temperature = 76;
if (temperature &gt;= 90) {
    System.out.println("ALERT: critical heat");
} else if (temperature &gt;= 70) {
    System.out.println("INSPECT COOLING");
} else {
    System.out.println("NORMAL");
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>For <code>temperature = 76</code>, the expression <code>temperature &gt;= 90</code> is false and <code>temperature &gt;= 70</code> is true. The console prints <code>INSPECT COOLING</code>. Java uses <code>&amp;&amp;</code> for logical AND, <code>||</code> for OR, and <code>!</code> for negation. Unlike Go, parentheses around an <code>if</code> condition are mandatory.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=7SEaME7ekMA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=7SEaME7ekMA
</div><figcaption class="wp-element-caption"><em>English beginner lesson covering Java if/else and switch decisions. Use the code in this lesson for the exact Java 21 examples.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Choose one case with switch</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A classic <code>switch</code> matches a selector against case labels. In the <em>colon form</em>, <code>break</code> commonly prevents execution from falling into the next case. The arrow form, standardized in modern Java, does not fall through.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.5;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,Consolas,monospace;font-size:0.94em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,Consolas,monospace">String mode = "maintenance";
switch (mode) {
    case "run":
        System.out.println("mode: production");
        break;
    case "maintenance":
        System.out.println("mode: service");
        break;
    default:
        System.out.println("mode: unknown");
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>In Java 14 and later, arrow labels can make the same selection easier to read. Each arrow case handles one selected alternative without a trailing <code>break</code>.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.5;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,Consolas,monospace;font-size:0.94em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,Consolas,monospace">switch (mode) {
    case "run" -&gt; System.out.println("mode: production");
    case "maintenance" -&gt; System.out.println("mode: service");
    default -&gt; System.out.println("mode: unknown");
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Both examples print <code>mode: service</code>. A <code>switch</code> may also be an expression that returns a value. See the <a href="https://docs.oracle.com/en/java/javase/21/language/switch-expressions-and-statements.html">Java 21 switch documentation</a> for arrow cases, <code>yield</code>, and exhaustiveness.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">3. Repeat actions with for, while, and do-while</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Choose a three-part <code>for</code> loop when a counter has a natural initialization, condition, and update. Choose <code>while</code> when repetition depends on a condition that may initially be false. Choose <code>do-while</code> when the body must execute at least once. The <code>do-while</code> condition ends with a semicolon.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.5;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,Consolas,monospace;font-size:0.94em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,Consolas,monospace">for (int i = 0; i &lt; 3; i++) {
    System.out.println(i); // 0, 1, 2
}

int attempts = 0;
while (attempts &lt; 2) {
    attempts++;
    System.out.println("attempt " + attempts);
}

int checks = 0;
do {
    checks++;
    System.out.println("check " + checks);
} while (checks &lt; 1);</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>A condition is checked before each <code>for</code> or <code>while</code> iteration, but after a <code>do-while</code> body. If the condition never becomes false, the program can loop forever. Plan how a program will stop, especially when interacting with external devices.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ZjHJrmYknrk","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ZjHJrmYknrk
</div><figcaption class="wp-element-caption"><em>Bro Code demonstrates Java while loops and do-while behavior in English, including how a loop can accidentally run without ending.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Enhanced for, continue, and break</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>An enhanced <code>for</code> loops over each value in an array or other iterable structure. It is concise when you need the value but not its numeric index. For arrays of primitive numbers, the iteration variable contains a copy of each element.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.5;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,Consolas,monospace;font-size:0.94em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,Consolas,monospace">int[] readings = {40, 76, 92, 55};
for (int value : readings) {
    System.out.println(value);
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Use an indexed loop if you need both the reading and its position. <code>continue</code> skips the remaining statements in the current iteration. <code>break</code> exits the innermost enclosing loop or switch.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.5;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,Consolas,monospace;font-size:0.94em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,Consolas,monospace">int[] readings = {40, 76, 92, 55};
for (int i = 0; i &lt; readings.length; i++) {
    int value = readings[i];
    if (value &lt; 70) continue;
    System.out.printf("sample %d: %d C%n", i, value);
    if (value &gt;= 90) {
        System.out.println("STOP at critical sample");
        break;
    }
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>This displays samples 1 and 2 but skips sample 0 because it is below 70. The loop ends at sample 2 (value 92), so sample 3 is never processed. A labeled <code>break</code> can terminate a named outer loop, but ordinary code should use the simplest clear exit condition.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vOmZ4JFhRds","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vOmZ4JFhRds
</div><figcaption class="wp-element-caption"><em>Bro Code’s focused English tutorial on Java for loops, counters, and loop boundaries. The indexed sampling example above adds break/continue.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Compile the complete equipment-monitoring mini-lab</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Create a file named <code>Main.java</code>. This full example combines conditionals, a modern arrow-style switch, indexed looping, <code>continue</code>, <code>break</code>, a <code>while</code> loop, and a <code>do-while</code> loop. The example was compiled and executed with <strong>OpenJDK 21</strong>; the values simulate a monitoring console, not real sensor measurements.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.5;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,Consolas,monospace;font-size:0.94em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,Consolas,monospace">public class Main {
    public static void main(String[] args) {
        int temperature = 76;
        if (temperature &gt;= 90) {
            System.out.println("ALERT: critical heat");
        } else if (temperature &gt;= 70) {
            System.out.println("INSPECT COOLING");
        } else {
            System.out.println("NORMAL");
        }

        String mode = "maintenance";
        switch (mode) {
            case "run" -&gt; System.out.println("mode: production");
            case "maintenance" -&gt; System.out.println("mode: service");
            default -&gt; System.out.println("mode: unknown");
        }

        int[] readings = {40, 76, 92, 55};
        for (int i = 0; i &lt; readings.length; i++) {
            int reading = readings[i];
            if (reading &lt; 70) continue;
            System.out.printf("sample %d: %d C%n", i, reading);
            if (reading &gt;= 90) {
                System.out.println("STOP at critical sample");
                break;
            }
        }

        int attempts = 0;
        while (attempts &lt; 2) {
            attempts++;
            System.out.println("attempt " + attempts);
        }

        int checks = 0;
        do {
            checks++;
            System.out.println("check " + checks);
        } while (checks &lt; 1);
    }
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Save, then run <code>javac Main.java</code> followed by <code>java Main</code>. Java compiles the <code>Main</code> class into bytecode, which the JVM executes. The exact tested output is:</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Java code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.5;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,Consolas,monospace;font-size:0.94em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,Consolas,monospace">INSPECT COOLING
mode: service
sample 1: 76 C
sample 2: 92 C
STOP at critical sample
attempt 1
attempt 2
check 1</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Notice that <code>sample 0</code> never prints because of <code>continue</code>, and <code>sample 3</code> never prints because of <code>break</code>. The <code>while</code> loop runs twice, while the <code>do-while</code> block runs once even though the final condition is false.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">6. Common mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Missing parentheses:</strong> Java uses <code>if (condition)</code>, not <code>if condition</code>.</li><li><strong>Accidental switch fallthrough:</strong> colon cases may need <code>break</code>; arrow cases do not implicitly fall through.</li><li><strong>Off-by-one bounds:</strong> a four-item array has indices 0–3. Use <code>i &lt; array.length</code>, not <code>i &lt;= array.length</code>.</li><li><strong>Infinite while loop:</strong> modify the state that the termination condition depends on.</li><li><strong>Confusing continue and break:</strong> <code>continue</code> advances to the next iteration; <code>break</code> exits.</li><li><strong>Misreading an enhanced for:</strong> use an indexed loop when element positions or writes to primitive arrays matter.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">7. Practice and self-check</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Change the first temperature to 65. Which message is printed?</li><li>Change <code>mode</code> to <code>run</code>. Does the arrow switch execute the maintenance case?</li><li>Replace <code>break</code> with <code>continue</code> when a reading reaches 90. What changes in the sample output?</li><li>Modify the while-loop limit to 3 and predict the number of attempt messages.</li><li>Explain why <code>do-while</code> prints once when <code>checks &lt; 1</code> becomes false immediately afterward.</li><li>Write an enhanced <code>for</code> loop to calculate the total of all four readings.</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answer guide:</strong> (1) NORMAL; (2) no, only production prints; (3) sample 3 is examined on the next iteration but does not print because it is below 70; (4) three; (5) its condition is tested after the first execution; (6) total = 263.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Official documentation and next steps</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use <a href="https://dev.java/learn/language-basics/controlling-flow/">Dev.java: Controlling the Flow</a>, the <a href="https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html">Oracle Java Control Flow tutorial</a>, and the <a href="https://docs.oracle.com/en/java/javase/21/language/switch-expressions-and-statements.html">Java switch reference</a> to verify language behavior. Compare <a href="https://bitcoinversus.tech/2026/11/01/osgo-004-control-flow-if-switch-for-range-break-continue/">OSGo.004</a> and <a href="https://bitcoinversus.tech/2026/11/01/osc-005-c-loops-for-while-do-while-break-continue/">OSC.005</a> to see how related loop ideas differ across languages. The next Java track lesson can introduce methods, parameters, return values, and method overloading. The complete curriculum rotation next moves to JavaScript.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="BitcoinVersus.Tech original Bitcoin donation QR for 5000 satoshis" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open the lesson on a larger screen and scan the QR code with a compatible Bitcoin wallet. Verify the destination address before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->
