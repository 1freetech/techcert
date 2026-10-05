---
title: "OSC++.016: Constructors and Destructors Basics"
wordpress_post_id: 20095
source: BitcoinVersus.tech
published: 2026-10-02T17:11:52
modified: 2026-10-02T17:13:10
live_url: https://bitcoinversus.tech/2026/10/02/oscpp-016-constructors-destructors-basics/
track: cpp
lesson_number: 16
raw_source: 016-oscpp-016-constructors-destructors-basics-20095.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} -->
<p class="has-large-font-size"><strong>Constructors prepare a C++ object when it is created. Destructors perform cleanup when that object’s lifetime ends.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson builds on <a href="https://bitcoinversus.tech/2026/09/30/cpp-lesson-8-classes-objects/">OSC++.008: Classes and Objects</a> and <a href="https://bitcoinversus.tech/2026/09/30/cpp-lesson-9-member-functions/">OSC++.009: Member Functions</a>. Those lessons showed how data and functions live inside a class. Constructors and destructors add object-lifecycle behavior.</p>
<!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Constructor basics</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A <strong>constructor</strong> is a special member function whose name matches the class name. It has no return type. C++ calls it automatically when an object is created.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;string&gt;

class Miner {
public:
    std::string name;
    int hashrate;

    Miner() {
        name = "Unknown";
        hashrate = 0;
        std::cout &lt;&lt; "Miner created\n";
    }
};

