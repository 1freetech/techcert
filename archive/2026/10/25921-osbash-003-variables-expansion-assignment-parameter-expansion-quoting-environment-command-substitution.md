---
post_id: 25921
title: "OSBash.003: Variables and Expansion — Assignment, $name, ${name}, Quoting, Environment Variables, and Command Substitution"
slug: osbash-003-variables-expansion-assignment-parameter-expansion-quoting-environment-command-substitution
status: publish
published: 2026-10-15T23:12:24
live_url: https://bitcoinversus.tech/2026/10/15/osbash-003-variables-expansion-assignment-parameter-expansion-quoting-environment-command-substitution/
featured_media: 25914
featured_image: https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osbash-003-variables-expansion-cover-1200x630-1.jpg
qr_media_id: 24043
---

<!-- wp:heading -->
<h2 class="wp-block-heading">Key Takeaways</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Bash variables store shell values.</strong> A basic assignment uses <code>name=value</code> with no spaces around the equals sign.</li><li><strong><code>$name</code> and <code>${name}</code> expand a parameter to its value.</strong> Braces make boundaries explicit when text follows the variable name.</li><li><strong>Double quotes usually preserve a value as one shell word while still allowing expansion.</strong> Single quotes suppress ordinary parameter, command, and arithmetic expansion.</li><li><strong>Shell variables and environment variables are related but not identical.</strong> <code>export</code> marks a variable for inheritance by child processes.</li><li><strong>Command substitution captures command output.</strong> The modern form is <code>$(command)</code>.</li><li><strong>Expansion is powerful enough to create bugs when values are left unquoted.</strong> Quoting variable expansions is a strong default unless you intentionally need word splitting or filename expansion.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/2026/10/10/osbash-002-commands-paths-pwd-ls-cd-absolute-relative-paths-path/"><strong>OSBash.002</strong></a> explained paths, the current working directory, and <code>PATH</code>. This lesson moves one level deeper: Bash can store values under names and then substitute those values into commands. That mechanism is called <strong>parameter expansion</strong>, and it is one of the foundations of practical shell scripting.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The current <a href="https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html"><strong>GNU Bash Reference Manual</strong></a> defines a variable as a named shell parameter with a value and optional attributes. Bash assignment uses the form <code>name=value</code>; a variable can later be expanded with <code>$name</code> or <code>${name}</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=7qd5sqazD7k","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=7qd5sqazD7k
</div><figcaption class="wp-element-caption"><em>NetworkChuck introduces Bash variables and arguments in a beginner scripting workflow.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Assign a Variable With name=value</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>site="bitcoinversus.tech"
track="Open CERT"
lesson=3</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The assignment syntax is compact on purpose. Do not insert spaces around <code>=</code> in an ordinary assignment. Bash parses words before it decides what they mean, so <code>site = value</code> is not the same construct as <code>site=value</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code># Correct
name="Ada"

# Not a normal variable assignment
name = "Ada"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>A shell variable stores text by default. Bash can perform arithmetic and can assign attributes with commands such as <code>declare</code>, but beginners should first master the normal string model: assign a value, expand the value, and quote it correctly.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Expand a Variable With $name</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>name="Ada"
echo "$name"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The assignment stores <code>Ada</code>. The second line does not pass the literal characters <code>$name</code> to <code>echo</code>; Bash performs parameter expansion and substitutes the variable's value.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>model="S21"
hashrate="200 TH/s"
printf '%s %s\n' "$model" "$hashrate"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>printf</code> is often easier to reason about than <code>echo</code> when scripts need predictable formatting. The important point here is that each expanded value is surrounded by double quotes.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Use ${name} When the Boundary Matters</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The basic parameter-expansion form documented by GNU Bash is <code>${parameter}</code>. Braces are optional in many simple cases, but they are valuable whenever the next character could be mistaken for part of the variable name.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>name="miner"

echo "$name"
echo "${name}_01"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Without braces, <code>$name_01</code> asks Bash for a variable named <code>name_01</code>. With <code>${name}_01</code>, the variable boundary is explicit: expand <code>name</code>, then append <code>_01</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=V_rKWUr5mXk","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=V_rKWUr5mXk
</div><figcaption class="wp-element-caption"><em>You Suck at Programming provides a recent 2026 deep dive into Bash parameter expansion.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Double Quotes Preserve Expansion Safely</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Double quotes allow parameter expansion, command substitution, and arithmetic expansion while preventing ordinary word splitting and filename expansion on the resulting value. This makes <code>"$variable"</code> one of the most important habits in shell scripting.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>project="Hash Race"
printf '%s\n' "$project"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Because <code>$project</code> is quoted, the embedded space stays inside a single argument. The <a href="https://www.gnu.org/software/bash/manual/html_node/Quoting.html"><strong>GNU Bash quoting documentation</strong></a> explains that quoting removes or preserves the special meaning of shell characters depending on the quoting mechanism.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Single Quotes Mean Literal Text</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>name="Ada"

