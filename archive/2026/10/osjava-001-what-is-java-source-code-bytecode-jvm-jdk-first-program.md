---
title: "OSJava.001: What Is Java? — Source Code, Bytecode, the JVM, JDK, and Your First Program"
status: published
wordpress_post_id: 22400
wordpress_status: publish
published: "2026-10-08T22:57:07"
live_url: "https://bitcoinversus.tech/2026/10/08/osjava-001-what-is-java-source-code-bytecode-jvm-jdk-first-program/"
series: "Open Source Java"
certification: OSJava
pathway: java
lesson_number: "001"
lesson_topic: "What Is Java? — Source Code, Bytecode, the JVM, JDK, and Your First Program"
featured_media_id: 22401
featured_media: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osjava001-cover-1200x630-2.jpg"
featured_media_dimensions: "1200x630"
body_media_id: 22402
body_media_dimensions: "1200x700"
seo_title: "OSJava.001: What Is Java? JVM, JDK, Bytecode & First Program"
seo_description: "Learn Java fundamentals: .java source files, javac, .class bytecode, the JVM, the JDK, java launcher, portability, and your first Hello Java program."
---

<!-- wp:paragraph -->
<p><strong>Elementary overview:</strong> Java is a general-purpose programming language built around a simple but important execution model: you write Java source code, a compiler can turn that source into <strong>bytecode</strong>, and a <strong>Java Virtual Machine (JVM)</strong> executes that bytecode on the computer running the program.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is the first lesson in the Open Source Java track. The goal is intentionally narrow: understand <strong>what Java is, what the JDK and JVM do, and how one tiny Java program moves from source code to execution</strong>. Variables, primitive types, operators, classes, objects, methods, packages, exceptions, collections, and concurrency belong in later lessons.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What You Should Learn</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>What Java is.</li><li>What a <code>.java</code> source file is.</li><li>What <code>javac</code> does.</li><li>What Java bytecode and a <code>.class</code> file are.</li><li>What the JVM does.</li><li>What the JDK provides.</li><li>How to compile and run a first Java program.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":22402,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osjava001-jvm-flow-1200x700-1.jpg?w=1024" alt="Diagram showing Hello.java compiled by javac into Hello.class bytecode and executed by the JVM" class="wp-image-22402" /><figcaption class="wp-element-caption"><em>Java source is compiled by javac into bytecode class files, which the JVM loads and executes.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What Is Java?</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Java is a statically typed, general-purpose programming language used for server software, enterprise applications, developer tools, desktop programs, data systems, Android-adjacent development, and many other types of software. It is part of the long evolution of programming languages described in <a href="https://bitcoinversus.tech/2026/09/30/assembly-to-kotlin-programming-languages-changed-computing/">From Assembly to Kotlin: How Programming Languages Changed Computing</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Java became especially influential because programs are commonly compiled into a platform-neutral instruction format called <strong>Java bytecode</strong>. A JVM for the target operating system and processor then executes that bytecode. This separates much of the application from the details of the underlying machine.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>As of October 2026, Oracle’s current Java SE documentation is at Java SE 27. The core workflow taught in this lesson—source code, <code>javac</code>, bytecode, and JVM execution—remains fundamental even as the platform continues to evolve.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=l9AzO1FMgM8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=l9AzO1FMgM8</div><figcaption class="wp-element-caption"><em>Fireship’s Java overview gives a concise visual explanation of Java, bytecode, the JVM, the JDK, and the language’s portability model.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Java Is Not JavaScript</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Java and JavaScript are separate programming languages. Their similar names do not make JavaScript a smaller or browser-only version of Java. They have different syntax, type systems, runtimes, ecosystems, and execution models. The previous lesson, <a href="https://bitcoinversus.tech/2026/10/08/osjavascript-001-what-is-javascript-where-it-runs-what-it-does-first-console-log/">OSJavaScript.001: What Is JavaScript?</a>, introduces JavaScript’s language-engine-host model.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>The Four-Part Java Execution Model</strong></h2>
<!-- /wp:heading -->

