<!-- wp:paragraph -->
<p><strong>Operators are the symbols that tell C what to do with values.</strong> Expressions combine variables, constants, function results, and operators to calculate new values, compare conditions, manipulate individual bits, and update program state.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/10/osc-002-c-variables-and-fundamental-types-declarations-initialization-integers-floating-point-char-const-and-sizeof/"><strong>OSC.002: C Variables and Fundamental Types</strong></a>. That lesson established what C values and types are. OSC.003 focuses on how those values interact inside expressions.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=5JXcX0IqRUo","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=5JXcX0IqRUo
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Neso Academy introduces arithmetic operators in C, including addition, subtraction, multiplication, division, remainder, precedence, and associativity.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An expression is like a small calculation written inside a program. In <code>total = price * quantity;</code>, C first forms the expression on the right, then stores its result in <code>total</code>. The symbols <code>=</code> and <code>*</code> are operators, while <code>price</code> and <code>quantity</code> are operands.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Use arithmetic operators correctly with integer and floating-point values.</li><li>Explain integer division and the remainder operator.</li><li>Use relational and equality operators to produce true/false results.</li><li>Use <code>&amp;&amp;</code>, <code>||</code>, and <code>!</code> and explain short-circuit evaluation.</li><li>Distinguish logical operators from bitwise operators.</li><li>Use compound assignment without confusing it with comparison.</li><li>Read operator precedence and associativity correctly.</li><li>Explain why precedence does not define the complete runtime evaluation order of subexpressions.</li><li>Avoid expressions whose behavior is undefined because the same object is modified without a defined sequencing relationship.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Arithmetic Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The basic arithmetic operators are <code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>, and <code>%</code>. The first four perform addition, subtraction, multiplication, and division. The remainder operator <code>%</code> is defined for integer operands and returns the remainder after integer division.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int a = 10;
int b = 3;

int sum = a + b;        // 13
int difference = a - b; // 7
int product = a * b;    // 30
int quotient = a / b;   // 3
int remainder = a % b;  // 1</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>When both operands of <code>/</code> are integers, C performs integer division. The fractional part is discarded toward zero. Therefore <code>10 / 3</code> produces <code>3</code>, not <code>3.333...</code>. If at least one operand has a floating-point type, the calculation is performed using the usual arithmetic conversions appropriate to the operands.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>double q1 = 10 / 3;      // 3.0 because integer division happens first
double q2 = 10.0 / 3.0;  // approximately 3.333333</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Relational and Equality Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>C uses <code>&lt;</code>, <code>&lt;=</code>, <code>&gt;</code>, <code>&gt;=</code>, <code>==</code>, and <code>!=</code> to compare values. A comparison expression produces an integer result: zero represents false and one represents true for these operators.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int temperature = 72;

int warm = temperature &gt; 70;
int exactly_72 = temperature == 72;
int not_freezing = temperature != 32;</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=1oKRTjw0yuY","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=1oKRTjw0yuY
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Neso Academy demonstrates relational operators and the difference among equality and ordering comparisons.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A common beginner bug is confusing assignment with comparison. <code>x = 5</code> assigns the value 5 to <code>x</code>. <code>x == 5</code> compares <code>x</code> with 5. Compilers can warn about suspicious assignments inside conditions when warning options such as <code>-Wall -Wextra</code> are enabled.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Logical Operators and Short-Circuit Evaluation</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The logical operators are <code>&amp;&amp;</code> for logical AND, <code>||</code> for logical OR, and <code>!</code> for logical NOT. C treats zero as false and any nonzero scalar value as true in a logical context. The result of these logical operators is either 0 or 1.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int powered = 1;
int network_ok = 1;

