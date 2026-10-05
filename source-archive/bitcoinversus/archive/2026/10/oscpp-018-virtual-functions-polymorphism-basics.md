---
title: "OSC++.018: Virtual Functions and Polymorphism Basics"
status: published
wordpress_post_id: 20249
published: "2026-10-03T10:30:13"
live_url: "https://bitcoinversus.tech/2026/10/03/oscpp-018-virtual-functions-polymorphism-basics/"
series: "Open-Source C++"
pathway: cpp
lesson_number: "018"
featured_media_id: 20248
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-018-virtual-functions-polymorphism-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=lWvq8nSQs_M"
youtube_2: "https://www.youtube.com/watch?v=K7l8T55fnXM"
youtube_3: "https://www.youtube.com/watch?v=IMUaLJiCHzg"
---

# OSC++.018: Virtual Functions and Polymorphism Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>Polymorphism means the same kind of call can produce different behavior depending on the actual object.</strong></p>

<p class="wp-block-paragraph">In C++, a <code>virtual</code> function lets a derived class provide its own version of a base-class function and have that version selected through a base-class reference or pointer.</p>

<p class="wp-block-paragraph">Start with one simple idea:</p>
<pre class="wp-block-code"><code>Animal says: "Animal"
Dog says:    "Woof"
Cat says:    "Meow"</code></pre>

<h2 class="wp-block-heading">The smallest useful example</h2>
<pre class="wp-block-code"><code>#include &lt;iostream&gt;

class Animal {
public:
    virtual void speak() {
        std::cout &lt;&lt; "Animal\n";
    }
};

class Dog : public Animal {
public:
    void speak() override {
        std::cout &lt;&lt; "Woof\n";
    }
};

int main() {
    Dog dog;
    Animal&amp; pet = dog;

    pet.speak();
}</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>Woof</code></pre>

<p class="wp-block-paragraph">The variable <code>pet</code> is an <code>Animal</code> reference, but it refers to a real <code>Dog</code> object. Because <code>speak()</code> is virtual, C++ calls <code>Dog::speak()</code>.</p>

<h2 class="wp-block-heading">Video 1: Virtual functions and override</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/lWvq8nSQs_M?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This focused C++ lesson demonstrates virtual functions and overriding in an inheritance hierarchy.</em></figcaption></figure>

<h2 class="wp-block-heading">What does virtual do?</h2>
<p class="wp-block-paragraph">Look at the base class:</p>
<pre class="wp-block-code"><code>virtual void speak()</code></pre>

<p class="wp-block-paragraph">The keyword <code>virtual</code> tells C++ that derived classes may provide their own version and that the program should select the appropriate overridden function when calling through a base reference or pointer.</p>

<p class="wp-block-paragraph">Without getting into the internal machinery yet, think:</p>
<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow"><p><strong>virtual = let the actual object choose the overridden behavior.</strong></p></blockquote>

<h2 class="wp-block-heading">What does override do?</h2>
<pre class="wp-block-code"><code>void speak() override</code></pre>

<p class="wp-block-paragraph"><code>override</code> tells the compiler, “I intend this function to override a virtual function from a base class.”</p>

<p class="wp-block-paragraph">That is useful because the compiler can catch mistakes. If the function does not actually match a virtual base-class function, the compiler reports an error instead of silently accepting your intention.</p>

<h2 class="wp-block-heading">Video 2: Runtime method selection</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/K7l8T55fnXM?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This beginner lesson connects virtual functions to runtime polymorphism and method selection.</em></figcaption></figure>

<h2 class="wp-block-heading">Add a Cat</h2>
<pre class="wp-block-code"><code>class Cat : public Animal {
public:
    void speak() override {
        std::cout &lt;&lt; "Meow\n";
    }
};</code></pre>

<p class="wp-block-paragraph">Now both <code>Dog</code> and <code>Cat</code> are kinds of <code>Animal</code>, but each can respond differently to the same <code>speak()</code> call.</p>

