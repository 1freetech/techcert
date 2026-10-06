<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Hardware debugging gives a firmware engineer controlled access to a running processor below the application interface.</strong> A debug probe and target debug port can halt execution, inspect registers and memory, set breakpoints, single-step instructions, and expose failures that logs alone cannot explain.</p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=XGTtMYa7IiM","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=XGTtMYa7IiM
</div><figcaption class="wp-element-caption"><em>DigiKey — Introduction to Zephyr Part 7: Debugging with OpenOCD and GDB. Demonstrates JTAG hardware debugging, OpenOCD, GDB commands, breakpoints, stepping, variable inspection, and VS Code integration.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:paragraph --><p>OSFEC.003 continues the Open Source Firmware Engineer Certification from <a href="https://bitcoinversus.tech/2026/10/05/osfec-002-real-time-firmware-scheduling-superloops-rtos-tasks-priorities-preemption-timing/"><strong>OSFEC.002: Real-Time Firmware Scheduling</strong></a>. It also builds on <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/"><strong>OSFEC.001: Microcontroller Architecture</strong></a> and the recovery workflow in <a href="https://bitcoinversus.tech/2026/10/05/osftc-003-firmware-backup-recovery-checksums-golden-images-rollback-validation/"><strong>OSFTC.003: Firmware Backup and Recovery</strong></a>.</p><!-- /wp:paragraph -->



<!-- wp:heading --><h2 class="wp-block-heading">Learning objectives</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Explain the roles of JTAG, SWD, a debug probe, OpenOCD, and GDB.</li><li>Establish a target connection without assuming voltage, interface, or device configuration.</li><li>Use halt, continue, step, next, breakpoints, register reads, memory reads, and backtraces.</li><li>Relate source-level debugging to machine state and the target memory map.</li><li>Recognize optimized-code, timing, reset, and concurrency effects that can mislead a debugger.</li><li>Build a repeatable evidence-first debugging workflow.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">The hardware-debugging stack</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The debugging path contains several layers. The target MCU or SoC exposes a hardware debug interface such as JTAG or Arm Serial Wire Debug. A physical probe translates that electrical protocol to a host connection. OpenOCD can control the probe and expose a GDB server, while GDB provides source-level and machine-level inspection.</p><!-- /wp:paragraph -->



<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>Host workstation
      |
      v
GDB client    OpenOCD
                              |
                              v
                         Debug probe
                              |
                         JTAG or SWD
                              |
                              v
                         Target MCU/SoC</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">JTAG and SWD</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>JTAG commonly uses TCK, TMS, TDI, and TDO plus ground and optional reset signals. SWD uses SWCLK and bidirectional SWDIO for Arm debug access, reducing pin count. Neither interface should be connected from appearance alone: the engineer must verify the board pinout, target reference voltage, ground, reset behavior, and processor documentation.</p><!-- /wp:paragraph -->



<!-- wp:heading --><h2 class="wp-block-heading">OpenOCD as the bridge</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Open On-Chip Debugger, commonly called OpenOCD, provides a software layer between a supported probe and a target. Its configuration identifies the adapter, transport, and target family. When the connection succeeds, OpenOCD can provide services such as a GDB server so a debugger can control the target through a standard remote-debugging protocol.</p><!-- /wp:paragraph -->



<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>openocd -f interface/&lt;probe&gt;.cfg -f target/&lt;target&gt;.cfg

# A common GDB-server endpoint is localhost:3333.
# Use the exact interface and target configuration for the hardware.</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">GDB remote debugging</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>GDB can load symbol information from the compiled ELF file while the executable code runs on the target. The symbol file maps machine addresses to functions, variables, types, and source lines. The remote connection then lets GDB ask OpenOCD to halt, resume, read state, and manage breakpoints on the physical processor.</p><!-- /wp:paragraph -->



