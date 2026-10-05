---
title: "How to Build and Test a Flask API Server for Application Controls"
wordpress_post_id: 6093
source: BitcoinVersus.tech
published: 2025-01-23T08:00:00
modified: 2026-09-11T13:44:45
live_url: https://bitcoinversus.tech/2025/01/23/how-to-set-up-a-flask-api-server-for-application-control/
track: programming/training
lesson_number: null
raw_source: how-to-set-up-a-flask-api-server-for-application-control-6093.gutenberg.html
---

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><em>UPDATE: the file names in this documentation have been changed. The server-side application is now referred to as <strong>VirtualServer.py</strong>, while the client-side script is called <strong>ProofOfScript.py</strong>. These names have been chosen to help readers easily follow along with the instructions. When running the API, please ensure you use the file names as indicated.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">In order to run an application that interacts with your machines, you need to:&nbsp;</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">1. Build a <a href="https://github.com/ManDarkDev/ControlApplication/blob/main/VirtualServer.py">virtual server</a></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">2. <a href="https://github.com/ManDarkDev/ControlApplication/blob/main/ProofOfScript.py">Run a script</a> that operates accordingly with the server.&nbsp;</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">You need to Copy this repository <a href="http://github.com/ManDarkDev/ControlApplication/blob/main/VirtualServer.py">code</a> into the <a href="https://code.visualstudio.com/Download">VS code terminal</a></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">If you haven’t done it already, Go ahead and<strong>&nbsp; Install the Dependencies</strong>:<br>pip install schedule</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">pip install flask</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">While not entirely necessary, you may want to upgrade to the latest pip version:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">pip install --upgrade pip</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":6116} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-5.png" alt="" class="wp-image-6116" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Example result of <em>pip install schedule</em> below. In this instance the <em>pip install schedule</em> was already satisfied. However, a new release of pip may be available. While not entirely necessary, you may want to upgrade to the latest pip version:.&nbsp;</p>
<!-- /wp:paragraph -->

<!-- wp:gallery {"imageCrop":false,"linkTo":"none"} -->
<figure class="wp-block-gallery has-nested-images columns-default"><!-- wp:image {"id":6106,"aspectRatio":"3/2","scale":"cover","sizeSlug":"large","linkDestination":"none","className":"is-style-default"} -->
<figure class="wp-block-image size-large is-style-default"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-1.png?w=891" alt="" class="wp-image-6106" style="aspect-ratio:3/2;object-fit:cover" /></figure>
<!-- /wp:image --></figure>
<!-- /wp:gallery -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Run <a href="https://github.com/ManDarkDev/ControlApplication/blob/main/VirtualServer.py">Flask API Server</a> in the terminal</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Type “VirtualServer.py”</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":6104} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image.png" alt="" class="wp-image-6104" /></figure>
<!-- /wp:image -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Next, Run <a href="https://github.com/ManDarkDev/ControlApplication/blob/main/ProofOfScript.py">Miner Control Script</a> (The “</strong><a href="https://github.com/ManDarkDev/ControlApplication/blob/main/Luxor%20Challenge.py"><strong>ProofOfScript.py</strong></a><strong>” File)</strong></h4>
<!-- /wp:heading -->

<!-- wp:image {"id":6108} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-1-3.png" alt="" class="wp-image-6108" /></figure>
<!-- /wp:image -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Afterward, you can<strong> Monitor and Test Output&nbsp;</strong></h4>
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong><em>Remember</em></strong>, you need  two separate terminals to run the <strong>Flask Server “VirtualServer.py”  </strong>and the <strong>“</strong><a href="https://github.com/ManDarkDev/ControlApplication/blob/main/Luxor%20Challenge.py"></a><strong><strong><a href="https://github.com/ManDarkDev/ControlApplication/blob/main/ProofOfScript.py">ProofOfScript.py</a></strong>” </strong>Application<strong> </strong></h4>
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>Flask Server (VirtualServer.py) Terminal</strong>: Logs API requests.</h4>
<!-- /wp:heading -->

<!-- wp:image {"id":6115} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-4-2.png" alt="" class="wp-image-6115" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">The<strong> Control Script (</strong><a href="https://github.com/ManDarkDev/ControlApplication/blob/main/Luxor%20Challenge.py"><strong></strong></a><strong><a href="https://github.com/ManDarkDev/ControlApplication/blob/main/Luxor%20Challenge.py"><strong>ProofOfScript</strong></a>.py</strong><strong>) Terminal</strong>: Logs mode changes.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":6113} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-4-1.png" alt="" class="wp-image-6113" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Use the <em><strong>import argparse</strong></em> to test your arguments within the script. This will allow you to adjust automation parameters and also will ensure the program works in real-time.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":6105,"width":"400px","height":"auto"} -->
<figure class="wp-block-image is-resized"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-1-1.png" alt="" class="wp-image-6105" style="width:400px;height:auto" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><strong>NOTE: </strong><strong>There are at least 4 different ways to test the application to make sure it’s running.&nbsp;</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><strong>Test the Login with </strong><strong>curl</strong><strong> (Command + Result shown below)</strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":6107} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-1-2.png" alt="" class="wp-image-6107" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><strong>Test the&nbsp;Logout with curl (Command + Result shown below)</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><strong>Test the Curtailment mode (“SleepMode”) with </strong><strong>curl </strong><strong>&nbsp;(Command + Result shown below)</strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":6112} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-4.png" alt="" class="wp-image-6112" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><strong>Test the Overclock with </strong><strong>curl </strong><strong>&nbsp;(Command + Result shown below)</strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":6111,"width":"457px","height":"auto"} -->
<figure class="wp-block-image is-resized"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-3.png" alt="" class="wp-image-6111" style="width:457px;height:auto" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">NOTE: Make sure you are <strong><em>LOGGED IN</em></strong><em> to the machine </em>using the curl Command and have the proper IP address, or your Overclock, Normal, Underclock, and Curtail tests will result in an error.(Pictured below)</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":6109} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-2.png" alt="" class="wp-image-6109" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong><em>TEST Server/Machine interaction IN REAL-TIME</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">To test all automated power controls<strong>(Overclock, Normal, Underclock, and Curtail)</strong> in real-time,&nbsp;</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">simply schedule the controls 1 minute apart during that time of day. In this example the automated control test started at 5:53 P.M. or <strong>17:53</strong> Military time</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":6110} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-2-1.png" alt="" class="wp-image-6110" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">The different commands will be listed in real time based off of the time you set in the script</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":6114} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/09/image-4-3.png" alt="" class="wp-image-6114" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"fontSize":"small"} -->
<p class="has-small-font-size"><a href="https://bitcoinversus.tech/"><strong><em><sup>BitcoinVersus.Tech</sup></em></strong></a><strong><em><sup> Editor's Note:</sup></em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"fontSize":"small"} -->
<p class="has-small-font-size"><strong><em><sup>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please </sup></em></strong><a href="https://www.gofundme.com/f/support-bitcoin-mining-data-centers-for-everyone"><strong><em><sup>donate here</sup></em></strong></a></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"fontSize":"small"} -->
<p class="has-small-font-size"><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes</em>.</p>
<!-- /wp:paragraph -->