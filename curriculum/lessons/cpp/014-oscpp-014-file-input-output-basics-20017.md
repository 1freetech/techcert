---
title: "OSC++.014: File Input and Output Basics"
wordpress_post_id: 20017
source: BitcoinVersus.tech
published: 2026-10-02T10:29:33
modified: 2026-10-02T10:29:33
live_url: https://bitcoinversus.tech/2026/10/02/oscpp-014-file-input-output-basics/
track: cpp
lesson_number: 14
raw_source: 014-oscpp-014-file-input-output-basics-20017.gutenberg.html
---

<!-- wp:paragraph -->
<p>A string keeps text inside a running program. A file lets that text remain after the program finishes. In this lesson, a fictional basketball score becomes a small text file that another run can read.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Definition:</strong> <strong>file input/output (I/O)</strong> means reading data from a file or writing data to one. <strong>Plain English:</strong> output saves the score; input brings the saved score back into the program. A <strong>stream</strong> is the interface used to move that data.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Review <a href="https://bitcoinversus.tech/2026/09/30/cpp-lesson-011-range-based-for-loops/">OSC++.011: Range-Based For Loops</a>, <a href="https://bitcoinversus.tech/2026/10/01/cpp-lesson-012-vector-methods/">OSC++.012: Vector Methods</a>, and <a href="https://bitcoinversus.tech/2026/10/01/cpp-lesson-013-strings-text-basics/">OSC++.013: Strings and Text Basics</a> for the same-module foundations.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Choose the file stream</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Include <code>&lt;fstream&gt;</code>. <code>std::ofstream</code> writes, <code>std::ifstream</code> reads, and <code>std::fstream</code> supports both when configured appropriately. We use separate readers and writers to keep the first exercise easy to trace.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The filename <code>"scores.txt"</code> is a relative path. It is resolved from the program’s <strong>working directory</strong>, which can differ from the folder containing your source code. An IDE may launch a program from its build folder. Check that directory before deciding a file disappeared.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Write a fictional score</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Save this as <code>writer.cpp</code> and run it in a dedicated practice folder. <strong>This default writer replaces an existing scores.txt file.</strong> Use only the disposable exercise file. It creates the file if the location is writable and the file does not exist.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>#include &lt;fstream&gt;
#include &lt;iostream&gt;

