---
title: "OSHTML.001: Document Structure — DOCTYPE, html, head, body, Metadata, and Your First Page"
status: published
wordpress_post_id: 22761
published: "2026-10-09T17:43:17"
modified: "2026-10-09T17:46:59"
live_url: "https://bitcoinversus.tech/2026/10/09/oshtml-001-document-structure-doctype-html-head-body-metadata-first-page/"
series: "Open Source HTML"
subject: html
lesson_number: "001"
featured_media_id: 22758
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oshtml-001-document-structure-cover.jpg"
featured_image_dimensions: "1200x630"
body_media_id: 22759
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oshtml-001-document-structure-body.jpg"
body_image_dimensions: "1200x675"
youtube_1: "https://www.youtube.com/watch?v=UB1O30fR-EE"
youtube_2: "https://www.youtube.com/watch?v=a_iQb1lnAEQ"
youtube_3: "https://www.youtube.com/watch?v=G3e-cpL7ofc"
social_1: "https://www.reddit.com/r/HTML/comments/1l9pk0n/"
seo_title: "OSHTML.001: Document Structure — DOCTYPE, head, body & First Page"
seo_description: "Learn HTML document structure from the beginning: DOCTYPE, html, head, body, UTF-8 metadata, title, headings, paragraphs, nesting, DOM inspection, and validation."
no_text_boxes: true
image_style: "realistic color-pencil cover; photorealistic body; no words; no diagrams"
youtube_minimum_met: 3
archive_format: "final Gutenberg source"
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>HTML gives a web page its structure.</strong> A browser reads HTML elements and builds a document from them. The most basic complete page has a document type declaration, an <code>html</code> element, a <code>head</code> section for document information, and a <code>body</code> section for the content people see on the page.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This first HTML lesson stays intentionally focused on document structure. You will build a minimal page, learn what <code>&lt;!doctype html&gt;</code> means, separate <code>&lt;head&gt;</code> metadata from <code>&lt;body&gt;</code> content, add a title and character encoding, create headings and paragraphs, understand nesting, and validate the finished document. Later HTML lessons can focus separately on links, images, lists, semantic elements, forms, tables, media, accessibility, metadata, and advanced document features.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>HTML works alongside other web technologies but has a different job. <a href="https://bitcoinversus.tech/2026/10/08/osjavascript-001-what-is-javascript-where-it-runs-what-it-does-first-console-log/"><strong>JavaScript</strong></a> adds behavior, while server-side software such as <a href="https://bitcoinversus.tech/2026/10/09/osphp-001-php-runtime-cli-php-v-running-scripts-built-in-development-server/"><strong>PHP</strong></a> can generate HTML before a page reaches the browser. HTML itself describes the document structure the browser receives.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What You Should Learn</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What HTML is and what a browser does with it.</li><li>Why modern documents begin with <code>&lt;!doctype html&gt;</code>.</li><li>What the root <code>&lt;html&gt;</code> element represents.</li><li>The difference between <code>&lt;head&gt;</code> and <code>&lt;body&gt;</code>.</li><li>Why <code>&lt;meta charset="utf-8"&gt;</code> belongs near the top of the head.</li><li>What the <code>&lt;title&gt;</code> element controls.</li><li>How headings and paragraphs create visible document content.</li><li>How parent, child, and sibling relationships arise from nesting.</li><li>How to inspect and validate a minimal HTML document.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">HTML Is A Markup Language</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>HTML stands for <strong>HyperText Markup Language</strong>. It uses elements to describe the meaning and organization of content. A heading is marked as a heading, a paragraph as a paragraph, a link as a link, and so on. The browser interprets that structure and creates an internal representation called the document object model, or DOM.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>When you type a web address into a browser, several networking and browser steps happen before the final page appears. The earlier BitcoinVersus.Tech explainer <a href="https://bitcoinversus.tech/2026/10/06/easy-tech-read-what-happens-when-you-type-a-website-into-your-browser/"><strong>What Happens When You Type a Website Into Your Browser?</strong></a> gives the broader picture. This lesson begins at the point where the browser has HTML to parse.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=UB1O30fR-EE","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=UB1O30fR-EE
</div><figcaption class="wp-element-caption"><em>Traversy Media — “HTML Crash Course For Absolute Beginners.” The course introduces HTML5 structure, common elements, attributes, and semantic markup from a beginner starting point.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22759,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oshtml-001-document-structure-body.jpg" alt="A website preview and camera on a sunlit desk beside a mountain-lake view." class="wp-image-22759" /><figcaption class="wp-element-caption"><em>Original BitcoinVersus.Tech lesson image for OSHTML.001.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Build The Smallest Useful Document</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Create a plain-text file named <code>index.html</code> and start with this structure:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;!doctype html&gt;
&lt;html lang="en"&gt;
  &lt;head&gt;
    &lt;meta charset="utf-8"&gt;
    &lt;title&gt;My First Page&lt;/title&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;h1&gt;Hello, web!&lt;/h1&gt;
    &lt;p&gt;This is my first HTML document.&lt;/p&gt;
  &lt;/body&gt;
