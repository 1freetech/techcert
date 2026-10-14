<!-- wp:paragraph -->
<p><strong>Production firmware should be designed to fail in a way that leaves evidence.</strong> A useful fault architecture captures enough processor and system state to reconstruct the failure, protects that evidence across reset, restores service through a controlled policy, and preserves the exact build information needed to symbolicate the crash later.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/12/osfec-009-can-bus-engineering/"><strong>OSFEC.009: CAN Bus Engineering</strong></a> and complements <a href="https://bitcoinversus.tech/2026/10/13/osftc-010-firmware-crash-logs-fault-recovery/"><strong>OSFTC.010: Firmware Crash Logs and Fault Recovery</strong></a>. The technician lesson focused on preserving crash evidence; this engineering lesson focuses on designing firmware so that evidence exists, survives reset, can be decoded automatically, and does not create a second reliability or security problem.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=3_ar-3OjXnA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=3_ar-3OjXnA
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Memfault demonstrates practical Cortex-M HardFault analysis, stacked-register recovery, GDB use, memory-corruption debugging, and crash collection at scale.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A firmware crash handler is like a flight recorder. It should save the important facts about what the processor was doing before the system resets. The engineer decides which facts to keep, where to keep them, how to prove they belong to the correct firmware build, and when the device is allowed to restart.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Design a Cortex-M fault handler that preserves exception state without corrupting additional evidence.</li><li>Explain the difference between fault capture, retained crash records, and full core dumps.</li><li>Choose what state belongs in retained RAM, flash, or external telemetry.</li><li>Build a symbolication pipeline tied to exact firmware build identity.</li><li>Design watchdog and reset policy that distinguishes recovery from root-cause analysis.</li><li>Prevent crash logging from causing flash wear, reset loops, or unsafe behavior.</li><li>Protect sensitive information contained in production dumps.</li><li>Validate the complete crash pipeline with deliberate fault injection.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Fault Handling Has Two Jobs</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A production fault path must do two different things: <strong>preserve diagnostic state</strong> and <strong>move the system toward a defined safe recovery state</strong>. Those goals can conflict. Writing a large log may preserve more context but increase the chance of blocking inside a damaged driver. Resetting immediately may restore service but destroy volatile evidence. The architecture must decide in advance which state can be captured safely before reset and which analysis can wait until the next boot.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The first rule is to keep the fatal exception path small. It should avoid dynamic allocation, complex logging stacks, blocking buses, filesystem operations, or dependencies on subsystems that may already be corrupted. Capture raw state into a bounded structure first. Formatting, symbolication, upload, compression, and human-readable decoding can happen later after a clean reboot.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=oL8qVAVMA0o","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=oL8qVAVMA0o
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>SEGGER demonstrates Cortex-M fault analysis, including nested exceptions, multiple stacks, and trace-assisted diagnosis.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Capture the Exception Frame Correctly</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>On Cortex-M exception entry, hardware normally stacks R0-R3, R12, LR, PC, and xPSR on the active stack. The fault handler must determine whether the exception used the Main Stack Pointer or Process Stack Pointer. On processors with floating-point support, an extended frame may also exist. Incorrectly assuming one stack layout can produce a convincing but false crash record.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The architecture should preserve the raw stacked frame plus SCB fault registers such as CFSR and HFSR, and MMFAR/BFAR when their valid bits indicate a meaningful address. Keep raw hexadecimal values even if firmware also stores a decoded reason code. Human-readable decoding can change as tooling improves; the original register state cannot be reconstructed if it was never saved.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>struct crash_record {
    uint32_t magic;
    uint32_t version;
    uint32_t build_id;
    uint32_t reset_reason;
    uint32_t exc_return;
    uint32_t r0, r1, r2, r3, r12;
    uint32_t lr, pc, xpsr;
    uint32_t msp, psp;
    uint32_t cfsr, hfsr, mmfar, bfar;
    uint32_t active_irq;
    uint32_t uptime_ms;
    uint32_t crc32;
};</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>This is an illustrative structure, not a universal ABI. A production format should have a version, length, integrity check, explicit endianness, build identity, and compatibility rules so old crash records remain decodable after the firmware evolves.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Retained RAM Is Fast but Temporary</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A small crash record can often be written to a <code>.noinit</code> region, backup SRAM, retention RAM, or another memory area that survives a software reset. This keeps the fatal path short and avoids flash writes while the processor may be unstable. On the next boot, startup code validates the record, copies it to durable storage or telemetry, then clears or advances the retained slot.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Retained RAM is not guaranteed across every reset. Power loss, brownout, battery-domain failure, bootloader behavior, or aggressive startup initialization may erase it. The design must know which reset classes preserve the chosen memory and must treat retained data as untrusted until its magic, version, bounds, and integrity check have been validated.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Flash Gives Persistence but Has Costs</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Flash-backed crash storage survives power removal but introduces write latency, erase granularity, wear, and power-fail atomicity concerns. A device caught in a rapid crash-reset loop can consume erase cycles or overwrite the first useful crash with hundreds of identical later events. Production designs commonly use a bounded ring, pre-erased slots, monotonically increasing sequence numbers, CRCs, and write-rate limits.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A robust format should distinguish <strong>capture complete</strong> from <strong>capture interrupted</strong>. One approach is to write the payload and integrity value first, then write a small commit marker last. On boot, records lacking a valid commit marker are ignored. The exact mechanism depends on the flash technology and its atomic write size.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Core Dumps Expand the Evidence Set</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A compact fault record preserves the minimum. A <strong>core dump</strong> preserves enough registers and memory to reconstruct much more of the failed execution context offline. Zephyr's core-dump subsystem can capture CPU registers plus selected memory and can store the result through logging, UDP, flash, or other supported backends. Engineers can choose minimal thread-state capture or broader RAM coverage depending on storage, privacy, and diagnosis needs.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=xn0Nb4Sj5ao","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=xn0Nb4Sj5ao
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Memfault explains embedded coredumps, Zephyr capture, GDB analysis, and why structured post-mortem state can outperform ordinary logs for difficult field failures.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A dump does not need to contain all RAM. Engineers should deliberately choose the smallest useful set: active task stack, selected RTOS control blocks, fault registers, key queues, allocator state, or other structures relevant to the product. Smaller dumps reduce storage, bandwidth, upload time, and exposure of sensitive memory.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Build Identity Is Part of the Crash Record</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Symbolication is only correct when crash addresses are resolved against the exact executable image that produced them. Every production build should have a stable identifier tied to the ELF, map file, compiler/linker configuration, source revision, and binary image. The identifier might be a Git commit plus build number, a cryptographic image digest, a generated build UUID, or another immutable value.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The backend should use that identifier to select the matching symbols automatically. Engineers should never choose an ELF manually because its filename “looks right.” Different optimization, link order, feature flags, or libraries can move addresses enough to make an incorrect symbol file produce believable but wrong source locations.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Separate On-Device Capture From Off-Device Symbolication</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Production firmware usually should not carry full debug symbols. Instead, the device records raw addresses and build identity; a secure backend stores the matching ELF and performs symbolication. That separation reduces image size and prevents field devices from needing symbol databases while still supporting detailed post-mortem analysis.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>arm-none-eabi-addr2line \
  -e build/firmware.elf \
  -f -C \
  0x08001234 0x08004567

