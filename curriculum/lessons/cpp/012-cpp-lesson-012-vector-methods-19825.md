---
title: "OSC++.012: Vector Methods"
wordpress_post_id: 19825
source: BitcoinVersus.tech
published: 2026-10-01T12:10:13
modified: 2026-10-01T12:10:40
live_url: https://bitcoinversus.tech/2026/10/01/cpp-lesson-012-vector-methods/
track: cpp
lesson_number: 12
raw_source: 012-cpp-lesson-012-vector-methods-19825.gutenberg.html
---

<!-- wp:paragraph --><p>A C++ <strong>vector</strong> is a container that can hold multiple values. In <a href="https://bitcoinversus.tech/2026/09/30/cpp-lesson-010-arrays-vectors/">OSC++.010</a>, we introduced vectors. In <a href="https://bitcoinversus.tech/2026/09/30/cpp-lesson-011-range-based-for-loops/">OSC++.011</a>, we looped through them. Now we will learn four simple vector methods that let us add, remove, count, and check items.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Start With a Vector</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;vector&gt;

int main() {
    std::vector&lt;int&gt; scores = {21, 34, 55};
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Our vector is named <code>scores</code>. It currently contains three numbers.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">push_back(): Add an Item</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>scores.push_back(89);</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>push_back()</code> adds a new item to the end of the vector. The vector is now <code>{21, 34, 55, 89}</code>.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video: C++ Vector Methods</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>This beginner C++ vector walkthrough demonstrates common vector operations including <code>push_back()</code>, <code>pop_back()</code>, and <code>size()</code>.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=BtVeU0k-TeE","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=BtVeU0k-TeE
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">pop_back(): Remove the Last Item</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>scores.pop_back();</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>pop_back()</code> removes the last item. If the last value was <code>89</code>, the vector returns to <code>{21, 34, 55}</code>. Only call it when the vector is not empty.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">size(): Count the Items</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>std::cout &lt;&lt; scores.size();</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>size()</code> returns the number of elements in the vector. For <code>{21, 34, 55}</code>, the result is <code>3</code>.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">empty(): Is Anything There?</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>if (scores.empty()) {
    std::cout &lt;&lt; "No scores yet";
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>empty()</code> returns <code>true</code> when the vector has no elements and <code>false</code> when it contains at least one element.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Gaming Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>std::vector&lt;int&gt; lapTimes;
lapTimes.push_back(72);
lapTimes.push_back(68);

std::cout &lt;&lt; "Laps: " &lt;&lt; lapTimes.size();</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>A racing game could add each completed lap time to a vector and use <code>size()</code> to count how many laps have been recorded.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Bitcoin Mining Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>std::vector&lt;int&gt; minerTemps;
minerTemps.push_back(61);
minerTemps.push_back(64);
minerTemps.push_back(63);</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>A simple monitoring program could store temperature readings from a Bitcoin mining machine in a vector as new readings arrive.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a vector containing three numbers.</li><li>Use <code>push_back()</code> to add a fourth number.</li><li>Print the result of <code>size()</code>.</li><li>Use <code>pop_back()</code> once.</li><li>Check the vector with <code>empty()</code>.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>push_back()</code> adds an item, <code>pop_back()</code> removes the last item, <code>size()</code> counts the items, and <code>empty()</code> checks whether the vector contains anything. These four methods make vectors much more useful in everyday C++ programs.</p><!-- /wp:paragraph -->