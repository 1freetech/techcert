---
title: "Bitcoin Mining: What Is Hashprice? Why Miners Track Revenue Per PH/s"
wordpress_post_id: 21426
source: BitcoinVersus.tech
published: 2026-10-06T21:05:19
modified: 2026-10-06T21:05:19
live_url: https://bitcoinversus.tech/2026/10/06/bitcoin-mining-what-is-hashprice-revenue-per-phs/
track: machine/tutorials
lesson_number: null
raw_source: bitcoin-mining-what-is-hashprice-revenue-per-phs-21426.gutenberg.html
---

<!-- wp:paragraph -->
<p><strong>Hashprice is the expected revenue a Bitcoin miner earns from a unit of computing power over time. It is usually quoted in dollars per petahash per second per day — written as $/PH/s/day — and it gives miners a fast way to see how valuable their hashrate is before subtracting operating costs.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The easiest way to think about it is simple: Bitcoin price tells you what one bitcoin is worth, while hashprice tells you what one unit of mining power is worth. That makes hashprice one of the most useful shorthand metrics in industrial Bitcoin mining.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hashprice Measures Revenue Per Unit Of Hashrate</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><a href="https://data.hashrateindex.com/bitcoin-compute-data/bitcoin-hashprice-index">Luxor’s Hashrate Index</a> defines hashprice as the expected value of a unit of SHA-256 mining hashrate per day. Luxor introduced the term and publishes the Bitcoin Hashprice Index in both U.S. dollars and bitcoin.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If hashprice is $40 per PH/s/day, then 1 PH/s of hashrate would be expected to generate about $40 in gross mining revenue over one day before pool fees, electricity, labor, hosting, repairs, financing, taxes, or other expenses.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Daily Gross Revenue = Hashrate × Hashprice

Example:
100 PH/s × $40 per PH/s/day = $4,000 per day</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hashprice Is Not The Same As Bitcoin Price</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bitcoin price is only one input. A miner can see Bitcoin rise while hashprice stays flat or even falls if network competition increases fast enough at the same time.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That distinction matters because miners are not paid simply for owning machines. They are competing with the rest of the network for a share of block rewards, so the value of each unit of hashrate depends on both the reward pool and how much global mining power is chasing it.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Four Main Inputs Move Hashprice</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Hashprice is driven primarily by four variables: Bitcoin price, network difficulty, the block subsidy, and transaction fees. Higher Bitcoin prices and higher transaction fees generally push dollar-denominated hashprice upward, while higher network difficulty usually pushes it downward.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The block subsidy also matters because it determines how many newly issued bitcoins miners collectively receive for each block. When the subsidy is cut during a Bitcoin halving, miners need some combination of higher price, higher fees, lower difficulty, better efficiency, or cheaper power to offset the lost revenue.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=PqwbXPoQY0k","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=PqwbXPoQY0k
</div><figcaption class="wp-element-caption"><em>Luxor Technology explains hashprice, network difficulty, mining revenue, and the main variables that move the value of hashrate.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Difficulty Can Push Hashprice Down Even When Bitcoin Is Strong</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bitcoin’s mining difficulty adjusts roughly every 2,016 blocks so blocks continue arriving near the network’s target interval. When more hashrate joins the network and difficulty rises, each individual petahash earns a smaller expected share of the fixed reward pool.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That is why global hashrate growth matters so much to individual operators. Our coverage of <a href="https://bitcoinversus.tech/2026/10/06/bitcoin-mining-global-hashrate-941-ehs-us-russia-q4-2026/">global Bitcoin hashrate near 941 EH/s</a> shows how competition for the same block rewards can keep pressure on miner revenue even when the industry continues expanding.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hashprice Is Revenue, Not Profit</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A common mistake is to treat hashprice like a profit number. It is not. Hashprice is gross revenue per unit of hashrate. Profit only appears after the operator subtracts the cost of producing that hashrate.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The biggest operating cost is usually electricity, but hosting fees, payroll, maintenance, cooling, pool fees, downtime, financing, insurance, land, transformers, taxes, and failed hardware can all affect the final margin.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">ASIC Efficiency Converts Hashprice Into A Power Breakeven</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><a href="https://braiins.com/blog/braiins-manager-price-adapt-automated-bitcoin-mining-profitability-optimization">Braiins explains</a> that mining profitability can be evaluated by combining hashprice, electricity price, and miner efficiency. A machine measured in joules per terahash converts electrical power into hashrate at a specific energy cost.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a simplified electricity-only breakeven, miners can divide hashprice by 24 hours and by machine efficiency in J/TH. Because one PH/s equals 1,000 TH/s, the numeric J/TH efficiency also equals the approximate kilowatts needed per PH/s.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Breakeven Power Price ($/kWh)
= Hashprice ($/PH/day) ÷ (24 × Efficiency in J/TH)

Example:
$40 ÷ (24 × 20 J/TH)
= about $0.083/kWh</code></pre>
<!-- /wp:code -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Efficiency Determines Which Machines Survive Low Hashprice</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Two ASICs earning the same hashprice can have completely different margins. A newer machine that produces the same hashrate with fewer joules consumes less electricity for every unit of revenue.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This is why older equipment often becomes idle before newer equipment during weak mining conditions. BitcoinVersus.Tech has documented periods when <a href="https://bitcoinversus.tech/2026/09/29/235-ehs-bitcoin-mining-asic-capacity-idle/">hundreds of exahash worth of ASIC capacity was estimated to be sitting idle</a> because available hardware was not automatically economical hardware.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Cheap Energy Raises The Value Of The Same Hashprice</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Hashprice is broadly the same market signal for miners around the world, but their cost structures are not. A site paying three cents per kilowatt-hour can tolerate a much lower hashprice than a site paying eight or ten cents.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That is one reason miners search for underused or stranded power. Our <a href="https://bitcoinversus.tech/2026/10/06/bitcoin-mining-what-is-stranded-energy-why-miners-follow-power-to-source/">stranded-energy explainer</a> shows why miners often move toward power sources that are cheap specifically because they are difficult to sell to other customers.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hashprice Helps Miners Decide When To Curtail</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If the revenue from hashing falls below the cost of electricity, continuing to run can destroy cash rather than create it. Operators can compare expected hashprice with hourly or day-ahead power prices to decide when to reduce output or shut machines off temporarily.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>More advanced operations can also underclock machines, improve J/TH efficiency, or move load between power-price windows. That turns hashprice from a passive market statistic into an operating signal.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hashprice Can Be Hedged</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Because hashprice changes over time, miners can face large swings in revenue even if their physical hashrate stays constant. Hashrate forward markets allow operators to lock in or hedge portions of future mining revenue rather than accepting every move in spot hashprice.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That does not remove operational risk, hardware failure, power-price risk, or counterparty risk. It simply gives miners another tool for managing the revenue side of the business.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Easy Way To Remember It</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Hashrate tells you how much mining power you have. Hashprice tells you how much that mining power is expected to earn.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>For a miner, that makes hashprice the bridge between the Bitcoin network and the income statement. It converts difficulty, block rewards, fees, and Bitcoin price into one number that can be compared directly with machine efficiency and electricity cost.</p>
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