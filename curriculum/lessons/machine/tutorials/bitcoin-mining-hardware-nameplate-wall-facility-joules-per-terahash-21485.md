---
title: "Bitcoin Mining Hardware: Why Nameplate J/TH and Wall J/TH Are Not the Same"
wordpress_post_id: 21485
source: BitcoinVersus.tech
published: 2026-10-06T23:09:48
modified: 2026-10-06T23:09:48
live_url: https://bitcoinversus.tech/2026/10/06/bitcoin-mining-hardware-nameplate-wall-facility-joules-per-terahash/
track: machine/tutorials
lesson_number: null
raw_source: bitcoin-mining-hardware-nameplate-wall-facility-joules-per-terahash-21485.gutenberg.html
---

<!-- wp:paragraph -->
<p><strong>A Bitcoin ASIC can be advertised at one efficiency number and still consume more energy at the wall. The difference is not a contradiction: joules per terahash depends on exactly where power is measured and which supporting equipment is included.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That distinction is becoming more important as modern miners push toward single-digit J/TH. BITMAIN lists the hydro-cooled S23 XP Hyd. at 600 TH/s, 5,340 W and 8.9 J/TH, while small open-source miners are now approaching the same efficiency class at radically different scales.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">What J/TH Actually Measures</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Joules per terahash measures the energy required to perform one trillion SHA-256 hashes per second. For a steady-state miner, the basic relationship is simple:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Efficiency (J/TH) = Power (W) ÷ Hashrate (TH/s)

5,340 W ÷ 600 TH/s = 8.9 J/TH</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>That arithmetic matches <a href="https://shop.bitmain.com/product/detail?pid=00020250312184146889fF0fd5720644">BITMAIN’s published S23 XP Hyd. specification</a>. But a facility operator ultimately pays for energy measured upstream of the hashboards, not for a specification sheet.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Nameplate Power And Wall Power Can Differ</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A miner dashboard may report ASIC-side or DC-side power. A wall meter can also capture conversion losses in the power supply. At larger hydro sites, the total electrical system can additionally include pumps, heat exchangers, dry coolers, controls and other balance-of-system loads.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech saw this issue directly in our <a href="https://bitcoinversus.tech/2026/09/30/bitaxe-naja-duo-wall-tests-stock-efficiency-13-j-th/">Bitaxe Naja Duo wall-test coverage</a>. The Naja is marketed around roughly 4.4 TH/s at 42 W, or about 9.5 J/TH at its reported operating point, but wall-side measurements can produce a different system-efficiency result because the wall includes losses the miner telemetry may not.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=gknNIwWRnR8","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=gknNIwWRnR8
</div><figcaption class="wp-element-caption"><em>Solo Satoshi demonstrates the Naja Duo, including stock power, wall-versus-DC measurement, temperature behavior and overclocking.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p>The accompanying <a href="https://www.solosatoshi.com/product/bitaxe-naja-duo/">Solo Satoshi specifications</a> list about 4.4 TH/s at 42 W and about 9.5 J/TH at default settings. Its detailed test video explicitly distinguishes AxeOS DC-side power from wall-meter power, which is the measurement boundary operators need to understand.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">A Small Overhead Becomes Expensive At Scale</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Consider a hypothetical 600 TH/s miner rated at 5,340 W. If the complete electrical path measured upstream consumed 5% more power, the effective draw would be 5,607 W and system efficiency would be about 9.35 J/TH. At 10% additional overhead, 5,874 W would work out to about 9.79 J/TH.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Those percentages are examples, not claims about a particular machine or facility. The point is that the denominator—hashrate—can remain unchanged while upstream electrical losses increase the number of joules purchased to produce each terahash.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Cooling Changes The Boundary Too</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Air-cooled miners carry fans on the machine, so some cooling power is naturally included in miner draw. Hydro systems move more of the thermal work outside the individual chassis. A miner-level J/TH figure therefore should not automatically be treated as whole-facility J/TH.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is also why comparing architectures matters. Our <a href="https://bitcoinversus.tech/2026/08/24/bitcoin-asic-architecture-bitmain-canaan-microbt-bitdeer/">Bitcoin ASIC architecture guide</a> explains how hashboards, controllers, power delivery and cooling differ across major manufacturers and deployment styles.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Efficiency Only Matters In Context</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Lower J/TH is valuable because it reduces the electrical energy required for a given amount of hashrate. But it does not guarantee profitability. Hardware price, uptime, network difficulty, cooling infrastructure, maintenance and electricity price still determine whether an efficient machine makes economic sense.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That is where <a href="https://bitcoinversus.tech/2026/10/06/bitcoin-mining-what-is-hashprice-revenue-per-phs/">hashprice</a> becomes useful: it describes the revenue side of each unit of hashrate, while wall-measured J/TH helps describe the energy cost of producing it.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Better ASIC Comparison</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When comparing miners, record the manufacturer’s rated TH/s, rated watts and rated J/TH—but also measure sustained wall power under the same operating mode. For hydro deployments, decide whether the comparison is miner-only or includes shared cooling equipment, and keep that boundary consistent across every machine being evaluated.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>The simplest rule: nameplate J/TH tells you how the miner is rated; wall J/TH tells you what your electrical meter actually has to support. Facility J/TH tells you what the complete mining system costs to run.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">BitcoinVersus.Tech</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Advertisement</h3>
<!-- /wp:heading -->

<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Editor’s Note</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong><em>We volunteer daily to help keep the information on this platform verifiably accurate. If you would like to support our independent research, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.tech is not a financial advisor. Content is provided for informational purposes.</p>
<!-- /wp:paragraph -->