<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>arm-none-eabi-gdb build/firmware.elf
(gdb) target extended-remote :3333
(gdb) monitor reset halt
(gdb) break main
(gdb) continue</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Breakpoints</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A breakpoint stops execution when the processor reaches a selected address or source location. Hardware breakpoints are especially important when code executes from flash, because flash cannot generally be patched like RAM to insert a software breakpoint. Microcontrollers therefore have a finite number of hardware breakpoint resources.</p><!-- /wp:paragraph -->



<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>(gdb) break main
(gdb) break control_loop
(gdb) info breakpoints
(gdb) disable 2
(gdb) delete 2</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Stepping through code</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The commands step and next answer different questions. Step enters a called function when debug information permits it, while next generally executes the current source line without descending into each call. At the instruction level, stepi and nexti operate on machine instructions and are useful when source-level behavior is distorted by optimization or startup assembly.</p><!-- /wp:paragraph -->



<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>(gdb) step
(gdb) next
(gdb) stepi
(gdb) nexti
(gdb) continue</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Registers and processor state</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Register inspection connects source code to the architecture introduced in OSFEC.001. The program counter indicates the current execution address, the stack pointer locates the active stack, general-purpose registers hold intermediate state, and processor status registers describe execution mode and condition state. On a fault, these values can reveal where execution stopped and what context was active.</p><!-- /wp:paragraph -->



<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>(gdb) info registers
(gdb) p/x $pc
(gdb) p/x $sp
(gdb) x/16wx $sp</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Memory inspection</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>GDB's examine command can display memory using an address, count, format, and unit size. Firmware engineers use memory reads to inspect stacks, buffers, peripheral registers, vector tables, and known structures. An address should always be interpreted through the target memory map; a numeric value without architectural context can be misleading.</p><!-- /wp:paragraph -->



<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>(gdb) x/16wx 0x20000000
(gdb) x/32bx buffer
(gdb) p/x variable
(gdb) p *pointer</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Call stacks and backtraces</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A backtrace reconstructs the active chain of function calls from available stack and debug information. It is often the fastest way to determine how execution reached a fault or breakpoint. Corrupted stacks, aggressive optimization, exception frames, hand-written assembly, or missing unwind information can make a backtrace incomplete, so it should be treated as evidence rather than infallible truth.</p><!-- /wp:paragraph -->



<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>(gdb) backtrace
(gdb) frame 0
(gdb) info locals
(gdb) up
(gdb) down</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Watchpoints</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A watchpoint asks the debugger to stop when a selected memory value changes. This is valuable when a variable is being corrupted but the writing code is unknown. Hardware watchpoint resources are limited, and the supported access sizes and address alignments depend on the processor's debug architecture.</p><!-- /wp:paragraph -->



<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>(gdb) watch shared_state
(gdb) rwatch status_register
(gdb) awatch buffer[0]
(gdb) info watchpoints</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Optimization changes what the debugger sees</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Optimized firmware does not preserve a one-to-one relationship between source lines and machine instructions. Variables can be kept only in registers, folded into constants, reordered, or eliminated. Functions can be inlined. When a debugger reports that a variable is optimized out, the engineer should inspect disassembly, registers, compiler options, and the generated ELF rather than assuming the debugger is defective.</p><!-- /wp:paragraph -->



<!-- wp:heading --><h2 class="wp-block-heading">Debugging can change timing</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Halting a processor changes the behavior of a real-time system. Peripherals, watchdogs, DMA engines, network peers, motor-control hardware, and external devices may continue operating while the CPU is stopped, or they may stop depending on debug-freeze configuration. A bug that disappears under single-stepping may therefore be a timing-sensitive Heisenbug rather than a solved problem.</p><!-- /wp:paragraph -->



<!-- wp:heading --><h2 class="wp-block-heading">Reset and connect-under-reset</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Some firmware becomes difficult to attach to after startup because it changes clocks, enters low-power modes, remaps pins, triggers a watchdog, or configures security features. A probe that supports connect-under-reset can establish debug control while reset is asserted or during the reset sequence, allowing the engineer to halt before the problematic firmware state develops.</p><!-- /wp:paragraph -->



