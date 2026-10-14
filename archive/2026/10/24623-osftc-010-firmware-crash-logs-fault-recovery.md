<!-- wp:paragraph -->
<p><strong>A firmware crash is not just an outage; it is a snapshot of what the processor was doing when execution failed.</strong> A technician who preserves the reset cause, fault registers, program counter, link register, stack data, build identity, and serial log can often turn an intermittent failure into evidence an engineer can reproduce and fix.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>This lesson follows <a href="https://bitcoinversus.tech/2026/10/12/osftc-009-can-bus-troubleshooting/"><strong>OSFTC.009: CAN Bus Troubleshooting</strong></a>. Earlier lessons covered <a href="https://bitcoinversus.tech/2026/10/07/osftc-005-watchdog-timers-reset-loops-timeouts-feeding-reset-causes-firmware-troubleshooting/"><strong>watchdog timers and reset loops</strong></a>, <a href="https://bitcoinversus.tech/2026/10/05/osftc-003-firmware-backup-recovery-checksums-golden-images-rollback-validation/"><strong>firmware backup and recovery</strong></a>, and <a href="https://bitcoinversus.tech/2026/10/05/osftc-002-serial-console-boot-logs-uart-baud-rate-pinouts-capture-recovery/"><strong>serial console and boot logs</strong></a>. OSFTC.010 combines those skills into a structured crash-recovery workflow.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=3_ar-3OjXnA","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=3_ar-3OjXnA
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Memfault demonstrates practical Cortex-M HardFault analysis, including stacked registers, fault-status registers, stack traces, GDB, and automated crash collection.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Overview</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>When firmware crashes, the processor often still has useful clues. Think of those clues like marks left at an accident scene: which instruction was running, where the program expected to return, what kind of memory error occurred, and what task was active. The technician's first job is to protect those clues before resetting, reflashing, or changing the hardware.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Learning Objectives</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Distinguish reset logs, fault-register dumps, stack traces, and core dumps.</li><li>Identify the minimum evidence to capture before recovery.</li><li>Interpret the technician meaning of PC, LR, SP, fault-status registers, and reset-cause registers.</li><li>Use an ELF file and address-to-line tools to map crash addresses back to source code.</li><li>Explain why build identity must match the crashed firmware exactly.</li><li>Use GDB and stored core dumps for post-mortem inspection.</li><li>Recognize when reflashing destroys evidence.</li><li>Separate safe technician recovery from engineering-level root-cause changes.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Start With the Reset Cause</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Before assuming a software bug, determine why the processor restarted. Depending on the MCU, reset-cause registers may distinguish power-on reset, brownout, watchdog reset, software reset, pin reset, lockup, or other platform-specific events. Record the raw register value and the decoded cause before firmware clears it during boot.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A watchdog reset and a HardFault can describe different failure paths. A HardFault means the CPU entered an exception because execution violated an architectural rule or escalated another fault. A watchdog reset usually means software stopped servicing the watchdog for too long. The final symptom may be the same—a reboot—but the evidence and troubleshooting direction are different.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Capture Evidence Before Recovery</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Record device serial number, board revision, and power conditions.</li><li>Record exact firmware version, build ID, commit, image hash, and bootloader version.</li><li>Capture the complete serial/UART log without trimming the beginning.</li><li>Record reset-cause registers before they are cleared.</li><li>Capture PC, LR, SP, xPSR, and general-purpose registers if available.</li><li>Capture architecture fault registers such as CFSR, HFSR, MMFAR, and BFAR on Cortex-M systems when implemented.</li><li>Save the stack trace or backtrace exactly as printed.</li><li>Export any core dump before erasing, reflashing, or factory-resetting the device.</li><li>Record the test action immediately preceding failure.</li><li>Photograph or save instrument conditions if voltage, current, temperature, or signal integrity may be relevant.</li></ol>
<!-- /wp:list -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=QQcp8CPjkoY","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=QQcp8CPjkoY
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>Linaro demonstrates essential Cortex-M debugging with GDB, including register inspection and practical firmware-debug workflows.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">PC, LR, and SP Are the First Coordinates</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The <strong>program counter (PC)</strong> identifies the instruction address associated with execution at the captured point. The <strong>link register (LR)</strong> normally carries return or exception-return information. The <strong>stack pointer (SP)</strong> identifies the active stack location. On Cortex-M exceptions, hardware automatically saves an exception frame containing registers such as R0-R3, R12, LR, PC, and xPSR. That saved PC is often the fastest path from a raw crash log to the failing source location.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Do not assume every PC value is the true root cause. Stack corruption, a damaged function pointer, buffer overrun, invalid exception return, or earlier memory corruption can make the processor fail far away from the original bug. Treat the faulting instruction as the starting point for diagnosis, not automatic proof of cause.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Fault Registers Explain the Type of Failure</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>On Arm Cortex-M devices, the configurable fault-status registers can identify classes such as memory-management faults, bus faults, and usage faults. Address registers may also preserve the memory address involved in a valid fault. Common technician-visible patterns include invalid reads or writes, unaligned accesses on platforms that fault on them, divide-by-zero when trapping is enabled, undefined instructions, corrupted return addresses, and execution through bad function pointers.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The technician should preserve the hexadecimal register values even when a debugger already prints a human-readable explanation. Decoder software, vendor tools, and engineering scripts change over time; the original values remain the most durable evidence.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Map Addresses With the Exact ELF File</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A raw address becomes much more useful when matched against the exact executable-and-linkable-format file produced by the same build. The ELF file contains symbols and address information that a stripped production binary normally does not. If the ELF comes from a different build, even one with the same visible version number, addresses may resolve to the wrong function or source line.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>arm-none-eabi-addr2line -e firmware.elf -f -C 0x08001234

