---
title: "OSC++.015: Exception Handling Basics"
status: published
wordpress_post_id: 20089
published: "2026-10-02T17:08:40"
live_url: "https://bitcoinversus.tech/2026/10/02/oscpp-015-exception-handling-basics/"
series: "Open-Source C++ Certification"
pathway: cpp
lesson_number: "015"
featured_media_id: 20088
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-015-exception-handling-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=qIbGqvP08cw"
youtube_2: "https://www.youtube.com/watch?v=hX8y7pBL9J4"
youtube_3: "https://www.youtube.com/watch?v=COEv2kq_Ht8"
---

# OSC++.015: Exception Handling Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>C++ exception handling gives a program a structured way to report and respond to unusual runtime failures using <code>try</code>, <code>throw</code>, and <code>catch</code>.</strong></p>

<p class="wp-block-paragraph">This lesson follows <a href="https://bitcoinversus.tech/2026/10/02/oscpp-014-file-input-output-basics/">OSC++.014: File Input and Output Basics</a>. File I/O introduced operations that can fail at runtime. Exception handling gives us another tool for separating normal work from exceptional error paths.</p>

<h2 class="wp-block-heading">What is an exception?</h2>
<p class="wp-block-paragraph">An <strong>exception</strong> is an object or value used to report an exceptional condition. Instead of forcing every function to return an error code, a function can <code>throw</code> an exception. Control then searches for a matching <code>catch</code> handler.</p>

<p class="wp-block-paragraph">Exceptions are not intended to replace every ordinary condition check. A predictable user choice, an empty vector, or a simple loop condition may be handled normally. Exceptions are useful when normal execution cannot continue cleanly at the point where the problem is detected.</p>

<h2 class="wp-block-heading">The three core keywords</h2>
<ul class="wp-block-list"><li><code>try</code> — surrounds code that may throw.</li><li><code>throw</code> — reports an exceptional condition.</li><li><code>catch</code> — handles a matching exception.</li></ul>

<pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;stdexcept&gt;

int main() {
    try {
        int voltage = 0;
        if (voltage == 0) {
            throw std::runtime_error("voltage cannot be zero here");
        }
        std::cout &lt;&lt; "Voltage: " &lt;&lt; voltage &lt;&lt; '\n';
    }
    catch (const std::runtime_error&amp; e) {
        std::cerr &lt;&lt; "Runtime error: " &lt;&lt; e.what() &lt;&lt; '\n';
    }
}
</code></pre>

<p class="wp-block-paragraph">The <code>throw</code> transfers control out of the <code>try</code> block. The matching <code>catch</code> receives the exception and can inspect its message with <code>what()</code>.</p>

<h2 class="wp-block-heading">Video 1: University introduction to try, throw, and catch</h2>

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/qIbGqvP08cw?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Darshan University introduces C++ exception handling with try, throw, and catch.</em></figcaption></figure>

<h2 class="wp-block-heading">Throw standard exception types</h2>
<p class="wp-block-paragraph">The standard library provides exception classes such as <code>std::runtime_error</code>, <code>std::invalid_argument</code>, <code>std::out_of_range</code>, and others. These classes derive from <code>std::exception</code> and provide a <code>what()</code> message.</p>

<pre class="wp-block-code"><code>#include &lt;stdexcept&gt;

double amps(double watts, double volts) {
    if (volts == 0.0) {
        throw std::invalid_argument("volts must not be zero");
    }
    return watts / volts;
}
</code></pre>

<p class="wp-block-paragraph">This function cannot calculate current when voltage is zero. It reports the invalid argument to the caller instead of silently returning a meaningless result.</p>

<h2 class="wp-block-heading">Catch by const reference</h2>
<p class="wp-block-paragraph">A common pattern is to catch standard exceptions by <strong>const reference</strong>:</p>

<pre class="wp-block-code"><code>try {
    double current = amps(3200.0, 0.0);
}
catch (const std::invalid_argument&amp; e) {
    std::cerr &lt;&lt; e.what() &lt;&lt; '\n';
}
</code></pre>

<p class="wp-block-paragraph">Catching by reference avoids copying the exception object and preserves its dynamic type.</p>

<h2 class="wp-block-heading">Multiple catch handlers</h2>
<p class="wp-block-paragraph">A <code>try</code> block can be followed by multiple handlers. Put more specific exception types before more general ones.</p>

<pre class="wp-block-code"><code>try {
    // code that may throw
}
catch (const std::invalid_argument&amp; e) {
    std::cerr &lt;&lt; "Invalid argument: " &lt;&lt; e.what() &lt;&lt; '\n';
}
catch (const std::runtime_error&amp; e) {
    std::cerr &lt;&lt; "Runtime error: " &lt;&lt; e.what() &lt;&lt; '\n';
}
catch (const std::exception&amp; e) {
    std::cerr &lt;&lt; "Standard exception: " &lt;&lt; e.what() &lt;&lt; '\n';
}
</code></pre>

<h2 class="wp-block-heading">Video 2: College-level exception handling and input validation</h2>

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/hX8y7pBL9J4?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>College of DuPage associate professor Bradley Sward demonstrates C++ try, catch, throw, and input validation.</em></figcaption></figure>

