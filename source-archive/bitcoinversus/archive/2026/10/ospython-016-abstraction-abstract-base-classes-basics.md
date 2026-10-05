---
title: "OSPython.016: Abstraction and Abstract Base Classes Basics"
status: published
wordpress_post_id: 20116
published: "2026-10-02T17:27:46"
live_url: "https://bitcoinversus.tech/2026/10/02/ospython-016-abstraction-abstract-base-classes-basics/"
series: "Open-Source Python"
pathway: python
lesson_number: "016"
featured_media_id: 20114
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ospython-016-abstraction-abstract-base-classes-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=0HbgNSoexFw"
youtube_2: "https://www.youtube.com/watch?v=ABEtGgB_XSo"
youtube_3: "https://www.youtube.com/watch?v=97V7ICVeTJc"
---

# OSPython.016: Abstraction and Abstract Base Classes Basics

Original published WordPress article content, preserved below in full:


<p class="has-large-font-size wp-block-paragraph"><strong>Abstraction lets Python programs expose the behavior a caller needs while hiding unnecessary implementation details. Abstract base classes can go one step further by defining a contract that subclasses must implement.</strong></p>



<p class="wp-block-paragraph">This lesson follows <a href="https://bitcoinversus.tech/2026/10/02/ospython-015-encapsulation-basics/">OSPython.015: Encapsulation Basics</a>. The previous lessons covered inheritance, polymorphism, and encapsulation. Abstraction completes this introductory pass through the four major object-oriented design principles.</p>


<h2 class="wp-block-heading">What abstraction means</h2>
<p class="wp-block-paragraph"><strong>Abstraction</strong> means presenting a useful interface while keeping implementation details behind that interface. A technician using a monitoring object may only need methods such as <code>read_temperature()</code> and <code>health_status()</code>. The caller should not need to know every parsing, protocol, retry, or validation step behind those methods.</p>

<pre class="wp-block-code"><code>class TemperatureSensor:
    def read_temperature(self):
        # Internal device communication is hidden here.
        return 67.4

sensor = TemperatureSensor()
print(sensor.read_temperature())</code></pre>

<p class="wp-block-paragraph">The method name gives the caller a simple interface. The implementation can change later without forcing every caller to understand the internal details.</p>

<h2 class="wp-block-heading">Video 1: Abstract base classes</h2>

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/0HbgNSoexFw?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Real Python explains why abstract base classes are useful and how they establish a consistent interface for subclasses.</em></figcaption></figure>


<h2 class="wp-block-heading">Python&#8217;s abc module</h2>
<p class="wp-block-paragraph">Python&#8217;s standard-library <code>abc</code> module provides tools for defining <strong>abstract base classes</strong>, commonly called ABCs. The two beginner-level pieces to recognize are <code>ABC</code> and <code>@abstractmethod</code>.</p>

<pre class="wp-block-code"><code>from abc import ABC, abstractmethod

class PowerDevice(ABC):
    @abstractmethod
    def status(self):
        pass</code></pre>

<p class="wp-block-paragraph"><code>PowerDevice</code> describes a required capability. It says that concrete subclasses must provide a <code>status()</code> implementation before they can be instantiated normally.</p>

<h2 class="wp-block-heading">Concrete subclasses</h2>
<pre class="wp-block-code"><code>from abc import ABC, abstractmethod

class PowerDevice(ABC):
    @abstractmethod
    def status(self):
        pass

class PDU(PowerDevice):
    def status(self):
        return "PDU online"

class UPS(PowerDevice):
    def status(self):
        return "UPS online"

pdu = PDU()
ups = UPS()

print(pdu.status())
print(ups.status())</code></pre>

<p class="wp-block-paragraph">Both concrete classes satisfy the contract by implementing <code>status()</code>. The caller can work with either device through the same high-level operation.</p>

<h2 class="wp-block-heading">What happens if a subclass is incomplete?</h2>
<pre class="wp-block-code"><code>class Transformer(PowerDevice):
    pass

unit = Transformer()</code></pre>

<p class="wp-block-paragraph">Because <code>Transformer</code> does not implement the required abstract method, attempting to instantiate it raises a <code>TypeError</code>. That is useful when a project needs a formal class contract rather than an informal naming convention.</p>

<h2 class="wp-block-heading">Video 2: Abstraction as an OOP principle</h2>

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/ABEtGgB_XSo?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>GeeksforGeeks School gives a concise explanation of abstraction and the idea of exposing essential behavior while hiding implementation detail.</em></figcaption></figure>


<h2 class="wp-block-heading">Abstract methods and concrete methods can coexist</h2>
<p class="wp-block-paragraph">An ABC does not have to contain only empty abstract methods. It can provide shared concrete behavior while requiring subclasses to supply specific pieces.</p>

<pre class="wp-block-code"><code>from abc import ABC, abstractmethod

class Monitor(ABC):
    def log_start(self):
        print("Monitoring started")

    @abstractmethod
    def read_value(self):
        pass

class TemperatureMonitor(Monitor):
    def read_value(self):
        return 68.2

monitor = TemperatureMonitor()
monitor.log_start()
print(monitor.read_value())</code></pre>

<p class="wp-block-paragraph"><code>log_start()</code> is concrete shared behavior. <code>read_value()</code> is the required extension point.</p>

