<!-- wp:paragraph -->
<p>You type a website address into a browser, press Enter, and a page appears a moment later. Behind that simple action, your computer may perform a <a href="https://bitcoinversus.tech/2026/10/01/osntc-006-dns-basics/">DNS lookup</a>, find an <a href="https://bitcoinversus.tech/2026/09/27/open-source-networking-lesson-1-ip-address/">IP address</a>, send data through a <a href="https://bitcoinversus.tech/2026/10/03/osntc-013-router-basics/">router</a>, create a transport connection, negotiate encryption, send an <a href="https://bitcoinversus.tech/2025/05/01/https-vs-http/">HTTP or HTTPS</a> request, receive files, and render those files into the page you see.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The easiest mental model is: <strong>name → address → connection → secure request → response → rendered page.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">1. The Browser Reads the URL</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A web address such as <code>https://example.com/news</code> contains several pieces of information. <code>https</code> tells the browser which application protocol and security scheme to use, <code>example.com</code> identifies the host name, and <code>/news</code> identifies a resource or path on that server.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The browser may already have some information cached from an earlier visit. If not, it needs to find the network address of the server before it can contact it.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">2. DNS Turns the Name Into an IP Address</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Computers route traffic using network addresses, not just human-friendly domain names. The <a href="https://bitcoinversus.tech/2026/10/01/osntc-006-dns-basics/">Domain Name System</a> translates a name such as <code>example.com</code> into an <a href="https://bitcoinversus.tech/2026/09/27/open-source-networking-lesson-1-ip-address/">IP address</a> that the network can use.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The answer may come from a local DNS cache, your operating system, a resolver provided by your network, or another recursive DNS service. Large websites may return different addresses depending on geography, load balancing, content delivery, and whether the client uses <a href="https://bitcoinversus.tech/2025/04/25/ipv4-vs-ipv6/">IPv4 or IPv6</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">3. Your Computer Sends Traffic Toward the Server</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Once the destination address is known, the <a href="https://bitcoinversus.tech/2026/10/06/ositc-001-it-systems-fundamentals-hardware-operating-systems-networks-troubleshooting/">operating system</a> checks its routing information. Traffic destined outside the local network normally goes toward the <a href="https://bitcoinversus.tech/2026/09/30/networking-lesson-003-default-gateway/">default gateway</a>, usually a <a href="https://bitcoinversus.tech/2026/10/03/osntc-013-router-basics/">router</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Your <a href="https://bitcoinversus.tech/2026/10/03/osntc-011-network-interface-card-nic-basics/">network interface card</a> sends the local traffic over Ethernet or Wi-Fi. On an Ethernet network, data travels in <a href="https://bitcoinversus.tech/2026/10/02/osntc-008-ethernet-frame-basics/">Ethernet frames</a>; the system may use <a href="https://bitcoinversus.tech/2026/10/02/osntc-009-arp-basics/">ARP</a> or IPv6 neighbor discovery to identify the correct local next-hop hardware address.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>On many home and office networks, the router also performs <a href="https://bitcoinversus.tech/2026/10/05/osntc-015-nat-pat-basics-private-addresses-port-translation-state-tables-troubleshooting/">NAT or PAT</a>, translating private local addressing into the public-facing connection used on the internet.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">4. A Transport Connection Is Established</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>For traditional HTTP/1.1 and HTTP/2 over HTTPS, the browser normally establishes a <a href="https://bitcoinversus.tech/2026/10/04/osntc-014-tcp-udp-transport-basics/">TCP</a> connection to the server. TCP uses a three-way handshake to establish a reliable session before application data is exchanged.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>HTTPS commonly uses destination <a href="https://bitcoinversus.tech/2025/03/08/understanding-network-ports-and-their-importance-in-the-it-industry/">port 443</a>. HTTP/3 works differently: it runs over QUIC, which uses <a href="https://bitcoinversus.tech/2026/10/04/osntc-014-tcp-udp-transport-basics/">UDP</a> rather than TCP. That is why “the browser always opens TCP first” is a useful beginner model, but not universally true on the modern web.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">5. HTTPS Adds TLS Encryption</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>If the URL uses <a href="https://bitcoinversus.tech/2025/05/01/https-vs-http/">HTTPS</a>, the browser and server establish an encrypted session using TLS. During this process, the server presents a digital certificate, the browser verifies that certificate against trusted certificate authorities, and both sides establish cryptographic keys for protecting the connection.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This prevents ordinary network observers from simply reading the page request and response as plaintext. The same certificate ecosystem is why changes to web cryptography, including the move toward post-quantum systems, matter to browsers, servers, and infrastructure providers; BitcoinVersus recently covered <a href="https://bitcoinversus.tech/2026/10/03/cloudflare-public-ca-post-quantum-merkle-tree-certificates/">Cloudflare’s work on a public certificate authority for the post-quantum web</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">6. The Browser Sends an HTTP Request</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After the connection is ready, the browser sends an <a href="https://bitcoinversus.tech/2025/05/01/https-vs-http/">HTTP request</a>. A simple page load commonly begins with a <code>GET</code> request for a resource. The request can also contain headers describing the host, accepted content formats, cookies, caching information, and other context.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The request reaches a web server, reverse proxy, load balancer, content-delivery system, application server, or some combination of those systems. BitcoinVersus’ overview of <a href="https://bitcoinversus.tech/2025/03/25/summarizing-services-provided-by-networked-hosts/">services provided by networked hosts</a> covers the larger idea: one networked machine can expose different services depending on the software and ports listening for traffic.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">7. The Server Sends a Response</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The server processes the request and sends an HTTP response. A successful request often includes a status such as <code>200 OK</code>, response headers, and the requested content. Other familiar responses include redirects, authentication failures, missing-page errors, and server errors.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The data does not travel across the internet as one giant object. It is divided into smaller units and carried through the networking stack. Tools such as packet analyzers can inspect this traffic, which is why our <a href="https://bitcoinversus.tech/2026/09/29/packet-capture-explained-how-network-engineers-inspect-traffic-and-troubleshoot-networks/">packet capture explainer</a> is useful when learning what these exchanges actually look like on a network.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">8. The Browser Builds the Page</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The first response is often an HTML document. The browser parses that HTML and may discover additional resources such as CSS stylesheets, JavaScript files, fonts, images, video, and data from APIs. Each additional hostname may require its own DNS work and additional connections, although modern browsers aggressively reuse connections and caches when possible.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Mozilla’s MDN documentation describes this process in detail: the browser resolves DNS, establishes the network connection, negotiates TLS for HTTPS, sends HTTP requests, receives responses, and then parses and renders the returned resources into the page the user sees.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Two useful external references are MDN’s <a href="https://developer.mozilla.org/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_the_web_works">How the Web Works</a> guide and its deeper <a href="https://developer.mozilla.org/en-US/docs/Web/Performance/Guides/How_browsers_work">How Browsers Work</a> performance guide.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vvpCnjyjTuU","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vvpCnjyjTuU
</div><figcaption class="wp-element-caption"><em>Scott Hanselman walks through what happens after you type a URL, including DNS, TCP/IP, HTTPS, certificates, web servers, load balancers, and HTTP responses.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">The Operating System and Drivers Are Working Underneath It All</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The browser does not directly manipulate the Ethernet controller or Wi-Fi radio by itself. The <a href="https://bitcoinversus.tech/2026/10/06/ositc-001-it-systems-fundamentals-hardware-operating-systems-networks-troubleshooting/">operating system</a>, its networking stack, and the appropriate <a href="https://bitcoinversus.tech/2026/10/06/easy-tech-read-what-is-a-device-driver-how-hardware-talks-to-the-operating-system/">device driver</a> connect browser software to the actual <a href="https://bitcoinversus.tech/2026/10/03/osntc-011-network-interface-card-nic-basics/">network hardware</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>That connection between software layers and physical hardware is one reason a seemingly simple page load crosses so many parts of a computer: browser, operating system, driver, NIC, local network, router, internet routing, remote server, and then the same chain back again.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">The Simple Mental Model</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>URL → DNS → IP address → router/internet → TCP or QUIC → TLS → HTTP request → web server → HTTP response → browser rendering.</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Real websites can add caches, CDNs, proxies, load balancers, multiple servers, reused connections, HTTP/3, and many other optimizations. But the core idea stays the same: your browser has to find the destination, establish communication, request the resource, receive the response, and turn the returned files into something you can see and use.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">BitcoinVersus.Tech</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Advertisement</strong></p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure>
<!-- /wp:embed -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading" style="font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,'Liberation Mono','Courier New',monospace">Editor’s Note</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>BitcoinVersus.Tech publishes technical explainers and reporting for informational and educational purposes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>BitcoinVersus.tech is not a financial advisor. Content is provided for informational purposes.</p>
<!-- /wp:paragraph -->