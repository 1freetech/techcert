---
title: "How to Build an Embedded System (Hardware Edition)"
wordpress_post_id: 7976
source: BitcoinVersus.tech
published: 2024-11-06T09:30:00
modified: 2026-09-11T13:45:02
live_url: https://bitcoinversus.tech/2024/11/06/how-to-build-an-embedded-system-hardware-edition/
track: firmware/tutorials
lesson_number: null
raw_source: how-to-build-an-embedded-system-hardware-edition-7976.gutenberg.html
---

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Building an embedded system for specialized applications like air coolant pods requires a tailored approach that combines <a href="https://bitcoinversus.tech/2024/08/15/how-to-replace-an-s19-kpro-120th-psu/">hardware assembly</a> and strategic component integration. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">This guide will walk you through the step-by-step process of constructing a custom embedded system using Rock Pi <a href="https://bitcoinversus.tech/2024/09/03/how-to-replace-a-bitmain-control-board-control-board-overview/">control boards</a>, an EMMC module for data storage, and an efficient power supply unit (PSU). </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">By following this method, you will learn how to prepare, assemble, and securely mount your components to create a robust system that supports effective <a href="https://bitcoinversus.tech/2023/11/22/expert-panel-debates-best-bitcoin-mining-cooling-methods-at-pacific-bitcoin-festival/">cooling management</a>.<em><strong><br></strong></em><strong><br></strong>1.<strong> </strong>First you need to ensure you have the correct material<br><br>- 3 rock pi’s (Control Boards)</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":7988} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/11/ad_4nxcve7gwhxnhopvqz179mlv7_jusnh0n_awdtjk4ycpvwgms6qpt4royiqixr6evnyf-lrnpjb_7jzyopoy8dfyymrebfu1th7ddpnhpsrrwymn8l-npfu0hfmmlphrjtz2bcm21dcrobnlgudtxqht5rrb1.png" alt="" class="wp-image-7988" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">- 1 EMMC (embedded MultiMediaCard)&nbsp; module</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdf4OdGGJ9PTsFpE6sfy3ccU4UgE_PCDWrTIcozrEeXBrm6Ojq0Fq6qj1jebqOBC57kybALyb0AbnaJoJotP7jyMfdJA6PogekFaY-W334gtyWLmHmFC-EPh0nFtrMLJwC2rbB_FAnZLoud0VeAX3zZET4?key=5Zs0luy2z5D5SXrkTP5tsA" width="114" height="151"><br>- Generic Rack (comes with screws)</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":7987} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/11/ad_4nxfx_s-_s7tl34-zk725k_hz-wz4yegqxrmnixqf7pfnhptzcveqou1vxk3jgr7pb8zrivuxyappo6nragnl0r7yjlq8pif2y3zd7rfah8errflry_41_wo7uqtabxwgfkcql5wsgtqhabiffi10hn9qwpo.jpg" alt="" class="wp-image-7987" /></figure>
<!-- /wp:image -->

