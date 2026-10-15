# OSGo.003: Operators and Expressions — Arithmetic, Comparison, Logic, Assignment, and Bitwise Operations

- WordPress post ID: 25314
- Canonical URL: https://bitcoinversus.tech/2026/10/14/osgo-003-operators-expressions-arithmetic-comparison-logic-assignment-bitwise/
- Featured media ID: 25313
- Featured image: 1200×630
- Archive format: final Gutenberg source

## Final Gutenberg Source

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Operators tell Go what computation to perform on values.</strong> Arithmetic operators calculate, comparison operators produce Boolean results, logical operators combine conditions, assignment operators update variables, and bitwise operators work directly with integer bits. Expressions combine values, operators, function calls, and other language elements into something Go can evaluate.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/10/osgo-002-variables-constants-zero-values-and-basic-types-var-int-float64-bool-string-byte-and-rune/"><strong>OSGo.002: Variables, Constants, Zero Values, and Basic Types</strong></a>. OSGo.002 introduced the values operators act on; OSGo.003 focuses on how those values are combined and transformed.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=VSCZmSqaVDQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=VSCZmSqaVDQ
</div><figcaption class="wp-element-caption"><em>John Elder introduces arithmetic, assignment, increment/decrement, and comparison operators in Go.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Use Go arithmetic operators: +, -, *, /, and %.</li><li>Explain integer division.</li><li>Use ==, !=, &lt;, &lt;=, &gt;, and &gt;= for comparisons.</li><li>Combine Boolean conditions with &amp;&amp;, ||, and !.</li><li>Use = and compound assignments such as += and *=.</li><li>Understand why ++ and &#045;&#045; are statements rather than expressions.</li><li>Use bitwise &amp;, |, ^, &amp;^, &lt;&lt;, and &gt;&gt; with integer values.</li><li>Recognize how precedence affects larger expressions.</li><li>Explain why Go intentionally has no ?: ternary operator.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Arithmetic Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Go uses familiar arithmetic operators. Addition uses +, subtraction uses -, multiplication uses *, division uses /, and remainder uses %. The operand types determine the type and behavior of the result.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Example:</strong><br>a := 17<br>b := 5<br>fmt.Println(a + b) &nbsp; // 22<br>fmt.Println(a &#045; b) &nbsp; // 12<br>fmt.Println(a * b) &nbsp; // 85<br>fmt.Println(a / b) &nbsp; // 3<br>fmt.Println(a % b) &nbsp; // 2</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Because both operands in a / b are integers, Go performs integer division and discards the fractional part. To produce a floating-point result, use floating-point operands or perform an explicit conversion when appropriate.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Floating-point example:</strong><br>x := 17.0<br>y := 5.0<br>fmt.Println(x / y) &nbsp; // 3.4</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Comparison Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Comparison expressions answer questions and produce a Boolean result. Go provides == for equality, != for inequality, &lt; and &gt; for ordering, and &lt;= and &gt;= for inclusive comparisons.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Example:</strong><br>temperature := 82<br>fmt.Println(temperature == 82) &nbsp; // true<br>fmt.Println(temperature != 82) &nbsp; // false<br>fmt.Println(temperature &gt; 75) &nbsp; // true<br>fmt.Println(temperature &lt;= 90) &nbsp; // true</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Rd3adYB1Msk","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Rd3adYB1Msk
</div><figcaption class="wp-element-caption"><em>Philomathia demonstrates comparison and logical operators in Go with Boolean expressions.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Logical Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The logical operators work with Boolean values. The operator &amp;&amp; means logical AND, || means logical OR, and ! means logical NOT. Go evaluates &amp;&amp; and || from left to right and only evaluates the right side when the result still depends on it. This behavior is called short-circuit evaluation and is defined by the current <a href="https://go.dev/ref/spec"><strong>Go language specification</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Example:</strong><br>online := true<br>temperature := 78<br>safe := online &amp;&amp; temperature &lt; 85<br>alert := !online || temperature &gt;= 85<br>fmt.Println(safe)<br>fmt.Println(alert)</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=fUr9BQn3ryI","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=fUr9BQn3ryI
</div><figcaption class="wp-element-caption"><em>BRO-IT demonstrates comparison, AND, OR, and NOT logic in Go.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Assignment and Compound Assignment</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The assignment operator = stores a value in an already-declared variable. Compound assignment combines an operation with assignment. For example, x += 3 is shorthand for x = x + 3.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Example:</strong><br>power := 100<br>power += 25<br>power -= 10<br>power *= 2<br>power /= 5<br>fmt.Println(power)</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not confuse = with :=. The short declaration operator := declares at least one new variable in the current scope, while = assigns to variables that already exist. That distinction builds directly on <a href="https://bitcoinversus.tech/2026/10/08/osgo-001-what-is-go-packages-toolchain-go-run-go-build-first-program/"><strong>OSGo.001: What Is Go?</strong></a> and the variable rules introduced in OSGo.002.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Increment and Decrement</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Go supports postfix increment and decrement statements: x++ and x&#045;&#045;. Unlike C, C++, Java, or JavaScript, these are statements rather than expressions. You cannot place x++ inside a larger expression or use a prefix form such as ++x.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Example:</strong><br>count := 10<br>count++<br>count&#045;&#045;<br>fmt.Println(count)</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The Go FAQ explains that removing ++ and &#045;&#045; from the expression hierarchy avoids complicated order-of-evaluation cases and keeps expression syntax simpler.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Bitwise Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bitwise operations work on integer representations. Go provides &amp; for bitwise AND, | for OR, ^ for XOR, &amp;^ for AND NOT or bit clear, &lt;&lt; for left shift, and &gt;&gt; for right shift. These operations become especially useful in networking, embedded systems, masks, registers, binary protocols, and low-level data processing.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Example:</strong><br>a := uint8(12) &nbsp; // binary 00001100<br>b := uint8(10) &nbsp; // binary 00001010<br>fmt.Println(a &amp; b)<br>fmt.Println(a | b)<br>fmt.Println(a ^ b)<br>fmt.Println(a &lt;&lt; 1)<br>fmt.Println(a &gt;&gt; 1)</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=RhBXMnJHdZw","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=RhBXMnJHdZw
</div><figcaption class="wp-element-caption"><em>ProgrammingKnowledge’s Go course includes integer types, bitwise operators, shifts, and later control-flow topics.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Operator Precedence</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When an expression contains several operators, precedence determines which operation binds first. Multiplication, division, remainder, shifts, and several bitwise operators bind more tightly than addition and subtraction. Comparison operators bind below arithmetic, while &amp;&amp; binds more tightly than ||. Parentheses should be used whenever they make intent clearer.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Example:</strong><br>result := 2 + 3*4<br>fmt.Println(result) &nbsp; // 14<br><br>explicit := (2 + 3) * 4<br>fmt.Println(explicit) &nbsp; // 20</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Go Has No Ternary Operator</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Go intentionally does not provide the C-style conditional operator condition ? trueValue : falseValue. The <a href="https://go.dev/doc/faq"><strong>official Go FAQ</strong></a> says the language designers preferred the clearer if/else form because ternary expressions can become difficult to read when they grow or nest.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Go form:</strong><br>status := "offline"<br>if online {<br>&nbsp;&nbsp;&nbsp;&nbsp;status = "online"<br>}<br>fmt.Println(status)</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/golang/comments/1jjgxr0/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/golang/comments/1jjgxr0/
</div><figcaption class="wp-element-caption"><em>A Go community discussion—written humorously—shows why the absence of a ternary operator remains a recurring language-design topic.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Expressions and Type Compatibility</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Go is strongly typed, so operands generally must be compatible with the operator being used. A Boolean cannot be added to an integer, and a string cannot be multiplied by a number. Explicit conversion is required when a calculation legitimately crosses numeric types.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Example:</strong><br>count := 5<br>ratio := 2.5<br>total := float64(count) * ratio<br>fmt.Println(total)</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This same principle appears across statically typed languages. Compare it with <a href="https://bitcoinversus.tech/2026/10/14/oscsharp-003-csharp-operators-expressions-precedence/"><strong>OSC#.003: C# Operators and Expressions</strong></a> to see which operator ideas transfer between languages and which rules are specific to Go.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a project with go mod init operatorslab.</li><li>Create two integer variables and print their sum, difference, product, quotient, and remainder.</li><li>Compare the two values with ==, !=, &lt;, and &gt;.</li><li>Create two Boolean conditions and combine them with &amp;&amp;, ||, and !.</li><li>Use += and *= to update an integer variable.</li><li>Use ++ once and &#045;&#045; once as standalone statements.</li><li>Choose two uint8 values and test &amp;, |, ^, &lt;&lt;, and &gt;&gt;.</li><li>Create one expression where parentheses intentionally change the result.</li><li>Write a normal if/else block where another language might use a ternary operator.</li><li>Run gofmt, go vet, and go run .</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What does % calculate?</li><li>Why does 17 / 5 produce 3 when both operands are integers?</li><li>Which operator tests equality?</li><li>What is the difference between &amp;&amp; and ||?</li><li>What is the difference between = and :=?</li><li>Can x++ be embedded inside a larger Go expression?</li><li>What does &amp;^ do?</li><li>Why are parentheses useful even when you know precedence rules?</li><li>Does Go provide a ?: ternary operator?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>The remainder after integer division.</li><li>Integer division produces an integer result and discards the fractional portion.</li><li>==.</li><li>&amp;&amp; requires both Boolean operands to be true; || requires at least one to be true.</li><li>= assigns to existing variables; := is the short variable declaration form and must introduce at least one new variable in the current scope.</li><li>No. ++ and &#045;&#045; are statements, not expressions.</li><li>It performs bit clear, also described as AND NOT.</li><li>They make evaluation order and programmer intent explicit.</li><li>No. Go intentionally uses if/else instead.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://go.dev/ref/spec"><strong>The Go Programming Language Specification</strong></a></li><li><a href="https://go.dev/doc/faq"><strong>Go Frequently Asked Questions</strong></a></li><li><a href="https://go.dev/tour/list"><strong>A Tour of Go</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Go’s operator system is intentionally compact. Arithmetic transforms numeric values, comparisons produce Boolean answers, logical operators combine decisions, assignment changes program state, and bitwise operations expose integer bits directly. Go also removes some expression complexity found in related languages: ++ and &#045;&#045; are statements, and there is no ternary operator. Learn these rules now and later control-flow, networking, concurrency, and systems code will read much more naturally.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech Editor's Note:<br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full" style="text-align:center"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" style="width:72vw;max-width:1170px;height:auto;display:block;margin-left:auto;margin-right:auto" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->