&lt;/html&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Save the file and open it in a browser. You should see the heading and paragraph in the page itself. The title should appear in the browser tab or window interface. This single file already contains the major structural ideas used by much larger HTML documents.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A code editor can make the nesting easier to see through indentation and <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/"><strong>syntax highlighting</strong></a>. A <a href="https://bitcoinversus.tech/2026/10/08/what-is-a-monospace-font-why-terminals-and-code-editors-use-fixed-width-text/"><strong>monospace font</strong></a> also helps columns and indentation line up visually. Those editor features improve readability, but the browser ultimately cares about the document markup itself.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What The DOCTYPE Does</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The first line is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;!doctype html&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The document type declaration tells modern browsers to process the page using standards mode. It is not an HTML element and it does not have a closing tag. In modern HTML, the short declaration above is the normal form.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Browsers can sometimes display pages that omit or misuse structural markup, but relying on error recovery is poor engineering. A browser being able to repair malformed input does not make the malformed input a good document.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The html Element Is The Root</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>&lt;html&gt;</code> element is the root element of the document. In the example it begins with:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;html lang="en"&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>lang</code> attribute identifies the document language. That information helps browsers, accessibility software, translation systems, search engines, and other tools interpret the content correctly. The root element contains the document's <code>head</code> and <code>body</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=a_iQb1lnAEQ","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=a_iQb1lnAEQ
</div><figcaption class="wp-element-caption"><em>freeCodeCamp.org — “Learn HTML &amp; CSS — Full Course for Beginners.” The HTML section covers tags, nesting, links, and proper document structure before moving into CSS.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The head Contains Document Information</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>&lt;head&gt;</code> section contains information about the document rather than the main visible page content. A minimal head often contains character encoding and a title:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;head&gt;
  &lt;meta charset="utf-8"&gt;
  &lt;title&gt;My First Page&lt;/title&gt;
&lt;/head&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>&lt;meta charset="utf-8"&gt;</code> declares the character encoding. UTF-8 can represent an enormous range of writing systems and symbols and is the standard choice for modern web pages. Place the character declaration early so the browser knows how to decode the document correctly.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The <code>&lt;title&gt;</code> element provides the document title used by browser tabs and other interfaces. It is not the same as an <code>&lt;h1&gt;</code>. The title describes the document to the browser; the heading is visible content inside the document body.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The body Contains Page Content</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>&lt;body&gt;</code> contains the document content intended to appear as part of the page: headings, paragraphs, links, images, lists, forms, sections, tables, and many other elements.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;body&gt;
  &lt;h1&gt;Hello, web!&lt;/h1&gt;
  &lt;p&gt;This is my first HTML document.&lt;/p&gt;
&lt;/body&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A recent beginner discussion in the HTML community demonstrates why this distinction matters: content placed in the wrong structural location may not behave as expected, while moving visible content into the body restores the intended document structure.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/HTML/comments/1l9pk0n/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/HTML/comments/1l9pk0n/
</div><figcaption class="wp-element-caption"><em>r/HTML discussion: a beginner fixes a missing link by learning why visible page content belongs inside the document body and why structural tags must be nested correctly.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elements Have Opening Tags, Content, And Closing Tags</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Many HTML elements have an opening tag, content, and a closing tag:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;p&gt;This is a paragraph.&lt;/p&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here, <code>&lt;p&gt;</code> opens the paragraph element, the text is its content, and <code>&lt;/p&gt;</code> closes it. Some elements do not wrap content and therefore do not use a closing tag in the same way. The character-encoding <code>meta</code> element is one example.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Nesting Creates A Tree</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>HTML elements can contain other elements. This is called nesting. Proper nesting produces parent, child, and sibling relationships that form a tree-like document structure.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;body&gt;
  &lt;main&gt;
    &lt;h1&gt;My Page&lt;/h1&gt;
    &lt;p&gt;Welcome.&lt;/p&gt;
  &lt;/main&gt;
