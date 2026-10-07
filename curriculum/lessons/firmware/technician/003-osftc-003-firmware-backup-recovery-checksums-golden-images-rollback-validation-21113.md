---
title: "OSFTC.003: Firmware Backup and Recovery — Checksums, Golden Images, Rollback, and Validation"
wordpress_post_id: 21113
source: BitcoinVersus.tech
published: 2026-10-05T21:35:39
modified: 2026-10-05T21:44:26
live_url: https://bitcoinversus.tech/2026/10/05/osftc-003-firmware-backup-recovery-checksums-golden-images-rollback-validation/
track: firmware/technician
lesson_number: 3
raw_source: 003-osftc-003-firmware-backup-recovery-checksums-golden-images-rollback-validation-21113.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Firmware backup and recovery is the controlled process of preserving a known-good device state before change, proving that firmware files are intact, and restoring operation when an update fails.</strong> A successful technician workflow protects both executable firmware and the configuration data required for the device to return to service.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=owPdKRQhMzk","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=owPdKRQhMzk
</div><figcaption class="wp-element-caption"><em>Memfault — Device Firmware Update Best Practices. Explains image packaging, recovery planning, bootloader/application coordination, and avoiding device bricking.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:paragraph --><p><strong>OSFTC.003</strong> follows <a href="https://bitcoinversus.tech/2026/10/05/osftc-002-serial-console-boot-logs-uart-baud-rate-pinouts-capture-recovery/"><strong>OSFTC.002: Serial Console and Boot Logs — UART, Baud Rate, Pinouts, Capture, and Recovery</strong></a> and <a href="https://bitcoinversus.tech/2026/10/04/osftc-001-firmware-images-safe-flashing-bootloaders-recovery-basics/"><strong>OSFTC.001: Firmware Images, Safe Flashing, Bootloaders, and Recovery Basics</strong></a>. The engineer-level companion topic is <a href="https://bitcoinversus.tech/2026/10/05/osfec-002-real-time-firmware-scheduling-superloops-rtos-tasks-priorities-preemption-timing/"><strong>OSFEC.002: Real-Time Firmware Scheduling</strong></a>, which addresses runtime behavior after the image has booted.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=nmTRWR9b1AY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=nmTRWR9b1AY
</div><figcaption class="wp-element-caption"><em>Nordic Semiconductor — Adding Device Firmware Update (DFU/FOTA) Support in nRF Connect SDK. Covers bootloaders, image verification, dual slots, swapping, and update workflows.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Separate firmware-image backup from configuration and calibration backup.</li><li>Create and label a known-good recovery package before flashing.</li><li>Use SHA-256 and other integrity checks to detect changed or corrupted files.</li><li>Explain the difference between checksums, hashes, and digital signatures.</li><li>Understand A/B or primary/secondary firmware slots and rollback behavior.</li><li>Recognize anti-rollback controls that intentionally block old firmware.</li><li>Validate a restored device with version, boot-log, configuration, and functional evidence.</li><li>Preserve enough evidence for another technician to reproduce the recovery.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Back up the complete device state</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A firmware image is only one part of device state. Configuration files, calibration values, bootloader settings, partition metadata, certificates, device identity, and persistent application data may live in separate storage regions and may require separate export procedures.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=WY1hQzMh6wo","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=WY1hQzMh6wo
</div><figcaption class="wp-element-caption"><em>STMicroelectronics — Programming STM32 MCUs using STM32CubeProgrammer: Part 1. Demonstrates reading, programming, erasing, and verifying microcontroller memory.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Backup item</th><th>Why it matters</th><th>Typical evidence</th></tr></thead><tbody><tr><td>Application firmware</td><td>Provides executable recovery image</td><td>Binary/HEX/ELF plus version and hash</td></tr><tr><td>Bootloader</td><td>May control image selection and recovery</td><td>Vendor package or approved readback</td></tr><tr><td>Configuration</td><td>Restores network, feature, and site settings</td><td>Exported configuration file</td></tr><tr><td>Calibration</td><td>May be unique to hardware</td><td>Calibration export or protected service record</td></tr><tr><td>Certificates / identity</td><td>May be required for authentication</td><td>Approved credential backup or enrollment record</td></tr><tr><td>Partition / slot state</td><td>Explains active and fallback image selection</td><td>Bootloader or management-tool output</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">Create a golden recovery package</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A <strong>golden image</strong> is a tested firmware version kept as a recovery reference. A useful recovery package records the exact hardware revision, firmware version, build identifier, configuration revision, file hashes, required programmer version, and the approved restore procedure.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=tMrg11N5TrU","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=tMrg11N5TrU
</div><figcaption class="wp-element-caption"><em>Memfault — OTA Updates &amp; Management. Demonstrates controlled firmware deployment and management of update artifacts.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:list --><ul class="wp-block-list"><li>Device model and hardware revision</li><li>Serial number or asset identifier when allowed</li><li>Current firmware and bootloader versions</li><li>Configuration export</li><li>Recovery firmware file</li><li>SHA-256 digest for every saved artifact</li><li>Programmer/tool version</li><li>Connection method: SWD, JTAG, USB DFU, UART, vendor recovery, or OTA</li><li>Known-good boot log</li><li>Functional validation checklist</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Verify firmware files before use</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A checksum or cryptographic hash is a compact value calculated from a file. If one byte changes, the calculated value will usually change, which makes hashes useful for detecting incomplete downloads, wrong files, storage corruption, and accidental modification.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=DMtFhACPnTY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=DMtFhACPnTY
</div><figcaption class="wp-element-caption"><em>Computerphile — SHA: Secure Hashing Algorithm. Explains how file contents produce a hash value and why altered data changes the result.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code"><code># Linux
sha256sum firmware.bin

