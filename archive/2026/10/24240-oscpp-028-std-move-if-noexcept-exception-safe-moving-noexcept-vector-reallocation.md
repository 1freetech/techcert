---
post_id: 24240
title: "OSC++.028: std::move_if_noexcept — Exception-Safe Moving, noexcept, and Vector Reallocation"
live_url: "https://bitcoinversus.tech/2026/10/13/oscpp-028-std-move-if-noexcept-exception-safe-moving-noexcept-vector-reallocation/"
slug: "oscpp-028-std-move-if-noexcept-exception-safe-moving-noexcept-vector-reallocation"
featured_media_id: 24241
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-028-move-if-noexcept-cover-1200x630-1.png"
status: publish
---

<!-- wp:paragraph -->
<p><strong><code>std::move_if_noexcept</code> lets generic C++ code prefer a move when moving is known not to throw, but fall back to copying when that gives a stronger recovery path.</strong> The function is small, but the design idea behind it connects move semantics, <code>noexcept</code>, type traits, containers, and exception guarantees.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/12/oscpp-027-std-exchange-replace-value-return-old-one/"><strong>OSC++.027: std::exchange</strong></a>, <a href="https://bitcoinversus.tech/2026/10/11/oscpp-026-custom-swap-adl-using-std-swap-noexcept-swappable/"><strong>OSC++.026: Custom swap and ADL</strong></a>, <a href="https://bitcoinversus.tech/2026/10/09/oscpp-025-copy-and-swap-exception-safe-assignment-strong-guarantee-noexcept-self-assignment-tradeoffs/"><strong>OSC++.025: Copy-and-Swap and Exception-Safe Assignment</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/06/oscpp-022-move-semantics-rvalue-references-std-move-move-constructors-move-assignment/"><strong>OSC++.022: Move Semantics</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=szU5b972F7E&amp;w=900&amp;h=506]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>CppCon’s Ben Saks explains modern move semantics and how containers benefit when types provide efficient move operations.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You’ll Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Explain what <code>std::move_if_noexcept</code> returns.</li><li>Understand why a throwing move can complicate rollback.</li><li>Explain the strong exception guarantee in practical terms.</li><li>Understand why <code>std::vector</code> may copy during reallocation even when a move constructor exists.</li><li>Use <code>std::is_nothrow_move_constructible</code> and <code>std::is_copy_constructible</code> to reason about the decision.</li><li>Know why move constructors should usually be marked <code>noexcept</code> when they truly cannot throw.</li><li>Recognize the special case of move-only types whose move constructor may throw.</li><li>Design resource-owning types that work well with standard containers.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Core Decision</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The current <a href="https://en.cppreference.com/w/cpp/utility/move_if_noexcept"><strong>cppreference documentation for std::move_if_noexcept</strong></a> describes a two-way choice. If type <code>T</code> is nothrow-move-constructible, or if <code>T</code> cannot be copied, the function produces an rvalue reference so a move can be selected. Otherwise, it produces a <code>const T&amp;</code>, allowing copy construction instead.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Nothrow move available:</strong> prefer moving.</li><li><strong>Move may throw and copying is available:</strong> prefer copying.</li><li><strong>Move may throw but copying is impossible:</strong> moving is still the only available transfer path.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>The important point is that <code>std::move_if_noexcept</code> does not itself move or copy an object. Like <code>std::move</code>, it changes the value category seen by later overload resolution. The constructor or function that receives the result performs the actual move or copy.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why a Throwing Move Is Hard to Undo</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Suppose a container has five existing elements and allocates a larger buffer. It starts transferring elements into the new storage. If copying element three throws, the original five elements can remain untouched in the old buffer while the partially created copies in the new buffer are destroyed. That makes rollback straightforward.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A move is different because moving may modify the source object. If element zero and element one have already been moved from and then moving element two throws, the old buffer may now contain partially moved-from objects. Restoring the exact original state could require moving values back, and that recovery move could also throw.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is the exception-safety problem that <code>std::move_if_noexcept</code> helps generic code avoid when a safe copy path exists.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[embed]https://www.reddit.com/r/cpp_questions/comments/1fiih0g/[/embed]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>A C++ community discussion walks through the same vector-reallocation problem: when moves can throw, copying can preserve the original elements and support rollback.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Strong Exception Guarantee</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <strong>strong exception guarantee</strong> is commonly summarized as “the operation either succeeds completely or leaves the observable program state unchanged.” It is a transactional idea: commit the new state only after all risky work succeeds.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That guarantee is easier to provide when the old objects remain intact until the replacement state has been built successfully. Copy construction naturally supports that pattern because the source object is not consumed. A non-throwing move can also support it because the transfer phase cannot fail midway.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A potentially throwing move combines the two difficult properties: it may alter the source and it may fail. That is why generic library code needs type information before selecting the fastest transfer path.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">How the Type Traits Drive the Choice</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The decision is based on compile-time properties. <code>std::is_nothrow_move_constructible&lt;T&gt;</code> asks whether constructing <code>T</code> from <code>T&amp;&amp;</code> is known not to throw. <code>std::is_copy_constructible&lt;T&gt;</code> asks whether copying is available.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Conceptually, the move path is selected when “move is nothrow” is true or “copy is unavailable” is true. Otherwise the copy path is selected. The result type therefore becomes either <code>T&amp;&amp;</code> or <code>const T&amp;</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Case A:</strong> copyable type + <code>noexcept</code> move → move.</li><li><strong>Case B:</strong> copyable type + potentially throwing move → copy.</li><li><strong>Case C:</strong> move-only type + <code>noexcept</code> move → move.</li><li><strong>Case D:</strong> move-only type + potentially throwing move → move anyway because no copy alternative exists.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Why std::vector Is the Classic Example</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When a <code>std::vector</code> runs out of capacity, it commonly allocates a larger contiguous region and constructs the existing elements into that new storage. For a resource-owning type, moving can be far cheaper than copying because a move may transfer a pointer or handle instead of duplicating the underlying resource.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>However, performance is not the only requirement. The container also has exception-safety obligations. That means a type with a move constructor that exists but is not declared <code>noexcept</code> can cause vector growth to use copies instead of moves when copying is available.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This behavior can surprise developers who write a move constructor, benchmark a vector, and still observe copy construction during capacity growth. The missing piece is often the exception specification rather than the move constructor itself.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=knEaMpytRMA&amp;w=900&amp;h=506]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>Andreas Fertig’s CppCon move-semantics session explicitly discusses why move operations should be <code>noexcept</code> when possible and how that affects efficient standard-library use.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">noexcept Is a Contract, Not a Performance Hint</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Marking a move constructor <code>noexcept</code> tells callers that the operation will not propagate an exception. Generic code is then free to depend on that guarantee. This can unlock better container behavior, but the declaration must be truthful.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If a function declared <code>noexcept</code> allows an exception to escape, the program calls <code>std::terminate</code>. Therefore, do not add <code>noexcept</code> merely because a benchmark improves. First verify that every operation performed by the move constructor is itself non-throwing under the intended contract.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Moves that simply exchange pointers, handles, sizes, or ownership flags are often natural candidates for <code>noexcept</code>. Moves that allocate memory, invoke user callbacks, or perform other operations capable of throwing require more careful design.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Resource-Owning Type Example</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Imagine a class named <code>Buffer</code> that owns heap memory through a pointer plus a size. A good move constructor can transfer the pointer and size into the destination, then place the source into a valid empty state. If those operations are only pointer and integer assignments, the move can normally be declared <code>noexcept</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>With that guarantee, a vector of <code>Buffer</code> objects can typically relocate its elements by moving them. Without the guarantee, the same vector may choose to copy each <code>Buffer</code> during growth if copying exists.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is one reason the Rule of Zero remains attractive: standard-library resource-owning members such as <code>std::unique_ptr</code> can often provide correct move behavior automatically, reducing the number of special member functions you must implement and audit yourself.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What Happens With Move-Only Types?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If a type cannot be copied, <code>std::move_if_noexcept</code> cannot choose copying as a fallback. It therefore returns an rvalue reference even if the move constructor may throw.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That does not magically make the move safe. It means the generic algorithm has no copy alternative. Depending on the operation and the standard-library requirements involved, the strongest rollback guarantee may no longer be available if the move throws.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The ISO C++ site has highlighted this exact container case: a move-only element type with a potentially throwing move can be used with vector operations, but an exception during relocation can weaken the recovery behavior compared with a nothrow-movable type.</p>
<!-- /wp:paragraph -->

