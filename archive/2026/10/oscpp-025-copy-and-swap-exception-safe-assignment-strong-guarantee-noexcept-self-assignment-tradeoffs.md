---
title: "OSC++.025: Copy-and-Swap and Exception-Safe Assignment — Strong Guarantee, noexcept swap, Self-Assignment, and Tradeoffs"
status: published
wordpress_post_id: 22586
published: "2026-10-09T09:47:04"
modified: "2026-10-09T09:47:04"
live_url: "https://bitcoinversus.tech/2026/10/09/oscpp-025-copy-and-swap-exception-safe-assignment-strong-guarantee-noexcept-self-assignment-tradeoffs/"
series: "Open Source C++"
subject: cpp
lesson_number: "025"
featured_media_id: 22584
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-025-copy-swap-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22585
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-025-copy-swap-strong-guarantee-body.png"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=5WuQarP5kOE"
youtube_2: "https://www.youtube.com/watch?v=W6jZKibuJpU"
youtube_3: "https://www.youtube.com/watch?v=vLinb2fgkHk"
social_1: "https://www.reddit.com/r/cpp_questions/comments/qrwavt/"
seo_title: "OSC++.025: Copy-and-Swap and Exception-Safe Assignment"
seo_description: "Learn C++ copy-and-swap and exception-safe assignment: strong guarantees, noexcept swap, self-assignment, pass-by-value assignment, Rule of Zero, and performance tradeoffs."
no_text_boxes: true
youtube_minimum_met: 3
media_language: English
english_media_required: true
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Copy assignment is harder than it first appears because the destination object already owns a valid state before assignment begins.</strong> If copying the new state fails halfway through, the class must not leak resources or leave the destination corrupted. The <strong>copy-and-swap idiom</strong> solves this by preparing a complete temporary copy first, then committing the new state with a non-throwing <code>swap</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson continues directly from <a href="https://bitcoinversus.tech/2026/10/07/oscpp-024-rule-of-five-rule-of-zero-copy-move-lifecycle-ownership-safe-class-design/"><strong>OSC++.024: Rule of Five and Rule of Zero</strong></a>, <a href="https://bitcoinversus.tech/2026/10/06/oscpp-023-perfect-forwarding-forwarding-references-std-forward-reference-collapsing-universal-constructors/"><strong>OSC++.023: Perfect Forwarding</strong></a>, <a href="https://bitcoinversus.tech/2026/10/06/oscpp-022-move-semantics-rvalue-references-std-move-move-constructors-move-assignment/"><strong>OSC++.022: Move Semantics</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/"><strong>OSC++.021: Smart Pointers and Ownership</strong></a>. The focus is one operation: designing assignment so failure does not partially destroy a valid object.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Why copy assignment has more failure paths than copy construction.</li><li>What the basic, strong, and no-throw exception guarantees mean.</li><li>How copy-and-swap turns assignment into prepare-then-commit.</li><li>Why the copy step may throw while <code>swap</code> should normally be <code>noexcept</code>.</li><li>How copy-and-swap naturally handles self-assignment.</li><li>Why pass-by-value assignment can combine copy and move assignment logic.</li><li>When copy-and-swap is elegant but not necessarily the fastest implementation.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Core Copy-and-Swap Pattern</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A compact modern form takes the right-hand side by value. Constructing that parameter performs either a copy or a move before the function body commits anything to the destination. Inside the function, a non-throwing swap exchanges the destination state with the prepared temporary.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>class Buffer {
public:
    Buffer&amp; operator=(Buffer other) {
        swap(other);
        return *this;
    }

    void swap(Buffer&amp; other) noexcept {
        using std::swap;
        swap(data_, other.data_);
        swap(size_, other.size_);
    }

