<!-- wp:paragraph -->
<p><strong>Chef is a real programming language in which source code is written to look like a cooking recipe.</strong> It is an <a href="https://bitcoinversus.tech/2026/09/30/assembly-to-kotlin-programming-languages-changed-computing/">esoteric programming language</a> created by David Morgan-Mar, and its unusual vocabulary hides a real execution model: ingredients store numeric values, mixing bowls behave like stacks, methods contain instructions, baking dishes collect output, and <strong>Serves</strong> writes that output. The creator’s <a href="https://www.dangermouse.net/esoteric/chef.html">Chef specification</a> is the primary reference for this lesson.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=cQ7bcCrJMHc","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=cQ7bcCrJMHc
</div><figcaption class="wp-element-caption"><em>Hillel Wayne’s introduction to esoteric languages includes Chef as an example of code deliberately written in another recognizable form.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>A Chef Program Is Organized Like a Recipe</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A Chef program begins with a recipe title. It can then contain a comment paragraph, an <strong>Ingredients</strong> section, optional cooking-time and oven-temperature metadata, a <strong>Method</strong> section, and an optional <strong>Serves</strong> statement. Those headings are not decoration: they are syntax. The ingredient list declares data, the method defines the operations to execute, and Serves controls whether baking-dish contents are written to standard output.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=6avJHaC3C2U","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=6avJHaC3C2U
</div><figcaption class="wp-element-caption"><em>Dylan Beattie’s “The Art of Code” discusses Chef specifically and shows why recipe syntax can still represent executable computation.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Ingredients Are Numeric Values</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Chef ingredients work much like named variables, but every ingredient value is numeric. The measure attached to an ingredient also matters. Measures such as <strong>g</strong>, <strong>kg</strong>, and <strong>pinches</strong> make a value dry, while <strong>ml</strong>, <strong>l</strong>, and <strong>dashes</strong> make it liquid. When output is produced, dry values are treated as numbers while liquid values are interpreted as Unicode characters. That is how the same integer can represent either the number <strong>65</strong> or the character <strong>A</strong>, depending on its state.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=pEfrdAtAmqk","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=pEfrdAtAmqk
</div><figcaption class="wp-element-caption"><em>Fireship’s programming-language iceberg places Chef among the deliberately strange languages that still implement real programming concepts.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22042,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oschef001-chef-programming-stack-body-1200x800-1.jpg?w=1024" alt="Colored-pencil diagram of ingredient values flowing into a stack-like mixing bowl and then into a baking-dish output buffer." class="wp-image-22042" /><figcaption class="wp-element-caption"><em>Chef maps recipe language onto computation: ingredients hold values, mixing bowls behave like stacks, and baking dishes collect output.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Mixing Bowls Are LIFO Stacks</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The most important mental model is the <strong>mixing bowl</strong>. Chef stores values in each bowl in last-in, first-out order: a value placed into a bowl goes on top, and a value removed from that bowl comes off the top. In ordinary computer-science terms, that is a <strong>stack</strong>. Chef can use multiple numbered bowls, while <strong>baking dishes</strong> act as separate ordered containers used for output. The cooking metaphor is funny, but the underlying data-structure behavior is precise.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=yhznYsjOhSU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=yhznYsjOhSU
</div><figcaption class="wp-element-caption"><em>Scott Hanselman and Daniel Temkin discuss how esoteric languages use unusual surface syntax while still exposing real computational structures underneath.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>The Method Is the Executable Part</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <strong>Method</strong> contains Chef instructions written as sentences. <strong>Put</strong> pushes an ingredient value into a mixing bowl; <strong>Fold</strong> pops the bowl’s top value back into an ingredient; <strong>Add</strong>, <strong>Remove</strong>, <strong>Combine</strong>, and <strong>Divide</strong> perform arithmetic against the top value; <strong>Pour</strong> copies a bowl into a baking dish; and <strong>Liquefy</strong> changes values so they are emitted as characters. Later OSChef lessons can take those instruction families one at a time rather than cramming the whole language into this introduction.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>A Tiny Chef Program That Prints A</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This original example uses one liquid ingredient with value 65. The method pushes that value into the first mixing bowl and then copies the bowl into the first baking dish. Because the ingredient is liquid, <strong>Serves 1</strong> outputs Unicode code point 65 as the character <strong>A</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Letter A.

Ingredients.
65 ml letter

Method.
Put letter into the mixing bowl.
Pour contents of the mixing bowl into the baking dish.

Serves 1.</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>To experiment locally, one open-source option is the Python-based <a href="https://github.com/stephenfmann/cooking-with-python">Cooking with Python Chef interpreter</a>. Another current package, <a href="https://pypi.org/project/chef-lang/">chef-lang</a>, provides a <code>cook</code> command for <code>.chef</code> files. If you install a Python package for this, the existing <a href="https://bitcoinversus.tech/2026/10/01/ospython-010-pip-package-installation/">OSPython pip lesson</a> and <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/">PATH explainer</a> cover the surrounding tooling concepts.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.linkedin.com/posts/dvoriankin-evgenii_have-you-known-that-theres-a-programming-activity-7218259766173732865-N7Rb","type":"rich","providerNameSlug":"linkedin","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-linkedin wp-block-embed-linkedin"><div class="wp-block-embed__wrapper">
https://www.linkedin.com/posts/dvoriankin-evgenii_have-you-known-that-theres-a-programming-activity-7218259766173732865-N7Rb
</div><figcaption class="wp-element-caption"><em>A programming-community walkthrough shows the classic Chef “Hello World” idea and maps recipe terms back to program behavior.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Beginner Exercises</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>In the example above, change <code>65 ml letter</code> to <code>66 ml letter</code>. Predict the output before running it.</li><li>Change <code>ml</code> to <code>g</code>. Explain why the output representation changes.</li><li>Write down the four structural pieces used by the example: title, Ingredients, Method, and Serves.</li><li>Explain in one sentence why a mixing bowl is a stack rather than an ordinary unordered container.</li><li>Install or clone an open-source Chef interpreter and run the example as a <code>.chef</code> file.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What are ingredients?</strong> Named numeric values used by the program.</li><li><strong>What is a mixing bowl?</strong> A LIFO stack that stores copies of ingredient values.</li><li><strong>What is the Method?</strong> The executable sequence of Chef instructions.</li><li><strong>What is a baking dish?</strong> An ordered container used to accumulate values for output.</li><li><strong>What does Serves do?</strong> It writes the requested baking dishes to standard output.</li><li><strong>Why can 65 become “A”?</strong> A liquid value is interpreted as a Unicode character when output.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Elementary Review</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The easiest way to remember Chef is: <strong>ingredients are data, bowls are stacks, methods are code, dishes are output.</strong> Once that mapping is clear, the language stops looking like random cooking prose and starts looking like an intentionally disguised stack machine. The next Chef programming lesson can build directly on this foundation by focusing on <strong>Put, Fold, and stack order</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This lesson covers the <strong>Chef esoteric programming language</strong>, not the Chef configuration-management product and not culinary training. The featured image is a unique 1200×630 illustration and is not reused in the body. Primary technical reference: David Morgan-Mar’s Chef specification. Additional implementation references include open-source Chef interpreters on GitHub and PyPI. No fixed-width lesson text boxes are used.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->