arm-none-eabi-gdb firmware.elf
(gdb) info registers
(gdb) bt
(gdb) x/16wx $sp
(gdb) list *0x08001234</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>These commands are examples, not universal syntax for every architecture. The principle is universal: preserve the exact firmware symbols, then translate captured addresses using tools built for that target.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Core Dumps Preserve More Than a Log</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A core dump stores structured processor and memory state for post-mortem analysis. Zephyr's core-dump subsystem can save CPU registers and selected memory through logging, UDP, flash, or other supported backends. Espressif's ESP-IDF can save task control blocks and stacks so the crash can later be decoded with development tools. The exact contents vary, but the goal is the same: preserve enough state to inspect the failed system after the device has stopped normal execution.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=-ikuU6MjMiI","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=-ikuU6MjMiI
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>The Linux Foundation and Memfault show how Zephyr core dumps preserve fault state and can be analyzed later with GDB.</em></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>A crash dump can contain sensitive information because RAM may include credentials, keys, customer data, network tokens, or proprietary state. Store and transfer dumps under the same security controls used for other diagnostic artifacts, and never publish a raw production dump casually.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Logs and Core Dumps Serve Different Purposes</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><strong>Boot log:</strong> shows startup sequence and reset reason.</li><li><strong>Application log:</strong> shows events the firmware intentionally reported before failure.</li><li><strong>Fault register dump:</strong> describes CPU exception state.</li><li><strong>Stack trace:</strong> reconstructs likely call history.</li><li><strong>Core dump:</strong> preserves structured registers and memory for offline analysis.</li><li><strong>Oscilloscope or logic-analyzer capture:</strong> adds physical evidence when a crash correlates with power, reset, clock, or bus activity.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Do not substitute one artifact for all the others. A log may show the last successful event but not the exact exception state. A core dump may preserve memory but lack the external voltage transient that caused the failure. Strong troubleshooting correlates software evidence with hardware conditions.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Reproduce Without Destroying the Original Evidence</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>After evidence is secured, reproduce the failure on a controlled unit whenever possible. Match firmware build, board revision, peripherals, input data, power supply, temperature, communications traffic, and timing. Change one variable at a time. If the failure is intermittent, preserve timestamps so repeated crashes can be correlated with external events.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=gVL5snqePWs","type":"video","providerNameSlug":"youtube","responsive":true} -->
<figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=gVL5snqePWs
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>This embedded-debugging talk demonstrates Cortex-M GDB workflows, debug probes, coredumps, tracing, and non-invasive techniques useful when a crash depends on timing.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">When to Reflash</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Reflashing is a recovery action, not automatically a diagnostic action. Reflash after evidence has been captured, when the authorized repair procedure calls for it, when image integrity is known to be bad, or when a controlled A/B comparison requires a known-good image. Do not reflash first simply because a device crashed; doing so may erase the only copy of the failure evidence.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>If a known-good image immediately crashes in the same way, expand the fault domain to hardware, power integrity, RAM/flash health, peripheral state, board revision, configuration storage, and environmental conditions. Firmware technicians should avoid repeatedly cycling images without recording what each attempt proves.</p>
<!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.reddit.com/r/embedded/comments/1uab98f/how_do_you_actually_debug_hardfault_dumps_day_to/","type":"rich","providerNameSlug":"reddit","responsive":true} -->
<figure class="wp-block-embed is-type-rich is-provider-reddit wp-block-embed-reddit"><div class="wp-block-embed__wrapper">
https://www.reddit.com/r/embedded/comments/1uab98f/how_do_you_actually_debug_hardfault_dumps_day_to/
</div></figure>
<!-- /wp:embed -->

