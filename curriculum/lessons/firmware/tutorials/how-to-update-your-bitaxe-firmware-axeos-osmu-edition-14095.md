---
title: "How to Update your Bitaxe Firmware (AxeOS OSMU Edition)"
wordpress_post_id: 14095
source: BitcoinVersus.tech
published: 2025-07-11T06:39:46
modified: 2026-09-28T22:54:28
live_url: https://bitcoinversus.tech/2025/07/11/how-to-update-your-bitaxe-firmware-axeos-osmu-edition/
track: firmware/tutorials
lesson_number: null
raw_source: how-to-update-your-bitaxe-firmware-axeos-osmu-edition-14095.gutenberg.html
---

<!-- wp:paragraph -->
<p>For the past month or so there were several <a href="https://bitcoinversus.tech/2024/11/08/bitaxe-startup-efficiency-peaks-explained/">bitaxe devices</a> at my micro data center that indicated they were in a state of overheating. <br><br>You will see a tab on your dashboard that says "<a href="https://bitcoinversus.tech/2025/04/01/how-to-fix-the-n-a-display-problem-on-a-bitaxe-gamma-601/">Bitaxe</a> has overheated - See settings." It is likely that your machine needs a <a href="https://bitcoinversus.tech/2025/07/02/suprahex-not-showing-in-pool-firmware-update-may-be-required/">firmware update</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":14097,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2025/07/screenshot-2025-07-10-202704.png?w=1024" alt="" class="wp-image-14097" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>While I did create a <a href="https://bitcoinversus.tech/tag/tech-docs/">tech doc</a> instructing you on <a href="https://bitcoinversus.tech/2025/03/16/bitaxe-gamma-601-device-overheat-mode-standard-procedure-for-resolving-bitaxe-miner-overheat-alerts/">how to get your bitaxe out of overheat mode</a>, a much more permanent solution for resolving the state of overheating is to update the <a href="https://bitcoinversus.tech/2025/05/20/uefi-firmware/">firmware</a> on your machine altogether.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>You should see the current version of your <a href="https://bitcoinversus.tech/2025/02/25/how-to-fix-a-bricked-suprahex/">bitaxe machine</a> at the bottom of your dashboard. If it's not there, click the "settings" tab and you should be able to see it at the bottom of the GUI (the graphical user interface).</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Click on the check button next.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":13980,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2025/07/screenshot-2025-07-02-214833-e1752228816678.png" alt="" class="wp-image-13980" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>After you click the check button the latest firmware version will show up, along with the bin files for the firware of the esp32 board ("esp-miner.bin") and the update for the actual website or GUI ("www.bin").  </p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":14105,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2025/07/screenshot-2025-07-10-202805.png" alt="" class="wp-image-14105" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Click on the "esp-miner.bin" and the "www.bin" tabs to download them. once downloaded, you will see them in the downloaded section of your computer.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":14046,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2025/07/screenshot-2025-07-07-214311.png" alt="" class="wp-image-14046" /></figure>
<!-- /wp:image -->

<!-- wp:image {"id":14044,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2025/07/image.png" alt="" class="wp-image-14044" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>After Downloading the files. Upload the "esp-miner.bin" file first.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":14103,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2025/07/screenshot-2025-07-10-202849.png" alt="" class="wp-image-14103" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Then, Upload the "www.bin" file immediately after.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":14102,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2025/07/screenshot-2025-07-10-202920.png" alt="" class="wp-image-14102" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>The uploading process is much quicker than a stock firmware update of an industrial machine. Each update shouldn't take any longer than 15-30 seconds. <br><br>Afterward, you will have a new dashboard with new features on the left of the GUI. You can also set the ASIC chip "frequency" and "core voltage" back to it's normal state. If you're feeling lucky, you can overclock your machine as well. </p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":14106,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2025/07/screenshot-2025-07-10-202748.png?w=1024" alt="" class="wp-image-14106" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Remember to save your settings. With the new firmware update, you know longer have to restart the machine like the old versions. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Hope this helps. And happy mining. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><a href="https://bitcoinversus.tech/"><strong><em><sup>BitcoinVersus.Tech</sup></em></strong></a><strong><em><sup> Editor's Note:</sup></em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong><em><sup>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please </sup></em></strong><a href="https://www.gofundme.com/f/support-bitcoin-mining-data-centers-for-everyone"><strong><em><sup>donate here</sup></em></strong></a></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p>
<!-- /wp:paragraph --><!-- wp:embed {"url":"https://www.youtube.com/watch?v=F5Qa7ZSALGs","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=F5Qa7ZSALGs</div></figure><!-- /wp:embed -->