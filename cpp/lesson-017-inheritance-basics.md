---
title: "OSC++.017: Inheritance Basics"
status: published
wordpress_post_id: 20182
published: "2026-10-02T21:19:03"
live_url: "https://bitcoinversus.tech/2026/10/02/oscpp-017-inheritance-basics/"
series: "Open-Source C++"
pathway: cpp
lesson_number: "017"
featured_media_id: 20181
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oscpp-017-inheritance-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=qbmQolrm6tk"
youtube_2: "https://www.youtube.com/watch?v=uTsROEjN1CY"
youtube_3: "https://www.youtube.com/watch?v=jsNE1yGItx0"
---

# OSC++.017: Inheritance Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>Inheritance lets one C++ class build on another class.</strong></p>
<p class="wp-block-paragraph">The easiest way to think about it is this:</p>
<ul class="wp-block-list">
<li><strong>Vehicle</strong> is a general class.</li>
<li><strong>Car</strong> is a more specific kind of Vehicle.</li>
<li>So <strong>Car can inherit useful parts of Vehicle</strong>.</li>
</ul>
<p class="wp-block-paragraph">In C++, the general class is usually called the <strong>base class</strong>. The class that inherits from it is called the <strong>derived class</strong>.</p>
<h2 class="wp-block-heading">Your first inheritance example</h2>
<pre class="wp-block-code"><code>#include &lt;iostream&gt;
using namespace std;

class Vehicle {
public:
    void start() {
        cout &lt;&lt; "Vehicle started\n";
    }
};

class Car : public Vehicle {
};

int main() {
    Car myCar;
    myCar.start();
}</code></pre>
<p class="wp-block-paragraph">The output is:</p>
<pre class="wp-block-code"><code>Vehicle started</code></pre>
<p class="wp-block-paragraph">Notice something important: we did <strong>not</strong> write <code>start()</code> inside <code>Car</code>. <code>Car</code> received access to that public function through inheritance.</p>
<h2 class="wp-block-heading">Read this line slowly</h2>
<pre class="wp-block-code"><code>class Car : public Vehicle</code></pre>
<p class="wp-block-paragraph">For this beginner lesson, read it as:</p>
<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow">
<p><strong>Car inherits from Vehicle.</strong></p>
</blockquote>
<p class="wp-block-paragraph"><code>Vehicle</code> is the base class. <code>Car</code> is the derived class.</p>
<h2 class="wp-block-heading">Video 1: Create a derived class with inheritance</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube">
<div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block"><span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=qbmQolrm6tk?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span></span>
</div><figcaption class="wp-element-caption"><em>This focused C++ lab shows how inheritance is used to create a derived class from a base class.</em></figcaption></figure>
<h2 class="wp-block-heading">The child can add its own feature</h2>
<pre class="wp-block-code"><code>class Vehicle {
public:
    void start() {
        cout &lt;&lt; "Vehicle started\n";
    }
};

class Car : public Vehicle {
public:
    void honk() {
        cout &lt;&lt; "Beep!\n";
    }
};</code></pre>
<p class="wp-block-paragraph">Now a <code>Car</code> object can use both:</p>
<pre class="wp-block-code"><code>Car myCar;

myCar.start();  // inherited from Vehicle
myCar.honk();   // defined in Car</code></pre>
<p class="wp-block-paragraph">That is the main benefit: put shared behavior in the general class, then put special behavior in the more specific class.</p>
<h2 class="wp-block-heading">A simple gaming example</h2>
<pre class="wp-block-code"><code>class Player {
public:
    void move() {
        cout &lt;&lt; "Player moves\n";
    }
};