&lt;/body&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>In this example, <code>body</code> contains <code>main</code>. The <code>main</code> element contains both the heading and paragraph. The heading and paragraph are siblings because they share the same parent.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Indentation is not what creates the relationship—the tags do—but indentation makes the relationship much easier for humans to see. Keep closing tags aligned with the opening structure while you learn.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=G3e-cpL7ofc","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=G3e-cpL7ofc
</div><figcaption class="wp-element-caption"><em>SuperSimpleDev — “HTML &amp; CSS Full Course — Beginner to Pro.” The early lessons cover HTML basics and later revisit the complete HTML document structure in a project workflow.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Headings Create Hierarchy</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>HTML provides heading levels from <code>&lt;h1&gt;</code> through <code>&lt;h6&gt;</code>. These levels communicate document hierarchy. They should not be chosen merely because one looks visually larger than another. Styling belongs to CSS; HTML heading levels describe structure.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;h1&gt;Main Page Topic&lt;/h1&gt;
&lt;h2&gt;First Major Section&lt;/h2&gt;
&lt;h3&gt;A Subsection&lt;/h3&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For a beginner page, start with one clear page-level heading and organize later sections beneath it. Semantic hierarchy helps readers, accessibility tools, search systems, and future maintainers understand the page.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Paragraphs Represent Paragraphs</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <code>&lt;p&gt;</code> element represents a paragraph of text:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>&lt;p&gt;HTML describes the structure of this content.&lt;/p&gt;</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Do not use repeated line breaks or empty paragraphs merely to create visual spacing. Later CSS lessons will teach presentation and spacing. The HTML should first describe what the content <em>is</em>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Inspect The Page In The Browser</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Open your <code>index.html</code> file in a browser. Then use the browser's developer tools to inspect the page. You should be able to find the <code>html</code>, <code>head</code>, and <code>body</code> elements in the DOM inspector even though only the body content appears in the page viewport.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is an important mental model: source markup is parsed into a document tree. Later JavaScript and CSS work with that parsed structure rather than treating the source file as a flat block of text.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Validate The Document</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Browsers are intentionally forgiving, so a page can appear to work even when the markup contains mistakes. A validator can reveal structural errors that the browser silently repaired.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Use the <a href="https://validator.w3.org/"><strong>W3C Markup Validation Service</strong></a> to check your file. Validation is especially useful while learning because it forces you to distinguish between “the browser displayed something” and “the document follows the expected syntax and structure.”</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Leaving out the doctype:</strong> include the modern HTML doctype at the top.</li><li><strong>Putting visible page content in the head:</strong> visible content belongs in the body.</li><li><strong>Confusing title and h1:</strong> the title labels the document in browser interfaces; h1 is page content.</li><li><strong>Closing elements in the wrong order:</strong> nested elements should close in the reverse order they were opened.</li><li><strong>Using headings only for appearance:</strong> choose heading levels for document hierarchy.</li><li><strong>Using HTML for spacing:</strong> structure content with HTML and leave presentation to CSS.</li><li><strong>Trusting the browser's repair behavior:</strong> validate the source instead of assuming rendered output proves the markup is correct.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Mini Lab</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a directory named <code>html_lab</code>.</li><li>Create <code>index.html</code>.</li><li>Add the doctype, <code>html</code>, <code>head</code>, and <code>body</code>.</li><li>Add UTF-8 character encoding and a page title.</li><li>Add one <code>h1</code>, two <code>h2</code> elements, and three paragraphs.</li><li>Open the file in a browser.</li><li>Confirm the tab title differs from the visible h1.</li><li>Inspect the DOM with developer tools.</li><li>Validate the file with the W3C validator.</li><li>Deliberately remove one closing tag, inspect what the browser repairs, then restore valid markup.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is HTML?</strong> HyperText Markup Language, used to describe the structure and meaning of web content.</li><li><strong>What does <code>&lt;!doctype html&gt;</code> do?</strong> It tells modern browsers to use the current HTML standards mode.</li><li><strong>What is the root element?</strong> <code>&lt;html&gt;</code>.</li><li><strong>What belongs in the head?</strong> Document metadata such as character encoding, title, and other non-body information.</li><li><strong>What belongs in the body?</strong> The page content represented by headings, paragraphs, links, images, forms, and other visible or interactive document elements.</li><li><strong>What does <code>&lt;meta charset="utf-8"&gt;</code> do?</strong> It declares UTF-8 as the document character encoding.</li><li><strong>Is <code>&lt;title&gt;</code> the same as <code>&lt;h1&gt;</code>?</strong> No. Title identifies the document in browser interfaces; h1 is a heading within the body.</li><li><strong>What is nesting?</strong> Placing one HTML element inside another to create document relationships.</li><li><strong>Why validate HTML?</strong> Browsers can repair malformed markup, so validation helps find source errors that rendered output may hide.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://html.spec.whatwg.org/"><strong>WHATWG — HTML Living Standard</strong></a></li><li><a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/html"><strong>MDN — The html Element</strong></a></li><li><a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/head"><strong>MDN — The head Element</strong></a></li><li><a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/body"><strong>MDN — The body Element</strong></a></li><li><a href="https://developer.mozilla.org/en-US/docs/Glossary/Doctype"><strong>MDN — Doctype</strong></a></li><li><a href="https://validator.w3.org/"><strong>W3C Markup Validation Service</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>An HTML page is a structured document.</strong> Start with the doctype, place the document inside <code>&lt;html&gt;</code>, put metadata in <code>&lt;head&gt;</code>, put page content in <code>&lt;body&gt;</code>, nest elements carefully, and validate the result. Once that structure is reliable, every later HTML feature has a correct place to live.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The next canonical HTML lesson is <strong>OSHTML.002: Elements</strong>, where the track will focus on how HTML elements are formed, how start tags and end tags work, which elements are void elements, how elements nest, and how element choice gives structure and meaning to a document.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured image is an original 1200×630 BitcoinVersus.Tech color-pencil illustration created specifically for OSHTML.001 and is not reused in the body. The lesson uses a separate original 1200×675 photograph. The three YouTube videos use responsive native Gutenberg 16:9 embed blocks, and the social item uses a responsive native Gutenberg embed. Ordinary lesson prose is not placed inside bordered, shaded, card, callout, panel, or fixed-width text boxes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->