<!-- wp:table -->
<figure class="wp-block-table"><table><thead><tr><th>Stage</th><th>Example</th><th>Purpose</th></tr></thead><tbody><tr><td>Source code</td><td><code>Hello.java</code></td><td>Human-readable Java program</td></tr><tr><td>Compiler</td><td><code>javac Hello.java</code></td><td>Translates Java source into bytecode</td></tr><tr><td>Bytecode</td><td><code>Hello.class</code></td><td>Portable instructions defined for the JVM</td></tr><tr><td>Execution</td><td><code>java Hello</code></td><td>Starts a JVM, loads the class, and runs the program</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>This is the mental model to remember. You write <code>.java</code> source. The Java compiler can produce <code>.class</code> files containing JVM bytecode. The <code>java</code> launcher starts a JVM, loads the requested class, and invokes the program’s entry point.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Step 1: Write a .java Source File</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Create a plain-text file named <code>Hello.java</code>. Java source files are ordinary text files, so they can be written in a simple text editor, an IDE, or a code editor with features such as <a href="https://bitcoinversus.tech/2026/10/08/what-is-syntax-highlighting-why-code-editors-use-different-colors/">syntax highlighting</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello, Java!");
    }
}</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For this traditional form, the public class is named <code>Hello</code>, so the source file is named <code>Hello.java</code>. The <code>main</code> method is the program entry point used in this example. Do not worry about understanding every keyword yet; later lessons will break them apart.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Step 2: Compile with javac</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The Java compiler command is <code>javac</code>. Oracle and Dev.java document <code>javac</code> as the JDK tool that reads Java class and interface definitions and compiles them into bytecode class files.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>javac Hello.java</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If the source is valid, this command normally creates:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Hello.class</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The <code>.class</code> file is not the original source text and is not a normal native executable for one operating system. It contains Java Virtual Machine instructions called bytecode.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Step 3: The JVM Executes Bytecode</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <strong>Java Virtual Machine</strong> is the abstract execution machine defined by the Java Virtual Machine Specification and implemented by JVM software such as HotSpot. The JVM loads classes, verifies and manages bytecode, provides runtime services, and executes the program. Modern JVMs can interpret code and use just-in-time compilation to turn frequently executed bytecode into optimized machine code while the application runs.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The JVM is a different idea from a full hardware-style <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-virtual-machine-vm-how-it-works/">virtual machine</a> that emulates or virtualizes an entire computer. A JVM is primarily a process virtual machine designed to execute Java bytecode and provide the Java runtime model.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.linkedin.com/posts/pedroalvesdev_java-jvm-jdk-activity-7503173305663877122-f3YE","type":"rich","providerNameSlug":"linkedin","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-linkedin wp-block-embed-linkedin"><div class="wp-block-embed__wrapper">https://www.linkedin.com/posts/pedroalvesdev_java-jvm-jdk-activity-7503173305663877122-f3YE</div><figcaption class="wp-element-caption"><em>A directly relevant Java overview of the JVM, JDK, runtime environment, bytecode, and the portability model.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Step 4: Launch the Program</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Run the compiled class with the <code>java</code> launcher:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>java Hello</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The expected output is:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Hello, Java!</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Oracle’s Java 27 tool documentation describes the <code>java</code> command as the launcher that starts a Java application by starting a JVM, loading the specified class, and calling its <code>main()</code> method. In the traditional class-launch form used here, the class name is written without the <code>.class</code> extension.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What Is the JDK?</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>JDK</strong> means <strong>Java Development Kit</strong>. It is the software kit used to develop Java applications. A modern JDK includes the Java runtime plus development and diagnostic tools. Important beginner commands include <code>java</code>, <code>javac</code>, <code>javadoc</code>, <code>jar</code>, <code>javap</code>, and <code>jshell</code>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For development, think of the JDK as the toolbox. The JVM is one major runtime component inside that larger development environment.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What About the JRE?</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>JRE</strong> means <strong>Java Runtime Environment</strong>. Historically, Java users often installed a separate JRE when they only needed to run applications and installed a JDK when they needed development tools. Modern Java distributions and deployment practices have changed, so beginners should not assume that a separate standalone JRE package is always required or supplied. For this course, installing a JDK gives you the tools needed to both compile and run the examples.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Why Bytecode Helps Java Run on Different Systems</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A Windows computer, Linux server, and Mac do not execute identical native machine instructions. Java’s common bytecode format creates an intermediate layer: the application can target the JVM instruction set, while the JVM implementation handles the details of the local operating system and processor.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This does not mean every Java program is magically portable with no conditions. Native libraries, operating-system dependencies, filesystem assumptions, architecture-specific code, and environment configuration can still reduce portability. The important idea is that Java bytecode and the JVM provide a standardized execution layer.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>You Can Also Run a Source File Directly</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Modern Java launchers also support source-file mode. For a suitable source program, you can run:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>java Hello.java</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The launcher compiles and runs the source as part of that operation. This is convenient for small programs and learning, but understanding the explicit <code>javac</code> → <code>.class</code> → <code>java</code> workflow is still valuable because it exposes the underlying Java compilation model.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Check Your Installed Java Tools</strong></h2>
<!-- /wp:heading -->

