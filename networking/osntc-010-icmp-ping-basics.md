---
title: "OSNTC.010: ICMP and Ping Basics"
status: published
wordpress_post_id: 20190
published: "2026-10-02T21:26:20"
live_url: "https://bitcoinversus.tech/2026/10/02/osntc-010-icmp-ping-basics/"
series: "Open-Source Networking Technician"
pathway: networking
lesson_number: "010"
featured_media_id: 20188
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osntc-010-icmp-ping-basics-cover-1200x630-1.png"
featured_image_dimensions: "1200x630"
youtube_1: "https://www.youtube.com/watch?v=cKPvR_MUHns"
youtube_2: "https://www.youtube.com/watch?v=2tI45h7QPh4"
youtube_3: "https://www.youtube.com/watch?v=p43bjduBf8I"
---

# OSNTC.010: ICMP and Ping Basics

Original published WordPress article content, preserved below in full:

<p class="has-large-font-size wp-block-paragraph"><strong>Ping answers one of the first questions in network troubleshooting: “Can I reach that device?”</strong></p>

<p class="wp-block-paragraph">When you run <code>ping</code>, your computer can send a small ICMP message called an <strong>Echo Request</strong>. If the target answers, it sends an <strong>Echo Reply</strong>.</p>

<p class="wp-block-paragraph">Think of it like calling out, “Are you there?” and hearing, “Yes, I’m here.”</p>

<h2 class="wp-block-heading">Start with one simple ping</h2>
<pre class="wp-block-code"><code>ping 8.8.8.8</code></pre>
<p class="wp-block-paragraph">This asks your computer to test reachability to the IP address <code>8.8.8.8</code>.</p>

<p class="wp-block-paragraph">A successful reply may show information such as:</p>
<pre class="wp-block-code"><code>Reply from 8.8.8.8: bytes=32 time=18ms TTL=117</code></pre>

<ul class="wp-block-list"><li><strong>Reply from:</strong> the target answered.</li><li><strong>time:</strong> roughly how long that request/reply took.</li><li><strong>TTL:</strong> a packet-lifetime value used by IP networks.</li></ul>

<h2 class="wp-block-heading">Video 1: Ping for basic troubleshooting</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/cKPvR_MUHns?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This focused lesson shows how ping uses ICMP Echo Requests and Echo Replies to test connectivity.</em></figcaption></figure>

<h2 class="wp-block-heading">What is ICMP?</h2>
<p class="wp-block-paragraph"><strong>ICMP</strong> stands for <strong>Internet Control Message Protocol</strong>.</p>
<p class="wp-block-paragraph">ICMP helps IP networks communicate useful control and error information. Ping is one familiar tool that uses ICMP.</p>

<p class="wp-block-paragraph">For this beginner lesson, remember this relationship:</p>
<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow"><p><strong>ping is the tool; ICMP carries the Echo Request and Echo Reply messages.</strong></p></blockquote>

<h2 class="wp-block-heading">The request and reply</h2>
<ol class="wp-block-list"><li>Computer A sends an <strong>ICMP Echo Request</strong>.</li><li>The network carries it toward Computer B.</li><li>If Computer B receives it and is allowed to answer, it sends an <strong>ICMP Echo Reply</strong>.</li><li>Computer A measures the result.</li></ol>

<h2 class="wp-block-heading">Video 2: ICMP explained</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/2tI45h7QPh4?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This beginner-friendly video explains ICMP, including diagnostic and error-reporting messages.</em></figcaption></figure>

<h2 class="wp-block-heading">A simple troubleshooting order</h2>
<p class="wp-block-paragraph">Suppose your computer cannot reach a website. Do not immediately assume “the internet is down.” Test one step at a time.</p>

<ol class="wp-block-list"><li><strong>Ping your own loopback address:</strong> <code>ping 127.0.0.1</code>.</li><li><strong>Ping your default gateway:</strong> this checks whether you can reach the local router.</li><li><strong>Ping a known outside IP address:</strong> this can test reachability beyond the local network.</li><li><strong>Ping a hostname:</strong> if an IP works but a name does not, DNS becomes an important thing to investigate.</li></ol>

