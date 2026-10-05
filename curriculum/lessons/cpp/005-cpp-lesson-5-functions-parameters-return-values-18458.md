---
title: "OSC++.005: Functions, Parameters, and Return Values"
wordpress_post_id: 18458
source: BitcoinVersus.tech
published: 2026-09-24T21:11:15
modified: 2026-09-30T20:09:20
live_url: https://bitcoinversus.tech/2026/09/24/cpp-lesson-5-functions-parameters-return-values/
track: cpp
lesson_number: 5
raw_source: 005-cpp-lesson-5-functions-parameters-return-values-18458.gutenberg.html
---

<!-- wp:paragraph --><p>C++ functions let you package a task into a reusable block of code. Instead of repeating the same math or logic throughout a program, you can give that operation a name, pass information into it through parameters, and return a result.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">A simple function</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>int add(int a, int b) {
    return a + b;
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Here, <code>int</code> is the return type, <code>add</code> is the function name, and <code>a</code> and <code>b</code> are parameters. The <code>return</code> statement sends the calculated value back to the code that called the function.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Calling the function</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;

int add(int a, int b) {
    return a + b;
}

int main() {
    int total = add(12, 8);
    std::cout &lt;&lt; total &lt;&lt; '\n';
    return 0;
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The values <code>12</code> and <code>8</code> are arguments. When the function runs, those arguments initialize the parameters <code>a</code> and <code>b</code>. The function returns <code>20</code>, which is stored in <code>total</code>.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Parameters versus arguments</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A parameter is the variable named in a function declaration or definition. An argument is the value or expression supplied when the function is called. Keeping those terms separate makes larger programs easier to discuss and debug.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">A practical electrical example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;

double power_kw(double volts, double amps) {
    return (volts * amps) / 1000.0;
}

int main() {
    double kw = power_kw(240.0, 20.0);
    std::cout &lt;&lt; kw &lt;&lt; " kW\n";
    return 0;
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>This function accepts voltage and current as parameters and returns calculated power in kilowatts. With 240 volts and 20 amps, the result is 4.8 kW for this simple DC or unity-power-factor example. Real AC power calculations may also require power factor and phase considerations.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Functions that return nothing</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>void show_status() {
    std::cout &lt;&lt; "System online\n";
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>void</code> return type means the function does not return a value to its caller. It can still perform work such as printing information or updating program state.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Why functions matter</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Functions make programs easier to organize, test, reuse, and troubleshoot. A larger application can separate calculations, hardware checks, user-interface behavior, networking, and other jobs into clearly named functions rather than placing everything inside <code>main()</code>.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Quick practice</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Create a function named <code>watts</code> that accepts voltage and current and returns watts. Then create another function named <code>is_over_limit</code> that accepts a measured value and a limit and returns a Boolean result.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">References</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>For deeper study, see the C++ function documentation at <a href="https://en.cppreference.com/w/cpp/language/functions">cppreference</a> and <a href="https://learn.microsoft.com/en-us/cpp/cpp/functions-cpp?view=msvc-170">Microsoft Learn</a>.</p><!-- /wp:paragraph -->
<!-- wp:separator --><hr class="wp-block-separator has-alpha-channel-opacity" /><!-- /wp:separator -->
<!-- wp:paragraph --><p><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><a href="https://x.com/1BitcoinVersus/status/1937006164555993338">BitcoinVersus.Tech on X</a></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->