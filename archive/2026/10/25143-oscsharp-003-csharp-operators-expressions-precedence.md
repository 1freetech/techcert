# OSC#.003: C# Operators and Expressions — Arithmetic, Assignment, Comparison, Logic, and Precedence

- WordPress post ID: 25143
- Canonical URL: https://bitcoinversus.tech/2026/10/14/oscsharp-003-csharp-operators-expressions-precedence/
- Featured media ID: 25132
- Featured image: 1200×630 unique original art
- Archive format: final Gutenberg source

## Final Gutenberg Source

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>An operator tells C# what operation to perform on one or more values.</strong> The values are operands, and the combination of operators and operands forms an expression. C# uses operators for arithmetic, comparison, assignment, Boolean logic, incrementing values, null handling, and many other tasks.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson continues directly from <a href="https://bitcoinversus.tech/2026/10/14/oscsharp-002-csharp-variables-built-in-types-var-const/"><strong>OSC#.002: C# Variables and Built-In Types</strong></a>. It also builds on the toolchain established in <a href="https://bitcoinversus.tech/2026/10/09/oscsharp-001-dotnet-sdk-compiler-install-verify-create-build-run-csharp-toolchain/"><strong>OSC#.001: .NET SDK and Compiler</strong></a> and the runtime foundation introduced in <a href="https://bitcoinversus.tech/2026/10/08/osdotnet-001-what-is-dotnet-platform-runtime-sdk-libraries/"><strong>OSDotNet.001: What Is .NET?</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>How arithmetic operators work with numeric types.</li><li>How assignment and compound-assignment operators update variables.</li><li>How comparison operators produce Boolean results.</li><li>How <code>&amp;&amp;</code>, <code>||</code>, and <code>!</code> implement Boolean logic.</li><li>Why <code>&amp;&amp;</code> and <code>||</code> short-circuit.</li><li>How prefix and postfix <code>++</code> and <code>--</code> differ inside larger expressions.</li><li>How the conditional operator <code>?:</code> selects one of two values.</li><li>How <code>??</code> and <code>??=</code> help with nullable values.</li><li>How operator precedence and parentheses determine evaluation order.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Arithmetic Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The basic arithmetic operators are <code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>, and <code>%</code>. The remainder operator <code>%</code> returns the remainder after division and is useful for tasks such as detecting even and odd numbers or cycling through fixed ranges.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int a = 17;
int b = 5;

Console.WriteLine(a + b); // 22
Console.WriteLine(a - b); // 12
Console.WriteLine(a * b); // 85
Console.WriteLine(a / b); // 3
Console.WriteLine(a % b); // 2</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Because both operands in <code>a / b</code> are integers, integer division discards the fractional part. To preserve a fraction, at least one operand must use a floating-point or decimal type.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>double ratio = 17.0 / 5;
Console.WriteLine(ratio); // 3.4</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=k1ivOkhxxdw","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=k1ivOkhxxdw
</div><figcaption class="wp-element-caption"><em>Bro Code demonstrates C# arithmetic operators and compound updates with beginner-friendly examples.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Assignment and Compound Assignment</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The simple assignment operator <code>=</code> stores the value produced by the right-hand expression in the left-hand variable. Compound assignment operators combine an operation with assignment. For example, <code>x += 5</code> means “add five to x and store the result back in x.”</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int miners = 100;

miners += 20; // 120
miners -= 5;  // 115
miners *= 2;  // 230
miners /= 10; // 23
miners %= 6;  // 5

Console.WriteLine(miners);</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>C# also provides compound operators for bitwise and shift operations such as <code>&amp;=</code>, <code>|=</code>, <code>^=</code>, <code>&lt;&lt;=</code>, and <code>&gt;&gt;=</code>. Those become more important in later lessons on systems, flags, binary data, and hardware-oriented programming.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Comparison Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Comparison operators evaluate relationships between values and produce <code>true</code> or <code>false</code>. The common operators are <code>==</code>, <code>!=</code>, <code>&lt;</code>, <code>&gt;</code>, <code>&lt;=</code>, and <code>&gt;=</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int temperature = 78;

