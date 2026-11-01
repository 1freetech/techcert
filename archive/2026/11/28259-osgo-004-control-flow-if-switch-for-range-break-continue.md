---
lesson_id: "OSGo.004"
track: "Open Source Go Programming"
level: "Super-Fundamentals"
wordpress_post_id: 28259
title: "OSGo.004: Control Flow — if, switch, for, range, break, and continue"
permalink: "https://bitcoinversus.tech/2026/11/01/osgo-004-control-flow-if-switch-for-range-break-continue/"
published_date: "2026-11-01"
wordpress_category_ids: [44329, 5812, 6]
featured_media_id: 28305
featured_dimensions: "1200x630"
featured_style: "renaissance/oil painting"
featured_person: "Fictional adult Black woman programmer, age 20s–30s, roster position 2"
in_story_media_count: 5
in_story_media:
  - "WordPress 28255: original Go if/else condition branching diagram"
  - "YouTube QgBYnz6I7p4: Tech With Tim Go if/else"
  - "YouTube siOPdXdQImg: Tech With Tim Go switch"
  - "WordPress 28256: original Go for/range slice index/value diagram"
  - "YouTube jZ-llP_yKNo: Tech With Tim Go for loops"
youtube_embed_qa: "WordPress published view HTML contains three distinct native YouTube iframe players with immediate captions; initial links-only rendering fixed by adding newlines inside embed wrappers and retested."
youtube_playback_verified: false
mobile_render_verified: false
code_blocks_count: 0
plain_unboxed_code_examples_count: 6
code_rendering: "Transparent, borderless, line-wrapping pre/code inside six Gutenberg HTML blocks; inline code styling transparent"
code_qa: "Complete main.go compiled and executed with Go 1.23.2; output matches lesson. Other instructional fragments reviewed against Go specification. No claim that all snippets compiled independently."
internal_link_count: 6
decorative_text_box_blocks: 0
primary_sources:
  - "https://go.dev/ref/spec"
  - "https://go.dev/tour/flowcontrol/1"
  - "https://go.dev/tour/flowcontrol/9"
qa_status: "OSGo.004 published. User-requested correction applied November 1: all six code examples now plain transparent borderless and line-wrapping, with inline code spans unboxed; featured cover replaced with 1200x630 code-centric Renaissance art (media 28281). Three YouTube iframe players, two diagrams, six internal links, original footer retained. Independent public browser playback and responsive visual screenshots unverified."
repair_note_2026_11_01: "Removed decorative code text boxes and replaced cover with Go if/switch/for-range/continue/break visualization; monitored WordPress published render and preserved working media."
next_go_lesson_id: "OSGo.005"
next_main_rotation_subject: "java"
november_1_2026_layout_repair: "Replaced former Gutenberg code boxes with 6 plain transparent no-border preformatted HTML examples, retaining code content, media, source links and footer; published WordPress readback verified."
november_1_2026_cover_repair: "Featured image changed from WordPress media 28254 to 28305; refreshed story-specific Go branching/iteration concept; new cover 1200x630, alt text present. Actual independent image-anatomy and browser screenshot review not available."
---

