<!-- wp:paragraph -->
<p><strong>The Shakespeare Programming Language (SPL) is a real esoteric programming language whose source code is written to resemble a stage play.</strong> It was designed by Karl Wiberg and Jon Åslund in 2001. Instead of conventional variable declarations, blocks, and statements, SPL uses Shakespearean characters, Acts, Scenes, stage directions, and dialogue. The language is intentionally impractical, but it still performs genuine computation. This first lesson focuses on one thing only: <strong>how an SPL program is structured and executed</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=YDO26TgAYpo","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=YDO26TgAYpo
</div><figcaption class="wp-element-caption"><em>A programming-focused esolang overview introduces Shakespeare at about the 5:48 mark and shows how theatrical syntax can still represent executable code.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>SPL Is Code Disguised as a Play</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The original <a href="https://krayon.github.io/shakespearelang/docs/shakespeare.html">Shakespeare Programming Language documentation</a> says the design goal was to make source code resemble Shakespeare plays while retaining basic arithmetic and control flow. That makes SPL a useful contrast with conventional languages covered in BitcoinVersus.Tech’s <a href="https://bitcoinversus.tech/2026/09/30/assembly-to-kotlin-programming-languages-changed-computing/">programming-language history</a>. The surface syntax looks literary, but underneath it are familiar ideas: variables, assignment, arithmetic, input/output, jumps, comparisons, and stacks.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22095,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osshakespeare001-program-structure-body-1200x800-1.jpg?w=1024" alt="Illustrated Shakespeare Programming Language stage diagram showing characters as variables, Acts and Scenes as labels, dialogue as instructions, and stack memory." class="wp-image-22095" /><figcaption class="wp-element-caption"><em>SPL turns theatrical structure into executable structure: characters are variables, Acts and Scenes organize control flow, dialogue changes values, and each character has stack memory.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>The Title Comes First</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Every SPL program begins with a title ending in a period. The title is required syntactically, but it is effectively a comment rather than executable code. A valid program might begin with <code>A Tiny Number.</code> This gives the file the appearance of a play before any variables or instructions appear.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Characters Are Variables</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After the title comes the equivalent of a <strong>Dramatis Personae</strong> section. Each recognized Shakespeare character declared here becomes a variable that stores a signed integer. The descriptive phrase after the character’s name is ignored by the language, so <code>Hamlet, a quiet prince.</code> and <code>Hamlet, a temporary register.</code> describe the same underlying variable. This is the first major mental translation: <strong>character name = variable name</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=-e8oBF4IrgU","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=-e8oBF4IrgU
</div><figcaption class="wp-element-caption"><em>A QCon demonstration performs an SPL program as drama, making the character-as-variable model visible instead of merely describing it.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Acts and Scenes Organize the Program</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>SPL divides executable code into <strong>Acts</strong> and <strong>Scenes</strong> written with Roman numerals. They are more than decoration: Acts and Scenes also serve as labels that later control-flow statements can jump to. A first program can stay simple with one Act and one Scene. Later lessons can isolate SPL’s jump and conditional behavior instead of mixing control flow into this introduction.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Stage Directions Control Who Can Interact</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Instructions such as <code>[Enter Hamlet and Juliet]</code>, <code>[Exit Hamlet]</code>, and <code>[Exeunt]</code> control which characters are currently on stage. This matters because dialogue operates on the characters present. A speaker generally addresses the other character on stage, so stage state determines which variable receives an assignment or output instruction. In programming terms, the theatrical scene helps define the active operands.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Dialogue Becomes Executable Statements</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A character’s speech contains the actual work. Compliments, insults, nouns, adjectives, arithmetic phrases, questions, and commands are parsed as expressions or statements. For example, a speaker can assign a value to the character being addressed and then request output. The original language documentation defines <strong>Open your heart</strong> as numeric output and <strong>Speak your mind</strong> as character output. This is code, even though it reads like dialogue.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=6avJHaC3C2U","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=6avJHaC3C2U
</div><figcaption class="wp-element-caption"><em>Dylan Beattie’s “The Art of Code” demonstrates Shakespeare Programming Language while connecting esoteric syntax to ordinary computation.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>A Small Original SPL Program</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The following original example keeps the program deliberately small. Hamlet and Juliet are declared as variables, both enter one Scene, Juliet assigns Hamlet the value represented by <code>King</code>, and <code>Open your heart</code> outputs Hamlet’s numeric value.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>A Tiny Number.