arm-none-eabi-gdb build/firmware.elf
(gdb) target remote :3333
(gdb) info registers
(gdb) bt</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>The same principle applies to automated systems: preserve machine-readable addresses and select symbols by immutable build ID before generating human-readable traces.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">The Watchdog Is Part of the Fault Architecture</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A watchdog should detect loss of forward progress, not merely prove that one periodic interrupt still runs. In an RTOS system, a supervisor can require health signals from critical tasks and feed the hardware watchdog only when the system as a whole is healthy. If the watchdog fires, retained state should distinguish which health check stopped progressing and which code path last reported success.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not automatically extend a watchdog timeout because a workload occasionally trips it. First determine whether the timeout budget is wrong, the workload has legitimate worst-case latency, interrupts are blocked too long, a mutex deadlocks, storage stalls, or memory corruption has stopped the service path. Recovery policy must be designed from measured worst-case timing, not from a desire to make resets disappear.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Prevent Reset Loops</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A device that crashes immediately after boot can enter a reset loop that prevents diagnostics, network upload, or safe operation. Engineers should define a boot-failure counter and a fallback policy. Examples include entering a recovery image, holding in a diagnostic mode, suppressing the failing feature, rolling back an update, or waiting for service intervention after a defined number of consecutive failures.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The counter itself must be designed carefully. It may live in backup registers, FRAM, flash, or another persistent mechanism. It should distinguish planned resets from crash resets and should decay or clear after a sufficiently long healthy runtime so a single historical failure does not permanently bias future recovery.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Crash Data Is Security-Sensitive</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Memory dumps can contain passwords, cryptographic keys, authentication tokens, personally identifiable data, network credentials, proprietary algorithms, or customer payloads. A debugging architecture must therefore define what memory is allowed into a dump, how records are encrypted or authenticated, who can retrieve them, how long they are retained, and how they are deleted.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not assume that “internal debug data” is harmless. Core dumps should follow the same security and privacy review applied to logs and telemetry. In high-assurance systems, sensitive buffers may be excluded from dumps or scrubbed before persistence when that can be done safely without damaging the essential failure record.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Crash Telemetry Needs Backpressure</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Fleet telemetry can become a denial-of-service problem if one firmware bug causes millions of identical crash uploads. Backends should deduplicate crashes by build ID and signature, rate-limit repeated events, preserve occurrence counts, and retain representative dumps rather than uploading every copy. Devices should also bound local retry queues so a network outage does not fill storage with stale diagnostics.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A useful crash signature may combine build ID, exception class, normalized PC, a few frames of the call stack, and selected status bits. The signature should remain stable for repeated instances of the same failure while avoiding accidental grouping of unrelated faults.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/embedded/comments/1uab98f/how_do_you_actually_debug_hardfault_dumps_day_to/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/embedded/comments/1uab98f/how_do_you_actually_debug_hardfault_dumps_day_to/
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>An embedded-systems discussion illustrates common field practice: save the stacked PC first, retain crash state across reset, automate fault-register decoding, and use matching ELF symbols instead of relying on a generic HardFault message.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Test the Failure Path Deliberately</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A crash system that has never been intentionally triggered is not verified. Build a fault-injection test matrix for development and CI hardware. Inject known null dereferences, invalid memory reads, divide-by-zero where supported, stack overflow, assertion failure, watchdog timeout, nested-fault conditions, and power interruption during crash-record persistence. Every test should have an expected reset cause, expected record fields, and expected post-boot behavior.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=-ikuU6MjMiI","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=-ikuU6MjMiI
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>The Linux Foundation and Memfault show Zephyr core-dump configuration, memory selection, storage backends, and GDB-based post-mortem analysis.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Engineering Validation Matrix</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Fault-frame correctness:</strong> PC, LR, stack selection, xPSR, and status registers match debugger truth.</li><li><strong>Persistence:</strong> retained records survive every intended reset class and are rejected after unintended power loss when incomplete.</li><li><strong>Integrity:</strong> corrupted records fail CRC/signature validation cleanly.</li><li><strong>Build mapping:</strong> each record selects one exact ELF and cannot silently fall back to a nearby build.</li><li><strong>Wear control:</strong> repeated crash loops cannot exhaust flash endurance quickly.</li><li><strong>Recovery:</strong> boot-loop policy reaches the designed safe or rollback state.</li><li><strong>Security:</strong> dump collection excludes or protects sensitive regions according to policy.</li><li><strong>Telemetry:</strong> duplicate crashes are counted and deduplicated rather than flooding the backend.</li><li><strong>Observability:</strong> dashboards can separate crash rate by build, hardware revision, reset reason, and signature.</li><li><strong>Regression:</strong> fault-injection tests run after changes to startup code, linker layout, RTOS, bootloader, or crash schema.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Engineering Exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Design a crash architecture for a Cortex-M RTOS controller with 1 MB internal flash, 256 KB RAM, a hardware watchdog, Ethernet connectivity, and an A/B bootloader. Requirements: the device must recover automatically from a single application fault, retain at least one useful crash across power loss, avoid writing flash repeatedly during a boot loop, and upload diagnostics after networking becomes available.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Define the exception record, retained-RAM layout, flash crash-slot format, commit/integrity scheme, build identifier, watchdog policy, boot-failure counter, A/B rollback criteria, upload retry policy, privacy exclusions, and automated symbolication pipeline. Then specify five fault-injection tests that prove the architecture works.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Why should the fatal exception path be small and bounded?</li><li>Why must a handler distinguish MSP from PSP?</li><li>What advantage does retained RAM have over immediate flash logging?</li><li>Why does flash crash storage need rate limiting or bounded slots?</li><li>What is the difference between a compact fault record and a core dump?</li><li>Why must symbolication use the exact firmware build?</li><li>Why can repeatedly feeding the watchdog from one timer be a weak health check?</li><li>What problem does a boot-failure counter solve?</li><li>Why can a core dump be a security risk?</li><li>Why should fault-injection testing be part of regression testing?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>The system may already be partially corrupted; complex allocation, drivers, filesystems, or blocking operations can fail again and destroy the original evidence.</li><li>The exception frame may be on different stacks depending on whether thread or handler context was active; reading the wrong stack produces invalid crash state.</li><li>It can preserve a small record quickly without erase latency or flash wear while the system is unstable.</li><li>A rapid crash loop can wear flash, overwrite the first useful event, or fill storage with identical records.</li><li>A compact record captures selected registers and metadata; a core dump preserves broader structured register and memory state for offline debugging.</li><li>Compiler options, link layout, libraries, and source changes move addresses between builds, so the wrong ELF can generate false source locations.</li><li>The timer can keep running while critical tasks are deadlocked or no longer making useful progress.</li><li>It detects repeated failure to reach a stable boot state and enables rollback, recovery mode, or service intervention instead of infinite resets.</li><li>RAM may contain credentials, keys, tokens, user data, or proprietary information.</li><li>Startup code, linker changes, RTOS updates, and crash-schema changes can silently break the failure path even when normal operation still passes tests.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The simplest rule is: <strong>design the crash path before the crash happens.</strong> Save the processor state, prove which firmware build produced it, protect the record across reset, recover through a controlled policy, and test the entire pipeline by deliberately causing known failures. Good post-mortem architecture turns rare field crashes into structured engineering data.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Previous Related Lessons</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://bitcoinversus.tech/2026/10/13/osftc-010-firmware-crash-logs-fault-recovery/"><strong>OSFTC.010: Firmware Crash Logs and Fault Recovery</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/12/osfec-009-can-bus-engineering/"><strong>OSFEC.009: CAN Bus Engineering</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/08/osfec-005-bootloader-design-firmware-update-architecture-image-validation-ab-slots-rollback-versioning-recovery/"><strong>OSFEC.005: Bootloader Design and Firmware Update Architecture</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/06/osfec-004-linker-scripts-startup-code-memory-sections-vector-tables-stack-heap-map-files/"><strong>OSFEC.004: Linker Scripts and Startup Code</strong></a></li><li><a href="https://bitcoinversus.tech/2026/10/05/osfec-003-hardware-debugging-jtag-swd-openocd-gdb/"><strong>OSFEC.003: Hardware Debugging with JTAG, SWD, OpenOCD, and GDB</strong></a></li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://developer.arm.com/community/arm-community-blogs/b/architectures-and-processors-blog/posts/cortex-m-resources">Arm — Cortex-M Resources and Fault Exception References</a></li><li><a href="https://docs.zephyrproject.org/latest/services/debugging/coredump.html">Zephyr Project — Core Dump</a></li><li><a href="https://docs.zephyrproject.org/latest/doxygen/html/group__coredump__apis.html">Zephyr Project — Coredump APIs</a></li><li><a href="https://sourceware.org/gdb/current/onlinedocs/gdb.html/Backtrace.html">GNU GDB — Backtraces</a></li><li><a href="https://interrupt.memfault.com/blog/cortex-m-hardfault-debug">Memfault — Cortex-M HardFault Debugging</a></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><em><strong>BitcoinVersus.Tech Editor's Note:</strong><br>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support to help further secure the integrity of our research initiatives, please donate using the QR code provided</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} -->
<figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="Bitcoin donation QR code for 5,000 sats." class="wp-image-24043" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><em>For best QR-code scanning results, please scan this donation code from a desktop or larger screen. Mobile screens may prevent camera recognition.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><em>BitcoinVersus.Tech provides technical education and analysis for informational purposes only.</em></p>
<!-- /wp:paragraph -->