# macOS
shasum -a 256 firmware.bin

# OpenSSL
openssl dgst -sha256 firmware.bin

# Windows PowerShell
Get-FileHash .\firmware.bin -Algorithm SHA256

# Windows Command Prompt
certutil -hashfile firmware.bin SHA256</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Checksum, hash, and signature are not the same</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A CRC or simple checksum is designed mainly to detect corruption. A cryptographic hash such as SHA-256 provides a stronger fingerprint of the data, while a digital signature adds authentication by proving that the image was signed by a trusted private key.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=nmTRWR9b1AY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=nmTRWR9b1AY
</div><figcaption class="wp-element-caption"><em>Nordic Semiconductor — DFU/FOTA Support in nRF Connect SDK. Includes image verification and bootloader-controlled acceptance of update images.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Mechanism</th><th>Main purpose</th><th>What it does not prove by itself</th></tr></thead><tbody><tr><td>CRC / checksum</td><td>Detect accidental corruption</td><td>Trusted origin</td></tr><tr><td>SHA-256 hash</td><td>Strong file fingerprint</td><td>Who created the file</td></tr><tr><td>Digital signature</td><td>Authenticity plus integrity when verified correctly</td><td>That the firmware is functionally correct</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">Readback and post-program verification</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>After programming, a technician should verify that the data stored on the device matches the intended image whenever the platform permits it. Vendor tools may provide direct verify functions, memory readback, or image-comparison features; protected devices may intentionally restrict readback and require another approved verification method.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=MsFcnA0FvCA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=MsFcnA0FvCA
</div><figcaption class="wp-element-caption"><em>STMicroelectronics Learning — Getting started with STM32CubeProgrammer. Demonstrates device connection, programming, and verification workflows.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Program the approved image.</li><li>Run the vendor verify operation when available.</li><li>Reset the target using the documented sequence.</li><li>Capture the complete boot log.</li><li>Confirm expected firmware and bootloader versions.</li><li>Confirm configuration and calibration state.</li><li>Run the functional acceptance test.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">A/B slots and rollback</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Many reliable update systems keep a primary image and a secondary image. The new firmware is placed in the inactive slot, validated, booted provisionally, and marked permanent only after the application proves that startup and required self-tests have succeeded.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=nmTRWR9b1AY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=nmTRWR9b1AY
</div><figcaption class="wp-element-caption"><em>Nordic Semiconductor — DFU/FOTA Support in nRF Connect SDK. Covers MCUboot dual slots, image swapping, verification, and update confirmation.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code"><code>known-good image in primary slot
        ↓
new image written to secondary slot
        ↓
bootloader validates candidate
        ↓
test boot
        ↓
application self-test
   ↙             ↘
pass              fail/reset
 ↓                 ↓
confirm image      rollback/revert</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Rollback and anti-rollback solve different problems</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Rollback</strong> restores a previous known-good image after a bad update. <strong>Anti-rollback</strong> prevents installation of firmware older than an allowed security version, because an old image may reintroduce vulnerabilities that were already fixed.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=nmTRWR9b1AY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=nmTRWR9b1AY
</div><figcaption class="wp-element-caption"><em>Nordic Semiconductor — DFU/FOTA Support in nRF Connect SDK. Reviews bootloader image versions, validation, and controlled update behavior.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:list --><ul class="wp-block-list"><li>Do not assume an older file can be reflashed simply because it is available.</li><li>Check version counters and secure-boot policy before attempting downgrade.</li><li>Use the approved recovery image for the exact hardware revision.</li><li>Never disable rollback protection or signature checks merely to force an image onto a device.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Pre-flash technician checklist</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The safest recovery begins before the first erase operation. Record the current state, verify the replacement image, confirm that recovery media is available, and make sure power and communication will remain stable for the entire programming operation.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=WY1hQzMh6wo","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=WY1hQzMh6wo
</div><figcaption class="wp-element-caption"><em>STMicroelectronics — STM32CubeProgrammer Part 1. Demonstrates controlled device connection, memory inspection, erase/program operations, and verification.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:list --><ul class="wp-block-list"><li>Confirm exact device and hardware revision.</li><li>Record installed firmware and bootloader versions.</li><li>Export configuration and calibration data where supported.</li><li>Save known-good logs and current slot state.</li><li>Verify the recovery image SHA-256 value.</li><li>Confirm the programmer, adapter, cable, and voltage requirements.</li><li>Confirm the recovery path if the flash operation is interrupted.</li><li>Use stable power and disable avoidable interruptions.</li><li>Document who approved the change and which image is being used.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Post-recovery validation</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A device is not recovered merely because it boots. Validation should prove that the expected version is running, the correct configuration is loaded, interfaces initialize normally, persistent data is intact, and the product completes its required functional checks without repeated resets or fallback behavior.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=tMrg11N5TrU","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=tMrg11N5TrU
</div><figcaption class="wp-element-caption"><em>Memfault — OTA Updates &amp; Management. Shows update deployment and the operational validation context surrounding device firmware updates.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Validation area</th><th>Evidence</th></tr></thead><tbody><tr><td>Boot</td><td>Complete boot log without unexpected recovery or reset loop</td></tr><tr><td>Version</td><td>Expected application and bootloader identifiers</td></tr><tr><td>Configuration</td><td>Expected network, feature, and site settings</td></tr><tr><td>Hardware interfaces</td><td>Normal sensor, network, storage, display, or control behavior</td></tr><tr><td>Persistent state</td><td>Required calibration, identity, and retained data present</td></tr><tr><td>Rollback status</td><td>New image confirmed or known-good image restored as intended</td></tr></tbody></table></figure><!-- /wp:table -->

