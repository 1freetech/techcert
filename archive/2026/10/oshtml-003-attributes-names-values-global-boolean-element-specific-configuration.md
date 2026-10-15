---
post_id: 25646
title: "OSHTML.003: Attributes — Names, Values, Global Attributes, Boolean Attributes, and Element-Specific Configuration"
live_url: "https://bitcoinversus.tech/2026/10/15/oshtml-003-attributes-names-values-global-boolean-element-specific-configuration/"
featured_media_id: 25643
featured_media_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oshtml-003-cover-1200x630-1.jpg"
status: publish
series: "Open Source HTML"
certification: OSHTML
lesson_number: "003"
lesson_topic: "Attributes"
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Attributes add configuration or metadata to an HTML element.</strong></li><li><strong>Some attributes are global and can appear on nearly any HTML element; others only make sense on specific elements.</strong></li><li><strong>Boolean attributes are controlled by presence or absence, not by writing true or false.</strong></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>In <a href="https://bitcoinversus.tech/2026/10/10/oshtml-002-elements-start-tags-end-tags-void-elements-nesting-semantic-structure/"><strong>OSHTML.002: Elements</strong></a>, we learned that HTML pages are trees made from elements. Most elements have a start tag, content, and an end tag, while void elements such as <code>img</code> and <code>input</code> have no end tag. This lesson adds the next layer: the information written inside a start tag that changes an element’s identity, destination, behavior, language, accessibility, data, or configuration.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=lmv8J2y_HvQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=lmv8J2y_HvQ
</div><figcaption class="wp-element-caption"><em>The Common Coder introduces HTML elements, attributes, global attributes, and how to use the MDN reference.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Identify an HTML attribute name and value.</li><li>Place attributes correctly inside a start tag.</li><li>Use quoted attribute values consistently.</li><li>Distinguish global attributes from element-specific attributes.</li><li>Explain how boolean attributes work.</li><li>Use <code>id</code>, <code>class</code>, <code>lang</code>, <code>title</code>, <code>hidden</code>, and <code>data-*</code> appropriately.</li><li>Use common element-specific attributes such as <code>href</code>, <code>src</code>, <code>alt</code>, <code>type</code>, <code>name</code>, <code>value</code>, <code>required</code>, and <code>disabled</code>.</li><li>Recognize common attribute mistakes that lead to invalid, inaccessible, or confusing markup.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What Is an HTML Attribute?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An attribute is additional information attached to an HTML element. Attributes normally appear inside the element’s start tag after the element name. The <a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Attributes"><strong>MDN HTML attribute reference</strong></a> describes attributes as values that configure elements or adjust their behavior.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;a href="https://example.com"&gt;Visit Example&lt;/a&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In this example, <code>a</code> is the element name, <code>href</code> is the attribute name, and <code>https://example.com</code> is the attribute value. The attribute does not replace the element. It configures the element by telling the browser where the link should go.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Attribute Names and Values</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Most attributes follow a name-and-value pattern. The name identifies what is being configured. The value supplies the configuration. Although HTML permits some unquoted values under limited syntax rules, beginners should normally quote attribute values because quoted values are easier to read and less likely to break when spaces or special characters appear.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;img src="rack.jpg" alt="Server rack with fiber cabling" width="800" height="533"&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This single <code>img</code> element contains four attributes. <code>src</code> identifies the image resource, <code>alt</code> provides a text alternative, and <code>width</code> and <code>height</code> provide dimensions. The element remains one node even though several attributes configure it.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=UGIKi7CGrBU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=UGIKi7CGrBU
</div><figcaption class="wp-element-caption"><em>STP Computer Education demonstrates how HTML attributes provide additional information and behavior to elements.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Global Attributes</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Global attributes are attributes defined for use across HTML elements. The <a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Global_attributes"><strong>MDN global-attributes reference</strong></a> and the <a href="https://html.spec.whatwg.org/multipage/dom.html#global-attributes"><strong>WHATWG HTML Standard</strong></a> list attributes that can be specified broadly across HTML elements, although a particular attribute may have little or no useful effect on some elements.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">id</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>id</code> attribute gives an element a document-wide identifier. An ID should be unique within the document. IDs are useful for fragment links, CSS selectors, JavaScript, accessibility relationships, and other references.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;section id="networking-lab"&gt;
  &lt;h2&gt;Networking Lab&lt;/h2&gt;
