---
title: "Linux File Permissions and Ownership​"
wordpress_post_id: 11007
source: BitcoinVersus.tech
published: 2025-03-15T18:23:57
modified: 2025-03-30T00:14:43
live_url: https://bitcoinversus.tech/2025/03/15/linux-file-permissions-and-ownership/
track: linux/tutorials
lesson_number: null
raw_source: linux-file-permissions-and-ownership-11007.gutenberg.html
---

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Linux file permissions are a fundamental aspect of system security and file management, dictating how users can interact with files and directories. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Each file or directory has an associated set of permissions that determine the actions permitted for the owner, the group, and others. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">These permissions are typically represented in a symbolic notation, such as <code>-rwxr-xr--</code>, where the first character indicates the type (e.g., <code>-</code> for a regular file, <code>d</code> for a directory), and the subsequent characters are divided into three triads representing the <a href="https://en.wikipedia.org/wiki/File-system_permissions">permissions</a> for the owner, group, and others, respectively. </p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=LnKoncbQBsM\u0026amp;pp=ygUWbGludXggZmlsZSBwZXJtaXNzaW9ucw%3D%3D","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=LnKoncbQBsM&amp;pp=ygUWbGludXggZmlsZSBwZXJtaXNzaW9ucw%3D%3D
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Within each triad, the characters <code>r</code>, <code>w</code>, and <code>x</code> denote read, write, and execute permissions, respectively, while a hyphen (<code>-</code>) signifies the absence of a permission. ​</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">To modify these permissions, the <code>chmod</code> command is commonly used. This command allows users to change the permissions of a file or directory using either symbolic or numeric (octal) notation. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">In numeric mode (octal notation), permissions are represented by a three-digit value, where each digit corresponds to the permissions for the owner, group, and others. </p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=4N4Q576i3zA\u0026amp;pp=ygUWbGludXggZmlsZSBwZXJtaXNzaW9ucw%3D%3D","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=4N4Q576i3zA&amp;pp=ygUWbGludXggZmlsZSBwZXJtaXNzaW9ucw%3D%3D
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Each permission is assigned a numeric value: read (<code>r</code>) is 4, write (<code>w</code>) is 2, and execute (<code>x</code>) is 1. By summing these values, one can determine the appropriate permission digit. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">For example, a permission set of <code>rwxr-xr--</code> <a href="https://www.redhat.com/en/blog/linux-file-permissions-explained">translates</a> to 755 in numeric notation, where the owner has read, write, and execute permissions (4+2+1=7), the group has read and execute permissions (4+1=5), and others have only read permission (4). </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">User roles in Linux are categorized into three distinct classes:​</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>User (u)</strong>: The owner of the file or directory.​</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Group (g)</strong>: A set of users who share the same group privileges.​</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Others (o)</strong>: All other users who are neither the owner nor part of the group.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Managing file ownership is crucial for maintaining proper access controls. The <code>chown</code> command is utilized to change the ownership of a file or directory, allowing administrators to assign a new owner and group to a file. </p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=BmVmJi5dR9c\u0026amp;pp=ygUWbGludXggZmlsZSBwZXJtaXNzaW9ucw%3D%3D","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=BmVmJi5dR9c&amp;pp=ygUWbGludXggZmlsZSBwZXJtaXNzaW9ucw%3D%3D
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">For example, <code>sudo chown user2:group2 filename</code> changes the owner to <code>user2</code> and the group to <code>group2</code>. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Similarly, the <code>chgrp</code> command specifically modifies the group ownership of a file or directory. Properly setting ownership ensures that only authorized users can access or modify sensitive files. ​<a href="https://www.stationx.net/linux-file-permissions-cheat-sheet/" target="_blank" rel="noreferrer noopener">StationX</a></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">Understanding and <a href="https://www.geeksforgeeks.org/set-file-permissions-linux/">correctly setting </a>file permissions and ownership are vital for system security and efficient collaboration among users. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}}} -->
<p style="text-transform:none">By leveraging commands like <code>chmod</code>, <code>chown</code>, and <code>chgrp</code>, administrators can finely tune access controls, ensuring that users have the appropriate permissions necessary for their roles while safeguarding critical system resources.​</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}},"fontSize":"small"} -->
<p class="has-small-font-size" style="text-transform:none"><a href="https://bitcoinversus.tech/"><strong><em><sup>BitcoinVersus.Tech</sup></em></strong></a><strong><em><sup> Editor's Note:</sup></em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"style":{"typography":{"textTransform":"none"}},"fontSize":"small"} -->
<p class="has-small-font-size" style="text-transform:none"><strong><em><sup>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please </sup></em></strong><a href="https://www.gofundme.com/f/support-bitcoin-mining-data-centers-for-everyone"><strong><em><sup>donate here</sup></em></strong></a></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"fontSize":"small"} -->
<p class="has-small-font-size">BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->