<!-- wp:paragraph -->
<p><em>An embedded-systems discussion illustrates common real-world workflows: preserve the stacked PC, decode fault registers, capture exception frames, and use symbol files rather than relying on a generic “HardFault” message.</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Technician Escalation Package</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li>Device and board identifiers.</li><li>Exact firmware image hash and matching ELF/map files.</li><li>Bootloader and configuration versions.</li><li>Complete serial log.</li><li>Reset cause.</li><li>PC, LR, SP, xPSR, and fault-status registers.</li><li>Stack trace or decoded source location.</li><li>Core dump if available.</li><li>Exact reproduction steps and occurrence rate.</li><li>Power, temperature, communications, and peripheral conditions.</li><li>What recovery actions were attempted and their results.</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>This package lets engineering reproduce the state instead of starting from “the device rebooted.” Good technician evidence shortens root-cause time and also prevents unnecessary board swaps, reflashes, and firmware changes.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Hands-On Exercise</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>A device reboots after processing a specific packet. The console shows a HardFault, PC = 0x08001234, LR = 0x08004567, BFAR = 0x20000000, and a valid bus-fault address flag. The production binary is available, along with three ELF files from different builds.</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Explain which ELF file must be selected and how to prove it matches the crashed image.</li><li>List the evidence that must be copied before resetting or reflashing.</li><li>Use the example <code>addr2line</code> command to resolve PC 0x08001234.</li><li>Explain why BFAR = 0x20000000 is useful but does not by itself prove which source-code statement caused the bad access.</li><li>Describe one controlled reproduction test and one hardware measurement that could strengthen the diagnosis.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Knowledge Check</h2>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Why should crash evidence be captured before reflashing?</li><li>What does the program counter identify?</li><li>Why must the ELF file match the exact firmware build?</li><li>What is the difference between a watchdog reset and a HardFault?</li><li>What additional information can a core dump preserve beyond a text log?</li><li>Why should raw hexadecimal fault-register values be saved?</li><li>What does <code>addr2line</code> help determine?</li><li>Why can the faulting PC be a symptom rather than the original cause?</li><li>Name three environmental or hardware conditions worth recording during reproduction.</li><li>When should a technician escalate instead of changing firmware behavior?</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3 class="wp-block-heading">Answers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><li>Reflashing may erase logs, retained RAM, stored core dumps, or other evidence needed to diagnose the original failure.</li><li>The instruction address associated with execution at the captured point.</li><li>Addresses and symbols change between builds, so a mismatched ELF can map the same address to the wrong function or line.</li><li>A watchdog reset occurs after the watchdog is not serviced within its allowed interval; a HardFault is an architectural exception or escalated fault condition.</li><li>CPU registers, task state, stacks, and selected memory regions, depending on the platform and configuration.</li><li>The original register values can be re-decoded later even if tools or interpretation change.</li><li>It maps a code address against symbols in the matching ELF to a function and, when debug information exists, a source file and line.</li><li>Earlier memory corruption, stack corruption, or a bad function pointer may only become visible when execution finally reaches the faulting instruction.</li><li>Examples include supply voltage, current, temperature, clock/reset behavior, bus traffic, and peripheral state.</li><li>When evidence is collected and the next step would change code, recipes, protected configuration, or safety-critical behavior beyond the approved technician procedure.</li></ol>
<!-- /wp:list -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Elementary Conclusion</h2>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The most important rule is simple: <strong>do not erase the clues.</strong> A crash address, fault register, exact build file, serial log, and core dump can explain a failure that would otherwise look random. Recover the device only after the evidence is safe, then reproduce methodically and escalate with a complete diagnostic package.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading">Primary References</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><li><a href="https://docs.zephyrproject.org/latest/services/debugging/coredump.html">Zephyr Project — Core Dump</a></li><li><a href="https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/fatal-errors.html">Espressif ESP-IDF — Fatal Errors</a></li><li><a href="https://docs.espressif.com/projects/esp-idf/en/stable/esp32c2/api-guides/core_dump.html">Espressif ESP-IDF — Core Dump</a></li><li><a href="https://developer.arm.com/documentation/dui0553/latest/">Arm — Cortex-M4 Devices Generic User Guide</a></li></ul>
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