&lt;/section&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">class</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>class</code> attribute provides one or more class names separated by spaces. Unlike an ID, the same class can be shared by many elements. Classes are commonly used by CSS and JavaScript to select groups of elements.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;p class="warning high-priority"&gt;Check the PDU before energizing the rack.&lt;/p&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">lang and dir</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>lang</code> attribute identifies the language of an element’s content, while <code>dir</code> can define text direction. The root <code>html</code> element commonly receives the document’s primary language, as introduced in <a href="https://bitcoinversus.tech/2026/10/09/oshtml-001-document-structure-doctype-html-head-body-metadata-first-page/"><strong>OSHTML.001: Document Structure</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;html lang="en"&gt;
...
&lt;p lang="es"&gt;Hola, mundo.&lt;/p&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">title, hidden, and tabindex</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>title</code> attribute can provide advisory information, but important instructions should not depend on a tooltip that some users may never receive. The <code>hidden</code> attribute marks content that is not currently relevant for presentation. The <code>tabindex</code> attribute affects keyboard focus order and should be used carefully; ordinary semantic controls already participate in keyboard navigation without needing large positive tabindex values.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Boolean Attributes</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A boolean attribute represents an on/off state by whether the attribute is present. According to MDN’s <a href="https://developer.mozilla.org/en-US/docs/Glossary/Boolean/HTML"><strong>boolean-attribute reference</strong></a>, presence means true and absence means false. Writing a value such as <code>disabled="false"</code> does not switch the attribute off; because the attribute is present, the state is still enabled.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;input type="text" disabled&gt;
&lt;input type="checkbox" checked&gt;
&lt;input type="email" required&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>To make a boolean attribute false, remove it. For example, an enabled text field normally omits <code>disabled</code> entirely.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;input type="text"&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Element-Specific Attributes</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Many attributes belong only to certain elements or have meaning only in certain contexts. An anchor uses <code>href</code>; an image uses <code>src</code> and <code>alt</code>; form controls use attributes such as <code>type</code>, <code>name</code>, <code>value</code>, <code>required</code>, and <code>disabled</code>. Always check the reference for the specific element instead of assuming an attribute works everywhere.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Links: href, target, and rel</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;a href="https://developer.mozilla.org/" target="_blank" rel="noopener"&gt;
  MDN Web Docs
&lt;/a&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>href</code> attribute supplies the destination. <code>target="_blank"</code> requests a new browsing context. When opening an external page in a new tab or window, the <code>rel</code> attribute can describe the relationship and add security-related behavior such as <code>noopener</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Images: src and alt</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For images, <code>src</code> identifies the image resource and <code>alt</code> provides a text alternative. The alternative text should communicate the image’s purpose in context rather than mechanically repeat a filename. Decorative images can use an empty alt value when appropriate.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Forms: type, name, value, required, disabled, and checked</h3>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;label for="email"&gt;Email&lt;/label&gt;
&lt;input id="email" name="email" type="email" required&gt;

&lt;label&gt;
  &lt;input type="checkbox" name="alerts" checked&gt;
  Enable alerts
&lt;/label&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Form attributes can change validation, submission data, default state, and user interaction. <code>name</code> is especially important because successful form controls are generally submitted using name-value pairs.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Custom data-* Attributes</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Custom <code>data-*</code> attributes let authors attach application-specific data to an element when no standard attribute already expresses the information. In JavaScript, these values can be accessed through the element’s <code>dataset</code> interface.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;article data-rack="A17" data-zone="west"&gt;
  Rack status
&lt;/article&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=3r7dkLersKA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=3r7dkLersKA
</div><figcaption class="wp-element-caption"><em>Adam Khoury demonstrates custom data attributes and how HTML data can be exposed to JavaScript and CSS.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p>Custom data attributes are useful, but they should not replace semantic HTML. If a standard attribute or element already communicates the meaning, use the standard mechanism first.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Attribute Order and Duplicate Attributes</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The order of ordinary attributes inside a start tag generally does not change the element’s meaning, so teams often choose a consistent formatting convention for readability. An element should not contain two attributes with the same name. Duplicate attributes produce invalid markup and can lead to confusing parser behavior.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;!-- Clear and valid --&gt;
&lt;input id="asset-id" class="field" name="asset" type="text" required&gt;

