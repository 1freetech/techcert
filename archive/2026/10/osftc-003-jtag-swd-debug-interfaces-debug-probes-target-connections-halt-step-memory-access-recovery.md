<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>JTAG and SWD are hardware debug interfaces that let a technician communicate with a microcontroller below the normal operating-system or application layer.</strong> When a serial console is silent or firmware will not boot, a debug probe can often identify the target, halt execution, inspect registers and memory, program flash, and support recovery.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IC108KdVYz4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=IC108KdVYz4</div><figcaption class="wp-element-caption"><em>38C3 — Demystifying Common Microcontroller Debug Protocols. Covers JTAG, SWD, memory access, flash programming, breakpoints, and processor control.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:paragraph --><p>This lesson continues <a href="https://bitcoinversus.tech/2026/10/05/osftc-002-serial-console-boot-logs-uart-baud-rate-pinouts-capture-recovery/"><strong>OSFTC.002: Serial Console and Boot Logs</strong></a> and builds on <a href="https://bitcoinversus.tech/2026/10/04/osftc-001-firmware-images-safe-flashing-bootloaders-recovery-basics/"><strong>OSFTC.001: Firmware Images, Safe Flashing, Bootloaders, and Recovery Basics</strong></a>. The engineer-level companion is <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/"><strong>OSFEC.001: Microcontroller Architecture</strong></a>, which explains the registers and memory map that a probe exposes.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IC108KdVYz4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=IC108KdVYz4</div><figcaption class="wp-element-caption"><em>38C3 — Demystifying Common Microcontroller Debug Protocols. Covers JTAG, SWD, memory access, flash programming, breakpoints, and processor control.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Distinguish JTAG from Arm Serial Wire Debug (SWD).</li><li>Identify the minimum target signals required for a safe debug connection.</li><li>Explain halt, reset, step, register, memory, and flash operations.</li><li>Use a debug probe without assuming the target voltage or pinout.</li><li>Recognize common connection failures and recovery paths.</li><li>Perform a repeatable technician-level connection and evidence-capture workflow.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">JTAG and SWD in plain language</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>JTAG is a general test and debug interface that can support processor debugging, device programming, scan chains, and boundary-scan testing. SWD is an Arm-focused two-signal debug transport that uses SWDIO for bidirectional data and SWCLK for the clock, reducing the number of target pins needed for core debugging.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IC108KdVYz4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=IC108KdVYz4</div><figcaption class="wp-element-caption"><em>38C3 — Demystifying Common Microcontroller Debug Protocols. Covers JTAG, SWD, memory access, flash programming, breakpoints, and processor control.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">The physical connection</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A technician should identify the exact board header and target documentation before attaching a probe. A typical SWD connection needs SWDIO, SWCLK, ground, and a target-reference voltage; reset and SWO may also be useful. The reference-voltage pin tells many probes what logic level the target is using—it is not permission to inject an arbitrary voltage into the board.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Ka5R6U9MXsc","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=Ka5R6U9MXsc</div><figcaption class="wp-element-caption"><em>Electrical Engineering Essentials — JTAG and SWD in embedded-firmware debugging. Reviews processor control, register inspection, programming, and the differences between the interfaces.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:list --><ul class="wp-block-list"><li>Confirm target part number and hardware revision.</li><li>Locate the documented debug header or test pads.</li><li>Identify GND and target reference voltage before signal pins.</li><li>Confirm SWDIO/SWCLK or JTAG TMS/TCK/TDI/TDO as applicable.</li><li>Check whether nRESET is required for connect-under-reset recovery.</li><li>Use ESD controls and avoid probing energized boards unless the procedure authorizes it.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">What the probe can do</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Once connected, the probe can request control of the processor through the target debug architecture. Common operations include reset, halt, resume, single-step, register inspection, memory reads, breakpoints, and flash programming. These operations are powerful because they can work even when normal firmware services such as networking, USB, or a command shell are unavailable.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=0Jtp0FRvwP4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=0Jtp0FRvwP4</div><figcaption class="wp-element-caption"><em>SEGGER Microcontroller — J-Link Commander. Demonstrates connecting a debug probe and using command-line target-analysis functions.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>connect
halt
read registers
read memory
inspect reset state
step or resume
program or verify flash only when authorized</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">J-Link Commander example</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>SEGGER J-Link Commander is one example of a command-line probe utility. Its documented workflow includes selecting the target device and interface, connecting, halting, reading memory, stepping, resuming, and loading an authorized firmware image. Exact commands vary by probe, target, and software version, so the device reference and current tool documentation remain authoritative.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=0Jtp0FRvwP4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=0Jtp0FRvwP4</div><figcaption class="wp-element-caption"><em>SEGGER Microcontroller — J-Link Commander. Demonstrates connecting a debug probe and using command-line target-analysis functions.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>JLinkExe -device STM32F407VE -if SWD -speed 1000

