---
title: "OSPython.027: HTTP Requests and REST APIs — GET, POST, Parameters, Headers, JSON, Status Codes, Timeouts, and Errors"
wordpress_post_id: 21419
source: BitcoinVersus.tech
published: 2026-10-06T20:59:13
modified: 2026-10-06T20:59:13
live_url: https://bitcoinversus.tech/2026/10/06/ospython-027-http-requests-rest-apis-get-post-parameters-headers-json-status-codes-timeouts-errors/
track: python
lesson_number: 27
raw_source: 027-ospython-027-http-requests-rest-apis-get-post-parameters-headers-json-status-codes-timeouts-errors-21419.gutenberg.html
---

<!-- wp:heading --><h2 class="wp-block-heading">Elementary Overview</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A <a href="https://bitcoinversus.tech/2026/04/29/full-stack-training-rest-api/"><strong>REST API</strong></a> is a controlled way for one program to ask another program for data or to request an action over <a href="https://bitcoinversus.tech/2025/05/01/https-vs-http/"><strong>HTTP or HTTPS</strong></a>. In Python, the third-party <strong>Requests</strong> library gives programs a simple client interface for sending those requests and reading the responses. A request normally contains a method such as GET or POST, a URL, optional parameters, headers, and sometimes a body. The server answers with a status code, headers, and often <a href="https://bitcoinversus.tech/2026/10/06/ospython-026-json-serialization-deserialization-strings-files-apis-validation/"><strong>JSON</strong></a>. The important idea is that Python is not “calling a website” in a magical way; it is constructing a structured network message, waiting for the server’s structured response, and deciding what to do next.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=hlsxmp9kc0o","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=hlsxmp9kc0o
</div><figcaption class="wp-element-caption"><em>Tiny Technical Tutorials — beginner guide to REST APIs, HTTP methods, resources, requests, and responses.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">GET Requests Read Resources and Query Parameters Refine the Request</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>GET</strong> is commonly used when a client wants to read a resource without intentionally changing server state. With Requests, <code>requests.get()</code> sends the request and returns a <code>Response</code> object. Query parameters should normally be supplied through the <code>params</code> argument instead of manually concatenating a long URL because Requests handles URL encoding and produces a clearer program. The response exposes values such as <code>status_code</code>, <code>headers</code>, <code>text</code>, and <code>json()</code>. That last method connects directly to <a href="https://bitcoinversus.tech/2026/10/06/ospython-026-json-serialization-deserialization-strings-files-apis-validation/">OSPython.026</a>: an API may transport JSON text across the network, and Python then deserializes that JSON into dictionaries, lists, strings, numbers, booleans, and null-equivalent values.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=tb8gHvYlCFs","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=tb8gHvYlCFs
</div><figcaption class="wp-element-caption"><em>Corey Schafer — Python Requests tutorial covering GET requests, JSON responses, form data, authentication, and HTTP interactions.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:code --><pre class="wp-block-code"><code>import requests

url = "https://api.example.com/v1/devices"
params = {"site": "west", "limit": 5}
response = requests.get(url, params=params, timeout=10)
data = response.json()</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">POST Requests Send Data; JSON, Headers, and Authentication Describe It</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>POST</strong> is commonly used when the client sends new data or requests a server-side action. Requests can serialize a Python dictionary as JSON by using the <code>json=</code> argument, which also sets the appropriate JSON content type. <strong>HTTP headers</strong> carry metadata such as accepted formats, content type, user agent, authorization, and request tracing information. Authentication tokens should be handled as secrets rather than written directly into source code; BitcoinVersus.Tech’s guide on <a href="https://bitcoinversus.tech/2026/09/22/protect-sso-api-tokens-from-theft/"><strong>protecting API tokens</strong></a> explains why exposed credentials are dangerous. A client should also distinguish between query parameters, which help identify or filter a resource, and a request body, which carries the data being submitted.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=ES82kgVf7-4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=ES82kgVf7-4
</div><figcaption class="wp-element-caption"><em>Tech With Rathan — Python Requests covering GET, POST, headers, query parameters, timeouts, and error handling.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:code --><pre class="wp-block-code"><code>payload = {"hostname": "edge-01", "enabled": True}
headers = {"Authorization": f"Bearer {token}"}
response = requests.post(
    "https://api.example.com/v1/devices",
    json=payload,
    headers=headers,
    timeout=10,
)</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Status Codes, Exceptions, and Timeouts Turn Network Failure Into Program Logic</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>An HTTP response can arrive successfully at the network level and still report an application failure. <strong>2xx</strong> status codes generally indicate success, <strong>4xx</strong> codes identify a client-side problem such as an invalid request or missing authorization, and <strong>5xx</strong> codes identify a server-side failure. Requests provides <code>raise_for_status()</code> to convert unsuccessful HTTP status codes into exceptions, while timeout settings prevent a program from waiting indefinitely for a slow or unreachable service. Production code should distinguish a timeout from a connection error, an HTTP error, and invalid response data because each failure has a different recovery path. A retry may make sense for a temporary timeout or some 5xx responses, but blindly retrying an invalid 400 request only repeats the mistake.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Mw8K_QkoUUg","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Mw8K_QkoUUg
</div><figcaption class="wp-element-caption"><em>Automation Helpers — Requests error handling, raise_for_status(), response codes, and timeout usage.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:code --><pre class="wp-block-code"><code>try:
    response = requests.get(url, timeout=5)
    response.raise_for_status()
    data = response.json()
