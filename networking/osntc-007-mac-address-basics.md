---
title: "OSNTC.007: MAC Address Basics"
status: publish
wordpress_post_id: 19949
published: "2026-10-02T00:37:19"
live_url: "https://bitcoinversus.tech/2026/10/02/osntc-007-mac-address-basics/"
series: "Open-Source Networking Technician Certification"
lesson_number: "007"
featured_media_id: 19950
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc-007-mac-address-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=TIiQiw7fpsU"
---

# OSNTC.007: MAC Address Basics

<p class="wp-block-paragraph">A <strong>MAC address</strong>, short for Media Access Control address, identifies a network interface on a local network. You will commonly see it written as six pairs of hexadecimal characters, such as <code>3C:52:82:1A:4F:90</code>.</p>
<p class="wp-block-paragraph">In <a href="https://bitcoinversus.tech/2026/09/27/open-source-networking-lesson-1-ip-address/">OSNTC.001</a>, you learned that an IP address identifies where a device communicates on an IP network. A MAC address serves a different job at the local Ethernet/Wi-Fi link layer. The simple technician idea is: <strong>IP addresses help traffic reach networks and hosts; MAC addresses help local network interfaces exchange frames.</strong></p>
<h2 class="wp-block-heading">What a MAC Address Looks Like</h2>
<pre class="wp-block-code"><code>3C:52:82:1A:4F:90</code></pre>
<p class="wp-block-paragraph">A traditional MAC address contains 48 bits, usually displayed as 12 hexadecimal digits. Depending on the operating system or tool, separators may appear as colons, hyphens, or periods.</p>
<h2 class="wp-block-heading">MAC Address vs. IP Address</h2>
<ul class="wp-block-list"><li><strong>MAC address:</strong> identifies a network interface for local link-layer communication.</li><li><strong>IP address:</strong> provides logical addressing used to communicate across IP networks.</li></ul>
<p class="wp-block-paragraph">A laptop can keep the same network interface while receiving a different IP address from DHCP. That is one reason technicians should know how to distinguish the two identifiers.</p>
<h2 class="wp-block-heading">Video: MAC Address Explained</h2>
<p class="wp-block-paragraph">PowerCert Animated Videos provides a visual beginner explanation of MAC addresses and the difference between MAC and IP addressing.</p>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/TIiQiw7fpsU?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>PowerCert Animated Videos explains MAC addressing and how it differs from IP addressing.</em></figcaption></figure>
<h2 class="wp-block-heading">How a Switch Uses MAC Addresses</h2>
<p class="wp-block-paragraph">An Ethernet switch learns which source MAC addresses appear on its ports. It builds a MAC address table so it can forward frames toward the appropriate port instead of treating every destination the same way.</p>
<h2 class="wp-block-heading">Simple Example</h2>
<p class="wp-block-paragraph">Imagine a PC and printer connected to the same switch. The switch can learn which port leads to the PC&#8217;s MAC address and which port leads to the printer&#8217;s MAC address. That local information helps it forward Ethernet frames between the devices.</p>
<h2 class="wp-block-heading">Data Center Example</h2>
<p class="wp-block-paragraph">During rack-and-stack work, a technician may compare a server&#8217;s documented MAC address with the address learned on a switch port. If the expected address appears on the wrong port, that can point to a cabling or documentation problem.</p>
<h2 class="wp-block-heading">Bitcoin Mining Example</h2>
<p class="wp-block-paragraph">A miner control board connected to Ethernet has a network interface with a MAC address. A technician can use the switch&#8217;s learned MAC information alongside IP and DHCP information to help identify which physical switch port reaches a particular miner.</p>
<h2 class="wp-block-heading">MAC Addresses Can Change</h2>
<p class="wp-block-paragraph">Do not assume a MAC address is a permanent personal identity. Modern operating systems can use randomized or locally administered MAC addresses, especially on Wi-Fi. Virtual machines and software-defined interfaces can also use assigned virtual MAC addresses.</p>
<h2 class="wp-block-heading">Practice</h2>
<ol class="wp-block-list"><li>What does MAC stand for?</li><li>How many hexadecimal digits are normally displayed in a 48-bit MAC address?</li><li>Explain one difference between a MAC address and an IP address.</li><li>What does an Ethernet switch learn from source MAC addresses?</li><li>Why might a technician compare a switch-port MAC table with device documentation?</li><li>Why should you not assume every MAC address is permanently fixed?</li></ol>
<h2 class="wp-block-heading">Key Takeaway</h2>
<p class="wp-block-paragraph">MAC addresses identify network interfaces for local link-layer communication. Ethernet switches learn MAC addresses on their ports, while IP addresses handle logical network addressing. Knowing both gives a technician a clearer path from a device&#8217;s network identity to its physical switch connection.</p>