bool hot = temperature &gt; 75;
bool exact = temperature == 78;
bool safe = temperature &lt;= 85;
bool different = temperature != 70;

Console.WriteLine(hot);
Console.WriteLine(exact);
Console.WriteLine(safe);
Console.WriteLine(different);</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Do not confuse <code>=</code> with <code>==</code>. The first assigns a value; the second asks whether two operands are equal. C# catches many accidental assignment mistakes because an assignment expression must still produce a type that is valid in the surrounding context.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=rCwW52uWAqY","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=rCwW52uWAqY
</div><figcaption class="wp-element-caption"><em>Just Pick and Learn reviews the C# comparison operators used to build Boolean expressions.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Boolean Logical Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For Boolean values, <code>&amp;&amp;</code> means logical AND, <code>||</code> means logical OR, and <code>!</code> means logical NOT. These operators let programs combine smaller conditions into larger expressions.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>bool powerAvailable = true;
bool coolingHealthy = true;
bool maintenanceMode = false;

bool canRun = powerAvailable &amp;&amp; coolingHealthy &amp;&amp; !maintenanceMode;
Console.WriteLine(canRun);</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>&amp;&amp;</code> and <code>||</code> are conditional logical operators. They short-circuit: if the left side of <code>&amp;&amp;</code> is already false, the right side is not evaluated; if the left side of <code>||</code> is already true, the right side is not evaluated. That behavior can improve efficiency and can also prevent invalid operations such as dereferencing a value that was first checked for null.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>string? status = null;

if (status != null &amp;&amp; status.Length &gt; 0)
{
    Console.WriteLine(status);
}</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=SvD3m4apJZ4","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=SvD3m4apJZ4
</div><figcaption class="wp-element-caption"><em>Dani Krossing explains logical operators in C# and how they combine conditions.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:embed {"url":"https://www.reddit.com/r/csharp/comments/1wx2imd/equal_precedence/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/csharp/comments/1wx2imd/equal_precedence/
</div><figcaption class="wp-element-caption"><em>Recent r/csharp discussion shows why precedence becomes important when logical operators are combined inside larger expressions.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Increment and Decrement</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The increment operator <code>++</code> adds one, while <code>--</code> subtracts one. When used by themselves as statements, prefix and postfix forms appear to do the same thing. Inside a larger expression, however, the difference matters.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int x = 5;
int a = x++; // a gets 5, then x becomes 6

int y = 5;
int b = ++y; // y becomes 6, then b gets 6

Console.WriteLine($"x={x}, a={a}");
Console.WriteLine($"y={y}, b={b}");</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Postfix returns the old value before the increment or decrement takes effect in the surrounding expression. Prefix updates the variable first and then produces the new value. Avoid compressing too many side effects into one expression; readable code is usually easier to verify.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Conditional Operator</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The conditional operator <code>?:</code> is C#’s ternary operator. It evaluates a Boolean condition and chooses one of two expressions.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>double temperature = 84.5;
string state = temperature &gt; 80 ? "hot" : "normal";

Console.WriteLine(state);</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Use the conditional operator when the choice is simple and value-oriented. If the logic requires several statements, nested decisions, or substantial side effects, an <code>if</code>/<code>else</code> statement will usually be clearer.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Null-Coalescing Operators</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The null-coalescing operator <code>??</code> supplies a fallback when the left operand is null. The null-coalescing assignment operator <code>??=</code> assigns a value only when the left side is currently null.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>string? rackName = null;
string displayName = rackName ?? "Unassigned Rack";

rackName ??= "Rack A";

