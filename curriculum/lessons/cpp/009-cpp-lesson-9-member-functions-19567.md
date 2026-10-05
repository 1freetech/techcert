---
title: "OSC++.009: Member Functions"
wordpress_post_id: 19567
source: BitcoinVersus.tech
published: 2026-09-30T11:16:38
modified: 2026-09-30T20:09:06
live_url: https://bitcoinversus.tech/2026/09/30/cpp-lesson-9-member-functions/
track: cpp
lesson_number: 9
raw_source: 009-cpp-lesson-9-member-functions-19567.gutenberg.html
---

<!-- wp:paragraph --><p>A <strong>member function</strong> is a function that belongs to a class. It lets an object perform an action using the data stored inside that object.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Start With a Game Score</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>In Lesson 8, we used classes to group related data. Now we can give a class an action.</p><!-- /wp:paragraph -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;

class Player {
public:
    int score;

    void showScore() {
        std::cout &lt;&lt; "Score: " &lt;&lt; score &lt;&lt; "\n";
    }
};

int main() {
    Player hero;
    hero.score = 100;
    hero.showScore();

    return 0;
}</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p><code>showScore()</code> is a member function because it is defined inside the <code>Player</code> class. The <code>hero</code> object calls it with <code>hero.showScore()</code>.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Data and Actions Together</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><code>score</code> is data stored by the object.</li><li><code>showScore()</code> is an action the object can perform.</li><li>The dot operator connects the object to its member: <code>hero.showScore()</code>.</li></ul><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Bitcoin Mining Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>#include &lt;iostream&gt;

class Miner {
public:
    bool running;

    void showStatus() {
        if (running) {
            std::cout &lt;&lt; "Miner is on\n";
        } else {
            std::cout &lt;&lt; "Miner is off\n";
        }
    }
};</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>The new programming idea is still the same: <code>showStatus()</code> belongs to <code>Miner</code>, so a <code>Miner</code> object can use that function to report its simple on/off state.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Sports Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>class Team {
public:
    int points;

    void addPoint() {
        points = points + 1;
    }
};</code></pre><!-- /wp:code -->
<!-- wp:paragraph --><p>If a <code>Team</code> object calls <code>addPoint()</code>, its own points increase by one. The action and the data it changes stay together in the same class.</p><!-- /wp:paragraph -->
<!-- wp:heading --><h2 class="wp-block-heading">Video Reference</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The freeCodeCamp C++ beginner course includes a dedicated Object Functions section that demonstrates functions attached to C++ objects. The embedded video begins near that part of the course.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vLnPwxZdW4Y\u0026amp;t=12881s","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vLnPwxZdW4Y&amp;t=12881s
</div></figure><!-- /wp:embed -->
<!-- wp:heading --><h2 class="wp-block-heading">Practice</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a class named <code>Game</code>.</li><li>Add an integer named <code>lives</code>.</li><li>Add a member function named <code>showLives()</code>.</li><li>Create one <code>Game</code> object and set <code>lives</code> to 3.</li><li>Call <code>showLives()</code> with the object.</li></ol><!-- /wp:list -->
<!-- wp:heading --><h2 class="wp-block-heading">Key Takeaway</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A member function is an action that belongs to a class. An object uses the dot operator to call that action. This keeps related data and behavior together.</p><!-- /wp:paragraph -->