<!-- wp:image {"id":7986} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/11/ad_4nxfl1kj7jxxksvtg5aeupvmkaabfpil_nxl_8atonvljes60r5_6atysi0mj_5iklqqlqytgl4mvyuycw2dausiu86wiygsfeic6ssjx75sxawsoifojxosqz-t4kccyajcywwdtbtw-l2xiakiij_voq507.jpg" alt="" class="wp-image-7986" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">- Miniature Phillips Head ScrewDriver</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfG2_rlTpYzD0DJ9HWzuq32spC5poVKTwM6uOy8EquSCuQGJHpnjmXktRKXXtdHSDCwxU5Ljsl9G_y08fQQyUci3ydjurB1f6KLl-Ib3A1wD4psAbQ-MnquV8FbqmfLMqQOhba6r_aqKYECi7VdEdv71KS4?key=5Zs0luy2z5D5SXrkTP5tsA" width="102" height="112"><br><br><br><br>- 400MM Zip Ties</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXet5mUGi0kFYn6H19STag9b7Ar63B35X_-vR-gPrIhwLtfP2I9U_Jt6rCYAhgzJpwH_yyeo5MIP2jl6vvr28TdwSgv8OoBfW76b9kt4gvm9iDa8TF1Qlwx_zO6-IDo5bhqWXx_h2VlQpH1VShxUknimBWMj?key=5Zs0luy2z5D5SXrkTP5tsA" width="83" height="119"><br><br>- At least 2 Nuts and 2&nbsp; Bolts from Server Rack OR compatible Nut and bolt that will fit on server Rack (Floating Square Black Cabinet Near PLC/PDU in container)<br><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcuotJ6KPlb9frAjJAQBif3K1Q2Zh_losh-HZDoBcf3YiabavDNV2YoQZKfxMPQDSbu96CcUwV6WLQDlErcPhwHQaRgPYvYRaYmUmEpTyJ9VzxnAWgtqow093EAHc1Oxtih0CawF9ozxaGzt8LBzPtOnKwJ?key=5Zs0luy2z5D5SXrkTP5tsA" width="133" height="179"></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>- Power Adapter (PSU)<br><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXckhzXQtu4lHs93thRmhHQJONpmg_sLlo4w-n0wzp2I-FceFLk7NW4g-HzHFLJyR9RcWceKAzxfN0Zfrfaapi1wN4gHe9MNnGttIHGcQSzyllaIRjl2NPkpnV8IBNxptqbsgT0lchPcjgr83Zq4TitpekJY?key=5Zs0luy2z5D5SXrkTP5tsA" width="126" height="157"></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Continue to the next page for further instruction.&nbsp;</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">2. Cut off a set of prongs on one end of the Generic Rack,. That is where you will be putting the PSU. To avoid damaging hardware, do this <strong><em>before</em></strong> you attach any devices to the rack.<br><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXclaHiTwn0rv2HnVL_EhlQAJ4PpbScHWMtxPtJrnO1yU_LWkJmznB-5B6QgveuTfGQO9oHL2RhdIuELJbpCToDGqt3L-pWcWhWJnTnlOCXFt9ajMKMkuUpTliEKiieQ8ZnQoaFYv3nEuy36Dg0FdT8d2rUL?key=5Zs0luy2z5D5SXrkTP5tsA" width="110" height="176"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXerZjrSYL73AdtU-1ci5gi3hviC_6KcESD0kpcCvqwfPRWcpvRnxsp2N9wemMdiLVLfPx1jz6NOiDiK1jvAT7rxZIGE34AAgcUg3LFJD3i3owTCOEUQ43hm-I8ZWVwo04G4ueZE7BudtgyfL-1PO7voH60m?key=5Zs0luy2z5D5SXrkTP5tsA" width="143" height="189"></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">3. Grab Rock Pi and assemble on the opposite end of the rack with screws from the generic rack.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcsZuBur2IGz2dvbhL7QvryD0oan0Sn9yYPksYQD54pr4mJfY_gIYYUNhsMMkdHehy4v5FmuSJB46yxaD4oRrbunvBRySce4xVfSIq2Y0noR5axSw_R5jdLsHHwh6tR0miMjJnHiaK5y5y_U9pBJzU8L7vE?key=5Zs0luy2z5D5SXrkTP5tsA" width="160" height="176"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXco1jZZWBYXEyeFWedjxdG-eC91n0CUutffoc6UiPCS1oX6Hbl8UPgOYrt8rGMQCSi_HQ3DoXs6LmuY3rJVTKY_wOLCQriVnnIAbvYizSAAekDN50Yo-qVxSwtEHmI0jDg02fFP3VrfPyRqX7r3M827-Pc?key=5Zs0luy2z5D5SXrkTP5tsA" width="143" height="176"><br><br>4. After Assembling all 3 Rock Pi’s, proceed to assemble the EMMC onto the Integrated circuit of the Rock Pi. This is located in the upper left hand corner of the control board. Simply snap the EMMC into place on the rock pi control board.&nbsp;<br><br><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfXOEu7qXcgHPABGNXiLzBLvO1KlsGRy7ymKU898szoedkeuJEfMzMa_0hvwxZts8BmKvHsDdbQ2i3b9UrOExZHefCzVq2npcuC5rCpvyLpjPTrSZ-KLsyDkc-MDrIitarJkhtyhPI7Eusx0mBmk9AJz1n9?key=5Zs0luy2z5D5SXrkTP5tsA" width="118" height="155"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcXZWpfangbdOcYBakNL1yDXNoh5Vk_EiIJu2Aqf_38zSaV8vjzX1SUfCALYEjCspiWTKlby-rbWSca0L443wW8WURf4HekByq8WchaZow_jWhZWi8lzRuppPX2mp1bvBINTq2IDUeAE-o3uDiDJTucQis?key=5Zs0luy2z5D5SXrkTP5tsA" width="90" height="159"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXccQIfXeWQnQ-GqoeKY7qSeI496WUDDPMvOBZA4IGjV7MxZa-DWvHYi5GQVf_x2BnVZRqU4jx9SIKmLK7IFxknZLGAnGY46ymk_84oVTQ9ngRQ7Gw7yhypDDBiTYCND0RxxDWCa5dp7HnwzS2aS3gaKZk_Z?key=5Zs0luy2z5D5SXrkTP5tsA" width="123" height="160"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdCqocc8ATRQTI2Qopoien_NGOxMNakPVFimg-B9qsGZEMqdPx_-Ubwe2_8d2tNqLied51JpnURc2D_b3DYGRHhklhy5Bw6pg99IbHaxlGqoHcB517nh-hjx9NFZ1_WBUF56e7GMLPjEgOOTZTbF6S6sY3N?key=5Zs0luy2z5D5SXrkTP5tsA" width="183" height="159"></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Continue to the next page for further instruction.&nbsp;</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">5A. After assembling the EMMC onto the Rock Pi, grab your PSU and your zip tie</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":7983} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/11/ad_4nxeowhinm1exp22ye-_1i0z64eqos6fia6puyaxsd5jl7yap4j8hw1d4szx_bsjlut0fdu20iz3ze6dtgtcs-xwntmwhoy2ui-fhnl45wzkaqf0yftsvnpzyyxucfxof4yosbks6bclj9wknvnjpejpqozg.jpg" alt="" class="wp-image-7983" /></figure>
<!-- /wp:image -->

