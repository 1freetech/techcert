---
title: "OSHTML.002: Elements — Start Tags, End Tags, Void Elements, Nesting, and Semantic Structure"
status: published
wordpress_post_id: 23227
wordpress_status: publish
published: "2026-10-10T10:33:23"
modified: "2026-10-10T10:33:23"
live_url: "https://bitcoinversus.tech/2026/10/10/oshtml-002-elements-start-tags-end-tags-void-elements-nesting-semantic-structure/"
series: "Open Source HTML"
certification: OSHTML
pathway: html
lesson_number: "002"
lesson_topic: "Elements"
featured_media_id: 23222
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oshtml002-elements-cover-1200x630-1.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 23223
body_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/html-elements-input-tags-wikimedia-1.png"
youtube:
  - "https://www.youtube.com/watch?v=PypMN-yui4Y"
  - "https://www.youtube.com/watch?v=kX3TfdUqpuU"
social:
  - "https://www.reddit.com/r/webdev/comments/1kqezgb/why_didnt_semantic_html_elements_ever_really_take/"
seo_title: "OSHTML.002: HTML Elements, Tags, Void Elements and Nesting"
seo_description: "Learn HTML elements: start tags, end tags, void elements, nesting, parent-child structure, semantic elements, div, span, and the document tree."
seo_schema_type: article
excerpt: "Learn how HTML elements are formed, how start and end tags work, which elements are void, how nesting creates the document tree, and why semantic elements matter."
no_text_boxes: true
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>An HTML element is more than a tag.</strong> Most elements include a start tag, content, and an end tag.</li><li><strong>Some elements are void elements.</strong> They do not have end tags because they cannot contain child content.</li><li><strong>Elements can nest inside other elements.</strong> Correct nesting creates the document tree that browsers, accessibility tools, CSS, and JavaScript work with.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>In <a href="https://bitcoinversus.tech/2026/10/09/oshtml-001-document-structure-doctype-html-head-body-metadata-first-page/"><strong>OSHTML.001</strong></a>, we built the outer structure of an HTML document with <code>&lt;!DOCTYPE html&gt;</code>, <code>&lt;html&gt;</code>, <code>&lt;head&gt;</code>, and <code>&lt;body&gt;</code>. This lesson focuses on the building blocks placed inside that structure: <strong>HTML elements</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>HTML is a markup language, not a programming language. Its job is to describe the structure and meaning of content so a browser can construct a document tree. That broader history is covered in <a href="https://bitcoinversus.tech/2026/04/14/html-history-and-overview-fullstack-u/"><strong>HTML History and Overview</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=PypMN-yui4Y","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=PypMN-yui4Y
</div><figcaption class="wp-element-caption"><em>Web Dev Simplified introduces the anatomy of HTML elements and builds a page from basic elements.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What Is an HTML Element?</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>An HTML element represents a part of a document. The <a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements"><strong>MDN HTML element reference</strong></a> catalogs the standard elements available to authors. A typical non-void element contains three parts: a start tag, content, and an end tag.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;p&gt;Hello, world!&lt;/p&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><li><code>&lt;p&gt;</code> is the start tag.</li><li><code>Hello, world!</code> is the element's text content.</li><li><code>&lt;/p&gt;</code> is the end tag.</li><li>The whole structure is the <code>p</code> element.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>A tag is syntax that marks the beginning or end of an element. The element is the complete node represented in the document. Beginners often use “tag” and “element” as if they are identical, but learning the distinction becomes useful once you work with the DOM, CSS selectors, browser developer tools, and JavaScript.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":23223,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/html-elements-input-tags-wikimedia-1.png?w=551" alt="Screenshot of HTML source code showing nested html, head, div, form, input, line break, and script elements" class="wp-image-23223" /><figcaption class="wp-element-caption"><em>Real HTML source showing nested elements and void elements such as input and br. Source: Ejn6699 / Wikimedia Commons, CC BY-SA 3.0.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Start Tags and End Tags</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For most elements, the start tag opens the element and the end tag closes it. The end tag repeats the element name with a leading slash.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;h1&gt;Main Heading&lt;/h1&gt;
&lt;p&gt;A paragraph of text.&lt;/p&gt;
&lt;strong&gt;Important text&lt;/strong&gt;
&lt;a href="https://example.com"&gt;A link&lt;/a&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Attributes such as <code>href</code> appear in the start tag. The attribute adds information or behavior to the element but is not itself the element's visible text content.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elements Can Contain Other Elements</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>HTML elements can be nested. A nested element becomes a child of the element around it. This parent-child structure is one of the most important ideas in web development because the browser turns HTML into a tree of nodes.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;p&gt;This is &lt;strong&gt;important&lt;/strong&gt; text.&lt;/p&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>strong</code> element is inside the <code>p</code> element. The paragraph is the parent; the <code>strong</code> element is one of its children.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Close Nested Elements in the Correct Order</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When elements nest, close the innermost element first. Think of nesting like opening and closing containers.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;p&gt;This is &lt;strong&gt;correct&lt;/strong&gt; HTML.&lt;/p&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A crossed structure such as opening <code>p</code>, then <code>strong</code>, then closing <code>p</code> before <code>strong</code> is malformed. Browsers include error-recovery rules and may repair malformed markup, but you should not rely on recovery behavior when writing clean HTML.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Void Elements Do Not Have End Tags</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Some HTML elements cannot contain child nodes and therefore do not use end tags. The HTML specification calls these <strong>void elements</strong>. Common examples include <code>img</code>, <code>input</code>, <code>br</code>, <code>hr</code>, <code>meta</code>, and <code>link</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;img src="photo.jpg" alt="Example"&gt;
&lt;input type="text" name="username"&gt;
&lt;br&gt;
&lt;hr&gt;
&lt;meta charset="UTF-8"&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In HTML syntax, writing a slash before the closing angle bracket—such as <code>&lt;br /&gt;</code>—does not make the element “more closed.” HTML parsers treat the slash as unnecessary syntax on void elements. This differs from XML and XHTML rules.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The img Element Is a Good Void-Element Example</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;img src="miner.jpg" alt="Bitcoin mining computer"&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The image itself is not written between start and end tags. Instead, the <code>src</code> attribute tells the browser where to obtain the image, while <code>alt</code> supplies alternative text for cases where the image cannot be seen or loaded. The element remains a single void element in the document tree.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Element Names Describe Structure and Meaning</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Some HTML elements exist primarily to give content meaning. A <code>nav</code> element identifies navigation. An <code>article</code> element represents a self-contained composition. A <code>main</code> element identifies the document's main content. A <code>button</code> is an interactive control. This is one reason semantic elements are usually better than using a generic <code>div</code> for everything.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=kX3TfdUqpuU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=kX3TfdUqpuU
</div><figcaption class="wp-element-caption"><em>Dave Gray demonstrates semantic HTML elements including header, main, nav, article, section, aside, and footer.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:embed {"url":"https://www.reddit.com/r/webdev/comments/1kqezgb/why_didnt_semantic_html_elements_ever_really_take/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/webdev/comments/1kqezgb/why_didnt_semantic_html_elements_ever_really_take/
</div><figcaption class="wp-element-caption"><em>A web-development discussion examines why real sites often overuse div elements even though semantic HTML can improve structure, maintainability, and accessibility.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Generic Elements Still Have a Purpose</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>div</code> and <code>span</code> elements are generic containers. They are useful when no more meaningful element applies or when you need a grouping hook for styling or scripting. The problem is not that <code>div</code> is bad. The problem is using generic markup where a more meaningful built-in element already expresses the content's purpose.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">HTML Creates a Tree</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;body&gt;
  &lt;main&gt;
    &lt;article&gt;
      &lt;h1&gt;Repairing a Laptop Screen&lt;/h1&gt;
      &lt;p&gt;Diagnose before replacing parts.&lt;/p&gt;
    &lt;/article&gt;
  &lt;/main&gt;
&lt;/body&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here, <code>body</code> contains <code>main</code>; <code>main</code> contains <code>article</code>; and <code>article</code> contains a heading and paragraph. That hierarchy becomes part of the DOM after the browser parses the page.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The browser workflow discussed in <a href="https://bitcoinversus.tech/2026/10/06/easy-tech-read-what-happens-when-you-type-a-website-into-your-browser/"><strong>What Happens When You Type a Website Into Your Browser?</strong></a> eventually reaches this parsing stage: downloaded HTML is converted into structured nodes that can be rendered, styled, queried, and changed.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Formatting Helps Humans See the Tree</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Browsers do not require your source indentation to match the nesting tree, but humans benefit from consistent indentation. Code editors often make this even clearer with <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>syntax highlighting</strong></a>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;ul&gt;
  &lt;li&gt;One&lt;/li&gt;
  &lt;li&gt;Two&lt;/li&gt;
  &lt;li&gt;Three&lt;/li&gt;
&lt;/ul&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Indentation is a readability convention. The actual parent-child relationships come from the markup itself.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Calling every element a tag:</strong> tags are part of the syntax; the full node is the element.</li><li><strong>Adding end tags to void elements:</strong> elements such as <code>img</code> and <code>br</code> do not have end tags.</li><li><strong>Crossing nested tags:</strong> close the innermost open element first.</li><li><strong>Using div for everything:</strong> prefer semantic built-in elements when they match the content's purpose.</li><li><strong>Assuming indentation changes structure:</strong> indentation helps humans, but tags determine the tree.</li><li><strong>Omitting useful attributes:</strong> elements such as <code>img</code> depend on attributes like <code>src</code>, and meaningful alternative text is important for accessibility.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create an HTML file with one <code>h1</code>, two <code>p</code> elements, and one <code>strong</code> element nested inside a paragraph.</li><li>Add an <code>img</code> element and explain why it has no end tag.</li><li>Add a <code>main</code> element containing an <code>article</code> element.</li><li>Inside the article, add a heading and paragraph with correct indentation.</li><li>Intentionally cross two tags, load the page, and inspect how the browser repairs the markup in developer tools.</li><li>Replace one generic <code>div</code> with a semantic element that better describes its purpose.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What are the three common parts of a non-void HTML element?</strong> A start tag, content, and an end tag.</li><li><strong>Is a tag the same thing as an element?</strong> Not exactly. Tags mark element boundaries; the full node is the element.</li><li><strong>What is a void element?</strong> An element that cannot contain child content and therefore has no end tag.</li><li><strong>Name three void elements.</strong> Examples include <code>img</code>, <code>input</code>, <code>br</code>, <code>hr</code>, <code>meta</code>, and <code>link</code>.</li><li><strong>What is nesting?</strong> Placing one element inside another so it becomes a child of that parent element.</li><li><strong>How should nested elements close?</strong> Close the innermost open element first.</li><li><strong>What is a semantic element?</strong> An element whose name communicates something about the role or meaning of its content.</li><li><strong>Are div and span useless?</strong> No. They are useful generic containers when no more meaningful element is appropriate.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>HTML pages are trees made from elements.</strong> Most elements have a start tag, content, and an end tag. Void elements do not. Correct nesting creates parent-child relationships, and choosing meaningful elements gives the document better structure.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next HTML Lesson</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>OSHTML.003: Attributes — Names, Values, Global Attributes, Boolean Attributes, and Element-Specific Configuration</strong> will focus on the extra information placed inside start tags.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is the user-selected 1200×630 laptop-focused HTML artwork created specifically for OSHTML.002 and is not reused inside the lesson. The separate body image is real HTML source code from Wikimedia Commons.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->