class Runner : public Player {
public:
    void sprint() {
        cout &lt;&lt; "Runner sprints\n";
    }
};</code></pre>
<p class="wp-block-paragraph">A <code>Runner</code> can use the normal <code>move()</code> behavior from <code>Player</code> and add <code>sprint()</code> for itself.</p>
<h2 class="wp-block-heading">Constructors still matter</h2>
<p class="wp-block-paragraph">The previous lesson, <a href="https://bitcoinversus.tech/2026/10/02/oscpp-016-constructors-destructors-basics/">OSC++.016: Constructors and Destructors Basics</a>, introduced automatic setup and cleanup.</p>
<p class="wp-block-paragraph">With inheritance, the base part of an object is set up before the derived part.</p>
<pre class="wp-block-code"><code>class Vehicle {
public:
    Vehicle() {
        cout &lt;&lt; "Vehicle constructor\n";
    }
};

class Car : public Vehicle {
public:
    Car() {
        cout &lt;&lt; "Car constructor\n";
    }
};

int main() {
    Car myCar;
}</code></pre>
<p class="wp-block-paragraph">The output is:</p>
<pre class="wp-block-code"><code>Vehicle constructor
Car constructor</code></pre>
<p class="wp-block-paragraph">Why? A <code>Car</code> contains its <code>Vehicle</code> base part, so C++ sets up that base part first.</p>
<h2 class="wp-block-heading">Video 2: C++ inheritance and class relationships</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube">
<div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block"><span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=uTsROEjN1CY?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span></span>
</div><figcaption class="wp-element-caption"><em>This focused C++ lesson reinforces how a derived class builds on a base class. It also introduces protected members as an additional inheritance concept.</em></figcaption></figure>
<h2 class="wp-block-heading">A derived class can provide its own version</h2>
<pre class="wp-block-code"><code>class Vehicle {
public:
    void sound() {
        cout &lt;&lt; "Vehicle sound\n";
    }
};

class Car : public Vehicle {
public:
    void sound() {
        cout &lt;&lt; "Beep!\n";
    }
};

int main() {
    Car myCar;
    myCar.sound();
}</code></pre>
<p class="wp-block-paragraph">For this <code>Car</code> object, the result is <code>Beep!</code>. The derived class has its own function with the same name.</p>
<p class="wp-block-paragraph">Later lessons can go deeper into <code>virtual</code> functions and true runtime polymorphism. For now, the important idea is simply that a derived class can add behavior and can also define its own version of a function name.</p>
<h2 class="wp-block-heading">Video 3: Redefining a base-class function</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube">
<div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center;display: block"><span class="embed-youtube" style="text-align:center;display: block">[youtube https://www.youtube.com/watch?v=jsNE1yGItx0?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent&w=640&h=360]</span></span>
</div><figcaption class="wp-element-caption"><em>This tutorial shows a derived C++ class defining its own version of a base-class function.</em></figcaption></figure>
<h2 class="wp-block-heading">When inheritance makes sense</h2>
<p class="wp-block-paragraph">A good beginner test is the phrase <strong>“is a kind of.”</strong></p>
<ul class="wp-block-list">
<li>A Car <strong>is a kind of</strong> Vehicle.</li>
<li>A Runner <strong>is a kind of</strong> Player.</li>
<li>A Dog <strong>is a kind of</strong> Animal.</li>
</ul>
<p class="wp-block-paragraph">If that sentence sounds wrong, inheritance may not be the right relationship.</p>
<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list">
<li>Mixing up the base class and derived class.</li>
<li>Thinking inheritance copies and pastes the source code.</li>
<li>Using inheritance between things that are not actually related.</li>
<li>Jumping into advanced inheritance features before the basic relationship is clear.</li>
</ul>
<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list">
<li>Create a base class named <code>Animal</code>.</li>
<li>Add a public function named <code>eat()</code>.</li>
<li>Create <code>Dog</code> as a public derived class of <code>Animal</code>.</li>
<li>Add <code>bark()</code> to <code>Dog</code>.</li>
<li>Create one <code>Dog</code> object and call both <code>eat()</code> and <code>bark()</code>.</li>
</ol>
<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong>Inheritance lets a more specific class build on a more general class.</strong> In <code>class Car : public Vehicle</code>, <code>Vehicle</code> is the base class and <code>Car</code> is the derived class. <code>Car</code> can use accessible behavior from <code>Vehicle</code> and add behavior of its own.</p>

