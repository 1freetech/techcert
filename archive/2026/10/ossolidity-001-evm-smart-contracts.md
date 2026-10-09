---
title: "OSSolidity.001: EVM and Smart Contracts"
status: published
wordpress_post_id: 22233
wordpress_status: publish
published: "2026-10-08T21:10:11"
live_url: "https://bitcoinversus.tech/2026/10/08/ossolidity-001-evm-smart-contracts/"
series: "Open Source Solidity"
certification: OSSolidity
pathway: programming
lesson_number: "001"
lesson_topic: "EVM and smart contracts"
featured_media_id: 22231
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossolidity001-cover-1200x630-1.jpg"
featured_image_dimensions: "1200x630"
body_image_id: 22232
body_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossolidity001-evm-flow-1200x700-1.jpg"
youtube_1: "https://www.youtube.com/watch?v=M576WGiDBdQ"
youtube_2: "https://www.youtube.com/watch?v=8A8-7Ks26yY"
social_embed: "https://twitter.com/iExecDev/status/2042177433646850276"
seo_title: "OSSolidity.001: EVM and Smart Contracts"
seo_description: "Learn what Solidity is, what smart contracts are, how the Ethereum Virtual Machine executes contract bytecode, and why Solidity source must be compiled before Ethereum can run it."
---

<!-- FINAL GUTENBERG SOURCE BELOW -->
<!-- wp:paragraph -->
<p><strong>Elementary overview:</strong> <strong>Solidity</strong> is a high-level programming language used to write programs called <strong>smart contracts</strong>. On Ethereum, those programs do not run directly as human-readable Solidity text. Solidity source code is compiled into low-level <strong>EVM bytecode</strong>, and the <strong>Ethereum Virtual Machine (EVM)</strong> executes that bytecode across Ethereum nodes. If you already understand a conventional <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-virtual-machine-vm-how-it-works/">virtual machine</a>, the name will sound familiar, but the EVM is not a desktop computer or guest operating system. It is a shared execution environment for blockchain programs.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=M576WGiDBdQ","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=M576WGiDBdQ</div><figcaption class="wp-element-caption"><em>freeCodeCamp’s beginner course introduces blockchain, Ethereum, Solidity, smart contracts, and Remix before moving into deeper development topics.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:image {"id":22232,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/ossolidity001-evm-flow-1200x700-1.jpg?w=1024" alt="Diagram showing Solidity source code moving through the Solidity compiler into EVM bytecode and Ethereum Virtual Machine execution" class="wp-image-22232" /><figcaption class="wp-element-caption"><em>Beginner mental model: Solidity source → compiler → EVM bytecode → EVM execution.</em></figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What Is a Smart Contract?</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A smart contract is a program stored at an address on Ethereum. It contains <strong>code</strong> that defines what it can do and <strong>state</strong> that records data it needs to remember. Users and other contracts interact with it by sending transactions or calls. The word <em>smart</em> does not mean artificial intelligence, and the word <em>contract</em> does not automatically mean a legal agreement. The simplest mental model is <strong>program + persistent state + blockchain address</strong>. Smart-contract ideas are not unique to Ethereum; Bitcoin researchers have also explored programmable designs such as <a href="https://bitcoinversus.tech/2023/10/15/bitvm-enables-smart-contracts-on-bitcoin/">BitVM</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Ethereum’s developer documentation describes a smart contract as code and data residing at a specific blockchain address. Unlike a normal application process on your laptop, a deployed contract is executed according to network rules rather than by one private server. That shared execution model is one reason Ethereum applications can compose with other on-chain programs and why Ethereum-compatible <a href="https://bitcoinversus.tech/2024/10/17/sony-launches-ethereum-layer-2-blockchain-soneium/">Layer-2 networks</a> often preserve familiar EVM tooling.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What Is the Ethereum Virtual Machine?</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <strong>EVM</strong> is Ethereum’s execution environment for smart contracts. Ethereum nodes use it to process contract bytecode under the same rules so that the network can agree on the resulting state. A traditional <a href="https://bitcoinversus.tech/2026/10/08/it-what-is-hypervisor-virtual-machines-physical-server/">hypervisor</a> can host complete guest operating systems with virtual CPUs, memory, disks, and devices. The EVM is much narrower: it is a deterministic machine for executing blockchain instructions.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=8A8-7Ks26yY","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=8A8-7Ks26yY</div><figcaption class="wp-element-caption"><em>This Solidity lesson walks through Ethereum, smart contracts, the Remix IDE, gas, and a first contract from a beginner perspective.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p>The Solidity documentation emphasizes that EVM execution is isolated: contract code does not receive ordinary access to a host computer’s filesystem, network stack, or unrelated processes. That restriction is important because every participating node must be able to reproduce the same valid result. You can think of the EVM less like a general-purpose PC and more like a carefully specified state machine whose instructions are designed for shared blockchain execution.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Solidity Source Is Not What the EVM Executes</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Developers write Solidity because human-readable source is easier to design, review, test, and maintain than raw machine instructions. A Solidity <strong>compiler</strong> translates that source into EVM bytecode. This is the same broad idea found across many <a href="https://bitcoinversus.tech/2026/09/30/assembly-to-kotlin-programming-languages-changed-computing/">programming languages</a>: programmers work at a higher level, while a compiler or runtime layer converts their intent into instructions a machine can execute. Recent work such as the <a href="https://bitcoinversus.tech/2026/10/08/ts-rust-typescript-7-compiler-rust-181711-tests-ai-agents/">TypeScript compiler port to Rust</a> is a different ecosystem, but it demonstrates the same fundamental role a compiler plays between source code and execution.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Solidity source (.sol)
        ↓
