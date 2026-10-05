---
title: "OSC++.013: Strings and Text Basics"
wordpress_post_id: 19937
source: BitcoinVersus.tech
published: 2026-10-01T17:23:11
modified: 2026-10-01T17:23:40
live_url: https://bitcoinversus.tech/2026/10/01/cpp-lesson-013-strings-text-basics/
track: cpp
lesson_number: 13
raw_source: 013-cpp-lesson-013-strings-text-basics-19937.gutenberg.html
---

<!-- wp:paragraph --><p>A <strong>string</strong> is text stored in a program. In C++, <code>std::string</code> can hold words, player names, messages, and labels. Unlike the numbers we stored in <a href="https://bitcoinversus.tech/2026/10/01/cpp-lesson-012-vector-methods/">OSC++.012</a>, a string stores a sequence of characters. This is a new subject, not another vector lesson.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">1. Make a String</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;string&gt;

int main() {
    std::string player = "Alex";
    std::cout &lt;&lt; player &lt;&lt; '\n';
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>#include &lt;string&gt;</code> line makes the standard string type available. <code>player</code> holds the text <strong>Alex</strong>. Double quotation marks surround a string literal.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">2. Join Text With +</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>std::string first = "Hash";
std::string second = " Race";
std::string game = first + second;
std::cout &lt;&lt; game; // Hash Race</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The <code>+</code> operator joins two strings. The space before <code>Race</code> is part of the text, so the words do not run together.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">3. Add More Text With +=</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>std::string message = "Level";
message += " Complete";
std::cout &lt;&lt; message; // Level Complete</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>+=</code> adds text to the existing string rather than making a separate new variable.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video: Useful C++ String Methods</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Bro Code demonstrates practical string operations in a short beginner lesson, including ways to inspect and modify text.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=KTr0SZTW9nI","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=KTr0SZTW9nI
</div><figcaption class="wp-element-caption"><em>Bro Code explains useful methods for C++ strings.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">4. Count Characters With size()</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>std::string word = "Bitcoin";
std::cout &lt;&lt; word.size(); // 7</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>size()</code> counts the characters. Spaces also count. For example, <code>"Hash Race"</code> has 9 characters, including the space.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">5. Read One Character</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>std::string name = "Alex";
std::cout &lt;&lt; name[0]; // A
std::cout &lt;&lt; name.at(1); // l</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>C++ starts counting character positions at <strong>0</strong>, not 1. The first character of <code>Alex</code> is <code>A</code>. Only access positions that exist: <code>at()</code> reports an out-of-range error, while an invalid <code>[]</code> index can cause undefined behavior.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">6. Check for Empty Text</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>std::string username = "";
if (username.empty()) {
    std::cout &lt;&lt; "Enter a name";
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>empty()</code> checks whether a string has no characters. A simple game can use it to reject a blank player name.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Gaming Example: Player Greeting</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;string&gt;

int main() {
    std::string player = "Alex";
    std::string greeting = "Welcome, " + player;
    std::cout &lt;&lt; greeting &lt;&lt; '\n';
    std::cout &lt;&lt; "Letters in name: " &lt;&lt; player.size() &lt;&lt; '\n';
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Output: <code>Welcome, Alex</code> followed by <code>Letters in name: 4</code>. The same idea can label players, levels, and menus.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Simple Bitcoin Mining Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>std::string miner = "Miner A";
std::string status = "Online";
std::cout &lt;&lt; miner + ": " + status; // Miner A: Online</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>A basic facility dashboard can combine a machine label with a simple status. You do not need advanced monitoring knowledge to understand this string example.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Common Mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Use <strong>double quotes</strong> for text strings, such as <code>"Hello"</code>; single quotes are for individual character literals such as <code>'H'</code>.</li><li>Include <code>&lt;string&gt;</code>.</li><li>Remember that character positions start at zero.</li><li>Do not read past the end of the string.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a string containing your favorite game title.</li><li>Join two strings with <code>+</code>.</li><li>Add a word using <code>+=</code>.</li><li>Use <code>size()</code> to print the character count.</li><li>Print the first character using <code>at(0)</code>.</li><li>Use <code>empty()</code> to detect a blank username.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>std::string</code> stores text. Use <code>+</code> and <code>+=</code> to join it, <code>size()</code> to count it, <code>[]</code> or <code>at()</code> to access characters, and <code>empty()</code> to check for a blank string. This prepares you for more advanced text processing in later lessons.</p><!-- /wp:paragraph -->