---
title: "OSC++.021: Smart Pointers — unique_ptr, shared_ptr, weak_ptr, and Ownership"
wordpress_post_id: 20978
source: BitcoinVersus.tech
published: 2026-10-05T12:53:27
modified: 2026-10-05T15:42:42
live_url: https://bitcoinversus.tech/2026/10/05/oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership/
track: cpp
lesson_number: 21
raw_source: 021-oscpp-021-smart-pointers-unique-ptr-shared-ptr-weak-ptr-ownership-20978.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Modern C++ uses smart pointers to make dynamic-memory ownership explicit, connect object lifetime to scope, and reduce the leaks, double deletes, dangling ownership, and cleanup ambiguity associated with unmanaged <code>new</code> and <code>delete</code>.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>OSC++.021</strong> continues the object-lifetime sequence from <a href="https://bitcoinversus.tech/2026/10/04/oscpp-020-virtual-destructors-polymorphic-cleanup/"><strong>OSC++.020: Virtual Destructors and Polymorphic Cleanup</strong></a>, builds on runtime polymorphism from <a href="https://bitcoinversus.tech/2026/10/03/oscpp-018-virtual-functions-polymorphism-basics/"><strong>OSC++.018: Virtual Functions and Polymorphism Basics</strong></a>, and depends on lifetime fundamentals from <a href="https://bitcoinversus.tech/2026/10/02/oscpp-016-constructors-destructors-basics/"><strong>OSC++.016: Constructors and Destructors Basics</strong></a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Explain why ownership is a separate concept from pointer syntax.</li><li>Use <code>std::unique_ptr</code> for exclusive ownership and transfer ownership with move semantics.</li><li>Use <code>std::shared_ptr</code> when lifetime is genuinely shared by multiple owners.</li><li>Use <code>std::weak_ptr</code> to observe shared objects without extending their lifetime and to break reference cycles.</li><li>Apply <code>std::make_unique</code> and <code>std::make_shared</code> as preferred construction patterns.</li><li>Combine smart pointers with polymorphic base classes and virtual destructors.</li><li>Recognize ownership anti-patterns, hidden lifetime coupling, and unnecessary reference counting.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Ownership is the central design question</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A pointer stores an address. Ownership describes responsibility for the lifetime of the object at that address. The two concepts are related but not identical. A raw pointer can point to an object without owning it, while a smart pointer can encode ownership directly in its type.</p><!-- /wp:paragraph -->

<!-- wp:table {"className":"is-style-regular"} --><figure class="wp-block-table is-style-regular" style="max-width:100%"><table style="width:100%;max-width:100%"><thead><tr><th>Type</th><th>Typical meaning</th><th>Lifetime effect</th></tr></thead><tbody><tr><td><code>T*</code></td><td>Non-owning observation, legacy interface, or low-level address use</td><td>None by itself</td></tr><tr><td><code>std::unique_ptr&lt;T&gt;</code></td><td>Exactly one owning handle</td><td>Destroys the object when the owner is destroyed or reset</td></tr><tr><td><code>std::shared_ptr&lt;T&gt;</code></td><td>Shared ownership</td><td>Destroys the object when the last owning handle disappears</td></tr><tr><td><code>std::weak_ptr&lt;T&gt;</code></td><td>Non-owning observation of a shared object</td><td>Does not keep the object alive</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>The C++ Core Guidelines recommend representing ownership explicitly rather than scattering manual allocation and deallocation across unrelated code. See <a href="https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#Rr-owner"><strong>C++ Core Guidelines R.20–R.24</strong></a> for the ownership guidance behind modern smart-pointer practice.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The unmanaged pattern and its failure modes</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;

struct Sensor {
    Sensor()  { std::cout &lt;&lt; "acquire\n"; }
    ~Sensor() { std::cout &lt;&lt; "release\n"; }
};