int main() {
    Miner unit;
    std::cout &lt;&lt; unit.name &lt;&lt; " " &lt;&lt; unit.hashrate &lt;&lt; '\n';
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>When <code>unit</code> is created, the constructor runs automatically. The object starts with known values instead of uninitialized data.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Constructors explained</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=5z3KEX9AZEQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=5z3KEX9AZEQ
</div><figcaption class="wp-element-caption"><em>Bro Code explains C++ constructors with beginner-friendly class examples.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Parameterized constructors</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A constructor can accept arguments so each object starts with different values.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;string&gt;

class Miner {
public:
    std::string name;
    int hashrate;

    Miner(const std::string&amp; minerName, int ths)
        : name(minerName), hashrate(ths) {
    }
};

int main() {
    Miner s21("S21", 200);
    Miner testRig("Lab Rig", 15);

    std::cout &lt;&lt; s21.name &lt;&lt; ": " &lt;&lt; s21.hashrate &lt;&lt; " TH/s\n";
    std::cout &lt;&lt; testRig.name &lt;&lt; ": " &lt;&lt; testRig.hashrate &lt;&lt; " TH/s\n";
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The text after the colon is a <strong>member initializer list</strong>. It initializes members before the constructor body runs. This is the preferred way to initialize many C++ data members.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Constructor overloading</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A class can have more than one constructor as long as their parameter lists differ.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>class Rack {
public:
    int miners;

    Rack() : miners(0) {}
    Rack(int count) : miners(count) {}
};</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>Rack empty;</code> calls the no-argument constructor. <code>Rack rowA(120);</code> calls the one-argument constructor.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: Constructors and destructors together</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=wyVAajK7QzQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=wyVAajK7QzQ
</div><figcaption class="wp-element-caption"><em>Caleb Curry demonstrates how C++ constructors and destructors fit into object lifetime.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Destructor basics</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A <strong>destructor</strong> has the class name preceded by <code>~</code>. It has no return type and takes no parameters. C++ calls it automatically when the object’s lifetime ends.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;

class Session {
public:
    Session() {
        std::cout &lt;&lt; "Session started\n";
    }

    ~Session() {
        std::cout &lt;&lt; "Session ended\n";
    }
};

int main() {
    Session test;
    std::cout &lt;&lt; "Program is running\n";
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The constructor runs when <code>test</code> is created. The destructor runs automatically when <code>test</code> goes out of scope at the end of <code>main</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Scope controls lifetime</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>int main() {
    std::cout &lt;&lt; "A\n";

    {
        Session local;
        std::cout &lt;&lt; "B\n";
    }

    std::cout &lt;&lt; "C\n";
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The <code>local</code> object is destroyed at the closing brace of the inner block, before the program reaches <code>C</code>. This is deterministic lifetime: the program knows exactly where automatic objects leave scope.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Why destructors matter</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Destructors are commonly used to release resources owned by an object. Examples include files, locks, sockets, or dynamically allocated memory.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Modern C++ often stores resources in standard-library objects such as <code>std::string</code>, <code>std::vector</code>, file streams, and smart pointers. Those objects already manage their own cleanup. Prefer them over manual <code>new</code>/<code>delete</code> when possible.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">RAII: resource lifetime follows object lifetime</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A major C++ design idea is <strong>RAII</strong>—Resource Acquisition Is Initialization. An object acquires a resource during construction and releases it during destruction. That ties cleanup to scope instead of relying on the programmer to remember a separate cleanup call.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For example, <code>std::ofstream</code> opens a file and closes it when the stream object is destroyed. The same lifetime principle appears throughout modern C++.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Object setup and teardown</h2><!-- /wp:heading -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=lZTRkGh9Cvs","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=lZTRkGh9Cvs
</div><figcaption class="wp-element-caption"><em>Professor Hank Stalica walks through default and overloaded constructors, destructors, and object cleanup.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Order of construction and destruction</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>For ordinary local objects, construction happens when execution reaches the declaration. Destruction generally occurs in reverse order when the scope ends.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>int main() {
    Session first;
    Session second;
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>first</code> is constructed first, then <code>second</code>. At the end of the scope, <code>second</code> is destroyed before <code>first</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">A practical class example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;string&gt;

class MinerMonitor {
private:
    std::string worker;
    int temperature;

public:
    MinerMonitor(const std::string&amp; workerName, int temp)
        : worker(workerName), temperature(temp) {
        std::cout &lt;&lt; "Monitoring " &lt;&lt; worker &lt;&lt; '\n';
    }

    void printStatus() const {
        std::cout &lt;&lt; worker &lt;&lt; ": "
                  &lt;&lt; temperature &lt;&lt; " C\n";
    }

    ~MinerMonitor() {
        std::cout &lt;&lt; "Stopped monitoring " &lt;&lt; worker &lt;&lt; '\n';
    }
};

int main() {
    MinerMonitor unit("rack-a-s21-01", 67);
    unit.printStatus();
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This example does not manage an external resource; the destructor only prints a message so you can see exactly when object cleanup occurs.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common beginner mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Giving a constructor a return type. Constructors have no return type.</li><li>Misspelling the constructor name so it no longer matches the class.</li><li>Forgetting the <code>~</code> in a destructor.</li><li>Calling the destructor manually on an ordinary automatic object.</li><li>Using manual <code>new</code>/<code>delete</code> when a standard container or smart pointer would manage lifetime safely.</li><li>Assuming every class needs a handwritten destructor. Many classes can use the compiler-generated destructor.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a class named <code>PDU</code> with a default constructor that sets <code>outlets</code> to 0.</li><li>Add a parameterized constructor that accepts the number of outlets.</li><li>Add a destructor that prints <code>PDU destroyed</code>.</li><li>Create two objects in the same scope and observe destruction order.</li><li>Create one object inside a nested block and identify exactly when its destructor runs.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>Question:</strong> When does a constructor run?<br><strong>Answer:</strong> automatically when an object is created.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong>Question:</strong> How many destructors can a class have?<br><strong>Answer:</strong> one.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong>Question:</strong> What does a member initializer list do?<br><strong>Answer:</strong> it initializes members before the constructor body executes.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong>Question:</strong> What idea ties resource cleanup to object lifetime?<br><strong>Answer:</strong> RAII.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Previous C++ lessons</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/02/oscpp-014-file-input-output-basics/">OSC++.014: File Input and Output Basics</a></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/01/cpp-lesson-013-strings-text-basics/">OSC++.013: Strings and Text Basics</a></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/01/cpp-lesson-012-vector-methods/">OSC++.012: Vector Methods</a></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Further reading</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>For reference material, review <a href="https://en.cppreference.com/w/cpp/language/constructor">cppreference on constructors</a> and <a href="https://en.cppreference.com/w/cpp/language/destructor">cppreference on destructors</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Constructors establish a valid starting state. Destructors handle end-of-lifetime cleanup. Together they make object lifetime explicit and prepare you for deeper C++ topics such as encapsulation, inheritance, smart pointers, and resource management.</p><!-- /wp:paragraph -->