int main() {
    std::ofstream out("scores.txt");
    if (!out) {
        std::cerr &lt;&lt; "Could not open scores.txt for writing\n";
        return 1;
    }
    out &lt;&lt; "Bitcoin Basketball: 21\n";
    out &lt;&lt; "Green Team: 18\n";
    out.close();
    if (!out) {
        std::cerr &lt;&lt; "Could not finish writing scores.txt\n";
        return 1;
    }
    return 0;
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>&lt;&lt;</code> operations send text into the file, and <code>\n</code> separates the two lines. The first check detects an unsuccessful open. The second checks the stream after closing, since a successful open does not guarantee every write or close succeeds.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>File contents:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Bitcoin Basketball: 21
Green Team: 18</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 1: writing with ofstream</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Caleb Curry demonstrates the output stream. Compare his file-opening steps with the writer above, and identify where our example checks for failure.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=XJhIJ6J5obY","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=XJhIJ6J5obY
</div><figcaption class="wp-element-caption"><em>Caleb Curry — Writing to Files with ofstream.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Read complete lines</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Save this as <code>reader.cpp</code>. Run the writer first, then run this reader from the same working directory. <code>std::getline(in, line)</code> reads a full line into a string, including its spaces; the separating newline is consumed rather than stored in the string.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>#include &lt;fstream&gt;
#include &lt;iostream&gt;
#include &lt;string&gt;

int main() {
    std::ifstream in("scores.txt");
    if (!in) {
        std::cerr &lt;&lt; "Could not open scores.txt for reading\n";
        return 1;
    }
    std::string line;
    while (std::getline(in, line)) {
        std::cout &lt;&lt; line &lt;&lt; '\n';
    }
    if (!in.eof()) {
        std::cerr &lt;&lt; "Reading stopped before end of file\n";
        return 1;
    }
    return 0;
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The loop attempts a read and processes the line only when that read succeeds. Avoid <code>while (!in.eof())</code>: end-of-file is normally discovered by attempting a read, so checking it before reading can process stale data. After the loop, the example distinguishes reaching the end from stopping for another input failure.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 2: reading with ifstream</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Watch Caleb Curry’s input-stream lesson. Notice which file supplies the data, then compare token-oriented input with our whole-line reader.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ruf_pj2hGpw","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ruf_pj2hGpw
</div><figcaption class="wp-element-caption"><em>Caleb Curry — Reading from Files with ifstream.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Append instead of replacing</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Append</strong> means adding at the end while preserving existing content. Save this complete example as <code>append.cpp</code>. The <code>std::ios::app</code> mode sends each write to the end. In our exercise, the writer already ended its final line with a newline, so the overtime record starts on a new line.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>#include &lt;fstream&gt;
#include &lt;iostream&gt;

int main() {
    std::ofstream out("scores.txt", std::ios::app);
    if (!out) {
        std::cerr &lt;&lt; "Could not open scores.txt for appending\n";
        return 1;
    }
    out &lt;&lt; "Overtime: 4\n";
    out.close();
    if (!out) {
        std::cerr &lt;&lt; "Could not finish appending\n";
        return 1;
    }
    return 0;
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>After running writer, append, and reader in that order, the reader prints three lines. Running append again adds another overtime line. Running the default writer again removes those appended records and restores the original two lines. Those are different operations, so choose the mode intentionally.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Video 3: a complete text-file walkthrough</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>CodeBeauty brings reading and writing together in a beginner demonstration. Use it to review the overall workflow, then predict what changes when the writer uses append mode.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=EaHFhms_Shw","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=EaHFhms_Shw
</div><figcaption class="wp-element-caption"><em>CodeBeauty — C++ file handling for beginners.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Compile and verify</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>With a configured GCC compiler, compile each source separately:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>g++ -std=c++17 -Wall -Wextra -pedantic writer.cpp -o writer
g++ -std=c++17 -Wall -Wextra -pedantic reader.cpp -o reader
g++ -std=c++17 -Wall -Wextra -pedantic append.cpp -o append</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>On Linux or macOS, run <code>./writer</code>, <code>./append</code>, then <code>./reader</code>. On Windows, use the corresponding executable names and your configured compiler or IDE. The examples use standard C++17 and do not require a database or network connection.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A missing file should make the reader print its open-error message and return a nonzero status. An unwritable location can prevent writing. <code>is_open()</code> reports whether a file is open; checking the stream state also matters after operations. File streams close automatically when destroyed, but explicit close here lets us check completion before reporting success.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice and answers</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1.</strong> Which stream writes text? <strong>Answer:</strong> <code>std::ofstream</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>2.</strong> Which mode preserves earlier records when adding another? <strong>Answer:</strong> <code>std::ios::app</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>3.</strong> Why use getline for “Bitcoin Basketball: 21”? <strong>Answer:</strong> it keeps the whole line, including spaces.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>4.</strong> Where does scores.txt go? <strong>Answer:</strong> the current working directory for this relative path.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>5.</strong> Does opening a stream guarantee a successful save? <strong>Answer:</strong> no; later writes and closing can fail too.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Documentation</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Microsoft’s <a href="https://learn.microsoft.com/en-us/cpp/standard-library/basic-ofstream-class?view=msvc-170">output file stream reference</a> and <a href="https://learn.microsoft.com/en-us/cpp/standard-library/basic-ifstream-class?view=msvc-170">input file stream reference</a> document opening, closing, and stream operations.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Key takeaway:</strong> choose read, replace, or append; check whether the operation succeeds; and know which working directory holds the file.</p>
<!-- /wp:paragraph -->