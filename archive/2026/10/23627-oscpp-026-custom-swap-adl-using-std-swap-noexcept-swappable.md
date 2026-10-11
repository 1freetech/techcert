---
post_id: 23627
title: "OSC++.026: Custom swap and ADL — using std::swap, noexcept, and Swappable Types"
live_url: "https://bitcoinversus.tech/2026/10/11/oscpp-026-custom-swap-adl-using-std-swap-noexcept-swappable/"
slug: "oscpp-026-custom-swap-adl-using-std-swap-noexcept-swappable"
featured_media_id: 23624
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-026-custom-swap-cover-1200x630-1.jpg"
status: publish
content_hash: "0c21d68fa8866099b5e53844b014cad7c33da29d"
---

<!-- wp:paragraph --><p><strong>A good custom <code>swap</code> function exchanges an object's state directly instead of rebuilding the object through expensive copy operations.</strong> In modern C++, the design is tied closely to argument-dependent lookup (ADL), <code>using std::swap;</code>, conditional <code>noexcept</code>, and the idea that generic code should find a type-specific swap when one exists.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>This lesson continues from <a href="https://bitcoinversus.tech/2026/10/09/oscpp-025-copy-and-swap-exception-safe-assignment-strong-guarantee-noexcept-self-assignment-tradeoffs/">OSC++.025: Copy-and-Swap and Exception-Safe Assignment</a>, <a href="https://bitcoinversus.tech/2026/10/07/oscpp-024-rule-of-five-rule-of-zero-copy-move-lifecycle-ownership-safe-class-design/">OSC++.024: Rule of Five and Rule of Zero</a>, and <a href="https://bitcoinversus.tech/2026/10/06/oscpp-023-perfect-forwarding-forwarding-references-std-forward-reference-collapsing-universal-constructors/">OSC++.023: Perfect Forwarding</a>. The focus now is the commit operation that copy-and-swap depends on: a correct and efficient <code>swap</code>.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Learning Objectives</h2><!-- /wp:heading -->
<!-- wp:list --><ul><li>Explain why generic <code>std::swap</code> is not always the best operation for a user-defined type.</li><li>Write a member <code>swap</code> that exchanges resources directly.</li><li>Write a non-member <code>swap</code> in the same namespace as the type.</li><li>Explain how argument-dependent lookup finds the non-member overload.</li><li>Use the idiom <code>using std::swap; swap(a, b);</code> correctly.</li><li>Apply <code>noexcept</code> when every member swap is non-throwing.</li><li>Understand how custom swap supports copy-and-swap and generic library code.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2>What std::swap Does by Default</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>For a typical movable type, the general <code>std::swap</code> implementation exchanges two objects using move construction and move assignment. Conceptually, it behaves like this:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>template&lt;class T&gt;
void generic_swap(T&amp; a, T&amp; b) {
    T temp = std::move(a);
    a = std::move(b);
    b = std::move(temp);
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>That is correct for many types. But a class that owns a pointer, file handle, socket wrapper, buffer, or other resource may be able to exchange its members more directly. A custom swap can avoid invoking the class's higher-level assignment logic and can make the intended operation explicit.</p><!-- /wp:paragraph -->
<!-- wp:image {"id":23626,"sizeSlug":"large","linkDestination":"none"} --><figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-026-cpp-logo.png?w=911" alt="C++ programming language logo." class="wp-image-23626" /><figcaption class="wp-element-caption"><em>C++ programming language logo by Adrien Memel, CC BY-SA 4.0, via Wikimedia Commons.</em></figcaption></figure><!-- /wp:image -->
<!-- wp:heading --><h2>Start With a Member swap</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Consider a class that owns a dynamic buffer through <code>std::unique_ptr</code>. A member <code>swap</code> can exchange the ownership handle and metadata directly:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>class Buffer {
public:
    void swap(Buffer&amp; other) noexcept {
        using std::swap;
        swap(data_, other.data_);
        swap(size_, other.size_);
    }

private:
    std::unique_ptr&lt;int[]&gt; data_;
    std::size_t size_{};
};</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The function exchanges the two data members. It does not allocate new storage and it does not copy the elements in the buffer. For ownership-oriented types, this can be the difference between exchanging a few machine words and rebuilding an entire resource.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=u1iewQYkYGE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">[youtube https://www.youtube.com/watch?v=u1iewQYkYGE]</div><figcaption class="wp-element-caption"><em>CppCon's Kostas Kyrimis explains argument-dependent lookup, customization points, and why qualified calls such as <code>std::swap</code> can bypass user-defined overloads.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2>Add a Non-Member swap in the Same Namespace</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Generic code cannot assume that every class exposes a member named <code>swap</code>. The conventional customization is therefore a non-member function placed in the same namespace as the type:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>namespace storage {

class Buffer {
public:
    void swap(Buffer&amp; other) noexcept {
        using std::swap;
        swap(data_, other.data_);
        swap(size_, other.size_);
    }

private:
    std::unique_ptr&lt;int[]&gt; data_;
    std::size_t size_{};
};

void swap(Buffer&amp; a, Buffer&amp; b) noexcept {
    a.swap(b);
}

} // namespace storage</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Placing the non-member overload beside the class matters because ADL examines namespaces associated with the argument types. When a call uses two <code>storage::Buffer</code> objects, the compiler can consider <code>storage::swap</code> even if that function was not explicitly named with a namespace qualifier.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Why using std::swap Comes Before swap(a, b)</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The standard idiom in generic code is:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>using std::swap;
swap(a, b);</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The first line makes the standard fallback visible. The second line is intentionally <strong>unqualified</strong>. That lets ordinary overload resolution and ADL choose a better type-specific <code>swap</code> if one exists. If no better overload is available, <code>std::swap</code> remains a candidate.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>Writing <code>std::swap(a, b)</code> directly can bypass a non-member swap found only through ADL. For a user-defined type with an efficient specialized exchange operation, that may force a less appropriate fallback path.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=TxgPZXe8XTo","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">[youtube https://www.youtube.com/watch?v=TxgPZXe8XTo]</div><figcaption class="wp-element-caption"><em>Bo Qian walks through Koenig lookup, another name for argument-dependent lookup, and shows how C++ expands name lookup using the argument types.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:heading --><h2>Why noexcept Matters</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A swap function is often used as the final commit step in exception-safe code. If all member swaps are non-throwing, the class-level swap should normally communicate that guarantee with <code>noexcept</code>. This is especially important when the function supports copy-and-swap assignment: the replacement object can be prepared first, then committed with a swap that cannot fail.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>Do not declare a function <code>noexcept</code> merely because you want it to be safe. If an operation inside a <code>noexcept</code> function actually throws and the exception escapes, the program calls <code>std::terminate</code>. The declaration must match reality.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Make noexcept Follow the Member Types</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>For a generic wrapper, it can be useful to make the exception specification depend on whether the contained type is swappable without throwing:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>template&lt;class T&gt;
class Box {
public:
    void swap(Box&amp; other)
        noexcept(std::is_nothrow_swappable_v&lt;T&gt;)
    {
        using std::swap;
        swap(value_, other.value_);
    }

private:
    T value_;
};</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>Since C++17, traits such as <code>std::is_swappable_v</code> and <code>std::is_nothrow_swappable_v</code> make it easier to reason about whether a type supports the operation and whether the operation can throw.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Connect swap Back to Copy-and-Swap</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The previous lesson used a pass-by-value assignment operator:</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>Buffer&amp; operator=(Buffer other) {
    swap(other);
    return *this;
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>That pattern works well only when the final swap really is cheap and non-throwing. The expensive or potentially throwing work occurs while constructing <code>other</code>. Once that succeeds, state exchange commits the new value and the temporary later destroys the old state.</p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>A badly designed swap that calls the same assignment operator again can create recursion. That is why a custom swap should normally exchange the data members directly instead of implementing itself through whole-object assignment.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Related Social Discussion</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><em>Related social discussion:</em> <a href="https://www.linkedin.com/posts/naresh-jagadeesan_moderncpp-effectivecpp-cplusplus-activity-7338915984512098308-b5zv">Naresh Jagadeesan discusses copy-and-swap, a friend/non-member <code>swap</code>, ADL, <code>using std::swap</code>, and <code>noexcept</code></a>.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>std::ranges::swap in C++20</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>C++20 adds <code>std::ranges::swap</code>, a customization-point object that is designed to find appropriate swap behavior in generic code. Its lookup rules differ in detail from directly calling <code>std::swap</code>, but the engineering goal is similar: use an efficient user-provided exchange operation when one is available and fall back safely when it is not.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;utility&gt;

std::ranges::swap(a, b);</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>For modern ranges-oriented generic code, this form can be clearer than manually reproducing the traditional unqualified-swap idiom. Understanding classic ADL remains important because it appears throughout the standard library and existing C++ codebases.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>Common Mistakes</h2><!-- /wp:heading -->
<!-- wp:list --><ul><li><strong>Calling only <code>std::swap</code> in generic code:</strong> this can miss a type-specific non-member overload discovered through ADL.</li><li><strong>Implementing custom swap with assignment:</strong> this can add unnecessary work or recurse back into copy-and-swap assignment.</li><li><strong>Forgetting a member:</strong> every state-bearing member must participate in the exchange unless omission is intentional.</li><li><strong>Claiming <code>noexcept</code> incorrectly:</strong> a throwing operation inside a non-throwing function can terminate the program.</li><li><strong>Putting the overload in an unrelated namespace:</strong> ADL will not find it simply because the function has the right name.</li><li><strong>Over-customizing trivial types:</strong> if ordinary <code>std::swap</code> is already correct and efficient, a custom overload may add no value.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2>Practice Lab</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li>Create a class that owns a <code>std::unique_ptr&lt;int[]&gt;</code> and a size value.</li><li>Write a member <code>swap</code> that exchanges both members.</li><li>Add a non-member <code>swap</code> in the same namespace.</li><li>Write a small generic function using <code>using std::swap; swap(a, b);</code>.</li><li>Verify that your custom overload is selected for your class.</li><li>Use <code>static_assert(std::is_swappable_v&lt;YourType&gt;);</code>.</li><li>If all member swaps are non-throwing, verify <code>std::is_nothrow_swappable_v&lt;YourType&gt;</code>.</li><li>Use the custom swap inside a copy-and-swap assignment operator and test self-assignment.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Knowledge Check</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li>Why can a custom swap be faster than generic whole-object swapping?</li><li>Where should a non-member swap normally be declared for a user-defined type?</li><li>Why does generic code often write <code>using std::swap;</code> before calling <code>swap(a, b)</code>?</li><li>What feature lets the compiler search the namespace associated with the argument type?</li><li>Why is <code>noexcept</code> valuable for swap?</li><li>What happens if an exception escapes a function declared <code>noexcept</code>?</li><li>Which C++17 trait reports whether a type can be swapped without throwing?</li><li>What modern C++20 customization point can also perform generic swapping?</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Answer Guide</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol><li>It can exchange resource handles and metadata directly rather than reconstructing or copying the resource.</li><li>In the same namespace as the user-defined type.</li><li>It keeps the standard fallback available while allowing an ADL-found type-specific overload to win.</li><li>Argument-dependent lookup, also called Koenig lookup.</li><li>It allows swap to serve as a reliable non-throwing commit operation and enables stronger generic guarantees.</li><li>The program calls <code>std::terminate</code>.</li><li><code>std::is_nothrow_swappable_v&lt;T&gt;</code>.</li><li><code>std::ranges::swap</code>.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2>Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>Custom swap is a small function with a large role in modern C++ design.</strong> Put the non-member overload beside the type, exchange members directly, use <code>using std::swap; swap(...)</code> when writing generic code, and declare <code>noexcept</code> only when the member exchanges truly cannot throw.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2>References</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Primary references: <a href="https://en.cppreference.com/w/cpp/utility/swap">cppreference — std::swap</a>, <a href="https://en.cppreference.com/w/cpp/utility/ranges/swap">cppreference — std::ranges::swap</a>, and <a href="https://en.cppreference.com/w/cpp/language/adl">cppreference — Argument-dependent lookup</a>.</p><!-- /wp:paragraph -->
<!-- wp:separator --><hr class="wp-block-separator has-alpha-channel-opacity" /><!-- /wp:separator -->
<!-- wp:paragraph --><p><strong>Advertisement</strong></p><!-- /wp:paragraph -->
<!-- wp:shortcode -->[tweet https://twitter.com/1BitcoinVersus/status/1937006164555993338]<!-- /wp:shortcode -->
<!-- wp:paragraph --><p><strong><em><sup>BitcoinVersus.Tech Editor's Note:</sup></em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em><sup>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our independent technical education work, please donate Bitcoin here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</sup></em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This lesson is for informational and educational purposes.</em></p><!-- /wp:paragraph -->