Console.WriteLine(displayName);
Console.WriteLine(rackName);</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>These operators are especially useful in modern C# because nullable reference types make null handling explicit. Later lessons will cover nullable types, null-conditional access with <code>?.</code>, and more advanced pattern matching in greater depth.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Operator Precedence and Associativity</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When several operators appear in one expression, precedence determines which operators bind more tightly. Multiplication and division bind more tightly than addition and subtraction, so <code>3 + 4 * 2</code> evaluates to <code>11</code>. Parentheses override the normal precedence and communicate intent directly to the reader.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>int first = 3 + 4 * 2;      // 11
int second = (3 + 4) * 2;    // 14

Console.WriteLine(first);
Console.WriteLine(second);</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Associativity resolves operators at the same precedence level. Many binary operators associate left to right, while assignment and the conditional operator associate right to left. Microsoft’s C# reference notes another important rule: operand expressions are generally evaluated from left to right even though operator precedence determines how the results are grouped.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=aa02O_neyGs","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=aa02O_neyGs
</div><figcaption class="wp-element-caption"><em>ScholarHat demonstrates C# operator precedence and the effect of evaluation order in compound expressions.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Compile and Run</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>dotnet new console -n OperatorLab
cd OperatorLab

dotnet build
dotnet run</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Use one small example at a time in <code>Program.cs</code>. Predict the result before running the program, then compare your prediction with the actual output. That habit is one of the fastest ways to build intuition for precedence, short-circuiting, and integer division.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create two integer variables and print their sum, difference, product, quotient, and remainder.</li><li>Use at least three compound-assignment operators to update one of the variables.</li><li>Create two comparison expressions and store their results in <code>bool</code> variables.</li><li>Combine two Boolean expressions with <code>&amp;&amp;</code>, then combine two with <code>||</code>.</li><li>Create one prefix and one postfix increment example and print both the variable and expression result.</li><li>Use <code>?:</code> to convert a temperature comparison into the string <code>"hot"</code> or <code>"normal"</code>.</li><li>Create a nullable string and use <code>??</code> to provide a fallback.</li><li>Write one expression whose result changes when parentheses are added, then explain why.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What does the remainder operator <code>%</code> return?</li><li>Why does <code>17 / 5</code> produce <code>3</code> when both operands are integers?</li><li>What is the difference between <code>=</code> and <code>==</code>?</li><li>What does <code>&amp;&amp;</code> mean?</li><li>What does short-circuiting mean for <code>&amp;&amp;</code> and <code>||</code>?</li><li>How do prefix and postfix <code>++</code> differ inside a larger expression?</li><li>What problem does <code>??</code> solve?</li><li>Why are parentheses useful even when you know C# precedence rules?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>The remainder left after division.</li><li>Integer division discards the fractional portion of the mathematical result.</li><li><code>=</code> assigns; <code>==</code> compares for equality.</li><li>Logical AND: both Boolean operands must evaluate to true for the result to be true.</li><li>The right operand may not be evaluated when the left operand already determines the final result.</li><li>Postfix produces the old value before incrementing; prefix increments first and then produces the new value.</li><li>It supplies a fallback when the left operand is null.</li><li>They make grouping explicit, can intentionally override precedence, and improve readability.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/operators"><strong>Microsoft Learn — C# operators and expressions</strong></a></li><li><a href="https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/expressions/"><strong>Microsoft Learn — C# expressions overview</strong></a></li><li><a href="https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/language-specification/expressions"><strong>C# Language Specification — Expressions</strong></a></li><li><a href="https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/operators/boolean-logical-operators"><strong>Microsoft Learn — Boolean logical operators</strong></a></li><li><a href="https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/operators/null-coalescing-operator"><strong>Microsoft Learn — Null-coalescing operators</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>C# expressions are built from values and operators.</strong> Arithmetic operators calculate, comparison operators return Boolean results, assignment operators update variables, and logical operators combine conditions. Learn the short-circuit behavior of <code>&amp;&amp;</code> and <code>||</code>, be careful with prefix versus postfix increment, and use parentheses whenever they make an expression easier to read. Understanding these rules makes every later lesson on control flow, loops, methods, collections, and object-oriented programming easier.</p>
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