# OSC++.030: std::variant — Type-Safe Alternatives

- WordPress post ID: 25090
- Canonical URL: https://bitcoinversus.tech/2026/10/14/oscpp-030-std-variant-type-safe-alternatives/
- Featured media ID: 25086
- Featured image: 1200×630
- Archive format: final Gutenberg source

## Final Gutenberg Source

<!-- wp:paragraph -->
<p><code>std::variant</code> is a C++ standard-library type that stores exactly one value from a fixed list of possible types. If a program needs a value that can legally be an <code>int</code>, <code>double</code>, or <code>std::string</code>, a declaration such as <code>std::variant&lt;int, double, std::string&gt;</code> expresses that design directly. Unlike a traditional union, the variant also tracks which alternative is currently active, making it a type-safe discriminated union.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=VZT2E8LAxCw","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=VZT2E8LAxCw
</div><figcaption class="wp-element-caption"><em>Mike Shah introduces std::variant as a type-safe tagged union in modern C++.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p>The type was added in C++17 through the <code>&lt;variant&gt;</code> header. The <a href="https://www.cppreference.com/cpp/utility/variant">cppreference std::variant reference</a> documents the current interface, while the original <a href="https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0088r3.html">WG21 P0088R3 proposal</a> describes the design goal: a type-safe union that makes the active alternative explicit and queryable.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Declaring and Assigning a Variant</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;string&gt;
#include &lt;variant&gt;

int main() {
    std::variant&lt;int, double, std::string&gt; value;

    value = 42;
    value = 3.14;
    value = std::string{"server-ready"};
}
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A default-constructed variant contains its first alternative when that type can be default constructed. In the example above, <code>value</code> begins as an <code>int</code> containing zero. Later assignments replace the active alternative. This differs from <a href="https://bitcoinversus.tech/2026/10/13/oscpp-029-std-optional-values-that-may-not-exist/">OSC++.029 on std::optional</a>: an optional models whether one type exists, while a variant models which one of several known types is active.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Checking the Active Type</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>std::variant&lt;int, double, std::string&gt; value = 42;

if (std::holds_alternative&lt;int&gt;(value)) {
    std::cout &lt;&lt; "integer\n";
}

std::cout &lt;&lt; "active index: " &lt;&lt; value.index() &lt;&lt; '\n';
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>std::holds_alternative&lt;T&gt;</code> asks whether the variant currently contains <code>T</code>. The <code>index()</code> member reports the zero-based alternative index. For <code>std::variant&lt;int, double, std::string&gt;</code>, index 0 means <code>int</code>, index 1 means <code>double</code>, and index 2 means <code>std::string</code>. Prefer type-based checks when the type itself communicates the design more clearly than an integer index.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Reading Values with get and get_if</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>std::variant&lt;int, double, std::string&gt; value = std::string{"ready"};

std::cout &lt;&lt; std::get&lt;std::string&gt;(value) &lt;&lt; '\n';

if (auto* text = std::get_if&lt;std::string&gt;(&amp;value)) {
    std::cout &lt;&lt; *text &lt;&lt; '\n';
}
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>std::get&lt;T&gt;</code> returns the stored value when <code>T</code> is active, but throws <code>std::bad_variant_access</code> when the requested type is not active. <code>std::get_if&lt;T&gt;</code> is the non-throwing alternative: it returns a pointer to the value when the type matches and <code>nullptr</code> otherwise. The exception behavior connects directly with <a href="https://bitcoinversus.tech/2026/10/02/oscpp-015-exception-handling-basics/">OSC++.015 on exception handling</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=gKbORJtnVu8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=gKbORJtnVu8
</div><figcaption class="wp-element-caption"><em>CppCon examines how std::variant can replace some forms of runtime polymorphism.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Using std::visit</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>std::visit</code> is the central dispatch mechanism for variant-based code. Instead of manually checking every possible type, a visitor provides behavior for the active alternative. This can make state machines, protocol messages, parsed values, configuration data, and other closed sets of types easier to model.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;string&gt;
#include &lt;variant&gt;

int main() {
    std::variant&lt;int, double, std::string&gt; value = 3.14;

    std::visit([](const auto&amp; item) {
        std::cout &lt;&lt; item &lt;&lt; '\n';
    }, value);
}
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The generic lambda above works because each listed type can be streamed with <code>operator&lt;&lt;</code>. More complex visitors can use overloaded lambdas or function objects to give each alternative different behavior. That approach is related to, but fundamentally different from, the virtual-function design introduced in <a href="https://bitcoinversus.tech/2026/10/03/oscpp-018-virtual-functions-polymorphism-basics/">OSC++.018 on runtime polymorphism</a>: variant dispatch operates over a closed, compile-time list of possible types.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=va9I2qivBOA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=va9I2qivBOA
</div><figcaption class="wp-element-caption"><em>Andrei Alexandrescu explores variant layout, construction, destruction, and performance implications at CppCon.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">std::monostate and Default Construction</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Sometimes none of the meaningful alternatives can be default constructed, or a program needs an explicit “nothing selected yet” state. <code>std::monostate</code> is a lightweight placeholder type for that purpose. A declaration such as <code>std::variant&lt;std::monostate, Config, Error&gt;</code> makes the first state intentionally empty-like while preserving variant semantics.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>struct Config {
    int port;
};

struct Error {
    std::string message;
};

std::variant&lt;std::monostate, Config, Error&gt; state;
</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">The valueless_by_exception State</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A variant normally holds exactly one alternative, but the standard permits a rare <code>valueless_by_exception</code> state if replacing one alternative with another throws during certain operations. Production code that stores types with throwing move or construction behavior should understand this possibility. The earlier lessons on move operations and exception guarantees are especially important when variants contain resource-owning classes.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/cpp/comments/1tzda95/your_stdlib_implementation_matters_more_than_the/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/cpp/comments/1tzda95/your_stdlib_implementation_matters_more_than_the/
</div><figcaption class="wp-element-caption"><em>Recent C++ community benchmarking shows that std::visit performance can vary substantially across standard-library implementations and compiler generations.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Compile and Run</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>g++ -std=c++17 -Wall -Wextra -pedantic variant_demo.cpp -o variant_demo
./variant_demo
</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>-std=c++17</code> flag is required because <code>std::variant</code> entered the standard library in C++17. Newer language modes such as C++20, C++23, or C++26 also provide the type, with later standards extending constexpr support and visitation capabilities.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Create a program named <code>sensor_value.cpp</code> with <code>std::variant&lt;int, double, std::string&gt;</code>. Store an integer temperature reading, a floating-point voltage, and a string status one at a time. For each value, use <code>std::visit</code> to print both the value and a label describing its type. Then add one test using <code>std::get_if</code> so the program safely checks for a string without throwing.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":2} -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>What problem does <code>std::variant</code> solve?</li><li>What does <code>holds_alternative&lt;T&gt;</code> test?</li><li>What is the difference between <code>std::get</code> and <code>std::get_if</code>?</li><li>What does <code>std::visit</code> do?</li><li>Why might <code>std::monostate</code> be placed first in a variant?</li><li>What does <code>valueless_by_exception()</code> report?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>It stores one value from a fixed set of possible types while tracking the active type safely.</li><li>It reports whether the variant currently contains the requested type.</li><li><code>std::get</code> returns the requested alternative and can throw on a mismatch; <code>std::get_if</code> returns a pointer or <code>nullptr</code>.</li><li>It invokes a callable with the currently active alternative.</li><li>It provides an explicit harmless default or empty-like state.</li><li>It reports whether the variant currently holds no alternative because an exception interrupted a state-changing operation.</li></ol>
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