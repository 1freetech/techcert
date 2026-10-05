---
title: "OSC++.013: Strings and Text Basics"
status: published
wordpress_post_id: 19937
published: "2026-10-01T17:23:11"
live_url: "https://bitcoinversus.tech/2026/10/01/cpp-lesson-013-strings-text-basics/"
series: "Open-Source C++"
pathway: cpp
lesson_number: "013"
featured_media_id: 19939
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-013-strings-text-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=KTr0SZTW9nI"
---

# OSC++.013: Strings and Text Basics

Original published WordPress article content, preserved below in full:

<p class="wp-block-paragraph">A <strong>string</strong> is text stored in a program. In C++, <code>std::string</code> can hold words, player names, messages, and labels. Unlike the numbers we stored in <a href="https://bitcoinversus.tech/2026/10/01/cpp-lesson-012-vector-methods/">OSC++.012</a>, a string stores a sequence of characters. This is a new subject, not another vector lesson.</p>
<h2 class="wp-block-heading">1. Make a String</h2>
<pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;string&gt;

int main() {
    std::string player = "Alex";
    std::cout &lt;&lt; player &lt;&lt; '\n';
}</code></pre>
<p class="wp-block-paragraph">The <code>#include &lt;string&gt;</code> line makes the standard string type available. <code>player</code> holds the text <strong>Alex</strong>. Double quotation marks surround a string literal.</p>
<h2 class="wp-block-heading">2. Join Text With +</h2>
<pre class="wp-block-code"><code>std::string first = "Hash";
std::string second = " Race";
std::string game = first + second;
std::cout &lt;&lt; game; // Hash Race</code></pre>
<p class="wp-block-paragraph">The <code>+</code> operator joins two strings. The space before <code>Race</code> is part of the text, so the words do not run together.</p>
<h2 class="wp-block-heading">3. Add More Text With +=</h2>
<pre class="wp-block-code"><code>std::string message = "Level";
message += " Complete";
std::cout &lt;&lt; message; // Level Complete</code></pre>
<p class="wp-block-paragraph"><code>+=</code> adds text to the existing string rather than making a separate new variable.</p>
<h2 class="wp-block-heading">Video: Useful C++ String Methods</h2>
<p class="wp-block-paragraph">Bro Code demonstrates practical string operations in a short beginner lesson, including ways to inspect and modify text.</p>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/KTr0SZTW9nI?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Bro Code explains useful methods for C++ strings.</em></figcaption></figure>
<h2 class="wp-block-heading">4. Count Characters With size()</h2>
<pre class="wp-block-code"><code>std::string word = "Bitcoin";
std::cout &lt;&lt; word.size(); // 7</code></pre>
<p class="wp-block-paragraph"><code>size()</code> counts the characters. Spaces also count. For example, <code>"Hash Race"</code> has 9 characters, including the space.</p>
<h2 class="wp-block-heading">5. Read One Character</h2>
<pre class="wp-block-code"><code>std::string name = "Alex";
std::cout &lt;&lt; name[0]; // A
std::cout &lt;&lt; name.at(1); // l</code></pre>
<p class="wp-block-paragraph">C++ starts counting character positions at <strong>0</strong>, not 1. The first character of <code>Alex</code> is <code>A</code>. Only access positions that exist: <code>at()</code> reports an out-of-range error, while an invalid <code>[]</code> index can cause undefined behavior.</p>
<h2 class="wp-block-heading">6. Check for Empty Text</h2>
<pre class="wp-block-code"><code>std::string username = "";
if (username.empty()) {
    std::cout &lt;&lt; "Enter a name";
}</code></pre>
<p class="wp-block-paragraph"><code>empty()</code> checks whether a string has no characters. A simple game can use it to reject a blank player name.</p>
<h2 class="wp-block-heading">Gaming Example: Player Greeting</h2>
<pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;string&gt;

int main() {
    std::string player = "Alex";
    std::string greeting = "Welcome, " + player;
    std::cout &lt;&lt; greeting &lt;&lt; '\n';
    std::cout &lt;&lt; "Letters in name: " &lt;&lt; player.size() &lt;&lt; '\n';
}</code></pre>
<p class="wp-block-paragraph">Output: <code>Welcome, Alex</code> followed by <code>Letters in name: 4</code>. The same idea can label players, levels, and menus.</p>
<h2 class="wp-block-heading">Simple Bitcoin Mining Example</h2>
<pre class="wp-block-code"><code>std::string miner = "Miner A";
std::string status = "Online";
std::cout &lt;&lt; miner + ": " + status; // Miner A: Online</code></pre>
<p class="wp-block-paragraph">A basic facility dashboard can combine a machine label with a simple status. You do not need advanced monitoring knowledge to understand this string example.</p>
<h2 class="wp-block-heading">Common Mistakes</h2>
<ul class="wp-block-list"><li>Use <strong>double quotes</strong> for text strings, such as <code>"Hello"</code>; single quotes are for individual character literals such as <code>'H'</code>.</li><li>Include <code>&lt;string&gt;</code>.</li><li>Remember that character positions start at zero.</li><li>Do not read past the end of the string.</li></ul>
<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list"><li>Create a string containing your favorite game title.</li><li>Join two strings with <code>+</code>.</li><li>Add a word using <code>+=</code>.</li><li>Use <code>size()</code> to print the character count.</li><li>Print the first character using <code>at(0)</code>.</li><li>Use <code>empty()</code> to detect a blank username.</li></ol>
<h2 class="wp-block-heading">Key Takeaway</h2>
<p class="wp-block-paragraph"><code>std::string</code> stores text. Use <code>+</code> and <code>+=</code> to join it, <code>size()</code> to count it, <code>[]</code> or <code>at()</code> to access characters, and <code>empty()</code> to check for a blank string. This prepares you for more advanced text processing in later lessons.</p>
