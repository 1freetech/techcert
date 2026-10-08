<!-- wp:paragraph -->
<p><strong>Chef performs arithmetic by combining a named ingredient with the value already sitting on top of a mixing bowl.</strong> After <a href="https://bitcoinversus.tech/2026/10/08/oschef-002-put-fold-and-stack-order/"><strong>OSChef.002</strong></a> established Put, Fold, and LIFO order, this lesson adds the four core arithmetic instructions defined by the <a href="https://www.dangermouse.net/esoteric/chef.html">Chef specification</a>: <strong>Add</strong>, <strong>Remove</strong>, <strong>Combine</strong>, and <strong>Divide</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=6avJHaC3C2U","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=6avJHaC3C2U</div><figcaption class="wp-element-caption"><em>“The Art of Code” uses esoteric languages such as Chef to show that unusual syntax can still implement ordinary computation.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Arithmetic Changes the Top Stack Value</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Chef does not require you to push both operands as separate stack values before every arithmetic operation. Instead, one operand is the <strong>current top value of the mixing bowl</strong> and the other is the value stored in a named ingredient. <code>Add delta to the mixing bowl.</code> replaces the top value with <code>top + delta</code>. <code>Remove delta from the mixing bowl.</code> stores <code>top - delta</code>. <code>Combine factor into the mixing bowl.</code> stores <code>top × factor</code>. <code>Divide divisor into the mixing bowl.</code> stores the result of dividing the top value by the ingredient value.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":22065,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/oschef003-arithmetic-stack-diagram-final-1200x800-1.jpg?w=1024" alt="Chef programming diagram showing Add, Remove, Combine, and Divide modifying the top value of a mixing-bowl stack using named ingredients." class="wp-image-22065" /><figcaption class="wp-element-caption"><em>Chef arithmetic works against the top value already in the mixing bowl: Add, Remove, Combine, and Divide apply a named ingredient to that top stack value.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Four Small Programs Make the Pattern Clear</strong></h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Addition.

Ingredients.
8 g base
5 g delta

Method.
Put base into the mixing bowl.
Add delta to the mixing bowl.

Serves 0.</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The bowl starts with 8 on top. Add uses the ingredient <code>delta = 5</code>, so the top becomes 13. The same pattern works for the other instructions: starting from 8, Remove 5 produces 3; starting from 5, Combine 3 produces 15; starting from 12, Divide 4 produces 3. In every case, the arithmetic result replaces the old top value instead of creating a second unrelated value.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=cQ7bcCrJMHc","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=cQ7bcCrJMHc</div><figcaption class="wp-element-caption"><em>An esoteric-programming overview provides context for why languages like Chef deliberately disguise conventional operations behind playful syntax.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Use Fold When You Want the Result Back in an Ingredient</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Arithmetic leaves its result on top of the bowl. If the program needs that result in a named ingredient, follow the operation with Fold. For example, after putting 8 into the bowl and adding 5, <code>Fold result into the mixing bowl.</code> removes 13 from the top and stores <code>result = 13</code>. This connects arithmetic directly back to the data-movement model from OSChef.002.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Arithmetic Result.

Ingredients.
8 g base
5 g delta
0 g result

Method.
Put base into the mixing bowl.
Add delta to the mixing bowl.
Fold result into the mixing bowl.

Serves 0.</code></pre>
<!-- /wp:code -->

<!-- wp:embed {"url":"https://www.linkedin.com/posts/dvoriankin-evgenii_have-you-known-that-theres-a-programming-activity-7218259766173732865-N7Rb","type":"rich","providerNameSlug":"linkedin","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-linkedin wp-block-embed-linkedin"><div class="wp-block-embed__wrapper">https://www.linkedin.com/posts/dvoriankin-evgenii_have-you-known-that-theres-a-programming-activity-7218259766173732865-N7Rb</div><figcaption class="wp-element-caption"><em>Chef examples make the central joke visible: the source resembles a recipe, but the execution is still ordinary programming.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Exercises</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Start with 10 on top and Add an ingredient worth 7. What is the new top?</li><li>Start with 20 and Remove 6.</li><li>Start with 4 and Combine an ingredient worth 5.</li><li>Start with 18 and Divide by an ingredient worth 3.</li><li>Modify the worked addition program so Fold stores the final result in an ingredient named <code>answer</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What does Add modify?</strong> The current top value of the selected mixing bowl.</li><li><strong>What does Remove compute?</strong> Top value minus the named ingredient value.</li><li><strong>What does Combine do?</strong> Multiplies the top value by the named ingredient value.</li><li><strong>What does Divide do?</strong> Divides the top value by the named ingredient value.</li><li><strong>Where is the result left?</strong> On top of the mixing bowl.</li><li><strong>How can the result be moved into a variable-like ingredient?</strong> Use Fold.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Elementary Review</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Chef arithmetic is easier when you translate the recipe words back into operators: <strong>Add = +, Remove = −, Combine = ×, Divide = ÷</strong>. The named ingredient supplies one operand; the top of the mixing bowl supplies the other. The next Chef lesson can move from arithmetic into <strong>Liquefy and character output</strong>, where numeric values become text.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->