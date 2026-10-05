---
title: "OSC++.006: References and Pass by Reference"
wordpress_post_id: 18573
source: BitcoinVersus.tech
published: 2026-09-25T23:06:10
modified: 2026-09-30T20:09:16
live_url: https://bitcoinversus.tech/2026/09/25/cpp-lesson-6-references-pass-by-reference/
track: cpp
lesson_number: 6
raw_source: 006-cpp-lesson-6-references-pass-by-reference-18573.gutenberg.html
---

<!-- wp:paragraph --><p>C++ Lesson 6 continues directly from Lesson 5's functions and parameters by introducing references and pass-by-reference. References let a function work with an existing object instead of receiving a separate copy.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">What is a reference?</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>int value = 10;
int&amp; reference = value;

reference = 25;
// value is now 25</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>&amp;</code> in the declaration makes <code>reference</code> an lvalue reference to <code>value</code>. Changing the referenced object through that reference changes the original object.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Pass by value</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>void addOne(int number) {
    number++;
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Here, the function receives its own parameter value. Changing <code>number</code> does not change the caller's original integer.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Pass by reference</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>void addOne(int&amp; number) {
    number++;
}

int main() {
    int count = 5;
    addOne(count);
    // count is now 6
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>With <code>int&amp;</code>, the function parameter refers to the caller's object. This is useful when a function is intentionally supposed to modify an argument.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Read-only references with const</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>void printName(const std::string&amp; name) {
    std::cout &lt;&lt; name &lt;&lt; '\n';
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>A <code>const</code> reference can avoid an unnecessary copy while preventing the function from modifying the object through that reference. This pattern is common when passing strings, containers, and other objects that may be more expensive to copy than a small primitive value.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Practical example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;

void updateTemperature(double&amp; temperature, double adjustment) {
    temperature += adjustment;
}

int main() {
    double sensorReading = 72.5;
    updateTemperature(sensorReading, -2.0);

    std::cout &lt;&lt; sensorReading &lt;&lt; '\n';
    return 0;
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The function changes the original <code>sensorReading</code>, so the program prints <code>70.5</code>. The same concept applies to configuration objects, device state, counters, simulation data, and many other real programs.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Reference material</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><a href="https://en.cppreference.com/w/cpp/language/reference">cppreference: References</a></p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video lesson</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IzoFn3dfsPA","type":"video","providerNameSlug":"youtube"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=IzoFn3dfsPA</div></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong>Key takeaway:</strong> pass by value creates an independent parameter value, a non-const reference can let a function modify the original object, and a const reference provides read-only access without requiring the same kind of object copy.</p><!-- /wp:paragraph -->