<h2 class="wp-block-heading">Exceptions and file I/O</h2>
<p class="wp-block-paragraph">Our previous lesson checked stream state manually. File streams can also be configured to throw <code>std::ios_base::failure</code> when selected error states occur.</p>

<pre class="wp-block-code"><code>#include &lt;fstream&gt;
#include &lt;iostream&gt;

int main() {
    try {
        std::ifstream in;
        in.exceptions(std::ifstream::failbit | std::ifstream::badbit);
        in.open("scores.txt");

        int score{};
        in &gt;&gt; score;
    }
    catch (const std::ios_base::failure&amp; e) {
        std::cerr &lt;&lt; "File I/O error: " &lt;&lt; e.what() &lt;&lt; '\n';
    }
}
</code></pre>

<p class="wp-block-paragraph">This does not mean exceptions are always better than stream-state checks. The important lesson is that a program should choose a deliberate error-handling strategy and apply it consistently.</p>

<h2 class="wp-block-heading">Stack unwinding</h2>
<p class="wp-block-paragraph">When an exception leaves a function, C++ begins <strong>stack unwinding</strong>. Local automatic objects whose lifetimes have begun are destroyed as control moves outward looking for a matching handler. This behavior is one reason RAII—resource acquisition is initialization—is so important in modern C++.</p>

<p class="wp-block-paragraph">If a file, lock, or memory resource is owned by an object whose destructor releases it, stack unwinding can clean that resource up automatically. Manual resource handling with raw pointers or C-style handles is much easier to get wrong.</p>

<h2 class="wp-block-heading">Video 3: CppCon explains what happens under the hood</h2>

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/COEv2kq_Ht8?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>CppCon’s James McNellis of Microsoft explains how C++ exceptions find handlers and unwind the stack on Windows.</em></figcaption></figure>

<h2 class="wp-block-heading">Rethrowing an exception</h2>
<p class="wp-block-paragraph">Sometimes a function can record context but cannot fully handle the problem. A bare <code>throw;</code> inside a handler rethrows the current exception.</p>

<pre class="wp-block-code"><code>try {
    // work that may fail
}
catch (const std::exception&amp; e) {
    std::cerr &lt;&lt; "Logging: " &lt;&lt; e.what() &lt;&lt; '\n';
    throw;
}
</code></pre>

<h2 class="wp-block-heading">Catch-all handlers</h2>
<p class="wp-block-paragraph"><code>catch (...)</code> catches any exception type. It can be useful at a top-level boundary, but it provides no direct access to the exception object unless you rethrow and inspect it elsewhere. Do not use a catch-all merely to hide failures.</p>

<h2 class="wp-block-heading">Do not use exceptions for ordinary control flow</h2>
<p class="wp-block-paragraph">A loop ending, a menu selection, or a routine boolean condition usually does not need an exception. Exceptions make the most sense when normal execution cannot continue at the point of detection and the caller is better positioned to decide what to do.</p>

<h2 class="wp-block-heading">Data-center software example</h2>
<p class="wp-block-paragraph">Imagine a small C++ utility that reads a miner configuration file. A low-level parser discovers an invalid numeric field. It can throw an exception describing the invalid input. A higher-level command-line layer can catch the exception, show a clear error to the technician, log the filename, and stop without continuing with corrupted configuration data.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Throwing exceptions for normal loop or menu flow.</li><li>Catching every exception and ignoring it.</li><li>Catching a base exception before a more specific derived exception.</li><li>Throwing raw pointers or unrelated values when a standard exception type would communicate intent better.</li><li>Forgetting that uncaught exceptions terminate the program.</li><li>Assuming <code>catch (...)</code> automatically explains what went wrong.</li><li>Using manual resource cleanup that can be skipped during stack unwinding.</li></ul>

<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list"><li>Write a function that throws <code>std::invalid_argument</code> when a denominator is zero.</li><li>Catch that exception by const reference.</li><li>Print <code>e.what()</code>.</li><li>Add a second catch for <code>std::exception</code>.</li><li>Explain why the more specific handler should come first.</li><li>Modify a file-reading example so an open failure is reported clearly.</li></ol>

<h2 class="wp-block-heading">Previous C++ lessons</h2>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/oscpp-014-file-input-output-basics/">OSC++.014: File Input and Output Basics</a></p>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/01/cpp-lesson-013-strings-text-basics/">OSC++.013: Strings and Text Basics</a></p>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/01/cpp-lesson-012-vector-methods/">OSC++.012: Vector Methods</a></p>

<h2 class="wp-block-heading">Reference</h2>
<p class="wp-block-paragraph"><a href="https://learn.microsoft.com/en-us/cpp/cpp/errors-and-exception-handling-modern-cpp?view=msvc-170">Microsoft Learn’s modern C++ exception and error-handling guidance</a> explains when exceptions are appropriate and how they interact with robust software design.</p>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph">Use <code>try</code> around code that may throw, <code>throw</code> to report an exceptional condition, and a matching <code>catch</code> to handle it. Prefer meaningful standard exception types, catch by const reference, and design resource ownership so stack unwinding remains safe.</p>