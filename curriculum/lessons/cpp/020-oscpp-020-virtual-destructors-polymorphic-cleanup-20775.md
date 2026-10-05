---
title: "OSC++.020: Virtual Destructors and Polymorphic Cleanup"
wordpress_post_id: 20775
source: BitcoinVersus.tech
published: 2026-10-04T21:08:53
modified: 2026-10-04T21:23:21
live_url: https://bitcoinversus.tech/2026/10/04/oscpp-020-virtual-destructors-polymorphic-cleanup/
track: cpp
lesson_number: 20
raw_source: 020-oscpp-020-virtual-destructors-polymorphic-cleanup-20775.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>A virtual destructor preserves correct destruction across a polymorphic class hierarchy when an object is deleted through a base-class pointer.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This lesson continues the object-lifetime thread introduced in <a href="https://bitcoinversus.tech/2026/10/04/oscpp-019-pure-virtual-functions-abstract-classes-basics/">OSC++.019: Pure Virtual Functions and Abstract Classes Basics</a>, builds on runtime dispatch from <a href="https://bitcoinversus.tech/2026/10/03/oscpp-018-virtual-functions-polymorphism-basics/">OSC++.018: Virtual Functions and Polymorphism Basics</a>, and connects back to cleanup fundamentals from <a href="https://bitcoinversus.tech/2026/10/02/oscpp-016-constructors-destructors-basics/">OSC++.016: Constructors and Destructors Basics</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Why destructor dispatch matters</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Polymorphism allows a pointer of a base type to refer to an object of a derived type. Destruction creates a separate requirement: if the program destroys that derived object through the base pointer, the base class must support polymorphic destruction.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>class Device {
public:
    virtual void report() const = 0;
    virtual ~Device() = default;
};</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The virtual destructor makes the destruction operation participate in dynamic dispatch. When a derived object is destroyed through <code>Device*</code>, the derived destructor runs before the base destructor.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Derived object destruction
        ↓
Derived destructor
        ↓
Derived members
        ↓
Base destructor
        ↓
Base members</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">The unsafe pattern</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Consider a base class with a non-virtual destructor:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;

class Device {
public:
    ~Device() {
        std::cout &lt;&lt; "Device cleanup\n";
    }
};

class Miner : public Device {
public:
    ~Miner() {
        std::cout &lt;&lt; "Miner cleanup\n";
    }
};

