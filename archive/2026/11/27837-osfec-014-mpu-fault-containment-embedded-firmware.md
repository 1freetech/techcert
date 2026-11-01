---
lesson_id: "OSFEC.014"
track: firmware_engineer
post_id: 27837
title: "Memory Protection Units and Fault Containment in Embedded Firmware"
url: "https://bitcoinversus.tech/2026/11/01/osfec-014-memory-protection-units-fault-containment-embedded-firmware/"
published: "2026-11-01"
preceding_lesson: "OSFEC.013, Hardware-in-the-Loop Firmware Testing"
featured_media_id: 27832
featured_dimensions: "1200x630"
featured_style: "Realistic editorial photo style, fictional Latina woman senior engineer aged 40s–50s"
in_story_media_count: 5
in_story_photo_ids: [27826, 27828, 27830]
in_story_youtube_ids: ["5xVKIGCPy2s", "GK9862hTl64"]
wordpress_youtube_block_type: core/shortcode
media_qa: "WordPress rendered HTML confirms both YouTube iframe src values and all three credited in-body photos. Independent end-user playback and desktop/mobile visual screenshots not verified."
footer_qr_media_id: 24043
sources: ["ST AN4838 March 2026", "Zephyr Memory Protection Design", "Memfault Interrupt"]
---

<!-- wp:paragraph --><p><strong>A memory protection unit (MPU)</strong> is a hardware feature that checks whether the processor is permitted to read, write or execute instructions at a given memory address. In embedded firmware, an incorrectly calculated pointer, runaway task or corrupted stack can damage important state long before the original programming mistake is obvious. An MPU can turn some of these silent corruptions into detectable access faults. This Firmware Engineer course entry is cataloged as <strong>OSFEC.014</strong>. It follows <a href="https://bitcoinversus.tech/2026/10/29/osfec-013-hardware-in-the-loop-firmware-testing-test-rigs-fault-injection-ci/">hardware-in-the-loop firmware testing</a>, connecting the design of protection rules with repeatable validation on a real microcontroller.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The objective is not to suggest that every Cortex-M chip has the same MPU or that turning one on makes firmware secure. This lesson distinguishes hardware permissions from operating-system isolation, explains what an access violation can tell the engineer, and develops a measured lab workflow. The most authoritative starting point is <a href="https://www.st.com/content/st_com/en/technical-documents/an4838-introduction-to-memory-protection-unit-management-on-stm32-mcus-stmicroelectronics.html">STMicroelectronics application note AN4838, Revision 11, March 2026</a>, supplemented by the exact processor programming manual and the installed RTOS documentation.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Elementary overview</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A microcontroller is a small computer on a chip. It may hold instructions in flash memory, working variables in SRAM, and hardware-control registers at fixed addresses. Without properly configured protection, software that computes the wrong address can access memory intended for something else. In an industrial control board, for example, a sensor task might accidentally overwrite a data buffer used by a safety-monitoring function. Even if the processor keeps running, the resulting output may be wrong.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The MPU is like a set of guarded zones in that address space. It does <strong>not</strong> move bytes, translate virtual addresses, increase physical RAM or substitute for a memory management unit (MMU) in a desktop operating system. Instead, it examines accesses made by the processor and applies programmed permissions. A rule can prohibit execution from a data buffer, prevent an unprivileged task from altering kernel memory, or deny access to a stack guard. Supported features vary by core, device implementation and processor mode.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":27826,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/osfec014-stm32-nucleo-ordercrazy-cc0.jpg" alt="Photograph of an actual STM32 Nucleo F411RE Cortex-M4 microcontroller development board" class="wp-image-27826" /><figcaption class="wp-element-caption"><em>A real STM32 Nucleo F411RE evaluation board. Photo: <a href="https://commons.wikimedia.org/wiki/File:Embedded_World_2016,_Stm32_Nucleo.jpg">Ordercrazy / Wikimedia Commons</a>, CC0 1.0. Confirm the exact MCU's MPU implementation before using any example configuration.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:heading --><h2 class="wp-block-heading">Which memory can be protected?</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Firmware engineers begin with the linker map, the microcontroller's reference manual and the memory architecture. Common sections include <code>.text</code> for program instructions, <code>.rodata</code> for constant data, <code>.data</code> for initialized writable variables and <code>.bss</code> for zero-initialized storage. Stacks, heaps, shared buffers and peripheral registers need separate consideration. Those sections do not automatically become individual MPU regions: the linker layout and protection granularity must be compatible with the hardware.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The key permissions are <strong>read, write and execute</strong>, together with processor privilege. <strong>Execute Never (XN)</strong> means an instruction fetch is prohibited even if data reads are allowed. Memory attributes such as Normal versus Device and cacheability also matter. Incorrectly marking peripheral registers as ordinary cacheable memory can produce dangerous behavior. Engineers should never copy a region table between MCU families without validating these constraints.</p><!-- /wp:paragraph -->