<pre class="wp-block-code"><code>Dog dog;
Cat cat;

Animal&amp; first = dog;
Animal&amp; second = cat;

first.speak();
second.speak();</code></pre>

<p class="wp-block-paragraph">Output:</p>
<pre class="wp-block-code"><code>Woof
Meow</code></pre>

<p class="wp-block-paragraph">Same base-class interface. Different actual objects. Different behavior. That is the beginner version of runtime polymorphism.</p>

<h2 class="wp-block-heading">How this connects to inheritance</h2>
<p class="wp-block-paragraph">The previous lesson, <a href="https://bitcoinversus.tech/2026/10/02/oscpp-017-inheritance-basics/">OSC++.017: Inheritance Basics</a>, introduced base and derived classes.</p>

<p class="wp-block-paragraph">Inheritance gives us the relationship:</p>
<pre class="wp-block-code"><code>Animal
  ├── Dog
  └── Cat</code></pre>

<p class="wp-block-paragraph">Virtual functions add behavior to that relationship:</p>
<pre class="wp-block-code"><code>Animal reference → Dog object → Dog behavior
Animal reference → Cat object → Cat behavior</code></pre>

<h2 class="wp-block-heading">Simple game example</h2>
<p class="wp-block-paragraph">Imagine a game with different characters. Every character can perform an action, but the action is different for each character.</p>

<pre class="wp-block-code"><code>class Character {
public:
    virtual void action() {
        std::cout &lt;&lt; "Character acts\n";
    }
};

class Miner : public Character {
public:
    void action() override {
        std::cout &lt;&lt; "Miner deploys an ASIC\n";
    }
};

class Engineer : public Character {
public:
    void action() override {
        std::cout &lt;&lt; "Engineer repairs equipment\n";
    }
};</code></pre>

<p class="wp-block-paragraph">The game can work with a <code>Character</code> interface while each real character supplies its own action.</p>

<h2 class="wp-block-heading">Video 3: Polymorphism, virtual functions, and abstract classes</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/IMUaLJiCHzg?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This beginner OOP tutorial reinforces polymorphism and virtual functions and previews how the idea extends into abstract classes.</em></figcaption></figure>

<h2 class="wp-block-heading">Reference vs. copy</h2>
<p class="wp-block-paragraph">For this lesson, notice the ampersand:</p>
<pre class="wp-block-code"><code>Animal&amp; pet = dog;</code></pre>

<p class="wp-block-paragraph">This makes <code>pet</code> a reference to the existing <code>dog</code> object. We are not creating a separate <code>Animal</code> copy.</p>

<p class="wp-block-paragraph">This connects back to <a href="https://bitcoinversus.tech/2026/09/25/cpp-lesson-6-references-pass-by-reference/">OSC++.006: References and Pass by Reference</a>.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Forgetting <code>virtual</code> on the base-class function when runtime overriding is intended.</li><li>Leaving off <code>override</code> and making a signature mistake that the compiler could have caught.</li><li>Thinking polymorphism means every function must be virtual.</li><li>Confusing overriding with overloading. Overriding replaces inherited virtual behavior in a derived class; overloading uses the same function name with different parameter lists.</li><li>Trying to learn vtables before understanding the simple behavior first.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list"><li>Create a base class named <code>Vehicle</code>.</li><li>Add a virtual function named <code>move()</code>.</li><li>Create <code>Car</code> and <code>Bike</code> classes that inherit from <code>Vehicle</code>.</li><li>Override <code>move()</code> in both classes.</li><li>Create a <code>Car</code> and a <code>Bike</code>.</li><li>Use <code>Vehicle&amp;</code> references to call <code>move()</code> and observe the different output.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong><code>virtual</code> enables runtime selection of overridden behavior through a base-class interface, and <code>override</code> lets the compiler verify that a derived function really overrides a base virtual function.</strong> In plain English: the program can say “speak” to an <code>Animal</code> and still get the correct <code>Dog</code> or <code>Cat</code> behavior.</p>
