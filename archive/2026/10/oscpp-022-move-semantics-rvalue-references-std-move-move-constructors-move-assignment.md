<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong><a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/">Modern C++</a> move semantics lets programs transfer ownership of resources instead of unnecessarily duplicating them.</strong> <strong>OSC++.022</strong> follows <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><strong>OSC++.021 smart pointers and ownership</strong></a> by explaining the language machinery behind efficient ownership transfer: rvalue references, <code>std::move</code>, move constructors, move assignment, and valid moved-from states. These mechanisms are especially important for resource-owning <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><strong>software objects</strong></a> that manage heap memory, file handles, sockets, buffers, and other nontrivial resources.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=i_Z_o9T2fNE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=i_Z_o9T2fNE
</div><figcaption class="wp-element-caption"><em>CppCon — Back to Basics: Rvalues and Move Semantics in C++. Covers value categories, move semantics, Rule of Zero/Five, std::move, forwarding references, and design guidance.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">1. Copying Versus Moving</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;string&gt;
#include &lt;utility&gt;

std::string a = "large payload";
std::string b = a;              // copy
std::string c = std::move(a);   // move permitted</code></pre><!-- /wp:code -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Copy:</strong> creates another logical value while leaving the source usable with its original value.</li><li><strong>Move:</strong> allows the destination to take over resources from the source.</li><li><code>std::move</code> does not itself move bytes; it converts an expression so move-aware overloads can be selected.</li><li>For trivial types such as <code>int</code>, a move often costs the same as a copy.</li><li>For resource-owning types such as <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><code>std::unique_ptr</code></a>, moving transfers ownership and copying is intentionally disabled.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Lvalues, Rvalues, and Rvalue References</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>An lvalue identifies an object with a persistent identity, while an rvalue commonly represents a temporary value or an object whose resources may be reused. An rvalue reference uses <code>&amp;&amp;</code>, such as <code>Widget&amp;&amp;</code>, and gives overload resolution a way to select operations designed for resource transfer. This distinction lets the <a href="https://bitcoinversus.tech/2026/05/09/the-greatest-c-coder-vs-bjarne-stroustrup/"><strong>C++ language</strong></a> optimize ownership-sensitive <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><strong>software components</strong></a> without changing ordinary copy behavior.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ehMg6zvXuMY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ehMg6zvXuMY
</div><figcaption class="wp-element-caption"><em>The Cherno — Move Semantics in C++. Demonstrates why move operations exist and how rvalue references enable resource transfer.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code"><code>int x = 10;
int&amp; lref = x;      // lvalue reference
int&amp;&amp; rref = 20;   // rvalue reference</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">3. Move Constructors</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A move constructor initializes a new object from an rvalue of the same type, usually by transferring resource handles and leaving the source safe to destroy. For a class that owns raw memory, that often means copying the pointer value into the destination and setting the source pointer to <code>nullptr</code>, avoiding a second allocation and deep copy. Classes that can express ownership with <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><strong>standard-library ownership types</strong></a> should prefer the Rule of Zero rather than manually implementing special member functions.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=NOYWeU0ragw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=NOYWeU0ragw
</div><figcaption class="wp-element-caption"><em>Neso Academy — Move Constructor in C++. Covers lvalues, rvalues, rvalue references, move constructors, and a complete program example.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code"><code>class Buffer {
public:
    Buffer(std::size_t n)
        : size_(n), data_(new int[n]) {}

    ~Buffer() {
        delete[] data_;
    }

    Buffer(Buffer&amp;&amp; other) noexcept
        : size_(other.size_), data_(other.data_) {
        other.size_ = 0;
        other.data_ = nullptr;
    }

private:
    std::size_t size_{};
    int* data_{};
};</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">4. std::move and Move Assignment</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>std::move</code>, declared in the <code>&lt;utility&gt;</code> header, is essentially a cast that produces an xvalue and tells overload resolution that the object may be moved from. Move assignment differs from a move constructor because the destination already exists and may already own a resource, so the assignment operator must first release or safely replace the destination’s current state before taking ownership from the source. A correctly implemented move assignment operator also handles self-assignment safely and normally returns <code>*this</code>.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=OWNeCTd7yQE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=OWNeCTd7yQE
</div><figcaption class="wp-element-caption"><em>The Cherno — std::move and the Move Assignment Operator in C++. Demonstrates std::move, move assignment, ownership transfer, and implementation details.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code"><code>Buffer&amp; operator=(Buffer&amp;&amp; other) noexcept {
    if (this != &amp;other) {
        delete[] data_;

        size_ = other.size_;
        data_ = other.data_;

        other.size_ = 0;
        other.data_ = nullptr;
    }
    return *this;
}</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Moved-From Objects</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>After a standard-library object is moved from, it generally remains valid but its value is unspecified unless the type documents a stronger guarantee. That means destruction, reassignment, and operations without violated preconditions remain valid, but code should not assume the old value is still present. One important exception is <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><code>std::unique_ptr</code></a>: after a successful move, the source is guaranteed to be empty, which makes ownership transfer explicit and testable.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=AmjoK55h68Y","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=AmjoK55h68Y
</div><figcaption class="wp-element-caption"><em>mCoding — unique_ptr: C++'s simplest smart pointer. Demonstrates non-copyable unique ownership, move construction, move assignment, and ownership transfer.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;memory&gt;
#include &lt;utility&gt;

