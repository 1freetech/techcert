---
title: "OSC++.010: Arrays and Vectors"
wordpress_post_id: 19580
source: BitcoinVersus.tech
published: 2026-09-30T11:30:53
modified: 2026-09-30T20:09:02
live_url: https://bitcoinversus.tech/2026/09/30/cpp-lesson-010-arrays-vectors/
track: cpp
lesson_number: 10
raw_source: 010-cpp-lesson-010-arrays-vectors-19580.gutenberg.html
---

<!-- wp:paragraph --><p>An <strong>array</strong> and a <strong>vector</strong> both let a C++ program keep several values together instead of creating a separate variable for every item. The main beginner difference is simple: an array has a fixed size, while a vector can grow or shrink.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Start With Four Scores</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;

int main() {
    int scores[4] = {10, 20, 30, 40};

    std::cout &lt;&lt; scores[0] &lt;&lt; "\n";
    std::cout &lt;&lt; scores[1] &lt;&lt; "\n";

    return 0;
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The four values are stored under one name: <code>scores</code>. Each position has an <strong>index</strong>. C++ starts counting indexes at zero, so <code>scores[0]</code> is the first value and <code>scores[3]</code> is the fourth.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video: See Arrays in C++</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>This freeCodeCamp beginner course reaches its C++ arrays section at about 1:13:45. Watch that section after trying the four-score example above.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vLnPwxZdW4Y\u0026amp;t=4425s","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vLnPwxZdW4Y&amp;t=4425s
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">A Vector Can Grow</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A vector is useful when the number of items may change. Include <code>&lt;vector&gt;</code>, create the vector, and use <code>push_back()</code> to add another value.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;vector&gt;

int main() {
    std::vector&lt;int&gt; scores = {10, 20, 30};
    scores.push_back(40);

    std::cout &lt;&lt; scores[3] &lt;&lt; "\n";

    return 0;
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The vector began with three values. <code>push_back(40)</code> added a fourth. That ability to change size is the important idea for this lesson.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Gaming Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;string&gt;
#include &lt;vector&gt;

std::vector&lt;std::string&gt; players = {"Solo", "Rex", "Nova"};
players.push_back("Zed");</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>A game lobby may begin with three player names and later gain a fourth. A vector fits that simple situation because the list can change.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Bitcoin Mining Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>int minerTemperatures[4] = {61, 63, 60, 64};

std::cout &lt;&lt; minerTemperatures[0] &lt;&lt; "\n";</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>If you know you are reading exactly four simple temperature values, a fixed array can hold them under one name.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Array or Vector?</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>Array:</strong> use it here to practice a fixed number of values.</li><li><strong>Vector:</strong> use it when the list needs to grow or shrink.</li><li><strong>Both:</strong> access individual items with an index beginning at zero.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create an integer array containing four basketball scores.</li><li>Print the first and fourth scores.</li><li>Create a vector containing three game titles.</li><li>Add one more title with <code>push_back()</code>.</li><li>Print the new fourth title.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Arrays and vectors keep multiple values together. A basic array has a fixed size. A vector can change size. Both use indexes that begin at zero.</p><!-- /wp:paragraph -->