echo "$name"
echo '$name'</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The first command prints the value of <code>name</code>. The second prints the literal characters <code>$name</code>. Single quotes are useful when you want Bash to stop interpreting most shell syntax inside the quoted text.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Expansion Happens Before a Command Runs</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bash processes shell syntax before it launches an external program. According to the <a href="https://www.gnu.org/software/bash/manual/html_node/Shell-Expansions.html"><strong>Bash expansion model</strong></a>, parameter expansion, command substitution, and arithmetic expansion happen before later steps such as word splitting, filename expansion, and quote removal. This ordering explains why quoting changes the number of arguments a program receives.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>path="$HOME/projects"
printf '%s\n' "$path"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Bash expands <code>$HOME</code> first. The double quotes then preserve the expanded result as a single shell word.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">HOME and PATH Are Already Variables</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>printf '%s\n' "$HOME"
printf '%s\n' "$PATH"
printf '%s\n' "$PWD"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>HOME</code>, <code>PATH</code>, and <code>PWD</code> are common shell or environment variables. OSBash.002 used <code>PATH</code> to explain command lookup; now you can see that the same search path is stored as a value that Bash can expand like other parameters.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Shell Variables vs Environment Variables</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A variable can exist in the current Bash process without automatically becoming part of the environment inherited by child processes. The GNU Bash manual describes an environment as a list of <code>name=value</code> strings passed to invoked programs. <code>export</code> marks a shell variable so Bash includes it in that environment.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>project="Open CERT"
export project

# Equivalent one-line form
export region="us-west"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>You can inspect environment entries with commands such as <code>env</code> or <code>printenv</code>. The current Bash documentation also notes that child processes inherit exported values but cannot directly rewrite the parent shell's variables.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=aKghi0hI1OA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=aKghi0hI1OA
</div><figcaption class="wp-element-caption"><em>Microsoft Developer explains Bash environment variables, <code>env</code>, <code>PATH</code>, and <code>export</code>.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Temporary Environment Values for One Command</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bash also lets you place an assignment directly before a command. That value becomes part of the environment for that command invocation without necessarily changing the variable permanently in the surrounding shell.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>LANG=C date
MODE=test ./check.sh</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This pattern is common in testing, build systems, deployment scripts, and troubleshooting because it keeps configuration scoped to one command.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Capture Command Output With $(...)</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Command substitution runs a command and replaces the substitution expression with that command's standard output. The modern and readable Bash form is <code>$(command)</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>today=$(date +%F)
host=$(hostname)

printf 'Date: %s\n' "$today"
printf 'Host: %s\n' "$host"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This turns command output into data your script can reuse. The older backtick form exists, but <code>$(...)</code> is easier to read and nest.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=8-zmlcwFAfE","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=8-zmlcwFAfE
</div><figcaption class="wp-element-caption"><em>ProgrammingKnowledge demonstrates shell command substitution and storing command output in variables.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Use Default Values With ${name:-fallback}</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Parameter expansion can do more than simple substitution. One highly practical form is <code>${parameter:-word}</code>, which uses <code>word</code> when the parameter is unset or null.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>region="${REGION:-us-west}"
printf '%s\n' "$region"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This pattern is common when scripts accept configuration from environment variables but still need a reasonable default. It is different from permanently assigning the fallback to the original parameter.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Test Whether a Variable Is Set</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>name=""
printf 'value=[%s]\n' "$name"

unset name
printf 'fallback=%s\n' "${name:-not-set}"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>An empty string and an unset variable are not always treated identically. Bash's parameter-expansion operators can distinguish these states depending on whether the operator includes a colon. Beginners do not need every operator at once, but they should understand that “unset” and “set to an empty value” are separate states.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">unset and readonly Change Variable Behavior</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>name="Ada"
unset name

readonly site="bitcoinversus.tech"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>unset</code> removes a variable. <code>readonly</code> marks a value so the current shell cannot normally assign a new value to it afterward. These builtins make intent clearer in larger scripts.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Arithmetic Expansion Is a Different Expansion</h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>count=4
next=$((count + 1))
printf '%s\n' "$next"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p><code>$((...))</code> is arithmetic expansion, not ordinary parameter expansion. Bash permits variable names inside arithmetic expressions without a leading dollar sign. A later lesson can go deeper into arithmetic, tests, and conditional logic; for now, recognize the syntax so you do not confuse it with <code>$(...)</code> command substitution.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Safe Default: Quote Variable Expansions</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When a variable might contain spaces, wildcard characters, an empty value, or user-provided text, unquoted expansion can change how Bash divides the command into arguments. A strong default is to write <code>"$variable"</code> unless you intentionally need Bash to perform word splitting or filename expansion.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>file="report october.txt"
printf '%s\n' "$file"