Hamlet, a quiet prince.
Juliet, a careful speaker.

Act I: The Beginning.
Scene I: One Number.

[Enter Hamlet and Juliet]

Juliet:
Thou art a King. Open your heart.

[Exeunt]</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The important lesson is structural rather than mathematical: title → character declarations → Act → Scene → stage entrance → speaker → executable dialogue → exit. Later lessons can isolate SPL’s expression rules, arithmetic vocabulary, stack operations, comparisons, and jumps.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Run SPL With the Python Interpreter</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A practical modern implementation is <a href="https://shakespearelang.com/1.0/">shakespearelang</a>, a Python-based interpreter with a console and debugger. Install it with <code>python -m pip install shakespearelang</code>, save a program as a <code>.spl</code> file, then run it with <code>shakespeare run filename.spl</code>. The surrounding package-management concept is covered in <a href="https://bitcoinversus.tech/2026/10/01/ospython-010-pip-package-installation/">OSPython.010 on pip</a>, while the <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-path-environment-variable-windows-linux/">PATH explainer</a> helps if an installed command is not found from the terminal.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>python -m pip install shakespearelang
shakespeare run tiny_number.spl</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.linkedin.com/posts/parvez-al-mumin_today-i-found-something-that-made-me-smile-activity-7477001798906703873-Al9M","type":"rich","providerNameSlug":"linkedin","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-linkedin wp-block-embed-linkedin"><div class="wp-block-embed__wrapper">
https://www.linkedin.com/posts/parvez-al-mumin_today-i-found-something-that-made-me-smile-activity-7477001798906703873-Al9M
</div><figcaption class="wp-element-caption"><em>A recent programming-community overview highlights the same core SPL mapping: variables become characters, code is divided into Acts and Scenes, and instructions appear as dialogue.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>How SPL Relates to Chef</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>SPL and <a href="https://bitcoinversus.tech/2026/10/08/oschef-001-program-structure-ingredients-mixing-bowls-methods-and-serves/">Chef</a> belong to the same broad esolang tradition but disguise computation differently. Chef maps variables and operations onto recipes, while Shakespeare maps them onto plays. Both demonstrate a useful computer-science idea: syntax can look radically different without changing the underlying need for state, operations, input/output, and control flow.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Exercises</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Identify the five major structural pieces in the example: title, character declarations, Act/Scene, stage direction, and dialogue.</li><li>Rename the Scene while keeping its Roman numeral. Explain why the descriptive text does not change the program structure.</li><li>Add a second valid Shakespeare character declaration without changing the executable Scene.</li><li>Replace <code>Open your heart</code> with <code>Speak your mind</code> and explain the difference between numeric and character output.</li><li>Install <code>shakespearelang</code> in a disposable Python environment and run a small <code>.spl</code> file.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is SPL?</strong> The Shakespeare Programming Language, an esoteric language whose programs resemble Shakespeare plays.</li><li><strong>What does a character represent?</strong> A signed-integer variable.</li><li><strong>What do Acts and Scenes provide?</strong> Program organization and labels that can later be used for control flow.</li><li><strong>What do Enter, Exit, and Exeunt control?</strong> Which character variables are currently on stage and available for interaction.</li><li><strong>Where are executable operations usually written?</strong> In character dialogue.</li><li><strong>What is the difference between Open your heart and Speak your mind?</strong> Open your heart outputs a numeric value; Speak your mind outputs the corresponding character.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Elementary Review</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The simplest translation is: <strong>characters are variables, Acts and Scenes are code sections and labels, stage directions manage active characters, and dialogue contains instructions.</strong> SPL looks theatrical, but its execution model is still programming. The next SPL lesson should focus narrowly on <strong>values, nouns, adjectives, and assignment expressions</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This lesson covers the <strong>Shakespeare Programming Language</strong>, not Shakespearean literature. Primary technical references are the original SPL documentation and the modern shakespearelang interpreter documentation. The featured image is a unique 1200×630 visual-learning cover and is not reused in the body. All YouTube videos use native responsive 16:9 Gutenberg YouTube embed blocks. No fixed-width lesson text boxes are used.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->