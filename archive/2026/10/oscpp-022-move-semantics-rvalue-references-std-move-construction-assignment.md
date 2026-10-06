---
title: "OSC++.022: Move Semantics and Rvalue References — std::move, Move Construction, and Move Assignment"
status: published
wordpress_post_id: 21264
published: "2026-10-06T08:52:06"
modified: "2026-10-06T08:52:06"
live_url: "https://bitcoinversus.tech/2026/10/06/oscpp-022-move-semantics-rvalue-references-std-move-construction-assignment/"
featured_media_id: 21263
track: "Open Source C++"
lesson: "OSC++.022"
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Move semantics let C++ transfer resources from one object to another instead of performing an expensive deep copy.</strong> OSC++.022 follows <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><strong>OSC++.021: Smart Pointers — unique_ptr, shared_ptr, weak_ptr, and Ownership</strong></a>, where <code>std::move</code> appeared as an ownership-transfer tool. This lesson explains what rvalues are, what <code>std::move</code> actually does, how move constructors and move-assignment operators work, and when the Rule of Zero or Rule of Five should guide class design.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=i_Z_o9T2fNE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=i_Z_o9T2fNE
</div><figcaption class="wp-element-caption"><em>CppCon — Amir Kirsh, “Back to Basics: Rvalues and Move Semantics in C++.” Covers rvalue references, std::move, move operations, Rule of Zero/Five, and common mistakes.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning Objectives</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Distinguish lvalues from rvalues at a practical programming level.</li><li>Explain why <code>T&amp;&amp;</code> is an rvalue-reference type.</li><li>Explain what <code>std::move</code> does and what it does not do.</li><li>Write a move constructor and move-assignment operator for a resource-owning class.</li><li>Recognize valid but unspecified moved-from states.</li><li>Understand why many move operations should be marked <code>noexcept</code>.</li><li>Apply the Rule of Zero and Rule of Five appropriately.</li><li>Choose copying, moving, references, or smart pointers based on ownership and lifetime.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Why Move Semantics Exist</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Before C++11, transferring an object that owned a large dynamic resource often meant copying the resource and then destroying the original. For a large string, vector, buffer, or file-owning wrapper, that can mean allocating new storage and copying data that is about to be discarded anyway. Move semantics give the language a way to transfer that internal resource when the source object is temporary or explicitly marked as movable.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The performance benefit comes from transferring ownership of internal state, not from a magical instruction called “move.” For example, a vector move can often transfer pointers, size, and capacity instead of copying every element. The exact behavior depends on the type and its move operations.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=St0MNEU5b0o","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=St0MNEU5b0o
</div><figcaption class="wp-element-caption"><em>CppCon — Klaus Iglberger, “Back to Basics: Move Semantics, Part 1.” Explains the motivation for moves, rvalue references, std::move, and practical ownership transfer.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Lvalues and Rvalues</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>An lvalue generally refers to an object with a persistent identity that can be named again, such as a local variable. An rvalue is commonly a temporary value or an expression whose resources may be eligible for transfer. These definitions have precise language-standard rules, but the practical distinction helps explain why overloads taking <code>T&amp;</code>, <code>const T&amp;</code>, and <code>T&amp;&amp;</code> behave differently.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>std::string name = "rack-01";     // name is an lvalue
std::string copy = name;          // copy from lvalue
std::string moved = std::move(name); // treat name as an rvalue source</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>name</code> does not cease to exist after the move. The object remains valid, but its specific value is generally unspecified unless the type documents a stronger guarantee. It can safely be destroyed, assigned a new value, or used in operations allowed for its documented moved-from state.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">What std::move Actually Does</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><code>std::move</code> does not physically transfer bytes by itself. It performs a cast that allows an expression to be treated as an rvalue, making move-enabled overloads eligible. The destination type still decides whether an actual move happens. If a type has no useful move operation, the expression may still end up copying.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is why <code>std::move</code> should be read as “this object may now be treated as a resource-transfer source,” not “the compiler has moved the object.” The standard-library reference for <a href="https://en.cppreference.com/w/cpp/utility/move"><strong><code>std::move</code></strong></a> documents it as a cast to an rvalue reference.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Move Constructor</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A move constructor creates a new object by taking resources from another object of the same type. A resource-owning class normally transfers its pointer or handle, then leaves the source in a state that can be safely destroyed.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>#include &lt;cstddef&gt;
#include &lt;utility&gt;

class Buffer {
public:
    explicit Buffer(std::size_t n)
        : data_(new int[n]{}), size_(n) {}

    ~Buffer() { delete[] data_; }