Solidity compiler
        ↓
EVM bytecode
        ↓
Ethereum Virtual Machine
        ↓
new blockchain state</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>For this first lesson, you do not need to memorize bytecode, opcodes, storage slots, or compiler flags. The required idea is simply that <strong>the EVM executes compiled bytecode, not the original Solidity source file</strong>. Contract structure and Solidity syntax belong in the next lesson.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Why Every Node Must Reach the Same Result</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Ethereum is a distributed system. Many machines independently process the same valid transactions and need to agree on the resulting blockchain state. That means contract execution must be deterministic under the protocol’s rules: the same starting state and valid transaction should produce the same valid outcome. This is very different from a normal web application that might ask an external server for changing data during execution.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The EVM therefore gives contracts a constrained execution environment and a defined instruction set. Ethereum documentation describes the EVM as a stack machine whose compiled bytecode consists of low-level operations. You will meet individual opcodes, storage, memory, and calldata much later in this track; lesson 001 only needs the concept that the EVM provides the common machine model Ethereum nodes follow.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>What Is Gas?</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Gas</strong> is the accounting unit Ethereum uses to measure computational work. EVM operations consume gas according to protocol rules, and transactions must provide enough gas for the requested execution. For a beginner, treat gas as a <strong>meter for computation and state-changing work</strong>, not as a programming language feature. Gas optimization deserves its own later lesson and should not be mixed into the fundamentals here.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Where Solidity Fits in the Software Stack</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Solidity:</strong> the human-readable high-level language used to express contract logic.</li><li><strong>Compiler:</strong> translates Solidity source into EVM bytecode and related build outputs.</li><li><strong>Smart contract:</strong> deployed code and persistent state at an Ethereum address.</li><li><strong>EVM:</strong> the shared runtime model that executes contract bytecode.</li><li><strong>Ethereum nodes:</strong> independent computers that validate and process network activity according to Ethereum rules.</li><li><strong>Blockchain state:</strong> the shared record that changes when valid transactions execute successfully.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Solidity itself is <a href="https://bitcoinversus.tech/2026/10/08/what-is-open-source-software-sharing-code-build-better-technology/">open-source software</a>, and smart-contract development commonly uses public tools, documentation, and repositories. That openness can make code easier to inspect, but open source does not automatically make a contract correct or safe. A bug in deployed contract logic can have real consequences, which is why testing, review, access control, and security receive dedicated lessons later.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/iExecDev/status/2042177433646850276","type":"rich","providerNameSlug":"twitter","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-twitter wp-block-embed-twitter"><div class="wp-block-embed__wrapper">https://twitter.com/iExecDev/status/2042177433646850276</div><figcaption class="wp-element-caption"><em>A 2026 developer example showing Solidity still being used as part of modern smart-contract SDK and on-chain application work.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Beginner Mistakes to Avoid</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>“The EVM is just like VirtualBox.”</strong> No. Both use the phrase virtual machine, but the EVM is a specialized blockchain execution model rather than a guest-PC platform.</li><li><strong>“Solidity runs directly on Ethereum.”</strong> Not exactly. Solidity source is compiled; the EVM executes bytecode.</li><li><strong>“Smart contract means AI contract.”</strong> No. A smart contract is program logic and state executed under blockchain rules.</li><li><strong>“Open source means safe.”</strong> No. Visibility helps inspection, but correctness still depends on engineering and review.</li><li><strong>“Gas is a fee setting inside Solidity.”</strong> No. Gas is part of Ethereum’s execution-accounting model.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Exercises</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Write the four-stage path from Solidity source to EVM execution from memory.</li><li>In one sentence, explain why an EVM is not the same thing as a desktop virtual machine.</li><li>Describe a smart contract using the words <strong>code</strong>, <strong>state</strong>, and <strong>address</strong>.</li><li>Explain why Ethereum nodes need deterministic execution.</li><li>State what gas measures without discussing optimization.</li><li>Read the official Solidity smart-contract introduction and identify one statement about EVM isolation.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li><strong>What is Solidity?</strong> A high-level programming language commonly used to write smart contracts for EVM-compatible environments.</li><li><strong>What is a smart contract?</strong> Program code plus persistent state stored at a blockchain address and executed according to network rules.</li><li><strong>What does the EVM execute?</strong> Compiled EVM bytecode.</li><li><strong>Does the EVM execute the original <code>.sol</code> text directly?</strong> No.</li><li><strong>Why is deterministic execution important?</strong> Independent nodes need to reproduce the same valid result from the same valid state and transaction.</li><li><strong>What does gas measure?</strong> Computational and state-changing work performed during EVM execution.</li><li><strong>Is the EVM a normal guest operating system?</strong> No. It is a specialized blockchain execution environment.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Primary Technical References</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://docs.soliditylang.org/en/latest/introduction-to-smart-contracts.html">Solidity Documentation — Introduction to Smart Contracts</a></li><li><a href="https://docs.soliditylang.org/en/latest/layout-of-source-files.html">Solidity Documentation — Layout of a Solidity Source File</a></li><li><a href="https://ethereum.org/developers/docs/evm/">Ethereum.org — Ethereum Virtual Machine</a></li><li><a href="https://ethereum.org/developers/docs/smart-contracts/">Ethereum.org — Introduction to Smart Contracts</a></li><li><a href="https://ethereum.org/developers/docs/smart-contracts/languages/">Ethereum.org — Smart Contract Languages</a></li><li><a href="https://ethereum.org/developers/docs/smart-contracts/compiling">Ethereum.org — Compiling Smart Contracts</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Next Lesson</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Next in the Solidity track: OSSolidity.002 — Contract Structure.</strong> That lesson will introduce the basic layout of a Solidity source file, including the SPDX identifier, pragma directive, contract declaration, state-variable placement, and function placement without jumping ahead into mappings, inheritance, tokens, deployment, or security exploits.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><em>Editor's Note:</em></strong> Solidity and Ethereum continue to evolve. Examples should be checked against the current Solidity and Ethereum documentation before production use.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong><em>We volunteer daily to improve the credibility of the information on this platform. If you would like to support the research, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.tech is not a financial advisor. This media platform reports on technical and financial subjects purely for informational purposes.</p>
<!-- /wp:paragraph -->