<!-- wp:heading --><h2 class="wp-block-heading">Example recovery record</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A recovery ticket should make the operation reproducible by another technician. Record the original state, the exact image filename and hash, the programming interface, the tool version, the result of verification, the post-flash version, the boot-log result, and the final functional status.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=owPdKRQhMzk","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=owPdKRQhMzk
</div><figcaption class="wp-element-caption"><em>Memfault — Device Firmware Update Best Practices. Emphasizes reliable update architecture, controlled deployment, and recovery evidence.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code"><code>Device: ExampleController Rev C
Original firmware: 2.4.1
Recovery image: controller-2.4.1.bin
SHA-256: &lt;record exact digest&gt;
Programmer: &lt;tool and version&gt;
Interface: SWD
Configuration backup: config-2026-10-05.json
Program verify: PASS
Boot log: PASS
Running firmware after restore: 2.4.1
Functional validation: PASS
Final state: returned to service</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Create a recovery-package checklist for an embedded controller with separate application, bootloader, and configuration storage.</li><li>Calculate and record the SHA-256 digest of a sample firmware file using two different operating-system tools.</li><li>Modify one byte in a copy of the file and confirm that the SHA-256 digest changes.</li><li>Explain why a matching SHA-256 digest does not prove who created the firmware.</li><li>Draw an A/B-slot update sequence that includes test boot, confirmation, and rollback.</li><li>Write a pre-flash checklist that prevents accidental use of firmware for the wrong hardware revision.</li><li>Design a post-recovery validation plan containing at least six independent checks.</li><li>Write a recovery ticket that another technician could repeat without additional verbal instructions.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check + answers</h2><!-- /wp:heading -->

<!-- wp:list --><ol class="wp-block-list"><li><strong>What is a golden image?</strong> A known-good, tested firmware image retained as a recovery reference.</li><li><strong>Why back up configuration separately?</strong> Firmware and persistent configuration may occupy different storage regions and may be changed independently.</li><li><strong>What does SHA-256 help prove?</strong> That the file being checked matches the expected byte content associated with the recorded SHA-256 value.</li><li><strong>Does a matching hash prove authenticity?</strong> No. Authenticity requires a trusted source or a verified digital signature.</li><li><strong>What is an A/B update design?</strong> A design with active and alternate image locations so a candidate image can be tested without immediately destroying the known-good recovery path.</li><li><strong>Why can rollback fail intentionally?</strong> Anti-rollback security policy may reject an older vulnerable firmware version.</li><li><strong>What proves successful recovery?</strong> Correct version, normal boot, correct configuration, working interfaces, stable operation, and completed functional acceptance checks.</li><li><strong>Why preserve the exact tool version?</strong> Programmer behavior, supported devices, security handling, and command syntax can differ between tool releases.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Firmware recovery is a chain of evidence, not a single flash command.</strong> A professional technician preserves the current state, verifies the intended image, maintains a known-good recovery path, understands rollback policy, confirms programmed data, and proves that the restored device actually works.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=owPdKRQhMzk","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=owPdKRQhMzk
</div><figcaption class="wp-element-caption"><em>Memfault — Device Firmware Update Best Practices. Summarizes robust update architecture and recovery planning for deployed embedded systems.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:paragraph --><p><em>Safety and service note: Firmware readback, bootloader modification, credential backup, downgrade, and recovery access can be restricted by secure-boot policy or device security configuration. Follow manufacturer procedures and site authorization; do not bypass protections merely to force a recovery image.</em></p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=nmTRWR9b1AY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=nmTRWR9b1AY
</div><figcaption class="wp-element-caption"><em>Nordic Semiconductor — DFU/FOTA Support in nRF Connect SDK. Demonstrates secure bootloader-controlled image verification and recovery-oriented update design.</em></figcaption></figure><!-- /wp:embed -->