void run() {
    Sensor* sensor = new Sensor;

    // More code executes here.
    // Every exit path must eventually perform:
    delete sensor;
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The allocation itself is simple. The lifetime obligation is not. An early return, exception, duplicated delete, reassignment, or unclear ownership transfer can invalidate the cleanup logic. Smart pointers move the cleanup responsibility into an object whose destructor participates in normal C++ scope unwinding.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">RAII: lifetime follows scope</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Resource Acquisition Is Initialization, commonly abbreviated RAII, binds a resource to an object's lifetime. When the owner leaves scope, its destructor releases the resource. Smart pointers apply RAII to dynamically allocated objects.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;memory&gt;

void run() {
    auto sensor = std::make_unique&lt;Sensor&gt;();

    // No explicit delete.
    // Sensor is destroyed automatically at scope exit.
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This pattern remains correct across ordinary returns and exception unwinding because the owning smart pointer is itself an automatic object.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video: RAII and the Rule of Zero</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=7Qgd9B1KuMQ","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=7Qgd9B1KuMQ
</div><figcaption class="wp-element-caption"><em>CppCon — Arthur O'Dwyer, “Back to Basics: RAII and the Rule of Zero.” Explains resource lifetime, leak prevention, double-free prevention, and how RAII supports predictable cleanup.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">std::unique_ptr: exclusive ownership</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>std::unique_ptr&lt;T&gt;</code> represents exclusive ownership. One <code>unique_ptr</code> owns the object at a time. Copying is disabled because two independent exclusive owners would contradict the ownership model.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;memory&gt;
#include &lt;string&gt;

struct Miner {
    explicit Miner(std::string model_name)
        : model(std::move(model_name)) {}

    std::string model;
};

int main() {
    auto miner = std::make_unique&lt;Miner&gt;("S21");
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><a href="https://en.cppreference.com/w/cpp/memory/unique_ptr"><strong>cppreference documents <code>std::unique_ptr</code></strong></a> as an owning smart pointer that manages an object through a stored pointer and associated deleter.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Ownership transfer requires std::move</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Exclusive ownership may be transferred, but not copied.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>auto first_owner = std::make_unique&lt;Miner&gt;("S21");

// auto second_owner = first_owner;      // error: copying disabled
auto second_owner = std::move(first_owner);

// first_owner is now empty.
// second_owner owns the Miner.</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Move semantics make the ownership transition visible in source code. After the move, the source <code>unique_ptr</code> remains a valid smart-pointer object but does not own the transferred object.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Passing unique ownership into a function</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;memory&gt;
#include &lt;vector&gt;

class Fleet {
public:
    void add(std::unique_ptr&lt;Miner&gt; miner) {
        miners.push_back(std::move(miner));
    }

private:
    std::vector&lt;std::unique_ptr&lt;Miner&gt;&gt; miners;
};

int main() {
    Fleet fleet;
    auto miner = std::make_unique&lt;Miner&gt;("S21");

    fleet.add(std::move(miner));
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Taking <code>std::unique_ptr&lt;T&gt;</code> by value communicates that the function accepts ownership. A non-owning function that merely uses the object usually does not need ownership at all; it can take <code>T&amp;</code>, <code>const T&amp;</code>, or an appropriate non-owning pointer.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Factories naturally return unique_ptr</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;memory&gt;
#include &lt;string&gt;

class Driver {
public:
    virtual void poll() = 0;
    virtual ~Driver() = default;
};

class S21Driver : public Driver {
public:
    void poll() override {}
};

std::unique_ptr&lt;Driver&gt; make_driver(const std::string&amp; model) {
    if (model == "S21") {
        return std::make_unique&lt;S21Driver&gt;();
    }

    return nullptr;
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>A factory that creates one object for one caller commonly returns <code>std::unique_ptr</code>. The caller receives ownership explicitly, and polymorphic destruction remains correct because the base class has a virtual destructor.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video: C++ smart pointers from first principles</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=YokY6HzLkXs","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=YokY6HzLkXs
</div><figcaption class="wp-element-caption"><em>CppCon — David Olsen, “Back to Basics: C++ Smart Pointers.” Covers <code>std::unique_ptr</code>, <code>std::shared_ptr</code>, ownership semantics, and practical selection guidelines.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">std::shared_ptr: shared ownership</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>std::shared_ptr&lt;T&gt;</code> allows multiple owners to participate in the lifetime of one object. The object remains alive while at least one owning <code>shared_ptr</code> exists.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;memory&gt;

struct TelemetryBus {};

int main() {
    auto bus_a = std::make_shared&lt;TelemetryBus&gt;();
    auto bus_b = bus_a;

    // bus_a and bus_b share ownership.
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><a href="https://en.cppreference.com/w/cpp/memory/shared_ptr"><strong>cppreference documents <code>std::shared_ptr</code></strong></a> as shared ownership managed through a control block containing ownership bookkeeping such as the strong-reference count.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Reference counting is a cost and a design signal</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Shared ownership is more expensive and more semantically complex than exclusive ownership. A typical <code>shared_ptr</code> implementation maintains a control block and updates ownership counts as shared handles are copied or destroyed. The correct question is not whether <code>shared_ptr</code> is convenient; it is whether several independent parts of the program truly share responsibility for keeping the object alive.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>Use <code>unique_ptr</code> when one owner is sufficient.</li><li>Use <code>shared_ptr</code> when lifetime responsibility is genuinely shared.</li><li>Do not choose <code>shared_ptr</code> merely to avoid deciding who owns an object.</li><li>Do not assume that reference counting makes the pointed-to object itself thread-safe.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">make_shared and allocation efficiency</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>auto bus = std::make_shared&lt;TelemetryBus&gt;();</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><code>std::make_shared</code> is generally the preferred construction form when creating a new object directly into shared ownership. It centralizes construction and can allow the object and control-block bookkeeping to be allocated together.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">std::weak_ptr: observation without ownership</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><code>std::weak_ptr&lt;T&gt;</code> observes an object managed by <code>shared_ptr</code> without increasing the strong ownership count. A weak pointer must be converted temporarily into a <code>shared_ptr</code> before the object is safely used.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;memory&gt;

struct Controller {
    void status() const {
        std::cout &lt;&lt; "online\n";
    }
};

int main() {
    std::weak_ptr&lt;Controller&gt; observer;

    {
        auto owner = std::make_shared&lt;Controller&gt;();
        observer = owner;

        if (auto locked = observer.lock()) {
            locked-&gt;status();
        }
    }

    if (observer.expired()) {
        std::cout &lt;&lt; "controller lifetime ended\n";
    }
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><a href="https://en.cppreference.com/w/cpp/memory/weak_ptr"><strong>cppreference documents <code>std::weak_ptr</code></strong></a> as a non-owning reference to an object managed by <code>std::shared_ptr</code>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Why weak_ptr is required for reference cycles</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Reference counting alone cannot reclaim objects that keep one another alive in a closed cycle.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;memory&gt;

struct Node {
    std::shared_ptr&lt;Node&gt; next;
    std::shared_ptr&lt;Node&gt; previous;
};</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>If two nodes own each other through <code>shared_ptr</code>, external owners may disappear while the internal strong references keep both counts above zero. One relationship should instead be non-owning when it does not represent lifetime responsibility.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>struct Node {
    std::shared_ptr&lt;Node&gt; next;
    std::weak_ptr&lt;Node&gt; previous;
};</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The weak back-reference preserves navigability without extending the predecessor's lifetime.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video: unique_ptr, shared_ptr, and weak_ptr in code</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=UOB7-B2MfwA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=UOB7-B2MfwA
</div><figcaption class="wp-element-caption"><em>The Cherno — “SMART POINTERS in C++.” Demonstrates practical use of <code>std::unique_ptr</code>, <code>std::shared_ptr</code>, and <code>std::weak_ptr</code> in a focused programming walkthrough.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Ownership and polymorphism</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Smart pointers and polymorphism work together naturally when the ownership model and destructor model agree.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;
#include &lt;memory&gt;
#include &lt;vector&gt;

class Equipment {
public:
    virtual void poll() const = 0;
    virtual ~Equipment() = default;
};

class Pdu : public Equipment {
public:
    void poll() const override {
        std::cout &lt;&lt; "PDU telemetry\n";
    }
};

class CoolingUnit : public Equipment {
public:
    void poll() const override {
        std::cout &lt;&lt; "Cooling telemetry\n";
    }
};

int main() {
    std::vector&lt;std::unique_ptr&lt;Equipment&gt;&gt; equipment;

    equipment.push_back(std::make_unique&lt;Pdu&gt;());
    equipment.push_back(std::make_unique&lt;CoolingUnit&gt;());

    for (const auto&amp; item : equipment) {
        item-&gt;poll();
    }
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The vector exclusively owns heterogeneous objects through one base interface. The collection determines lifetime, <code>unique_ptr</code> performs automatic cleanup, and the virtual destructor ensures destruction reaches the correct derived type.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Non-owning access should stay non-owning</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A function that only reads or modifies an object temporarily should not usually receive a smart pointer merely because the caller stores the object in one.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>void print_status(const Equipment&amp; equipment) {
    equipment.poll();
}

int main() {
    auto pdu = std::make_unique&lt;Pdu&gt;();
    print_status(*pdu);
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The function receives exactly the capability it needs: access to an existing object. It does not claim ownership and cannot accidentally extend or transfer lifetime.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">get(), reset(), and release()</h2><!-- /wp:heading -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Operation</th><th>Meaning</th><th>Ownership warning</th></tr></thead><tbody><tr><td><code>ptr.get()</code></td><td>Returns the stored raw pointer</td><td>The smart pointer still owns the object</td></tr><tr><td><code>ptr.reset()</code></td><td>Destroys the currently owned object and optionally takes a new one</td><td>Ownership remains inside the smart pointer model</td></tr><tr><td><code>ptr.release()</code></td><td>Relinquishes ownership and returns the raw pointer</td><td>The caller now bears manual lifetime responsibility</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:paragraph --><p><code>release()</code> is intentionally different from <code>reset()</code>. Releasing without immediately transferring the returned raw pointer to another well-defined owner can reintroduce the exact lifetime hazards that smart pointers were meant to prevent.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Choosing the pointer type</h2><!-- /wp:heading -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Design requirement</th><th>Preferred representation</th></tr></thead><tbody><tr><td>Automatic object with ordinary scope lifetime</td><td>Object by value; no pointer required</td></tr><tr><td>One dynamic owner</td><td><code>std::unique_ptr&lt;T&gt;</code></td></tr><tr><td>Several true lifetime owners</td><td><code>std::shared_ptr&lt;T&gt;</code></td></tr><tr><td>Observe a shared object without keeping it alive</td><td><code>std::weak_ptr&lt;T&gt;</code></td></tr><tr><td>Temporary guaranteed access</td><td><code>T&amp;</code> or <code>const T&amp;</code></td></tr><tr><td>Nullable, non-owning observation where pointer semantics are appropriate</td><td><code>T*</code> or <code>const T*</code></td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">Data-center control example</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;memory&gt;
#include &lt;string&gt;
#include &lt;unordered_map&gt;

class DeviceSession {
public:
    explicit DeviceSession(std::string host)
        : host_(std::move(host)) {}

    const std::string&amp; host() const { return host_; }

private:
    std::string host_;
};

class SessionManager {
public:
    void connect(std::string id, std::string host) {
        sessions_[std::move(id)] =
            std::make_unique&lt;DeviceSession&gt;(std::move(host));
    }

    const DeviceSession* find(const std::string&amp; id) const {
        auto it = sessions_.find(id);
        if (it == sessions_.end()) {
            return nullptr;
        }
        return it-&gt;second.get();
    }

private:
    std::unordered_map&lt;std::string,
                       std::unique_ptr&lt;DeviceSession&gt;&gt; sessions_;
};</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The manager is the sole owner of each session. Callers may obtain a non-owning pointer for immediate use, but the manager remains the authority over session lifetime.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Shared telemetry example</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;memory&gt;

class TelemetryStream {};

class Dashboard {
public:
    explicit Dashboard(std::shared_ptr&lt;TelemetryStream&gt; stream)
        : stream_(std::move(stream)) {}

private:
    std::shared_ptr&lt;TelemetryStream&gt; stream_;
};

class AlertEngine {
public:
    explicit AlertEngine(std::shared_ptr&lt;TelemetryStream&gt; stream)
        : stream_(std::move(stream)) {}

private:
    std::shared_ptr&lt;TelemetryStream&gt; stream_;
};

int main() {
    auto stream = std::make_shared&lt;TelemetryStream&gt;();

    Dashboard dashboard(stream);
    AlertEngine alerts(stream);
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This design is justified only if the dashboard and alert engine independently participate in keeping the telemetry stream alive. If one component clearly owns the stream and the other merely uses it temporarily, references or non-owning pointers would communicate the design more accurately.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Common mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Using <code>shared_ptr</code> by default because ownership has not been designed.</li><li>Calling <code>new</code> directly when <code>make_unique</code> or <code>make_shared</code> expresses the intended construction more clearly.</li><li>Passing smart pointers to functions that do not participate in ownership.</li><li>Calling <code>release()</code> and then forgetting that manual ownership has returned.</li><li>Creating <code>shared_ptr</code> cycles without a <code>weak_ptr</code> relationship.</li><li>Constructing separate <code>shared_ptr</code> owners from the same raw pointer, which can create independent control blocks and double deletion.</li><li>Assuming <code>shared_ptr</code> makes the object it points to inherently thread-safe.</li><li>Using <code>std::unique_ptr&lt;Base&gt;</code> for a derived object when the base destructor is not appropriate for polymorphic destruction.</li><li>Using dynamic allocation when an ordinary value object would be simpler.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create an abstract <code>Sensor</code> base class with a virtual <code>read()</code> function and a virtual defaulted destructor.</li><li>Create <code>TemperatureSensor</code> and <code>PressureSensor</code> derived classes.</li><li>Store both objects in <code>std::vector&lt;std::unique_ptr&lt;Sensor&gt;&gt;</code>.</li><li>Write a factory function that returns <code>std::unique_ptr&lt;Sensor&gt;</code> based on a string or enum selection.</li><li>Move the returned pointer into the vector and verify that the source owner becomes empty.</li><li>Create a separate telemetry object owned by two independent consumers with <code>std::shared_ptr</code>.</li><li>Add a monitoring object that observes the telemetry object with <code>std::weak_ptr</code> and uses <code>lock()</code> before access.</li><li>Create a two-node shared-ownership cycle, observe why the objects stay alive, then replace one direction with <code>weak_ptr</code>.</li><li>Refactor one function that accepts <code>shared_ptr&lt;T&gt;</code> unnecessarily so it accepts <code>const T&amp;</code> instead.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. What does <code>std::unique_ptr</code> represent?</strong><br>Exclusive ownership of a dynamically managed object. The owned object is destroyed automatically when the owning smart pointer is destroyed or reset.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. Why can a <code>unique_ptr</code> be moved but not copied?</strong><br>Moving transfers the single ownership responsibility. Copying would create two exclusive owners and violate the type's ownership model.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. When is <code>shared_ptr</code> appropriate?</strong><br>When multiple independent program components genuinely share responsibility for keeping one object alive.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. What does <code>weak_ptr</code> contribute?</strong><br>It observes an object managed by <code>shared_ptr</code> without increasing the strong ownership count and can break cycles in shared-ownership graphs.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. What does <code>weak_ptr::lock()</code> do?</strong><br>It attempts to create a temporary <code>shared_ptr</code> if the observed object is still alive. If the object has expired, the returned <code>shared_ptr</code> is empty.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>6. Why is <code>make_unique</code> normally preferred over writing <code>unique_ptr&lt;T&gt;(new T(...))</code>?</strong><br>It expresses construction directly, reduces manual ownership syntax, and keeps allocation tied to the owning smart-pointer creation.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>7. Does <code>shared_ptr</code> make the pointed-to object thread-safe?</strong><br>No. Ownership bookkeeping and access to the object's own mutable state are different concerns.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>8. Why can <code>std::unique_ptr&lt;Base&gt;</code> still require a virtual base destructor?</strong><br>Because the smart pointer may destroy a derived object through the base type. The base-class destruction interface must support the intended polymorphic cleanup.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Smart pointers are ownership types, not merely safer pointer syntax.</strong> <code>std::unique_ptr</code> should be the default owning pointer when one owner is sufficient, <code>std::shared_ptr</code> should be reserved for true shared lifetime, and <code>std::weak_ptr</code> provides non-owning observation inside shared-ownership systems. When ownership is made explicit, cleanup becomes a property of the type system and object lifetime rather than a scattered manual convention.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Technical note: The examples use C++17-compatible smart-pointer patterns except where standard-library behavior is described generically. Production code should compile with project-specific warning levels, static analysis, sanitizers, and the language standard selected by the build system.</em></p><!-- /wp:paragraph -->