<!-- wp:table --><figure class="wp-block-table"><table><thead><tr><th>Memory area</th><th>Illustrative access policy</th><th>Why</th></tr></thead><tbody><tr><td>Application flash text</td><td>Read, execute; no ordinary writes</td><td>Run approved instructions without unintended modification</td></tr><tr><td>Read-only constants</td><td>Read-only, execute-never where separately representable</td><td>Protect lookup tables and immutable parameters</td></tr><tr><td>Application SRAM</td><td>Read/write, execute-never</td><td>Permit variables while preventing instruction fetches from data</td></tr><tr><td>Peripheral register window</td><td>Restricted privileged access, Device type, execute-never</td><td>Avoid accidental register edits and improper memory ordering</td></tr><tr><td>Kernel/private RTOS state</td><td>Privileged access only</td><td>Keep untrusted tasks from corrupting scheduling and system control</td></tr><tr><td>Task stack guard</td><td>No access, where supported</td><td>Detect growth into a prohibited address range</td></tr></tbody></table><figcaption class="wp-element-caption"><em>Conceptual policy, not a ready-to-flash MPU configuration. Real region counts, alignment, overlap rules, attributes and privilege handling depend on the MCU architecture and RTOS.</em></figcaption></figure><!-- /wp:table -->

<!-- wp:paragraph --><p>For some Armv7-M MPUs, region sizes follow power-of-two and alignment restrictions; priority and eligible subregions can matter when regions overlap. Newer Armv8-M implementations use base-and-limit region definitions with different rules. ST's AN4838 explicitly separates these architectural families. The table above is deliberately conceptual: it is a security policy to translate into device-specific code, not a literal configuration register dump.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">How a Memory Protection Unit works</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>When the core attempts a load, store or instruction fetch, the MPU compares the access address with its configured regions and the executing code's privilege level. A permitted access proceeds normally. A prohibited instruction or data access can raise a <strong>MemManage fault</strong> on applicable Cortex-M devices. If configurable fault handling is disabled or a fault escalates, the observable event may be a HardFault instead. Engineers must examine the actual exception state rather than assuming every firmware crash originated in the MPU.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This video explains why STM32 firmware uses memory regions and access permissions. The second half of the lesson applies the concepts to an RTOS with isolated tasks.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=5xVKIGCPy2s]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=5xVKIGCPy2s">ControllersTech — STM32 MPU Config: Need for the Memory Protection Unit</a> (July 2021). Relevant introduction to MPU motivations and memory-region protection.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>In practice, the desired outcome is <strong>fault containment</strong>, not merely an exception message. The protection policy should stop a malfunctioning component from silently damaging unrelated state. It should also preserve enough diagnostic information to understand what happened. There is no guarantee that a corrupted privileged task can be safely restarted. Systems with hazardous physical outputs must enter a verified safe state if execution integrity is in doubt.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Permissions, privilege and trust boundaries</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>On supported Cortex-M systems, privileged firmware and unprivileged application code can have different memory-access rights. A kernel may need privileged access to interrupt-control registers and scheduling structures, while an application thread should see only its stack, executable code, approved shared buffers and explicit interfaces. The separation is more useful when the operating system enforces it consistently: user tasks call validated system services instead of manipulating privileged control blocks or peripheral registers directly.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Some processors have a privileged default-background-map option, often named <code>PRIVDEFENA</code>. Depending on the configuration, privileged code may be able to access addresses without an explicit MPU region while unprivileged code cannot. This flexibility can also conceal gaps in the intended isolation policy. The implementation must test <strong>both permitted and denied operations</strong> in the actual privilege modes that will run in production.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":27828,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/osfec014-stm32-microcontroller-microstm32-golonlutoj-cc-by-sa.jpg" alt="Optical inspection microscope photograph of an STM32F103R6T6 Arm Cortex microcontroller package" class="wp-image-27828" /><figcaption class="wp-element-caption"><em>Photograph of an STM32F103 microcontroller package, by <a href="https://commons.wikimedia.org/wiki/File:MicroSTM32.jpg">Golonlutoj / Wikimedia Commons</a>, <a href="https://creativecommons.org/licenses/by-sa/3.0/">CC BY-SA 3.0</a>, unchanged. A physical MCU image; it is not a memory-map diagram.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:heading --><h2 class="wp-block-heading">Protecting real-time operating-system tasks</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>An RTOS such as Zephyr can combine processor privilege with memory domains and user-mode threads. In Zephyr's <a href="https://docs.zephyrproject.org/latest/kernel/usermode/memory_domain.html">Memory Protection Design</a>, a user thread has its own stack, code and read-only data plus any explicitly granted regions. Memory partitions let developers share buffers among intended threads without granting blanket access to all SRAM. Protection resources are limited by the MCU's available MPU regions, so application structure and region allocation are real engineering constraints.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A typical design might isolate telemetry parsing from a motor-control kernel. The telemetry task receives only the packet buffers it needs. The kernel validates any requests that cross into privileged services. A malformed packet must not be able to edit the motor driver's private state merely because both functions share one chip. This boundary can narrow the impact of a logic bug, but the application must also verify pointer lengths, integer arithmetic, device permissions and the lifetime of shared buffers.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The Linux Foundation presentation below discusses Zephyr's actual memory-protection design, including physical memory regions, user privileges and RTOS system calls. It is particularly useful for understanding why a microcontroller MPU cannot simply imitate the page tables of a general-purpose operating system.</p><!-- /wp:paragraph -->

