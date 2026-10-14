# OSC.004: C Control Flow — if, else, switch, and ?:

- WordPress post ID: 25107
- Canonical URL: https://bitcoinversus.tech/2026/10/14/osc-004-c-control-flow-if-else-switch-ternary/
- Featured media ID: 25106
- Featured image: 1200×630
- Archive format: final Gutenberg source

## Final Gutenberg Source

<!-- wp:paragraph -->
<p>Control flow determines which statements a C program executes and which statements it skips. Up to this point, the course has focused on building programs, declaring values, and forming expressions. In this lesson, those expressions begin controlling program behavior through <code>if</code>, <code>else if</code>, <code>else</code>, <code>switch</code>, and the conditional operator <code>?:</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson builds directly on <a href="https://bitcoinversus.tech/2026/10/14/osc-003-c-operators-and-expressions/">OSC.003 on C operators and expressions</a>, because comparisons such as <code>temperature &gt; 80</code> and logical expressions such as <code>ready &amp;&amp; connected</code> become the conditions that choose a branch.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=K8mntKyBJGc","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=K8mntKyBJGc
</div><figcaption class="wp-element-caption"><em>Programiz demonstrates if, else, and else-if decision making in C.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">How C Decides True or False</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>In C, zero is false and any nonzero value is true. A condition does not need to produce a special Boolean object. The expression simply evaluates to an integer-like truth value. That means <code>if (5)</code> takes the branch, while <code>if (0)</code> does not.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>#include &lt;stdio.h&gt;

int main(void) {
    int temperature = 87;

    if (temperature &gt; 80) {
        printf("High temperature\n");
    }

    return 0;
}
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The comparison <code>temperature &gt; 80</code> is evaluated first. Because the result is nonzero, the body of the <code>if</code> statement runs. This depends on the comparison and logical operators introduced after the variables and data types covered in <a href="https://bitcoinversus.tech/2026/10/10/osc-002-c-variables-and-fundamental-types-declarations-initialization-integers-floating-point-char-const-and-sizeof/">OSC.002</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">if and else</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An <code>if</code> statement handles one condition. Adding <code>else</code> gives the program a second path when the condition is false.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int power_ok = 1;

if (power_ok) {
    printf("Start system\n");
} else {
    printf("Keep system offline\n");
}
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The two bodies are mutually exclusive. Exactly one runs. Braces are technically optional around a single statement, but using them consistently reduces ambiguity and prevents maintenance bugs when another statement is added later.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">else if Chains</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Use <code>else if</code> when several conditions must be checked in order. C stops at the first condition that evaluates true.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int load_percent = 73;

if (load_percent &gt;= 90) {
    printf("Critical load\n");
} else if (load_percent &gt;= 70) {
    printf("High load\n");
} else if (load_percent &gt;= 40) {
    printf("Normal load\n");
} else {
    printf("Low load\n");
}
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Order matters. If the test for <code>&gt;= 40</code> appeared before the test for <code>&gt;= 90</code>, a value of 95 would match the earlier condition and the later branch would never be reached.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">switch, case, break, and default</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A <code>switch</code> statement is useful when one integral expression must be compared against several constant values. Common switch expressions include <code>char</code>, <code>int</code>, enumerations, and other integer types. Standard C does not use <code>switch</code> to compare arbitrary strings.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=u6mb8NNwojA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=u6mb8NNwojA
</div><figcaption class="wp-element-caption"><em>Programiz explains switch, case, break, default, and a simple calculator example in C.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:code -->
<pre class="wp-block-code"><code>char command = 's';

switch (command) {
    case 's':
        printf("Start\n");
        break;

    case 'p':
        printf("Pause\n");
        break;

    case 'q':
        printf("Quit\n");
        break;

    default:
        printf("Unknown command\n");
        break;
}
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Each <code>case</code> is a labeled entry point. The <code>break</code> statement exits the switch. Without <code>break</code>, execution continues into the next case. That behavior is called fallthrough. Fallthrough can be intentional, but accidental fallthrough is a common source of bugs.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Intentional Fallthrough</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int month = 1;

switch (month) {
    case 12:
    case 1:
    case 2:
        printf("Winter\n");
        break;

    case 3:
    case 4:
    case 5:
        printf("Spring\n");
        break;
}
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here, several cases deliberately share one body. This is a legitimate use of fallthrough because months 12, 1, and 2 all produce the same result.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">The Conditional Operator ?: </h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The conditional operator chooses between two expressions. It is often called the ternary operator because it has three operands: a condition, the expression used when true, and the expression used when false.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=05xv2nMj6Ls","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=05xv2nMj6Ls
</div><figcaption class="wp-element-caption"><em>Programiz demonstrates the conditional operator and compares it with a conventional if-else statement.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int temperature = 85;
const char *state = temperature &gt; 80 ? "hot" : "normal";
printf("%s\n", state);
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The expression before <code>?</code> is the condition. The expression between <code>?</code> and <code>:</code> is selected when the condition is true. The expression after <code>:</code> is selected when it is false. Use this operator when both alternatives are simple values or expressions. Long nested conditional expressions usually reduce readability and are better written as ordinary <code>if</code> statements.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">A Common Bug: = Versus ==</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int mode = 0;

if (mode = 1) {
    printf("This branch runs\n");
}
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This code assigns 1 to <code>mode</code>. The assignment expression itself evaluates to 1, which is true, so the branch runs. The likely intention was <code>mode == 1</code>. Compiler warnings help catch this class of error, which is one reason the toolchain flags introduced in <a href="https://bitcoinversus.tech/2026/10/09/osc-001-c-compiler-toolchain-gcc-preprocessing-compilation-assembly-linking-first-build/">OSC.001</a> matter.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Compile and Run</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>gcc -std=c17 -Wall -Wextra -Wpedantic control_flow.c -o control_flow
./control_flow
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The warning flags are especially useful in control-flow code because they can expose suspicious assignments, unreachable branches, missing switch cases, and other logic problems before runtime testing begins.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Create <code>power_state.c</code>. Declare an integer named <code>load</code> and print <code>LOW</code>, <code>NORMAL</code>, <code>HIGH</code>, or <code>CRITICAL</code> with an <code>if</code>/<code>else if</code> chain. Then declare a character command with values <code>'s'</code>, <code>'p'</code>, or <code>'q'</code> and handle it with <code>switch</code>. Finally, use the conditional operator to set a string pointer to <code>"online"</code> or <code>"offline"</code> from an integer status flag.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What integer value does C treat as false?</li><li>When does an <code>else</code> body execute?</li><li>Why does order matter in an <code>else if</code> chain?</li><li>What does <code>break</code> do inside a switch?</li><li>What is switch fallthrough?</li><li>What three operands make up the <code>?:</code> operator?</li><li>Why is <code>if (x = 1)</code> often a bug?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Zero.</li><li>When the associated <code>if</code> or preceding <code>else if</code> conditions are false.</li><li>C executes the first true branch and skips the remaining alternatives.</li><li>It exits the switch statement.</li><li>Execution continues from one case into the next because no break or other control transfer ended the first case.</li><li>A condition, the expression selected when true, and the expression selected when false.</li><li>Because <code>=</code> assigns a value, while <code>==</code> compares two values.</li></ol>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech Editor's Note:<br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full" style="text-align:center"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" style="width:72vw;max-width:1170px;height:auto;display:block;margin-left:auto;margin-right:auto"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->