<h2 class="wp-block-heading">Abstraction vs. encapsulation</h2>
<p class="wp-block-paragraph">The concepts are related but not identical. <strong>Abstraction</strong> focuses on what useful interface should be exposed. <strong>Encapsulation</strong> focuses on organizing state and behavior together and controlling how internal state is accessed or changed.</p>

<pre class="wp-block-code"><code># Abstraction question:
# "What operations should every sensor provide?"

# Encapsulation question:
# "How should the sensor protect and validate its internal state?"</code></pre>

<h2 class="wp-block-heading">Abstraction and polymorphism</h2>
<p class="wp-block-paragraph">ABCs also work naturally with polymorphism. Different concrete classes can satisfy the same abstract contract with different implementations.</p>

<pre class="wp-block-code"><code>devices = [PDU(), UPS()]

for device in devices:
    print(device.status())</code></pre>

<p class="wp-block-paragraph">The loop depends on the common interface instead of the internal details of each device class.</p>

<h2 class="wp-block-heading">Video 3: Python abstract classes in code</h2>

<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/97V7ICVeTJc?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>Bro Code&#8217;s Python course series demonstrates abstract classes and required subclass behavior with runnable Python examples.</em></figcaption></figure>


<h2 class="wp-block-heading">A data-center example</h2>
<pre class="wp-block-code"><code>from abc import ABC, abstractmethod

class CoolingSystem(ABC):
    @abstractmethod
    def supply_temperature(self):
        pass

    @abstractmethod
    def healthy(self):
        pass

class AirCooling(CoolingSystem):
    def supply_temperature(self):
        return 22.5

    def healthy(self):
        return True

class ImmersionCooling(CoolingSystem):
    def supply_temperature(self):
        return 35.0

    def healthy(self):
        return True

def print_cooling_status(system):
    print(f"Supply: {system.supply_temperature()} C")
    print(f"Healthy: {system.healthy()}")

print_cooling_status(AirCooling())
print_cooling_status(ImmersionCooling())</code></pre>

<p class="wp-block-paragraph">The reporting function does not need to know how an air system or immersion system gathers its measurements. It depends on the abstraction: every supported cooling system supplies the same required operations.</p>

<h2 class="wp-block-heading">When an ABC is useful</h2>
<ul class="wp-block-list"><li>Several related classes must provide the same operations.</li><li>You want Python to reject incomplete subclasses at instantiation time.</li><li>You need a clear extension contract for a framework or internal API.</li><li>You have shared base behavior plus required subclass-specific behavior.</li></ul>

<p class="wp-block-paragraph">Do not add an ABC merely because a project contains multiple classes. Python also supports ordinary inheritance, duck typing, and typing protocols. Use the simplest design that expresses the requirement clearly.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Forgetting to inherit from <code>ABC</code> when intending to create an ABC using the common modern pattern.</li><li>Forgetting the <code>@abstractmethod</code> decorator.</li><li>Trying to instantiate an abstract class that still has unimplemented abstract methods.</li><li>Assuming abstraction and encapsulation mean exactly the same thing.</li><li>Creating an elaborate inheritance hierarchy when a simple class or function would be clearer.</li></ul>

<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list"><li>Create an ABC named <code>Sensor</code>.</li><li>Add an abstract method named <code>read()</code>.</li><li>Create <code>TemperatureSensor</code> and <code>PowerSensor</code> subclasses.</li><li>Implement <code>read()</code> differently in each subclass.</li><li>Place both objects in a list and call <code>read()</code> in a loop.</li><li>Create an intentionally incomplete subclass and observe the error when you try to instantiate it.</li></ol>

<h2 class="wp-block-heading">Knowledge check</h2>
<p class="wp-block-paragraph"><strong>Question:</strong> What does abstraction emphasize?<br><strong>Answer:</strong> exposing the essential interface while hiding unnecessary implementation details.</p>
<p class="wp-block-paragraph"><strong>Question:</strong> Which standard-library module supports abstract base classes?<br><strong>Answer:</strong> <code>abc</code>.</p>
<p class="wp-block-paragraph"><strong>Question:</strong> What decorator marks a required abstract method?<br><strong>Answer:</strong> <code>@abstractmethod</code>.</p>
<p class="wp-block-paragraph"><strong>Question:</strong> Can a class with an unimplemented abstract method normally be instantiated?<br><strong>Answer:</strong> no; Python raises a <code>TypeError</code>.</p>

<h2 class="wp-block-heading">Previous Python lessons</h2>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/ospython-015-encapsulation-basics/">OSPython.015: Encapsulation Basics</a></p>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/ospython-014-polymorphism-basics/">OSPython.014: Polymorphism Basics</a></p>
<p class="wp-block-paragraph"><a href="https://bitcoinversus.tech/2026/10/02/ospython-013-inheritance-basics/">OSPython.013: Inheritance Basics</a></p>

<h2 class="wp-block-heading">Reference</h2>
<p class="wp-block-paragraph">Python&#8217;s standard-library documentation for <code>abc</code> is available in the <a href="https://docs.python.org/3/library/abc.html">Python documentation</a>. Real Python also provides detailed ABC examples and interface discussions.</p>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph">Abstraction helps code depend on clear capabilities rather than internal implementation details. Python&#8217;s abstract base classes let you formalize that idea when related subclasses must satisfy a shared contract.</p>