std::unique_ptr&lt;int&gt; first = std::make_unique&lt;int&gt;(42);
std::unique_ptr&lt;int&gt; second = std::move(first);

// first == nullptr
// second owns the int</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">6. noexcept and Standard Containers</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Move constructors should normally be marked <code>noexcept</code> when they truly cannot throw.</li><li><a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><code>std::vector</code></a> and other containers may prefer copying over moving during reallocation when a move constructor can throw and copying is available.</li><li><code>std::move_if_noexcept</code> supports this exception-safety strategy.</li><li>A move operation should preserve class invariants for both destination and moved-from source.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">7. Rule of Zero, Rule of Five</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Rule of Zero:</strong> prefer composing classes from types such as <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><code>std::string</code>, <code>std::vector</code>, and smart pointers</a> so the compiler-generated special members are correct.</li><li><strong>Rule of Five:</strong> when a class manually owns a resource and defines one ownership-sensitive special member, review the destructor, copy constructor, copy assignment, move constructor, and move assignment together.</li><li><a href="https://bitcoinversus.tech/2026/10/04/oscpp-020-virtual-destructors-polymorphic-cleanup/"><strong>Destructors</strong></a> remain responsible for releasing whatever resource the object still owns at destruction time.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">8. Common Mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Assuming <code>std::move</code> physically moves data by itself.</li><li>Reading a moved-from object as though it still contains its previous value.</li><li>Moving from a <code>const</code> object and expecting a normal move operation.</li><li>Forgetting to release the destination’s existing resource in move assignment.</li><li>Implementing custom move logic when standard ownership types already provide correct behavior.</li><li>Forgetting <code>noexcept</code> on a move constructor that is guaranteed not to throw.</li><li>Returning <code>std::move(local)</code> unnecessarily and interfering with copy elision.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">9. Practical Exercise</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a class that owns a dynamically allocated integer array.</li><li>Implement a destructor and delete copy operations.</li><li>Implement a <code>noexcept</code> move constructor.</li><li>Implement a <code>noexcept</code> move assignment operator.</li><li>Print the source and destination pointer values before and after moving.</li><li>Confirm the moved-from source is safe to destroy.</li><li>Replace the raw array with <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><code>std::unique_ptr&lt;int[]&gt;</code></a> and compare how much custom code disappears.</li><li>Place the class in a <code>std::vector</code> and observe construction during container growth.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">10. Knowledge Check + Answers</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>What does <code>std::move</code> actually do?</strong> It casts an expression to an xvalue so move-aware overloads can be selected.</li><li><strong>What syntax declares an rvalue reference?</strong> <code>T&amp;&amp;</code>.</li><li><strong>When is a move constructor used?</strong> When a new object is initialized from an rvalue or xvalue of the same type and a viable move constructor exists.</li><li><strong>How does move assignment differ?</strong> It transfers state into an object that already exists and may already own resources.</li><li><strong>Can a moved-from standard-library object be destroyed?</strong> Yes. It remains valid, although its value is usually unspecified.</li><li><strong>What is guaranteed after moving from <code>std::unique_ptr</code>?</strong> The source pointer is empty.</li><li><strong>Why mark move constructors <code>noexcept</code>?</strong> It communicates the exception guarantee and can let standard containers move elements during reallocation instead of copying them.</li><li><strong>What is the preferred design when possible?</strong> Rule of Zero: compose from resource-managing standard types and let their special member functions handle ownership.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Useful Prior Lessons</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><strong>OSC++.021: Smart Pointers — unique_ptr, shared_ptr, weak_ptr, and Ownership</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/04/oscpp-020-virtual-destructors-polymorphic-cleanup/"><strong>OSC++.020: Virtual Destructors and Polymorphic Cleanup</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/04/oscpp-019-pure-virtual-functions-abstract-classes-basics/"><strong>OSC++.019: Pure Virtual Functions and Abstract Classes Basics</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/04/oscpp-018-virtual-functions-polymorphism-basics/"><strong>OSC++.018: Virtual Functions and Polymorphism Basics</strong></a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Technical References</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><a href="https://en.cppreference.com/w/cpp/utility/move"><strong>cppreference — std::move</strong></a></li><li><a href="https://en.cppreference.com/w/cpp/language/move_constructor"><strong>cppreference — Move constructors</strong></a></li><li><a href="https://learn.microsoft.com/en-us/cpp/cpp/move-constructors-and-move-assignment-operators-cpp"><strong>Microsoft Learn — Move constructors and move assignment operators</strong></a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Move semantics is ownership transfer expressed through C++ value categories and special member functions.</strong> Use <code>std::move</code> intentionally, keep moved-from objects valid, mark nonthrowing moves <code>noexcept</code>, and prefer standard resource-managing types so custom move code is needed only when the class truly owns a low-level resource.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->