<!-- wp:shortcode -->
[embed]https://www.reddit.com/r/cpp_questions/comments/q5gtvx/[/embed]
<!-- /wp:shortcode -->

<!-- wp:paragraph -->
<p><em>This vector-implementation discussion focuses on the difficult case where moving user-supplied elements during reallocation can throw and the container must clean up partial construction safely.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">std::move vs. std::move_if_noexcept</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong><code>std::move(x)</code>:</strong> unconditionally treats <code>x</code> as an xvalue so move-aware overloads may be selected.</li><li><strong><code>std::move_if_noexcept(x)</code>:</strong> conditionally exposes an rvalue or a const lvalue depending on move exception safety and copy availability.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Use <code>std::move</code> when your algorithm intentionally transfers from the source regardless of the move constructor’s exception specification. Use <code>std::move_if_noexcept</code> in generic transfer code when preserving rollback behavior matters and copying is an acceptable fallback.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Do Not Use It Everywhere</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><code>std::move_if_noexcept</code> is not a universal replacement for <code>std::move</code>. Its main value appears when an algorithm has both a move path and a copy path and exception safety changes which path is preferable.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Application code that is clearly transferring ownership, such as assigning one unique owner into another, normally uses ordinary move semantics. Generic containers, buffers, transactional replacement operations, and reusable library components are where the conditional decision becomes especially useful.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Practical Design Checklist</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>Determine whether your type actually needs custom copy or move operations.</li><li>Prefer the Rule of Zero when standard-library members can own the resources for you.</li><li>If you implement a move constructor, identify every operation it performs.</li><li>Mark the move constructor <code>noexcept</code> only if an exception cannot escape.</li><li>Check whether move assignment can also truthfully be <code>noexcept</code>.</li><li>Test the traits <code>std::is_nothrow_move_constructible_v&lt;T&gt;</code> and <code>std::is_copy_constructible_v&lt;T&gt;</code> when generic behavior matters.</li><li>Remember that vector reallocation may choose copying when a move can throw.</li><li>Do not assume that adding a move constructor automatically makes container relocation use moves.</li><li>Document any move-only type whose move can throw because it may weaken exception guarantees in generic code.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hands-On Exercise</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>Create a small class that records whenever its copy constructor or move constructor runs.</li><li>Give it both copy and move construction, but initially leave the move constructor without <code>noexcept</code>.</li><li>Store several objects in a <code>std::vector</code> and trigger reallocation by growing past capacity.</li><li>Record whether copies or moves occur during relocation.</li><li>Change only the move constructor so it is truthfully declared <code>noexcept</code>.</li><li>Repeat the same vector-growth test and compare the constructor calls.</li><li>Check <code>std::is_nothrow_move_constructible_v&lt;YourType&gt;</code> in both versions.</li><li>Delete the copy constructor in a separate experiment and observe how the available transfer path changes.</li><li>Explain which version gives a container the easiest path to the strong exception guarantee.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>Does <code>std::move_if_noexcept</code> itself move an object?</li><li>When does it return an rvalue reference?</li><li>When can it return a const lvalue reference?</li><li>Why can copying be safer than a potentially throwing move during reallocation?</li><li>What does the strong exception guarantee mean?</li><li>Why can a vector copy a type even though that type has a move constructor?</li><li>What happens if a function declared <code>noexcept</code> lets an exception escape?</li><li>Why does a move-only type force a different decision?</li><li>Which type trait checks whether move construction is known not to throw?</li><li>Should every move constructor automatically be marked <code>noexcept</code>?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ol class="wp-block-list"><li>No. It changes the value category presented to overload resolution.</li><li>When move construction is nothrow, or when the type is not copy-constructible.</li><li>When the move may throw and copying is available.</li><li>Copies leave the original objects unchanged, making rollback after partial construction easier.</li><li>If the operation fails, it should leave the observable state unchanged.</li><li>The move constructor may not be declared non-throwing, so copying can better preserve exception guarantees.</li><li><code>std::terminate</code> is called.</li><li>There is no copy fallback, so the algorithm must use the move path.</li><li><code>std::is_nothrow_move_constructible</code>.</li><li>No. Use <code>noexcept</code> only when the contract is true.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaway</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><code>std::move_if_noexcept</code> is where performance and exception safety meet.</strong> It lets generic code move when that transfer is guaranteed not to throw, but preserve a copy-based rollback path when moving could leave source objects modified before failure.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">References</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Primary learning references: <a href="https://en.cppreference.com/w/cpp/utility/move_if_noexcept">cppreference — std::move_if_noexcept</a>, <a href="https://en.cppreference.com/w/cpp/header/utility">cppreference — &lt;utility&gt;</a>, <a href="https://isocpp.org/blog/2017/10/quick-q-can-i-use-move-only-exception-throwable-objects-with-vectors">Standard C++ — move-only throwable objects with vectors</a>, and the CppCon move-semantics sessions embedded above.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Next:</strong> OSC++.029 will continue the modern C++ utility and type-design sequence.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>Practice note: test constructor behavior with compiler warnings enabled and multiple standard-library implementations when container performance or exception guarantees are part of your design requirements.</em></p>
<!-- /wp:paragraph -->