    Buffer(Buffer&amp;&amp; other) noexcept
        : data_(other.data_), size_(other.size_) {
        other.data_ = nullptr;
        other.size_ = 0;
    }

private:
    int* data_ = nullptr;
    std::size_t size_ = 0;
};</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The new object receives the resource pointer and size. The source relinquishes ownership by being reset to an empty state. This avoids two objects believing they own the same allocation and therefore avoids double deletion.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Move Assignment</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Move assignment transfers resources into an object that already exists. The destination must first release any resource it currently owns, protect against self-assignment, take the source resource, and reset the source.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>Buffer&amp; operator=(Buffer&amp;&amp; other) noexcept {
    if (this != &amp;other) {
        delete[] data_;

        data_ = other.data_;
        size_ = other.size_;

        other.data_ = nullptr;
        other.size_ = 0;
    }
    return *this;
}</code></pre><!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=knEaMpytRMA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=knEaMpytRMA
</div><figcaption class="wp-element-caption"><em>CppCon — Andreas Fertig, “Back to Basics: C++ Move Semantics.” Demonstrates move constructors, move assignment, noexcept, moved-from objects, std::move, and std::forward.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Why noexcept Matters</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Standard-library containers often prefer a move operation only when it is known not to throw, because container reallocation must preserve strong exception-safety guarantees. Marking a correct move constructor <code>noexcept</code> can therefore allow containers such as <code>std::vector</code> to move elements during growth instead of falling back to copying them.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Do not add <code>noexcept</code> blindly. The implementation must actually satisfy the promise. A move operation that calls potentially throwing code may require different design or exception guarantees.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The Rule of Five and the Rule of Zero</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A class that manually manages a resource may need to think about five special member functions: destructor, copy constructor, copy-assignment operator, move constructor, and move-assignment operator. That collection is commonly called the Rule of Five.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Modern C++ usually prefers the Rule of Zero: compose classes from standard-library types and RAII wrappers that already manage copying, moving, and destruction correctly. A class made from <code>std::string</code>, <code>std::vector</code>, and <code>std::unique_ptr</code> often needs no handwritten destructor or move operation at all. This builds directly on <a href="https://bitcoinversus.tech/2026/10/02/oscpp-016-constructors-destructors-basics/"><strong>OSC++.016: Constructors and Destructors Basics</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=iLpt23V2vQE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=iLpt23V2vQE
</div><figcaption class="wp-element-caption"><em>CppCon — Peter Sommerlad on class roles, the Rule of Zero, Rule of Five/Six, special member functions, and when move operations belong in a class design.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Moving Standard-Library Types</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Standard containers and strings already implement move semantics. That is why ownership-heavy code can stay simple when it uses library types instead of raw allocations. Moving a <code>std::vector</code> commonly transfers its internal storage ownership rather than copying every element, although programs should rely on documented semantics rather than specific implementation details.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>#include &lt;utility&gt;
#include &lt;vector&gt;

std::vector&lt;int&gt; source(1'000'000, 42);
std::vector&lt;int&gt; destination = std::move(source);

// source is valid but its exact post-move contents are unspecified.</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Move-Only Types</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Some types intentionally prohibit copying because there must be only one owner. <code>std::unique_ptr</code> is the most familiar example. Its copy constructor is deleted, while its move operations transfer exclusive ownership. That ownership model was the central subject of <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><strong>OSC++.021</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>auto first = std::make_unique&lt;int&gt;(42);

// auto second = first;            // error: copy disabled
auto second = std::move(first);    // ownership transferred</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Common Mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>Assuming <code>std::move</code> itself moves data.</li><li>Using a moved-from object as though its old value were guaranteed to remain.</li><li>Writing move operations that leave two objects owning the same resource.</li><li>Forgetting to release the destination’s old resource during move assignment.</li><li>Marking a throwing move operation <code>noexcept</code>.</li><li>Writing custom move operations when ordinary standard-library members would make the Rule of Zero sufficient.</li><li>Calling <code>std::move</code> on an object that still needs to preserve its original value.</li><li>Using <code>std::move</code> on a return value unnecessarily when copy elision can already construct the result directly.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical Exercise</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a <code>PacketBuffer</code> class that owns a dynamically allocated byte array.</li><li>Write a destructor that releases the array.</li><li>Delete the copy constructor and copy-assignment operator.</li><li>Write a <code>noexcept</code> move constructor.</li><li>Write a <code>noexcept</code> move-assignment operator.</li><li>Print messages from each special member function so you can observe which operation is selected.</li><li>Store several <code>PacketBuffer</code> objects in a <code>std::vector</code> and trigger reallocation.</li><li>Refactor the class to use <code>std::vector&lt;std::byte&gt;</code> internally and compare how much handwritten lifetime code disappears.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge Check + Answers</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>What does <code>std::move</code> do?</strong> It casts an expression so it can bind to rvalue-reference overloads; the destination operation performs the actual transfer.</li><li><strong>Does a moved-from object still exist?</strong> Yes. It remains valid and destructible, but its specific value may be unspecified.</li><li><strong>Why reset the source pointer after moving a raw-owned resource?</strong> To prevent two objects from believing they own the same resource.</li><li><strong>What is the difference between a move constructor and move assignment?</strong> A move constructor initializes a new object; move assignment replaces the state of an already existing object.</li><li><strong>Why can <code>noexcept</code> improve container behavior?</strong> Containers can safely choose move operations during reallocation when they know those moves cannot throw.</li><li><strong>What is the Rule of Zero?</strong> Prefer composing classes from types that already manage their own resources so custom copy, move, and destruction code is unnecessary.</li><li><strong>Why is <code>unique_ptr</code> movable but not copyable?</strong> Exclusive ownership can be transferred, but copying would create two owners and violate the type’s design.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Technical References</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><a href="https://en.cppreference.com/w/cpp/utility/move">cppreference — std::move</a></li><li><a href="https://en.cppreference.com/w/cpp/language/move_constructor">cppreference — Move Constructor</a></li><li><a href="https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#Rc-zero">C++ Core Guidelines — Rule of Zero and Resource Management</a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>Move semantics are about transferring resource ownership efficiently and explicitly.</strong> <code>std::move</code> makes an object eligible to be treated as a move source, while move constructors and move-assignment operators define what transfer actually means. Prefer the Rule of Zero whenever standard-library types can manage resources for you; write custom move logic only when your class truly owns a lower-level resource.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong> This lesson is educational material for technical training. Compile examples with warnings enabled and use sanitizers or static analysis when experimenting with manual resource ownership.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on technical and financial subjects for informational purposes.</p><!-- /wp:paragraph -->