folder="$HOME/My Projects"
printf '%s\n' "$folder"</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Quoting is not decoration. It changes shell parsing behavior. This is why reliable scripts treat expansion and quoting as one combined skill.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Common Beginner Mistakes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Putting spaces around <code>=</code>:</strong> use <code>name=value</code>, not <code>name = value</code>.</li><li><strong>Forgetting the dollar sign when reading a value:</strong> assignment uses <code>name=value</code>; expansion uses <code>$name</code> or <code>${name}</code>.</li><li><strong>Using braces incorrectly:</strong> write <code>${name}</code>, not <code>$(name)</code>. The latter is command substitution.</li><li><strong>Leaving values unquoted by habit:</strong> unquoted expansion can trigger word splitting and filename expansion.</li><li><strong>Expecting single quotes to expand variables:</strong> single quotes preserve literal text.</li><li><strong>Assuming every shell variable is exported:</strong> child processes only inherit variables included in the environment.</li><li><strong>Confusing <code>$(...)</code> with <code>$((...))</code>:</strong> the first captures command output; the second performs arithmetic expansion.</li><li><strong>Assuming unset and empty mean the same thing:</strong> Bash parameter expansion can distinguish them.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hands-On Practice</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Create a variable named <code>name</code> and print it with <code>printf</code>.</li><li>Create a value containing a space and compare quoted and unquoted expansion.</li><li>Set <code>model="S21"</code> and build <code>${model}_rack_01</code> using braces.</li><li>Print <code>HOME</code>, <code>PATH</code>, and <code>PWD</code>.</li><li>Create a shell variable, then export it and confirm it appears in <code>env</code>.</li><li>Run one command with a temporary environment assignment placed before the command.</li><li>Capture the current date with <code>today=$(date +%F)</code>.</li><li>Use <code>${REGION:-us-west}</code> with <code>REGION</code> unset, then set <code>REGION</code> and compare the result.</li><li>Use <code>unset</code> on a test variable and verify its expansion afterward.</li><li>Create a small script that combines a variable, <code>$HOME</code>, and command substitution in one formatted output.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check + Answers</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is the normal Bash assignment syntax?</strong> <code>name=value</code> with no spaces around the equals sign.</li><li><strong>What does <code>$name</code> do?</strong> Performs parameter expansion and substitutes the value associated with <code>name</code>.</li><li><strong>Why use <code>${name}</code>?</strong> It makes the parameter boundary explicit and supports additional parameter-expansion forms.</li><li><strong>Do double quotes stop parameter expansion?</strong> No. They preserve expansion while protecting the result from ordinary word splitting and filename expansion.</li><li><strong>Do single quotes expand <code>$name</code>?</strong> No. They preserve the enclosed characters literally.</li><li><strong>What does <code>export</code> do?</strong> Marks a shell variable so it is included in the environment inherited by child processes.</li><li><strong>What does <code>$(command)</code> do?</strong> Runs the command and substitutes its standard output.</li><li><strong>What does <code>${name:-fallback}</code> mean?</strong> Use <code>fallback</code> when <code>name</code> is unset or null.</li><li><strong>What is the difference between <code>$(...)</code> and <code>$((...))</code>?</strong> The first is command substitution; the second is arithmetic expansion.</li><li><strong>What is a strong default when expanding a variable into a command?</strong> Quote it as <code>"$variable"</code> unless you intentionally need splitting or glob expansion.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Review</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Bash variables are named parameters, and expansion turns those names into values.</strong> Assign with <code>name=value</code>, read with <code>$name</code> or <code>${name}</code>, use double quotes to preserve expanded values safely, use <code>export</code> when child processes need a value, and use <code>$(...)</code> when command output must become data inside the script.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Previous Bash Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/10/osbash-002-commands-paths-pwd-ls-cd-absolute-relative-paths-path/"><strong>OSBash.002: Commands and Paths</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/09/osbash-001-shell-script-basics-bash-shebang-chmod-first-script/"><strong>OSBash.001: Shell and Script Basics</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Next Bash Lesson</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>OSBash.004: Quoting, Word Splitting, and Globbing</strong> will go deeper into how Bash turns expanded text into command arguments, including spaces, wildcard patterns, quoted versus unquoted values, and safe filename handling.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Primary references:</strong> <a href="https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html">GNU Bash — Shell Parameters</a>, <a href="https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html">GNU Bash — Shell Parameter Expansion</a>, <a href="https://www.gnu.org/software/bash/manual/html_node/Environment.html">GNU Bash — Environment</a>, <a href="https://www.gnu.org/software/bash/manual/html_node/Quoting.html">GNU Bash — Quoting</a>, and <a href="https://www.gnu.org/software/bash/manual/html_node/Shell-Expansions.html">GNU Bash — Shell Expansions</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:paragraph -->
<p><em><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech provides technical education and analysis for informational purposes only.</em></p>
<!-- /wp:paragraph -->