# Typical interactive operations:
connect
halt
regs
mem32 0x20000000 16
go</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">JTAG scan chains versus SWD</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>JTAG can place multiple Test Access Ports in a scan chain, so chain order and instruction-register lengths may matter when more than one device shares the interface. SWD normally presents an Arm Debug Access Port using fewer signal wires and is primarily debug-oriented rather than a boundary-scan replacement. A board that exposes both interfaces may multiplex the SWD signals onto pins also used by JTAG.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IC108KdVYz4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=IC108KdVYz4</div><figcaption class="wp-element-caption"><em>38C3 — Demystifying Common Microcontroller Debug Protocols. Covers JTAG, SWD, memory access, flash programming, breakpoints, and processor control.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Connection speed and signal integrity</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A probe clock that is too aggressive can create intermittent connection failures, especially with long flying leads, weak grounding, adapters, or a target that is still starting. A useful troubleshooting method is to reduce the debug clock, shorten the connection, verify ground and reference voltage, then retry before assuming the processor or flash is defective.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=0Jtp0FRvwP4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=0Jtp0FRvwP4</div><figcaption class="wp-element-caption"><em>SEGGER Microcontroller — J-Link Commander. Demonstrates connecting a debug probe and using command-line target-analysis functions.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Connect under reset</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Some failures occur because firmware quickly reconfigures clocks, enters a low-power state, disables debug access, or crashes before a normal attach completes. When the target and probe support it, connect-under-reset holds or controls reset while the debug session is established, giving the technician a chance to halt the processor before the failing firmware takes over.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Ka5R6U9MXsc","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=Ka5R6U9MXsc</div><figcaption class="wp-element-caption"><em>Electrical Engineering Essentials — JTAG and SWD in embedded-firmware debugging. Reviews processor control, register inspection, programming, and the differences between the interfaces.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Memory and register inspection</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Register and memory reads turn an apparently dead board into an observable system. The technician can check the program counter, stack pointer, fault-related registers, SRAM contents, boot configuration, or a known peripheral region, then compare those observations with the target reference manual and a known-good unit. Reading is usually a lower-risk first step than writing.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IC108KdVYz4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=IC108KdVYz4</div><figcaption class="wp-element-caption"><em>38C3 — Demystifying Common Microcontroller Debug Protocols. Covers JTAG, SWD, memory access, flash programming, breakpoints, and processor control.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Flash programming and recovery</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Debug probes can often erase or program on-chip flash, but recovery should begin with identity and evidence rather than an immediate mass erase. Verify the exact target, preserve useful logs or memory where possible, confirm the approved image and address, and understand whether option bytes, security settings, calibration data, or bootloader regions could be changed by the operation.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=0Jtp0FRvwP4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=0Jtp0FRvwP4</div><figcaption class="wp-element-caption"><em>SEGGER Microcontroller — J-Link Commander. Demonstrates connecting a debug probe and using command-line target-analysis functions.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>sha256sum approved-firmware.bin
# Compare the digest with the approved release record before programming.</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">A technician workflow</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Identify the target MCU/SoC and board revision.</li><li>Find the authoritative debug-header pinout.</li><li>Verify ground and target reference voltage.</li><li>Connect the probe with the target powered as required by the procedure.</li><li>Start at a conservative debug clock.</li><li>Read the target identity before modifying anything.</li><li>Halt and capture registers or memory relevant to the fault.</li><li>Compare results with a known-good unit or documented expected state.</li><li>Program flash only with an approved image and address map.</li><li>Reset, reconnect, and verify the target boots and remains debuggable.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Common mistakes</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Guessing a header pinout from physical appearance.</li><li>Connecting a 3.3 V probe assumption to a 1.8 V target without checking reference voltage.</li><li>Swapping SWDIO and SWCLK or omitting a solid ground reference.</li><li>Using long unshielded flying leads at an unnecessarily high debug clock.</li><li>Mass-erasing before preserving evidence or configuration.</li><li>Programming the correct binary at the wrong flash address.</li><li>Changing option bytes, fuses, or security state without a recovery plan.</li><li>Assuming a failed attach proves that the MCU is dead.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->

<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Draw a four-wire SWD connection showing SWDIO, SWCLK, GND, and VTref.</li><li>Explain why reading the target identity should come before erasing flash.</li><li>Describe three reasons lowering debug-clock speed can improve connection reliability.</li><li>Compare a JTAG scan chain with a basic point-to-point SWD connection.</li><li>Write a recovery checklist for a board that has power but produces no UART boot log.</li><li>Explain why connect-under-reset can succeed when a normal attach fails.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>1. What are the two primary SWD signal lines?</strong><br>SWDIO carries bidirectional data and SWCLK supplies the debug clock.</li><li><strong>2. Why is target reference voltage important?</strong><br>It lets the probe identify or adapt to the target logic level and helps prevent an unsafe electrical mismatch.</li><li><strong>3. What should normally happen before a mass erase?</strong><br>Confirm target identity, preserve useful evidence, verify the approved recovery image, and understand protected or calibration regions.</li><li><strong>4. What does single-step do?</strong><br>It advances execution in a controlled manner so state changes can be observed between instructions or debug events.</li><li><strong>5. Why can connect-under-reset help?</strong><br>It can establish debug control before faulty firmware reconfigures the device or blocks a normal attach.</li><li><strong>6. Does a failed debug connection prove the MCU is defective?</strong><br>No. Pinout, voltage, grounding, clock speed, reset behavior, security configuration, probe settings, or cabling can all prevent a valid attach.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>JTAG and SWD provide a recovery path beneath normal firmware services.</strong> The technician’s job is not merely to make the probe connect; it is to establish the correct electrical interface, identify the target, capture evidence, make the smallest authorized change, and verify recovery without destroying information that could explain the original failure.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=IC108KdVYz4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=IC108KdVYz4</div><figcaption class="wp-element-caption"><em>38C3 — Demystifying Common Microcontroller Debug Protocols. Covers JTAG, SWD, memory access, flash programming, breakpoints, and processor control.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:paragraph --><p><em>Safety and engineering note: Debug headers can expose powered logic and can permit destructive flash or security operations. Use the exact board documentation, ESD controls, authorized firmware, approved procedures, and current probe/target documentation for production work.</em></p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=0Jtp0FRvwP4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">https://www.youtube.com/watch?v=0Jtp0FRvwP4</div><figcaption class="wp-element-caption"><em>SEGGER Microcontroller — J-Link Commander. Demonstrates connecting a debug probe and using command-line target-analysis functions.</em></figcaption></figure><!-- /wp:embed -->