&lt;!-- Do not duplicate the same attribute --&gt;
&lt;input id="first" id="second" type="text"&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Accessibility Is Part of Attribute Design</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Attributes are often essential to accessibility, but attributes cannot rescue fundamentally poor structure. Use native semantic elements first. Then add attributes such as <code>alt</code>, <code>lang</code>, form-label relationships, and ARIA states or properties when they are actually needed. Avoid replacing a real button or link with a generic element plus a pile of scripting and accessibility attributes.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Small Attribute Lab</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;!doctype html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
  &lt;meta charset="utf-8"&gt;
  &lt;title&gt;Attribute Lab&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
  &lt;main id="lab" class="training-page" data-level="3"&gt;
    &lt;h1&gt;Attribute Lab&lt;/h1&gt;

    &lt;a href="https://developer.mozilla.org/"&gt;Open MDN&lt;/a&gt;

    &lt;img src="rack.jpg" alt="Data-center rack with patch panels" width="640" height="426"&gt;

    &lt;label for="asset"&gt;Asset tag&lt;/label&gt;
    &lt;input id="asset" name="asset" type="text" required&gt;

    &lt;button type="button" disabled&gt;Run Test&lt;/button&gt;
  &lt;/main&gt;
&lt;/body&gt;
&lt;/html&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This file combines global attributes, element-specific attributes, boolean attributes, accessibility-related relationships, and custom data. Open it in a browser, inspect the DOM with developer tools, then add and remove attributes to observe what changes.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Writing boolean attributes as disabled="false":</strong> presence still means true.</li><li><strong>Reusing the same id on multiple elements:</strong> IDs should be unique within the document.</li><li><strong>Forgetting alt on meaningful images:</strong> the image may become inaccessible to users who cannot see it.</li><li><strong>Using an attribute on an element that does not support it:</strong> check the element reference instead of guessing.</li><li><strong>Leaving complex values unquoted:</strong> consistent quotes reduce syntax mistakes.</li><li><strong>Using title as the only place for critical information:</strong> tooltips are not a reliable replacement for visible text or accessible labeling.</li><li><strong>Using data-* when a standard attribute already exists:</strong> prefer standard HTML semantics first.</li><li><strong>Adding duplicate attributes:</strong> each attribute name should appear only once on an element.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a new HTML file based on the document structure from OSHTML.001.</li><li>Add an <code>id</code> and two classes to the <code>main</code> element.</li><li>Create a link with <code>href</code>.</li><li>Add an image with <code>src</code>, meaningful <code>alt</code>, <code>width</code>, and <code>height</code>.</li><li>Create a required email input.</li><li>Create a disabled button, load the page, then remove the <code>disabled</code> attribute and reload.</li><li>Add one <code>data-*</code> attribute and inspect it in developer tools.</li><li>Intentionally duplicate an <code>id</code> attribute on one element, run the markup through an HTML validator, then correct it.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>Where do attributes normally appear?</strong> Inside an element’s start tag after the element name.</li><li><strong>What are the two common parts of an ordinary attribute?</strong> An attribute name and an attribute value.</li><li><strong>What is a global attribute?</strong> An attribute defined for broad use across HTML elements.</li><li><strong>Should two elements normally share the same id?</strong> No. An ID should be unique within the document.</li><li><strong>Can many elements share the same class?</strong> Yes.</li><li><strong>How does a boolean attribute become false?</strong> Remove the attribute.</li><li><strong>Does disabled="false" enable an input?</strong> No. The presence of <code>disabled</code> still makes the boolean state true.</li><li><strong>What does href do on an anchor?</strong> It supplies the link destination.</li><li><strong>What does alt do on an image?</strong> It provides a text alternative that communicates the image’s purpose or content in context.</li><li><strong>What are data-* attributes for?</strong> Application-specific custom data when no standard HTML attribute already represents the information.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Previous Related Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/10/oshtml-002-elements-start-tags-end-tags-void-elements-nesting-semantic-structure/"><strong>OSHTML.002: Elements</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/09/oshtml-001-document-structure-doctype-html-head-body-metadata-first-page/"><strong>OSHTML.001: Document Structure</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>What Is Syntax Highlighting?</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Attributes"><strong>MDN — HTML Attribute Reference</strong></a></li><li><a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Global_attributes"><strong>MDN — Global Attributes</strong></a></li><li><a href="https://developer.mozilla.org/en-US/docs/Glossary/Boolean/HTML"><strong>MDN — Boolean Attributes</strong></a></li><li><a href="https://html.spec.whatwg.org/multipage/dom.html#global-attributes"><strong>WHATWG HTML Standard — Global Attributes</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Elements define the structure; attributes refine the element.</strong> Learn to recognize attribute names and values, use global attributes only when they serve a purpose, understand presence-based boolean attributes, and check element-specific documentation instead of guessing. Clean attribute use makes HTML easier to read, style, script, validate, and use with assistive technology.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next HTML Lesson</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The next HTML lesson will move from element configuration into the elements used to structure and communicate text content, including heading hierarchy, paragraphs, emphasis, and related document semantics.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->