<!-- wp:image {"id":7985} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/11/ad_4nxd_1wix8ugetvfoqzgzaz3ns3nwool9-yymfxozmb1egiqchwhv60slnwg93uh6fus9frtsnbni_-b4fdnrmbkvka_spy_8eimuvaw-3az2loy5wlvrbub40x6ul98el3jkef-tyepyv_ejihc_onqpdbg.jpg" alt="" class="wp-image-7985" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">5B. The standard and most convenient way to mount a PSU is to<br>Place the adapter on its side so that the USB ports are facing the rock pi control boards. You need at least 2 ties to reinforce the PSU onto the Generic Rack. </p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":7984} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/11/ad_4nxebzq76lvvedxdshmktawi5hmee1mxkglnfmapg7z_pajvehilzeakypcdr2uvbsqexlttmjenkq69oazrmbme-a0rqavjnj0byh3gypmlodi9ynvwhs0e1cmljiv_66vhzvxszmpxkr0ybusfi5pkhc_u8.jpg" alt="" class="wp-image-7984" /></figure>
<!-- /wp:image -->

<!-- wp:image {"id":7982} -->
<figure class="wp-block-image"><img src="https://bitcoinversus.tech/wp-content/uploads/2024/11/ad_4nxfol3njxzgp8ygw0_msra2qebumgvpcr58gyhitcgfp9wcq9xbi5mfqlgavcozy1bbotev0nh5jobbgn8xeidb8dcacgpv24pvuie3ga3vfoml-ckju2mxyrb1-mzd_ghou-yftwrukgdqanwbu6li3fc8.jpg" alt="" class="wp-image-7982" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">5C. Alternative PSU Mounting Method: To ensure PSU is stable on rack <strong>tie 3 zip ties vertically and 3 zip ties horizontally</strong> around the PSU. Make sure zip ties are not covering the socket for PSU. PSU should have its <strong>USB type C</strong> ports visible to plug in other cables/devices.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcgkV02WI7QGB68J2iIBORyhdcyXgO0rMZDuSM72E4ab7Qi-kjDBFSz8PTiW_sIQbYBat3RWmwZJbPOAvJFOvJvbwnaphkj3XC9_Ipl0-ti97PevL6Y0rnodhxzj3oT1YrELP1fGY7tqMpS6OHE2Vfo6CQW?key=5Zs0luy2z5D5SXrkTP5tsA" width="168" height="156"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd3M8oU_xr_ugXZatVc7Q3nn3Nq56r_v5If0eUO7T0u3LjcgIddwJUtcfaofiophx5EuKXK6PiRsO_kBaTZAKHzsVmmd6RSAbvYMj0tw_nIx6kqn9IRNVDDo-E6pIDQ-nkpYmneeeLnx8iKbazSXK0y1MFf?key=5Zs0luy2z5D5SXrkTP5tsA" width="121" height="151"><br>6. Once Finished this is how your Boron Bot should look. Great Job!</p>
<!-- /wp:paragraph -->

<!-- wp:image -->
<figure class="wp-block-image"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfPpJrnOFCim2RBCGiKiX-lLRX-Vs1vw1cmp53LnUlJuLKE6LZ8bhBn__ONsaL2wROjq6zoDSMfGgveuU3k42R75QYHvOeI0cJjmvtHy3DidkorFjEQxP-yDMYEORlkGoJ70E9Qa3kJoGL2glf9IXQy9q8?key=5Zs0luy2z5D5SXrkTP5tsA" alt="" /></figure>
<!-- /wp:image -->