<p class="wp-block-paragraph">This connects directly to earlier lessons on <a href="https://bitcoinversus.tech/2026/09/30/networking-lesson-003-default-gateway/">default gateways</a> and <a href="https://bitcoinversus.tech/2026/10/01/osntc-006-dns-basics/">DNS</a>.</p>

<h2 class="wp-block-heading">A failed ping does not always mean the device is down</h2>
<p class="wp-block-paragraph">This is important. Some devices or firewalls block ICMP Echo traffic. A server can therefore be running normally while refusing to answer ping.</p>

<p class="wp-block-paragraph">So a failed ping means:</p>
<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow"><p><strong>“I did not receive the expected ping reply.”</strong></p></blockquote>
<p class="wp-block-paragraph">It does <strong>not</strong> automatically prove:</p>
<ul class="wp-block-list"><li>the target is powered off,</li><li>the entire network is down, or</li><li>every application on the target has failed.</li></ul>

<h2 class="wp-block-heading">Video 3: ICMP, ping, and connectivity testing</h2>
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
<span class="embed-youtube" style="text-align:center; display: block;"><iframe loading="lazy" class="youtube-player" width="640" height="360" src="https://www.youtube.com/embed/p43bjduBf8I?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe></span>
</div><figcaption class="wp-element-caption"><em>This networking lesson connects ICMP and ping to practical connectivity testing.</em></figcaption></figure>

<h2 class="wp-block-heading">How ARP and ping fit together on a LAN</h2>
<p class="wp-block-paragraph">The previous lesson, <a href="https://bitcoinversus.tech/2026/10/02/osntc-009-arp-basics/">OSNTC.009: ARP Basics</a>, explained how an IPv4 device can learn the MAC address needed for local Ethernet delivery.</p>

<p class="wp-block-paragraph">Now imagine you ping another IPv4 device on the same LAN. Your computer may need ARP first so it knows the destination MAC address. Then it can place the IP/ICMP traffic inside Ethernet frames and send it across the local network.</p>

<p class="wp-block-paragraph">That gives you a useful beginner chain:</p>
<pre class="wp-block-code"><code>IP address
   ↓
ARP finds the local MAC address
   ↓
Ethernet carries the frame
   ↓
ICMP Echo Request
   ↓
ICMP Echo Reply</code></pre>

<h2 class="wp-block-heading">Simple data-center example</h2>
<p class="wp-block-paragraph">A technician connects a new server and cannot reach the management gateway. A quick ping to the gateway fails. That does not solve the problem by itself, but it gives the technician a starting point: check the local IP settings, subnet, VLAN, cable/link state, ARP behavior, and gateway path before blaming a remote service.</p>

<h2 class="wp-block-heading">Common beginner mistakes</h2>
<ul class="wp-block-list"><li>Thinking ping and ICMP are the same thing.</li><li>Assuming every device must answer ping.</li><li>Assuming one successful ping proves every application works.</li><li>Testing a hostname first and forgetting that DNS can fail separately from basic IP reachability.</li><li>Changing several network settings at once instead of testing one step at a time.</li></ul>

<h2 class="wp-block-heading">Quick practice</h2>
<ol class="wp-block-list"><li>Run <code>ping 127.0.0.1</code>.</li><li>Find your default gateway and ping it.</li><li>Ping one known IP address.</li><li>Ping one hostname.</li><li>Explain the difference between an ICMP Echo Request and an Echo Reply.</li><li>Explain why a failed ping does not always prove a device is offline.</li></ol>

<h2 class="wp-block-heading">Key takeaway</h2>
<p class="wp-block-paragraph"><strong>Ping is a basic reachability test that commonly uses ICMP Echo Request and Echo Reply messages.</strong> It is useful because it gives a technician a fast first test, but its result must be interpreted carefully. A reply proves useful IP communication occurred; no reply only tells you that the expected reply did not come back.</p>