private:
    std::unique_ptr&lt;int[]&gt; data_;
    std::size_t size_{};
};</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The temporary parameter <code>other</code> first acquires the incoming value. If constructing that temporary throws, the assignment function body never commits a partial change. If construction succeeds, <code>swap</code> exchanges the complete states. When <code>other</code> goes out of scope, its destructor releases the destination’s former resources.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=5WuQarP5kOE","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=5WuQarP5kOE
</div><figcaption class="wp-element-caption"><em>CppNuts — Copy And Swap Idiom In C++. An English walkthrough of implementing assignment with a temporary object and swap for simpler, exception-safe resource management.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22585,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-025-copy-swap-strong-guarantee-body.png" alt="Original diagram showing the C++ copy-and-swap strong exception guarantee: original object, temporary copy, noexcept swap, commit, and a failure path that leaves the original object unchanged." class="wp-image-22585" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech diagram: copy-and-swap separates preparation from commit. If the temporary copy fails, the original object remains unchanged; after preparation succeeds, a non-throwing swap commits the new state.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Understand The Exception Guarantees</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Exception safety is not the claim that a function can never fail. It describes what remains true <strong>after</strong> failure. Microsoft’s modern C++ guidance describes three common levels: the <strong>basic guarantee</strong>, the <strong>strong guarantee</strong>, and the <strong>no-throw guarantee</strong>. The basic guarantee keeps objects valid and prevents leaks. The strong guarantee behaves like a transaction: either the operation succeeds, or the observable state remains unchanged. The no-throw guarantee promises that the operation itself does not allow exceptions to escape.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Copy-and-swap is attractive because the potentially throwing work happens while creating the temporary. The existing destination object is not modified until the swap step. If <code>swap</code> is truly non-throwing, that final commit can provide the strong guarantee.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=W6jZKibuJpU","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=W6jZKibuJpU
</div><figcaption class="wp-element-caption"><em>CppCon 2019 — Ben Saks, “Back to Basics: Exception Handling and Exception Safety.” An English explanation of exception guarantees, RAII, throwing/catching practices, and designing code that remains valid when operations fail.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Copy Step Can Throw</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Do not mark the pass-by-value assignment operator <code>noexcept</code> merely because its internal swap is <code>noexcept</code>. Creating the by-value parameter may invoke a copy constructor, and copying may allocate memory or copy members whose constructors can throw. The important guarantee is that this failure happens <strong>before</strong> the destination is changed.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Buffer&amp; operator=(Buffer other) {
    // If copying into 'other' failed, execution never reached here.
    swap(other);      // should not throw
    return *this;
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The swap function, by contrast, should normally exchange members whose own swaps are non-throwing. Standard-library resource handles such as <code>std::unique_ptr</code> are especially useful here because their swaps are designed for inexpensive ownership exchange.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/cpp_questions/comments/qrwavt/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/cpp_questions/comments/qrwavt/
</div><figcaption class="wp-element-caption"><em>English r/cpp_questions discussion: “What are the benefits of the copy-and-swap technique?” The thread directly discusses automatic exception safety, self-assignment, temporary ownership, and the performance tradeoff versus reusing an existing allocation.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why Self-Assignment Works Naturally</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Traditional hand-written copy assignment often checks <code>if (this == &amp;rhs)</code> because deleting the destination’s resource before copying from the source can destroy the very data being copied. Copy-and-swap does not depend on that fragile ordering. The temporary copy is complete before the destination’s old state is exchanged, so an expression such as <code>a = a;</code> remains valid without a special early-return branch.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Pass By Value Can Reuse Move Construction</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The by-value parameter also gives the compiler a useful choice. When assignment receives an lvalue, constructing <code>other</code> uses the copy constructor. When it receives an rvalue, the parameter can be move-constructed instead. The same assignment body can therefore accept both copied and moved input states.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Buffer a;
Buffer b;

a = b;             // parameter is copied from b
a = Buffer{1024};  // parameter can be moved from the temporary</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This compact design is elegant, but it should not be mistaken for a universal performance rule. A specialized copy-assignment operator may be able to reuse an existing allocation rather than always creating a new temporary resource.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vLinb2fgkHk","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vLinb2fgkHk
</div><figcaption class="wp-element-caption"><em>Howard Hinnant — “Everything You Ever Wanted to Know About Move Semantics.” This English talk examines special-member-function design and the tradeoffs of copy-and-swap, including cases where separate assignment logic can reuse storage more efficiently.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Copy-and-Swap Is About Correctness First</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Copy-and-swap is often taught because it reduces duplicated cleanup logic and makes exception safety easier to reason about. It is not automatically faster than a carefully written assignment operator. If a destination already owns a large buffer with sufficient capacity, a specialized copy assignment may reuse that memory and avoid a fresh allocation. Howard Hinnant has specifically highlighted that copy-and-swap can impose measurable overhead in classes containing reusable resources such as vectors or strings.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The design decision is therefore contextual: use copy-and-swap when its strong safety, compactness, and maintainability are worth the temporary. Prefer Rule of Zero when standard-library members can manage resources automatically. Write specialized assignment only when the resource model and measurements justify the added complexity.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A More Explicit Strong-Guarantee Assignment</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>You can also preserve the prepare-then-commit idea without using the pass-by-value form for every assignment. One approach constructs replacement resources first, then swaps or installs them only after all throwing work succeeds.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Buffer&amp; Buffer::operator=(const Buffer&amp; rhs) {
    if (this == &amp;rhs) {
        return *this;
    }

    Buffer replacement(rhs);  // may throw; *this is unchanged
    swap(replacement);        // commit, ideally noexcept
    return *this;
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This form makes the strong guarantee explicit and lets copy assignment remain a distinct operation from move assignment if the class benefits from specialized behavior.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Design Checklist</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Prefer Rule of Zero when standard-library members already provide correct ownership.</li><li>If custom assignment is required, identify every operation that may throw.</li><li>Do not destroy the valid old state until replacement state is ready.</li><li>Keep <code>swap</code> cheap and <code>noexcept</code> when the member types permit it.</li><li>Verify self-assignment remains safe.</li><li>Verify the object remains valid after allocation or copy failure.</li><li>Measure before assuming copy-and-swap is faster or slower.</li><li>Document whether assignment offers the basic or strong exception guarantee.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practical Exercise</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a class that owns a dynamically allocated array and write a correct copy constructor and destructor.</li><li>Implement copy assignment manually by allocating replacement storage before releasing the old storage.</li><li>Implement a second version using copy-and-swap.</li><li>Test <code>a = a;</code> for both implementations.</li><li>Force an allocation failure or use a member type whose copy constructor throws, then verify the destination object remains valid.</li><li>Replace the raw allocation with <code>std::vector</code> and determine whether Rule of Zero eliminates the custom assignment code entirely.</li><li>Benchmark repeated assignments where the destination already has reusable capacity and compare specialized assignment with copy-and-swap.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is the main idea of copy-and-swap?</strong> Build a complete replacement first, then commit it with swap.</li><li><strong>What does the strong exception guarantee mean?</strong> If the operation fails, the observable state remains unchanged.</li><li><strong>Can constructing the temporary copy throw?</strong> Yes. That is acceptable because the destination has not yet been modified.</li><li><strong>Why should swap normally be noexcept?</strong> The commit step should not introduce a new failure after replacement state is ready.</li><li><strong>Does copy-and-swap require a manual self-assignment check?</strong> Usually no; preparing a separate temporary makes self-assignment naturally safe.</li><li><strong>Is copy-and-swap always the fastest assignment strategy?</strong> No. A specialized assignment operator may reuse existing storage and avoid temporary allocation.</li><li><strong>What design should usually be considered before custom copy-and-swap?</strong> Rule of Zero with RAII-aware standard-library types.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Reference Resources</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://en.cppreference.com/w/cpp/language/copy_assignment"><strong>cppreference — Copy Assignment Operator</strong></a></li><li><a href="https://en.cppreference.com/w/cpp/language/rule_of_three"><strong>cppreference — Rule of Three/Five/Zero</strong></a></li><li><a href="https://learn.microsoft.com/en-us/cpp/cpp/errors-and-exception-handling-modern-cpp?view=msvc-170"><strong>Microsoft Learn — Modern C++ Exception Handling and Exception Safety</strong></a></li><li><a href="https://stackoverflow.com/questions/3279543/"><strong>Stack Overflow — What is the copy-and-swap idiom?</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/07/oscpp-024-rule-of-five-rule-of-zero-copy-move-lifecycle-ownership-safe-class-design/"><strong>OSC++.024 — Rule of Five and Rule of Zero</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Copy-and-swap treats assignment like a small transaction.</strong> Prepare a valid replacement first. If preparation fails, keep the old object. If preparation succeeds, commit with a non-throwing swap. This makes correctness and exception safety easier to reason about, while Rule of Zero remains the preferred destination whenever standard-library types can manage the resource for you.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is an original 1200×630 BitcoinVersus.Tech cover created specifically for OSC++.025 and is not reused in the body. The body uses a separate original 1200×675 English instructional diagram. The lesson contains three unique English-language YouTube videos implemented as responsive native Gutenberg 16:9 embed blocks and one directly relevant English-language social-media embed. Ordinary lesson prose is not placed inside bordered, shaded, card, callout, panel, or fixed-width text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->