<!-- wp:shortcode -->
[youtube https://www.youtube.com/watch?v=GK9862hTl64]
<!-- /wp:shortcode -->

<!-- wp:paragraph --><p><em>Video: <a href="https://www.youtube.com/watch?v=GK9862hTl64">The Linux Foundation — Zephyr OS Memory Protection, Andrew Boie</a> (May 2020). Presentation on RTOS userspace, protection domains and hardware MPU limitations.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Engineering the boot-time protection sequence</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Protection should be designed before it is enabled. Capture the board revision, exact MCU marking, compiler/linker configuration, bootloader address map, stack placement, RTOS task layout, interrupt execution model and DMA design. Confirm that the target device actually implements an MPU and identify the number of usable regions. Validate the flash and SRAM boundaries with the device manual; a development-board marketing description alone is insufficient.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Plan the address map:</strong> identify executable flash, constants, data, per-task stacks, peripherals, shared communication buffers and any memory-mapped external devices.</li><li><strong>Define least-privilege policy:</strong> document which tasks may read, write or execute each area and which operations require a trusted service call.</li><li><strong>Program architecture-specific regions:</strong> honor required alignment, region priority, size and memory-type constraints. A Cortex-M4 configuration is not automatically valid on Cortex-M33.</li><li><strong>Prepare fault diagnostics:</strong> enable applicable configurable fault handling, save registers in a safe way and define a non-reentrant reporting path.</li><li><strong>Enable with required synchronization:</strong> use the processor and vendor-recommended barrier sequence so changed protection state is recognized before code continues.</li><li><strong>Test on isolated hardware:</strong> use a protected bench fixture and a known-good recovery image before introducing deliberate denied accesses.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The following is <strong>pseudocode only</strong>. Its function names are descriptive, not CMSIS or STM32 HAL APIs. Production code must use the exact processor instructions, CMSIS definitions and vendor libraries for its target, and every mapping must be reviewed against the linker output.</p><!-- /wp:paragraph -->

<!-- wp:code --><pre class="wp-block-code"><code>// Teaching pseudocode — not a vendor driver or drop-in application
on_boot:
    verify_target_mcu_and_MPU_presence()
    examine_linker_map_and_required_boot_memory()
    configure_flash_for_instruction_fetch_without_app_writes()
    configure_application_sram_read_write_execute_never()
    configure_peripheral_windows_as_device_execute_never()
    restrict_kernel_state_and_assign_task_private_stacks()
    enable_architecture_appropriate_MemManage_diagnostics()
    apply_required_memory_barriers_and_enable_MPU()
    run_prepared_permitted_and_denied_access_tests()
    record_fault_status_and_restore_known_good_firmware()</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Fault registers and post-mortem evidence</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>For the applicable Cortex-M fault model, the configurable fault status register (<code>CFSR</code>) contains MemManage status bits. <code>IACCVIOL</code> indicates an instruction-access violation; <code>DACCVIOL</code> indicates a data-access violation; <code>MMARVALID</code> tells the debugger whether the MemManage fault address register (<code>MMFAR</code>) contains a valid address. Other status bits cover errors during exception stack entry, return or lazy state preservation. Not every fault populates the address register, and the stored address must never be used blindly when the valid bit is clear.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Preserve the faulting program counter, link register, stacked xPSR, processor privilege state and the applicable fault status. Correlate these with the firmware build ID and linker map. A crash address alone is not a root-cause explanation: determine the exact instruction and whether the address was supposed to be accessible. <a href="https://interrupt.memfault.com/blog/cortex-m-hardfault-debug">Memfault's Cortex-M HardFault debugging guide</a> provides register-by-register context. The preceding lesson on <a href="https://bitcoinversus.tech/2026/10/27/osfec-012-firmware-observability-structured-diagnostics/">structured observability</a> explains why durable event identifiers and timestamps are just as important.</p><!-- /wp:paragraph -->

<!-- wp:image {"id":27830,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/11/osfec014-pemicro-multilink-debug-probe-kmcneil-cc-by-sa.png" alt="Photograph of a real PEmicro Multilink ACP USB JTAG SWD debug probe used with Arm Cortex microcontrollers" class="wp-image-27830" /><figcaption class="wp-element-caption"><em>Real PEmicro Multilink ACP debug probe for JTAG/SWD. Photo by <a href="https://commons.wikimedia.org/wiki/File:PEmicro%27s_Multilink_ACP_Debug_Probe.png">KMcNeilWiki / Wikimedia Commons</a>, <a href="https://creativecommons.org/licenses/by-sa/4.0/">CC BY-SA 4.0</a>, unchanged. Debug equipment can inspect fault registers but cannot prove isolation on its own.</em></figcaption></figure><!-- /wp:image -->

<!-- wp:heading --><h2 class="wp-block-heading">Practical case study: a sensor task writes into another stack</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Imagine a controller with two RTOS threads. A sensor parser accepts framed packets and stores readings in a small buffer. A motor supervisor maintains a private stack and periodically updates a control register. A malformed packet causes an off-by-one write in the parser. Without a suitable memory boundary, the write might alter a neighboring task's data and trigger a motor-control problem minutes later. With well-designed MPU isolation, an unprivileged parser attempting an out-of-domain write should produce a memory-access fault instead.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The engineer first checks the task's allowed memory domain and the exact address of the failed write. If the fault status shows a data access violation, the recorded faulting instruction maps to the parser, and the attempted destination belongs to the motor supervisor's private stack, the evidence supports the isolation mechanism working as intended. The correct next step is to fix the parser's bounds checking and retest—not to enlarge the parser's permissions until the crash disappears.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A second test puts a deliberate guard region beyond a task stack. The RTOS may detect growth into the guard when it crosses that boundary, depending on the stack allocation and MPU behavior. Such a guard does <strong>not</strong> detect every out-of-bounds write, and features such as Zephyr's optional <code>CONFIG_HW_STACK_PROTECTION</code> impose platform-specific limits. The test must target a spare board or development emulator with verified recovery access, not equipment currently controlling motors or industrial loads.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">What the MPU does not protect</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>DMA writes:</strong> a CPU MPU is not normally a general memory firewall for independent bus masters. DMA engines may still write locations the CPU would be prohibited from accessing. Use DMA design controls, bus protection or an IOMMU where the hardware provides one.</li><li><strong>Privileged code defects:</strong> overly permissive privileged regions and unsafe system-call interfaces can defeat the intended boundary. MPU isolation is a layer, not proof of a secure kernel.</li><li><strong>Fault-free control outputs:</strong> a detected memory violation can still leave a relay, power stage or actuator in a hazardous state. Define and validate fail-safe actions.</li><li><strong>Flash-image authenticity:</strong> secure boot, cryptographic image verification and update rollback protections solve different problems. Connect this to <a href="https://bitcoinversus.tech/2026/10/27/osftc-013-firmware-image-integrity-hash-signature-verification/">firmware image integrity verification</a>.</li><li><strong>Functional verification:</strong> a few deliberate fault tests do not prove all regions are correct after every RTOS task switch or future firmware update. Keep repeatable hardware-in-the-loop regression tests.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">A repeatable laboratory validation checklist</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Record the device part number, bootloader version, clock configuration and exact toolchain/build ID.</li><li>Capture the linker map and show that stack boundaries and region alignments meet the target's MPU restrictions.</li><li>Verify intended read, write and execute operations in each applicable privilege mode before testing denied access.</li><li>Introduce one controlled bad access at a time: an unprivileged write to privileged memory, an attempted fetch from an XN data region, and—if supported—a guarded stack overrun.</li><li>Log <code>CFSR</code> and applicable fault-address state, the instruction location, task identity and whether fault handling was enabled. Check escalation behavior if the configurable exception is absent.</li><li>Confirm safe fallback and debugger recovery, restore the approved firmware, and compare the recorded result with the expected test matrix.</li><li>Add each confirmed failure mode to the HIL suite from <a href="https://bitcoinversus.tech/2026/10/29/osfec-013-hardware-in-the-loop-firmware-testing-test-rigs-fault-injection-ci/">the preceding Firmware Engineer lesson</a>.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Why is an MPU different from a general-purpose MMU, and why does the distinction matter on a microcontroller?</li><li>What does an Execute Never rule protect against?</li><li>Why should software check <code>MMARVALID</code> before interpreting <code>MMFAR</code>?</li><li>Why can a DMA transfer still damage a buffer that a CPU task is not allowed to write?</li><li>What would demonstrate that isolation is effective after a firmware update or an RTOS context switch?</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p><strong>Answers:</strong> An MPU enforces configured permissions on addresses without generally providing virtual-memory translation. XN rejects instruction fetches from protected data regions. The MMFAR address is not guaranteed valid without its status bit. A separate DMA bus master may bypass the CPU MPU, so other hardware or driver safeguards are required. Repeatable tests should validate both allowed and denied accesses with evidence from the intended privilege modes, representative context switches and current firmware builds.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">References and further study</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Read <a href="https://www.st.com/content/st_com/en/technical-documents/an4838-introduction-to-memory-protection-unit-management-on-stm32-mcus-stmicroelectronics.html">STMicroelectronics AN4838, Revision 11 (March 2026)</a>; <a href="https://docs.zephyrproject.org/latest/kernel/usermode/memory_domain.html">Zephyr Memory Protection Design</a>; <a href="https://docs.zephyrproject.org/latest/kernel/usermode/overview.html">Zephyr Userspace Overview</a>; <a href="https://interrupt.memfault.com/blog/fix-bugs-and-secure-firmware-with-the-mpu">Memfault — Fix Bugs and Secure Firmware with the MPU</a>; and <a href="https://interrupt.memfault.com/blog/cortex-m-hardfault-debug">Memfault — Cortex-M HardFault Debugging</a>. Continue in this curriculum with <a href="https://bitcoinversus.tech/2026/10/06/osfec-004-linker-scripts-startup-code-memory-sections-vector-tables-stack-heap-map-files/">Linker Scripts and Startup Code</a>, <a href="https://bitcoinversus.tech/2026/10/14/osfec-011-rtos-synchronization-concurrency/">RTOS Synchronization</a>, and <a href="https://bitcoinversus.tech/2026/10/13/osfec-010-fault-handling-post-mortem-architecture/">Fault Handling Architecture</a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em><strong>BitcoinVersus.Tech Editor's Note:</strong> We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our independent technical education and research, please scan the QR code below to donate <strong>5,000 sats</strong> (best results on a laptop or larger screen).</em></p><!-- /wp:paragraph -->

<!-- wp:image {"id":24043,"sizeSlug":"full","linkDestination":"none"} --><figure class="wp-block-image size-full"><img src="https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/bitcoinversus-donation-qr-5000-sats-original.png" alt="BitcoinVersus.Tech original Bitcoin donation QR code for 5,000 satoshis" class="wp-image-24043" /></figure><!-- /wp:image -->

<!-- wp:paragraph --><p><em>For mobile scanning, open this lesson on a laptop or larger screen and scan the QR code with a compatible Bitcoin wallet on your phone. Confirm the destination address before sending: <strong>3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</strong>.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</em></p><!-- /wp:paragraph -->