<!-- wp:code -->
<pre class="wp-block-code"><code>java -version
javac -version</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>If <code>java</code> works but <code>javac</code> does not, you may have a path or installation problem, or you may be using an environment that exposes a runtime but not the full development toolset. Oracle’s JDK installation documentation covers Windows, macOS, and Linux installation paths.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Common Beginner Mistakes</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Running <code>javac</code> on the wrong filename:</strong> verify the file is really named <code>Hello.java</code>.</li><li><strong>Running <code>java Hello.class</code>:</strong> the normal class-launch form uses <code>java Hello</code>, not the filename.</li><li><strong>Using the wrong capitalization:</strong> Java identifiers and filenames can be case-sensitive in important ways.</li><li><strong>Forgetting that <code>javac</code> and <code>java</code> are different tools:</strong> one compiles; the other launches.</li><li><strong>Confusing the JVM with the JDK:</strong> the JVM executes bytecode; the JDK is the broader development kit.</li><li><strong>Confusing Java with JavaScript:</strong> they are different languages.</li><li><strong>Assuming every Java program is perfectly portable:</strong> applications can still depend on native libraries, files, environment variables, or OS-specific behavior.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Practice</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Run <code>java -version</code> and <code>javac -version</code>.</li><li>Create <code>Hello.java</code> using the example in this lesson.</li><li>Compile it with <code>javac Hello.java</code>.</li><li>Confirm that <code>Hello.class</code> appears.</li><li>Run it with <code>java Hello</code>.</li><li>Change the output message, compile again, and rerun it.</li><li>Delete the <code>.class</code> file and explain why <code>java Hello</code> can no longer find the compiled class.</li><li>Try <code>java Hello.java</code> and compare source-file mode with the explicit compile-and-run workflow.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is stored in a .java file?</strong> Human-readable Java source code.</li><li><strong>What does javac do?</strong> It compiles Java source into JVM bytecode class files.</li><li><strong>What is usually stored in a .class file?</strong> Java Virtual Machine bytecode and class metadata.</li><li><strong>What does the JVM do?</strong> It loads and executes JVM bytecode and provides the Java runtime execution environment.</li><li><strong>What is the JDK?</strong> The Java Development Kit, containing the runtime and development tools such as javac.</li><li><strong>What command launches a compiled Hello class?</strong> <code>java Hello</code>.</li><li><strong>Are Java and JavaScript the same language?</strong> No.</li><li><strong>Why does bytecode help portability?</strong> The application can target the standardized JVM instruction set while platform-specific JVM implementations handle the local machine.</li><li><strong>Can modern Java run a source file directly?</strong> Yes. The java launcher supports source-file mode, such as <code>java Hello.java</code>.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Primary Technical References</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://dev.java/learn/first-steps/">Dev.java — Your First Steps in Java</a></li><li><a href="https://dev.java/learn/first-steps/first-java-code/">Dev.java — Your First Java Code</a></li><li><a href="https://dev.java/learn/jvm/tools/core/javac/">Dev.java — javac, the Compiler</a></li><li><a href="https://docs.oracle.com/en/java/javase/27/docs/specs/man/java.html">Oracle Java SE 27 — The java Command</a></li><li><a href="https://docs.oracle.com/en/java/javase/27/">Oracle — JDK 27 Documentation</a></li><li><a href="https://docs.oracle.com/en/java/javase/27/docs/specs/index.html">Oracle — Java SE 27 Language, JVM, and JDK Specifications</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Elementary Review</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Write source. Compile to bytecode. Run the bytecode on a JVM.</strong> The JDK gives you the development tools, <code>javac</code> creates class files, and the <code>java</code> launcher starts the JVM that runs the program. That is the basic Java execution model.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Next Java Lesson</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>OSJava.002: Primitive Types and Variables</strong> will introduce Java’s basic value types, variable declarations, literals, assignment, and the difference between primitive values and reference types at an introductory level.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Editor’s Note</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The featured artwork is a unique 1200×630 technical editorial illustration created specifically for OSJava.001 and is not reused inside the lesson. The separate 1200×700 body diagram explains the Java source → <code>javac</code> → bytecode → JVM flow. Neon green is limited to the small <code>bitcoinversus.tech</code> tag at bottom-left.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech content is provided for informational and educational purposes.</p>
<!-- /wp:paragraph -->