except requests.exceptions.Timeout:
    print("Request timed out")
except requests.exceptions.RequestException as exc:
    print(f"HTTP request failed: {exc}")</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Requests Is Convenient, but the Standard Library Still Defines the Boundary</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Python also includes <code>urllib.request</code> for opening URLs and building HTTP requests without an external dependency. The Python documentation describes <code>urllib.request</code> as the standard-library URL interface and points to Requests as a higher-level HTTP client. The engineering choice therefore depends on the environment: Requests is usually clearer for application code, while <code>urllib.request</code> can be useful when third-party packages are unavailable or undesirable. In either case, the same boundary concepts remain: method, URL, headers, body, timeout, response status, response headers, and response data. A good client validates assumptions at that boundary instead of trusting that every server will always return the expected status, content type, or JSON shape.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=cGMJp744rb8","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=cGMJp744rb8
</div><figcaption class="wp-element-caption"><em>Coding with Nirmala — practical Python API tutorial covering Requests, GET/POST, JSON parsing, and error handling.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Technician / Developer Workflow</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Read the API documentation and identify the endpoint, method, authentication, parameters, and expected response.</li><li>Use HTTPS when the service supports it, especially when credentials or private data are involved.</li><li>Keep API tokens outside source code using an appropriate secret-management or environment-variable method.</li><li>Pass query parameters with <code>params=</code> and JSON bodies with <code>json=</code>.</li><li>Set an explicit timeout for network requests.</li><li>Check the response status before trusting the body.</li><li>Use <code>raise_for_status()</code> or equivalent explicit status handling.</li><li>Validate the response content type and expected JSON structure.</li><li>Log enough request/response metadata to troubleshoot failures without logging secrets.</li><li>Retry only failures that are actually safe to retry.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Worked Example: Read Five Devices</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>Endpoint:</strong> <code>GET /v1/devices</code></li><li><strong>Query:</strong> <code>?site=west&amp;limit=5</code></li><li><strong>Expected status:</strong> <code>200 OK</code></li><li><strong>Expected body:</strong> JSON list of device objects</li><li><strong>Timeout:</strong> 10 seconds</li><li><strong>Failure handling:</strong> timeout → report network delay; 401/403 → check credentials; 404 → check endpoint; 5xx → treat as server/service failure.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Write a GET request with two query parameters and a 5-second timeout.</li><li>Write a POST request that sends a Python dictionary as JSON.</li><li>Explain the difference between request headers and a JSON request body.</li><li>Explain why a 404 response is different from a connection timeout.</li><li>Modify a request so an API token comes from an environment variable instead of the source file.</li><li>List two failures that may be reasonable to retry and two failures that normally should not be retried unchanged.</li><li>Compare <code>requests.get()</code> with <code>urllib.request.urlopen()</code> at a conceptual level.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge Check + Answers</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>What does GET normally do?</strong> Reads or retrieves a resource without intentionally changing server state.</li><li><strong>What does <code>params=</code> do in Requests?</strong> Encodes query-string parameters into the URL.</li><li><strong>What does <code>json=</code> do?</strong> Serializes a Python value as a JSON request body and applies the JSON content type.</li><li><strong>What does a 2xx status generally mean?</strong> The server reports that the request succeeded.</li><li><strong>What does a 4xx status generally mean?</strong> The request has a client-side problem such as bad input, authentication, authorization, or a missing resource.</li><li><strong>Why set a timeout?</strong> To prevent a client from waiting indefinitely for a network operation.</li><li><strong>What does <code>raise_for_status()</code> do?</strong> Raises an HTTP-related exception for unsuccessful HTTP status codes.</li><li><strong>Why validate JSON after a successful status?</strong> A successful HTTP response does not guarantee the body has the exact structure the program expects.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Reference Resources</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><a href="https://requests.readthedocs.io/en/latest/">Requests documentation</a></li><li><a href="https://docs.python.org/3/library/urllib.request.html">Python — urllib.request documentation</a></li><li><a href="https://docs.python.org/3/library/http.html">Python — HTTP status-code documentation</a></li><li><a href="https://bitcoinversus.tech/2025/01/23/how-to-set-up-a-flask-api-server-for-application-control/">BitcoinVersus.Tech — Flask API Server for Application Controls</a></li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Elementary Conclusion</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>An API request is like a very precise question sent from one computer program to another. The URL says where the question goes, GET or POST says what kind of action is being requested, parameters and JSON carry the details, headers carry instructions and identity information, and the status code tells whether the server accepted the request. Python’s Requests library packages those pieces into a convenient interface, but the programmer still has to check the answer. Good API code sets a timeout, protects credentials, checks the status, validates the returned data, and handles failure deliberately. Once those habits are understood, the same pattern can connect Python to monitoring systems, cloud services, databases, automation platforms, AI services, mining infrastructure, and thousands of other web-connected tools.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=-rNAHhgUHdY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=-rNAHhgUHdY
</div><figcaption class="wp-element-caption"><em>Munawar Munir Coding Guru — REST API overview covering endpoints, HTTP methods, JSON responses, status codes, and practical API flows.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->