<!-- wp:heading --><h2 class="wp-block-heading">Fault debugging workflow</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A disciplined fault investigation begins by preserving state. Before modifying flash or repeatedly resetting the system, capture the program counter, stack pointer, fault-status registers, backtrace, relevant memory, firmware build identity, and reproduction conditions. This makes the investigation repeatable and protects evidence that may disappear after recovery actions.</p><!-- /wp:paragraph -->



<!-- wp:list --><ul class="wp-block-list"><li>Record exact hardware revision and target device.</li><li>Record firmware version, ELF/build ID, compiler, and optimization level.</li><li>Connect at a conservative debug clock.</li><li>Halt only when necessary and record whether peripherals continue running.</li><li>Capture registers, backtrace, stack memory, and fault registers.</li><li>Compare addresses against the exact ELF and map file.</li><li>Reproduce with the smallest controlled change.</li><li>Verify the fix under normal timing without a debugger attached.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">A minimal OpenOCD and GDB session</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The following sequence illustrates the shape of a basic session, not a universal command recipe. Probe names, target files, reset configuration, executable names, architecture-specific GDB binaries, and server ports vary. The board and tool documentation should define the authoritative configuration.</p><!-- /wp:paragraph -->



<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>openocd -f interface/probe.cfg -f target/target.cfg

# In another terminal:
arm-none-eabi-gdb build/firmware.elf
(gdb) target extended-remote localhost:3333
(gdb) monitor reset halt
(gdb) info registers
(gdb) break main
(gdb) continue
(gdb) next
(gdb) backtrace</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>Draw the complete path from GDB to a target MCU when OpenOCD and an SWD probe are used.</li><li>Explain why the ELF file is more useful to GDB than a raw .bin image.</li><li>Create a command sequence that halts a target, prints registers, inspects 16 words of SRAM, sets a breakpoint at main, and resumes.</li><li>Explain why a hardware breakpoint may be required for code executing from flash.</li><li>Describe how a watchpoint could identify an unexpected write to a shared state variable.</li><li>List three reasons a backtrace might be incomplete or misleading.</li><li>Explain how halting a processor can change watchdog, DMA, or real-time behavior.</li><li>Design an evidence checklist for investigating a Cortex-M hard fault.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>What does OpenOCD do?</strong><br>It connects supported debug adapters and targets and can expose services such as a GDB server for hardware debugging.</li><li><strong>Why does GDB need the ELF file?</strong><br>The ELF can contain executable layout, symbols, types, addresses, and debug information that map machine state back to source code.</li><li><strong>What is the difference between a breakpoint and a watchpoint?</strong><br>A breakpoint stops at an execution location; a watchpoint stops when a selected memory access or value change occurs.</li><li><strong>Why can optimized firmware look strange in GDB?</strong><br>The compiler may inline, reorder, combine, move, or eliminate source-level objects while preserving program semantics.</li><li><strong>Why can single-stepping hide a bug?</strong><br>Stopping execution changes timing and interactions with interrupts, peripherals, DMA, watchdogs, and external systems.</li><li><strong>What should be captured before destructive recovery?</strong><br>Build identity, registers, fault state, stack/backtrace evidence, relevant memory, hardware revision, and reproduction conditions.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Hardware debugging is an evidence system, not merely a way to pause code.</strong> JTAG or SWD exposes processor debug access, a probe connects that interface to the host, OpenOCD can translate probe and target operations into a remote-debugging service, and GDB turns machine state into inspectable source-level information. Strong firmware engineering uses those layers deliberately while accounting for optimization, timing changes, limited hardware debug resources, and the possibility that the debugger itself changes system behavior.</p><!-- /wp:paragraph -->



<!-- wp:paragraph --><p><em>Engineering note: Debug access can halt safety-critical control, modify memory, erase flash, change security state, and alter timing. Production debugging must follow the target vendor documentation, electrical limits, organizational authorization, ESD requirements, and system safety procedures.</em></p><!-- /wp:paragraph -->



<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->

<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->