int main() {
    Device* device = new Miner;
    delete device;
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>Deleting a derived object through a base pointer whose destructor is non-virtual is undefined behavior in the ordinary polymorphic case. Correctness cannot be inferred from a particular compiler run or from output that merely appears plausible.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><a href="https://en.cppreference.com/cpp/language/virtual">cppreference documents the virtual-destructor rule</a>: deleting a derived object through a base pointer requires a virtual base destructor for well-defined polymorphic destruction.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The safe pattern</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;

class Device {
public:
    virtual ~Device() {
        std::cout &lt;&lt; "Device cleanup\n";
    }
};

class Miner : public Device {
public:
    ~Miner() override {
        std::cout &lt;&lt; "Miner cleanup\n";
    }
};

int main() {
    Device* device = new Miner;
    delete device;
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The intended destruction sequence is:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Miner cleanup
Device cleanup</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The derived portion is destroyed first, followed by the base portion. This ordering matches the normal reverse-order destruction of a complete object.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 1: Virtual destructors in C++</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=jELbKhGkEi0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=jELbKhGkEi0
</div><figcaption class="wp-element-caption"><em>The Cherno — Virtual Destructors in C++. Demonstrates why polymorphic base classes require correct destructor dispatch.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">What virtual actually changes</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The static type of the pointer remains the base type:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Device* device = new Miner;</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The dynamic type of the allocated object is <code>Miner</code>. A virtual destructor allows the deletion operation to reach the destructor associated with that dynamic type before completing base-class cleanup.</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Concept</th><th>Meaning</th></tr></thead><tbody><tr><td>Static type</td><td>The type written in the pointer declaration, such as <code>Device*</code>.</td></tr><tr><td>Dynamic type</td><td>The actual runtime object type, such as <code>Miner</code>.</td></tr><tr><td>Virtual destructor</td><td>Enables destruction to follow the runtime object type when deletion occurs through the base interface.</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">Resource ownership makes the consequence visible</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The problem becomes easier to see when the derived class owns resources.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><code>#include &lt;iostream&gt;<br>#include &lt;memory&gt;<br><br>class Device {<br>public:<br>&nbsp;&nbsp;&nbsp;&nbsp;virtual ~Device() = default;<br>};<br><br>class CoolingController : public Device {<br>&nbsp;&nbsp;&nbsp;&nbsp;std::unique_ptr&lt;int[]&gt; samples;<br><br>public:<br>&nbsp;&nbsp;&nbsp;&nbsp;CoolingController()<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: samples(std::make_unique&lt;int[]&gt;(1024)) {}<br><br>&nbsp;&nbsp;&nbsp;&nbsp;~CoolingController() override {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;std::cout &lt;&lt; "CoolingController cleanup\n";<br>&nbsp;&nbsp;&nbsp;&nbsp;}<br>};</code></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The <code>std::unique_ptr</code> member releases its owned array automatically when the derived object is destroyed. Correct polymorphic destruction ensures that the derived destructor and derived members participate in cleanup when ownership flows through the base type.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Public virtual versus protected non-virtual</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The C++ Core Guidelines state a widely used design rule: a base-class destructor should generally be either public and virtual, or protected and non-virtual.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><a href="https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#Rc-dtor-virtual">C++ Core Guidelines C.35</a> formalizes this distinction.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><code>// Deletion through Base* is part of<br>the interface.<br>class Base {<br>public:<br>&nbsp;&nbsp;&nbsp;&nbsp;virtual ~Base() = default;<br>};</code></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><code>// Deletion through Base* is intentionally<br>disallowed.<br>class Base {<br>protected:<br>&nbsp;&nbsp;&nbsp;&nbsp;~Base() = default;<br>};</code></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A protected non-virtual destructor prevents ordinary external code from deleting an object through the base pointer. This can be appropriate when the base type provides an interface but is not intended to own or destroy derived objects polymorphically.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 2: V-tables, inheritance, and virtual destructors</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=sAZ6JvLPx_0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=sAZ6JvLPx_0
</div><figcaption class="wp-element-caption"><em>DeepDiveDev — C++ Inheritance Explained: V-Tables, Virtual Destructors &amp; Edge Cases. Connects virtual dispatch machinery to safe polymorphic destruction.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Defaulted virtual destructors</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A virtual destructor does not require custom cleanup code. A defaulted destructor is often sufficient:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>class Device {
public:
    virtual ~Device() = default;
};</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>This declaration communicates two design facts at once: the type is intended to participate safely in polymorphic destruction, and no custom destructor body is required for the base itself.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Derived destructors inherit virtual behavior</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Once the base destructor is virtual, derived destructors are virtual as well. The <code>override</code> specifier remains useful because it documents intent and lets the compiler verify the relationship.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>class Device {
public:
    virtual ~Device() = default;
};

class Miner : public Device {
public:
    ~Miner() override = default;
};</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Pure virtual destructors</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A destructor may also be pure virtual when a base class should remain abstract:</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>class Device {
public:
    virtual ~Device() = 0;
};

Device::~Device() = default;</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>The out-of-class definition is still required. Every complete derived-object destruction eventually reaches the base destructor, even when that destructor is pure virtual.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><a href="https://en.cppreference.com/cpp/language/destructor">cppreference covers both virtual and pure virtual destructor semantics</a>, including destruction order and the requirement for a pure virtual destructor definition.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Smart pointers do not remove the rule</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Modern C++ commonly replaces explicit <code>new</code> and <code>delete</code> with smart pointers. The destructor-design rule still matters when the smart pointer owns a derived object through a base type.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;memory&gt;

class Device {
public:
    virtual ~Device() = default;
};

class Miner : public Device {};

int main() {
    std::unique_ptr&lt;Device&gt; device = std::make_unique&lt;Miner&gt;();
}</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>When <code>device</code> leaves scope, <code>std::unique_ptr&lt;Device&gt;</code> destroys the owned object through the base type. The virtual destructor preserves correct cleanup of the derived object.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Data-center control example</h2><!-- /wp:heading -->

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

    ~Pdu() override {
        std::cout &lt;&lt; "PDU cleanup\n";
    }
};

class CoolingUnit : public Equipment {
public:
    void poll() const override {
        std::cout &lt;&lt; "Cooling telemetry\n";
    }

    ~CoolingUnit() override {
        std::cout &lt;&lt; "Cooling cleanup\n";
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

<!-- wp:paragraph --><p>The collection owns heterogeneous objects through one base interface. The virtual destructor allows each concrete equipment type to complete its own destruction correctly when the collection is released.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">ASIC-management example</h2><!-- /wp:heading -->

<!-- wp:code --><pre class="wp-block-code"><code>class MinerDriver {
public:
    virtual void read_hashrate() = 0;
    virtual ~MinerDriver() = default;
};

class S21Driver : public MinerDriver {
public:
    void read_hashrate() override {
        // model-specific telemetry path
    }

    ~S21Driver() override {
        // release model-specific resources if required
    }
};</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p>A common driver interface can support multiple miner models while preserving model-specific cleanup.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Video 3: Destructor fundamentals with virtual-destructor context</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=YvgrGAnBbKc","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=YvgrGAnBbKc
</div><figcaption class="wp-element-caption"><em>Sudhakar Atchala — Destructors In C++ Programming. Reinforces destructor lifecycle concepts and includes virtual-destructor context.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Common mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Deleting a derived object through a base pointer when the base destructor is non-virtual.</li><li>Assuming that the presence of another virtual function automatically makes the destructor virtual.</li><li>Adding manual resource cleanup when RAII members such as <code>std::unique_ptr</code> already express ownership safely.</li><li>Using a public non-virtual destructor on a base type that callers are expected to destroy polymorphically.</li><li>Forgetting that a pure virtual destructor still requires a definition.</li><li>Judging undefined behavior only by whether a small test appears to run without crashing.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a base class named <code>Sensor</code> with a virtual <code>read()</code> function and a virtual defaulted destructor.</li><li>Create two derived classes named <code>TemperatureSensor</code> and <code>PressureSensor</code>.</li><li>Add destructors to both derived classes that print distinct cleanup messages.</li><li>Store both objects in <code>std::vector&lt;std::unique_ptr&lt;Sensor&gt;&gt;</code>.</li><li>Allow the vector to leave scope and record the destruction sequence.</li><li>Replace the public virtual destructor with a protected non-virtual destructor and observe which ownership patterns no longer compile.</li><li>Create a separate abstract base class with a pure virtual destructor and provide the required out-of-class definition.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>1. When is a virtual base destructor required?</strong><br>When objects may be destroyed through a base-class pointer or owning base-type interface and the dynamic object may be derived.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>2. What is the destruction order for a derived object?</strong><br>The derived destructor runs first, followed by destruction of derived members, then the base destructor and base members according to normal reverse construction order.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>3. Does another virtual function automatically make the destructor virtual?</strong><br>No. The destructor must itself be declared virtual in the base hierarchy.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>4. Is a custom destructor body required to obtain polymorphic destruction?</strong><br>No. <code>virtual ~Base() = default;</code> is often sufficient.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>5. Why must a pure virtual destructor still have a definition?</strong><br>Because base-class destruction still occurs when a complete derived object is destroyed.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>6. Do smart pointers eliminate the need for virtual destructors?</strong><br>No. Owning a derived object through <code>std::unique_ptr&lt;Base&gt;</code> still depends on correct base-class destruction semantics.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>A polymorphic base class that permits destruction through the base interface should provide a public virtual destructor. Correct destructor dispatch preserves the full derived-to-base cleanup sequence and keeps resource ownership aligned with object lifetime.</strong></p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>Base pointer owns derived object
            ↓
Base destructor is virtual
            ↓
Delete or smart-pointer cleanup
            ↓
Derived destructor runs
            ↓
Derived resources released
            ↓
Base destructor runs
            ↓
Complete object cleanup</code></pre><!-- /wp:code -->

<!-- wp:paragraph --><p><em>Display note: all C++ examples and diagrams in this lesson are plain educational code blocks. They are not simulated IDE or terminal interfaces.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->