<!-- wp:paragraph --><p>Go programs do more than evaluate expressions: they <strong>make decisions, repeat work, and exit loops deliberately</strong>. <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">if</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">switch</code>, and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">for</code> control which statements run. Go uses one loop keyword, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">for</code>, rather than separate <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">while</code> or <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">do-while</code> statements. Its <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">range</code> clause iterates over collections, while <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">break</code> and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">continue</code> alter loop execution.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This is <strong>OSGo.004</strong> in the complete Open CERT programming rotation. It follows <a href="https://bitcoinversus.tech/2026/10/14/osgo-003-operators-expressions-arithmetic-comparison-logic-assignment-bitwise/">OSGo.003: Operators and Expressions</a>, which supplied the comparison and logical expressions used here. If the syntax is unfamiliar, review <a href="https://bitcoinversus.tech/2026/10/10/osgo-002-variables-constants-zero-values-and-basic-types-var-int-float64-bool-string-byte-and-rune/">OSGo.002: Variables and Basic Types</a> or <a href="https://bitcoinversus.tech/2026/10/08/osgo-001-what-is-go-packages-toolchain-go-run-go-build-first-program/">OSGo.001: The Go Toolchain</a> first.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Write conditional branches using <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">if</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">else if</code>, and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">else</code>.</li><li>Use an initialization statement scoped to an <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">if</code>.</li><li>Choose between a value <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">switch</code> and a condition-only <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">switch</code>.</li><li>Recognize classic, condition-only, and unbounded <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">for</code> loops.</li><li>Iterate over a slice with <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">range</code>; distinguish the index from the copied value.</li><li>Use <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">break</code> to leave a loop and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">continue</code> to skip to its next iteration.</li><li>Run a complete working Go program and interpret its output.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">1. Conditions: if, else if, and else</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A Go <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">if</code> expects an expression of type <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">bool</code>. Unlike C-style syntax, the condition does not need parentheses, but braces are mandatory. Go tests the branches from top to bottom and executes the <strong>first matching branch</strong>.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Go code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">temperature := 76
if temperature &gt;= 85 {
    fmt.Println("STOP: overheat")
} else if temperature &gt;= 70 {
    fmt.Println("CHECK COOLING")
} else {
    fmt.Println("NORMAL")
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>The first comparison is false because 76 is below 85. The second is true because 76 is at least 70, so the output is <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">CHECK COOLING</code>. The <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">else</code> branch is skipped. A semicolon can introduce a short setup statement: <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">if value := 76; value &gt;= 70 { ... }</code>. That variable is scoped to the <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">if</code> statement and any attached <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">else</code> branches.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":28255,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/osgo-004-if-else-branching-flowchart.png" alt="Flowchart showing Go if else if else branches for a temperature of 76°C and the matching CHECK COOLING output" class="wp-image-28255" /><figcaption class="wp-element-caption"><em>Original OSGo.004 decision diagram. At 76°C, the STOP condition fails and the CHECK COOLING condition succeeds.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p>In a real service, such decisions might determine whether a server fan alert is raised, a sensor reading is logged, or a task proceeds. Use clearly defined thresholds and never assume example values are safe production limits.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=QgBYnz6I7p4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=QgBYnz6I7p4
</div><figcaption class="wp-element-caption"><em>Tech With Tim explains if, else if, and else in Go. English tutorial; related examples appear directly below in this lesson.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">2. Switching between cases</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Use <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">switch</code> when several cases depend on one value. A Go <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">switch</code> <strong>does not fall through by default</strong>: when a matching case finishes, the switch ends. Go does not require a <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">break</code> after each case.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Go code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">status := "warning"
switch status {
case "critical":
    fmt.Println("stop")
case "warning", "degraded":
    fmt.Println("inspect")
default:
    fmt.Println("normal")
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>The output is <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">inspect</code>. A case may match several comma-separated values. For checks that are better expressed as conditions, write <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">switch { case temperature &gt;= 85: ... }</code>; this is an expressionless switch whose cases are tested in order. <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">fallthrough</code> is available for specialized cases, but it transfers control to the next clause without retesting that case, so avoid it when ordinary branching is clearer.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Compare the Go specification’s <a href="https://go.dev/ref/spec#Switch_statements">switch rules</a> with the older <a href="https://bitcoinversus.tech/2026/10/14/oscsharp-003-csharp-operators-expressions-precedence/">C# operators and branching background</a>: a similar surface syntax does not imply identical control-flow rules.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=siOPdXdQImg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=siOPdXdQImg
</div><figcaption class="wp-element-caption"><em>Tech With Tim demonstrates Go switch statements. Cases finish automatically unless an explicit language mechanism changes control flow.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">3. One loop keyword: for</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Go uses <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">for</code> in three common forms. A traditional loop provides initialization, a condition, and an update. A condition-only form is Go’s equivalent of a <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">while</code> loop. An unconditional <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">for { ... }</code> repeats until a branch exits.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Go code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">// Three-part loop
for i := 0; i &lt; 3; i++ {
    fmt.Println(i) // 0, 1, 2
}

// Condition-only loop
count := 0
for count &lt; 3 {
    count++
}

// Open-ended loop with a deliberate exit
for {
    if count &gt;= 3 {
        break
    }
    count++
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>The three-part loop initializes <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">i</code> once, checks the condition before each iteration, and runs <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">i++</code> after the body. An open-ended loop without a reachable exit can run indefinitely, so command-line applications and background services should define appropriate termination conditions.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">4. Iterating with range, break, and continue</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">for ... range</code> loop can yield both an <strong>index</strong> and an <strong>element value</strong> for a slice. The value is assigned to an iteration variable, so changing that copy does not update the original slice element. Use <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">for i := range readings</code> when you need to modify <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">readings[i]</code> directly.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Go code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">readings := []int{40, 75, 92}
for index, value := range readings {
    fmt.Println(index, value)
}
// 0 40
// 1 75
// 2 92</code></pre><!-- /wp:html -->

<!-- wp:image {"id":28256,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/osgo-004-range-slice-index-value-diagram.png" alt="Diagram showing Go range over slice readings 40 75 92 with indices 0 1 2 and copies of element values" class="wp-image-28256" /><figcaption class="wp-element-caption"><em>Original OSGo.004 range diagram. Slice indices increase from zero; ranging over a map does not guarantee an iteration order.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">continue</code> skips the remainder of the current loop body and starts the next iteration. <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">break</code> exits the innermost enclosing <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">for</code>, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">switch</code>, or <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">select</code>. In nested loops, a labeled <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">break Outer</code> can explicitly exit a named outer loop. For a string, <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">range</code> produces byte offsets and Unicode code points; for maps, iteration order is unspecified.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=jZ-llP_yKNo","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=jZ-llP_yKNo
</div><figcaption class="wp-element-caption"><em>Tech With Tim demonstrates Go for loops and condition-only looping. The separate range and break/continue examples above extend that introduction.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">5. Mini lab: flag overheated equipment readings</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Create a file named <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">main.go</code> containing the complete program below. The thresholds are illustrative. It combines a decision tree, a condition-only switch, and a range loop that ignores low readings and stops at the first critical reading.</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Go code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">package main

import "fmt"

func main() {
    temperature := 76
    if temperature &gt;= 85 {
        fmt.Println("STOP: overheat")
    } else if temperature &gt;= 70 {
        fmt.Println("CHECK COOLING")
    } else {
        fmt.Println("NORMAL")
    }

    switch {
    case temperature &gt;= 85:
        fmt.Println("status: critical")
    case temperature &gt;= 70:
        fmt.Println("status: warning")
    default:
        fmt.Println("status: nominal")
    }

    readings := []int{40, 75, 92}
    for i, value := range readings {
        if value &lt; 70 {
            continue
        }
        fmt.Printf("sample %d: %d°C\n", i, value)
        if value &gt;= 90 {
            fmt.Println("Stop at first critical reading")
            break
        }
    }
}</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Run <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">gofmt -w main.go</code> to format the source and <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">go run main.go</code> to execute it. The program was compiled and run for this lesson using <strong>Go 1.23.2</strong>. Its exact console output was:</p><!-- /wp:paragraph -->

<!-- wp:html --><pre aria-label="Go code or console output example" tabindex="0" style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;margin:1.2em 0;line-height:1.55;white-space:pre-wrap;max-width:100%;font-family:ui-monospace,SFMono-Regular,Consolas,monospace;font-size:0.95em;color:inherit"><code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">CHECK COOLING
status: warning
sample 1: 75°C
sample 2: 92°C
Stop at first critical reading</code></pre><!-- /wp:html -->

<!-- wp:paragraph --><p>Why was sample 0 absent? Its value, 40, triggered <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">continue</code>. Why did processing stop after sample 2? Its value, 92, triggered <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">break</code>. This is a filtering pattern frequently used in device diagnostics, data validation, and systems monitoring. For related loop syntax in another language, compare <a href="https://bitcoinversus.tech/2026/11/01/osc-005-c-loops-for-while-do-while-break-continue/">OSC.005: C Loops</a> and <a href="https://bitcoinversus.tech/2026/10/14/osrust-005-control-flow-if-loop-while-for-break-continue/">OSRust.005: Rust Control Flow</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">6. Common mistakes and troubleshooting</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Parentheses and braces:</strong> Go omits parentheses in ordinary <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">if</code> conditions but requires curly braces.</li><li><strong>Unexpected case execution:</strong> Go switch cases stop automatically. Do not insert <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">fallthrough</code> unless the next clause must run even when it does not match.</li><li><strong>Missing range variables:</strong> use <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">_</code> to ignore an index or value you do not need.</li><li><strong>Map traversal:</strong> never depend on a particular map iteration order; collect and sort keys when ordering matters.</li><li><strong>Accidental infinite loops:</strong> ensure a condition eventually changes or the loop has an intentional termination path.</li><li><strong>Wrong break target:</strong> a plain <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">break</code> inside a <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">switch</code> exits that switch, not necessarily an enclosing loop.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">7. Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>What is printed for temperature 65 in the first example?</li><li>Does a matching Go switch case run the next case automatically?</li><li>Which loop form replaces a traditional while statement?</li><li>What does <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">continue</code> do to the current loop iteration?</li><li>Can <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">range</code> over a map guarantee key order?</li><li>What changes if the lab replaces <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">break</code> with <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">continue</code> at 92°C?</li></ol><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answer guide:</strong> (1) NORMAL; (2) no; (3) <code style="background:transparent;border:0;box-shadow:none;padding:0;border-radius:0;font-family:ui-monospace,SFMono-Regular,Consolas,monospace">for condition { ... }</code>; (4) skips to the next iteration; (5) no; (6) the loop will advance to later readings rather than stop at the first critical value.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Official references and next lesson</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The authoritative sources for these constructs are <a href="https://go.dev/tour/flowcontrol/1">A Tour of Go: For</a>, <a href="https://go.dev/tour/flowcontrol/9">A Tour of Go: Switch</a>, and the <a href="https://go.dev/ref/spec#For_statements">Go Language Specification: For Statements</a>. Note that Go 1.22 changed loop-variable behavior, giving each iteration its own iteration variables; modern examples should not assume older closure-capture semantics. The next Go lesson, <strong>OSGo.005</strong>, can focus on functions, parameters, and return values. The overall certificate rotation advances to the Java track rather than repeating Go immediately.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our work and help further secure the integrity of our research initiatives, please scan the QR code below to donate 5,000 sats.</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="BitcoinVersus.Tech original Bitcoin donation QR for 5000 satoshis" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open the lesson on a larger screen and scan the QR code with a compatible Bitcoin wallet. Verify the destination address before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->