if (powered &amp;&amp; network_ok) {
    /* both conditions are true */
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>&amp;&amp;</code> and <code>||</code> are short-circuit operators. For <code>A &amp;&amp; B</code>, C evaluates <code>B</code> only if <code>A</code> is true. For <code>A || B</code>, C evaluates <code>B</code> only if <code>A</code> is false. This behavior can safely guard operations that would otherwise be invalid.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>if (x != 0 &amp;&amp; (100 / x) &gt; 5) {
    /* division occurs only when x is nonzero */
}</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=WGQRInmOBM8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=WGQRInmOBM8
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Neso Academy explains C logical operators and short-circuit behavior.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Bitwise Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bitwise operators work on the individual bits of integer operands. They include <code>&amp;</code> for bitwise AND, <code>|</code> for bitwise OR, <code>^</code> for bitwise XOR, <code>~</code> for bitwise complement, and <code>&lt;&lt;</code> and <code>&gt;&gt;</code> for shifts.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>unsigned int flags = 0x05;   // binary ...0101
unsigned int mask  = 0x01;

int bit0_set = (flags &amp; mask) != 0;
flags |= 0x08;   // set bit 3
flags &amp;= ~0x01u; // clear bit 0</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Do not confuse <code>&amp;</code> with <code>&amp;&amp;</code>, or <code>|</code> with <code>||</code>. The bitwise forms operate on bits and evaluate both operands. The logical forms interpret operands as true/false conditions and can short-circuit.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=jlQmeyce65Q","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=jlQmeyce65Q
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Neso Academy introduces bitwise AND, OR, complement, and the distinction between bitwise and logical operators.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Assignment and Compound Assignment</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The assignment operator <code>=</code> stores a value in a modifiable object. C also provides compound assignment forms such as <code>+=</code>, <code>-=</code>, <code>*=</code>, <code>/=</code>, <code>%=</code>, <code>&amp;=</code>, <code>|=</code>, <code>^=</code>, <code>&lt;&lt;=</code>, and <code>&gt;&gt;=</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int count = 10;
count += 5;  // count becomes 15
count *= 2;  // count becomes 30</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=zv73Qv1GdwY","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=zv73Qv1GdwY
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Neso Academy covers ordinary and shorthand assignment operators in C.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Precedence and Associativity</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Operator precedence determines how tokens in an expression are grouped when parentheses do not state the grouping explicitly. For example, multiplication binds more tightly than addition, so <code>a + b * c</code> is parsed as <code>a + (b * c)</code>. Parentheses are often the clearest way to show intended grouping.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Associativity matters when operators of the same precedence appear together. Addition and subtraction associate left to right, so <code>a - b - c</code> groups as <code>(a - b) - c</code>. Assignment associates right to left, so <code>x = y = 0</code> groups as <code>x = (y = 0)</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=8H9G621pQq0","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=8H9G621pQq0
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Neso Academy explains C operator precedence, associativity, parentheses, and common increment/decrement cases.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Precedence Is Not Evaluation Order</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This distinction is important. Precedence tells the compiler how an expression is grouped syntactically; it does <strong>not</strong> generally specify the order in which independent operand subexpressions are evaluated. In an expression such as <code>f() + g() * h()</code>, multiplication has higher precedence than addition, but that does not by itself require the calls to occur in the order <code>g()</code>, <code>h()</code>, then <code>f()</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/C_Programming/comments/1bzohxb/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/C_Programming/comments/1bzohxb/
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>A C programming discussion highlights an important standards point: prefix and postfix operators have defined precedence relationships, but precedence should not be confused with runtime sequencing.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Avoid Undefined Side-Effect Expressions</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>C gives programmers considerable freedom, but some compact expressions are not portable because they modify and access the same object without the sequencing required by the language rules. Code such as <code>i = i++ + ++i;</code> should not be treated as a puzzle to solve by operator precedence. Its behavior is undefined.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Prefer clear, separately sequenced statements:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>i++;
int next = i + 1;
i = next;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Readable C is usually better C. Parentheses and separate statements make the programmer's intent visible and reduce reliance on memorizing a long precedence table.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical Exercise</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a file named <code>operators.c</code>.</li><li>Declare two integers and one floating-point variable.</li><li>Print the results of <code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>, and <code>%</code> for the integers.</li><li>Repeat division using floating-point operands and compare the result.</li><li>Create three comparison expressions and print their integer results.</li><li>Write one short-circuit condition that safely guards division by zero.</li><li>Use a bit mask to test, set, and clear one bit in an unsigned integer.</li><li>Write one expression that depends on precedence, then rewrite it with explicit parentheses.</li><li>Compile with <code>gcc -Wall -Wextra -Wpedantic operators.c -o operators</code>.</li><li>Remove every compiler warning before considering the exercise complete.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What does <code>10 / 3</code> produce when both operands are <code>int</code>?</li><li>What is the difference between <code>=</code> and <code>==</code>?</li><li>What does <code>%</code> compute?</li><li>What values represent false and true in C logical contexts?</li><li>Why can <code>&amp;&amp;</code> safely guard a division operation?</li><li>What is the difference between <code>&amp;</code> and <code>&amp;&amp;</code>?</li><li>How does <code>a + b * c</code> group?</li><li>Does operator precedence fully determine the runtime evaluation order of independent subexpressions?</li><li>Why is <code>i = i++ + ++i;</code> not a valid precedence exercise?</li><li>What compiler options used in this lesson help expose suspicious code?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><code>3</code>, because integer division discards the fractional part toward zero.</li><li><code>=</code> assigns a value; <code>==</code> compares two values for equality.</li><li>The remainder from integer division.</li><li>Zero is false; nonzero scalar values are treated as true. Logical operators themselves produce 0 or 1.</li><li>The right operand is evaluated only if the left operand is true.</li><li><code>&amp;</code> is bitwise AND; <code>&amp;&amp;</code> is logical AND and short-circuits.</li><li><code>a + (b * c)</code>.</li><li>No. Precedence determines grouping, not the complete order of independent operand evaluation.</li><li>It modifies the same object multiple times without the required sequencing, producing undefined behavior.</li><li><code>-Wall -Wextra -Wpedantic</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Arithmetic.html">GNU C Language Manual — Arithmetic</a></li><li><a href="https://en.cppreference.com/w/c/language/operator_precedence">cppreference — C Operator Precedence</a></li><li><a href="https://en.cppreference.com/w/c/language/operator_logical">cppreference — Logical Operators</a></li><li><a href="https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf">ISO/IEC 9899 Committee Draft N1570 — Expressions</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Operators tell C how values should interact.</strong> Arithmetic operators calculate, comparison operators test, logical operators combine conditions, bitwise operators manipulate individual bits, and assignment operators update objects. Precedence determines how expressions group, but it should never be confused with full evaluation order. When an expression becomes difficult to read, use parentheses or split it into simpler statements.</p>
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

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech provides technical education and analysis for informational purposes only.</em></p>
<!-- /wp:paragraph -->