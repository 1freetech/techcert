---
title: "OSFEC.004: Linker Scripts and Startup Code — Memory Sections, Vector Tables, Stack, Heap, and Map Files"
status: published
wordpress_post_id: 21374
published: "2026-10-06T18:40:46"
live_url: "https://bitcoinversus.tech/2026/10/06/osfec-004-linker-scripts-startup-code-memory-sections-vector-tables-stack-heap-map-files/"
series: "Open Source Firmware Engineer Certification"
subject: firmware_engineer
lesson_number: "004"
featured_media_id: 21373
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/osfec-004-linker-startup-memory-cover-1200x630-1.jpg"
youtube_1: "https://www.youtube.com/watch?v=UdkuoHSp_0s"
youtube_2: "https://www.youtube.com/watch?v=B7oKdUvRhQQ"
youtube_3: "https://www.youtube.com/watch?v=5aafG5mjZ_Y"
youtube_4: "https://www.youtube.com/watch?v=7stymN3eYw0"
youtube_5: "https://www.youtube.com/watch?v=y9nIB2YK4xw"
youtube_6: "https://www.youtube.com/watch?v=U4HirlTbTBw"
youtube_7: "https://www.youtube.com/watch?v=J8tf3JeQNC0"
youtube_8: "https://www.youtube.com/watch?v=XGTtMYa7IiM"
youtube_9: "https://www.youtube.com/watch?v=meiq0LsNaEw"
---

<!-- wp:heading --><h2 class="wp-block-heading">Elementary Overview</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/"><strong>microcontroller</strong></a> does not automatically know where a compiled program belongs in memory. The <strong>linker script</strong> tells the build system which parts of the program belong in <strong>Flash</strong> and which parts need <strong>RAM</strong>; the <strong>startup code</strong> then prepares those memory regions before <code>main()</code> begins. The vector table tells an Arm Cortex-M processor where the initial stack and interrupt handlers are located, while the stack and heap reserve RAM for temporary function state and dynamic allocation. This lesson connects the architecture from <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/">OSFEC.001</a>, the task memory demands of <a href="https://bitcoinversus.tech/2026/10/05/osfec-002-real-time-firmware-scheduling-superloops-rtos-tasks-priorities-preemption-timing/">OSFEC.002</a>, and the <a href="https://bitcoinversus.tech/2026/10/05/osfec-003-hardware-debugging-jtag-swd-openocd-gdb/">GDB/OpenOCD debugging workflow</a> from OSFEC.003.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=UdkuoHSp_0s","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=UdkuoHSp_0s
</div><figcaption class="wp-element-caption"><em>TechVedas — embedded memory layout, Flash, SRAM, .data, .bss, stack, heap, and linker-script fundamentals.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">The Linker Script Turns a Memory Map Into an Executable Layout</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A compiler produces object files containing code and data, but the <strong>linker</strong> decides their final addresses. A GNU linker script commonly defines memory regions such as <code>FLASH</code> and <code>RAM</code>, then maps output sections into those regions. On a Cortex-M device with Flash beginning at <code>0x08000000</code> and SRAM beginning at <code>0x20000000</code>, the linker script can place the vector table and program code in nonvolatile Flash while reserving writable data for SRAM. This is the software expression of the hardware <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/">memory map</a>; if the addresses, sizes, alignment, or region permissions are wrong, a perfectly valid C or C++ program can still fail before normal application logic runs.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=B7oKdUvRhQQ","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=B7oKdUvRhQQ
</div><figcaption class="wp-element-caption"><em>Fastbit Embedded Brain Academy — writing GNU linker scripts and controlling section placement.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">.text, .rodata, .data, and .bss Have Different Jobs</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The <strong>.text</strong> section normally contains executable instructions, while <strong>.rodata</strong> stores read-only constants; both can usually remain in Flash. <strong>.data</strong> contains writable variables that have nonzero initial values, so their initial bytes are stored in the firmware image but copied into RAM during startup. <strong>.bss</strong> contains zero-initialized or uninitialized static-storage objects and usually consumes RAM without requiring equivalent initialized bytes in the Flash image. The linker also emits symbols that startup code can use to locate the beginning and end of these regions. Reading the generated <strong>map file</strong> makes these relationships visible and helps explain why a binary can run out of SRAM even when plenty of Flash remains.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=5aafG5mjZ_Y","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=5aafG5mjZ_Y
</div><figcaption class="wp-element-caption"><em>Fastbit Embedded Brain Academy — linking object files, linker symbols, reset-handler work, and analyzing the memory map file.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Startup Code Builds the C Runtime Before main()</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>After reset, low-level <strong>startup code</strong> creates the environment expected by compiled C or C++. A typical <strong>Reset_Handler</strong> copies the initial values for <code>.data</code> from their load address in Flash to their run address in RAM, fills <code>.bss</code> with zeros, performs any processor or clock initialization required by the platform, may call C/C++ runtime constructors, and finally branches to <code>main()</code>. If the copy boundaries are wrong, initialized global variables contain bad values; if <code>.bss</code> is not cleared, code that assumes zero initialization starts with unpredictable state. These failures often appear in early <a href="https://bitcoinversus.tech/2026/10/05/osftc-002-serial-console-boot-logs-uart-baud-rate-pinouts-capture-recovery/">boot logs</a> or under a hardware debugger before the application reaches its normal scheduler.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=7stymN3eYw0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=7stymN3eYw0
</div><figcaption class="wp-element-caption"><em>EmbeddedGeek — STM32 startup code and the Cortex-M boot process, including implementing startup logic in C.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">The Vector Table Connects Reset and Interrupts to Code</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>On a typical Arm Cortex-M reset sequence, the processor obtains the initial <strong>Main Stack Pointer (MSP)</strong> from the first vector-table entry and the <strong>reset vector</strong> from the next entry, then begins fetching instructions from the reset handler. Additional table entries identify exception and <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/">interrupt</a> handlers. The vector table therefore has both a linker-placement requirement and a runtime meaning: the image must place it where the processor or vector-table offset configuration expects it. A bootloader may relocate or replace this table when handing control to an application image, which is why vector-base errors can make a firmware image appear to flash successfully but fault immediately after reset.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=y9nIB2YK4xw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=y9nIB2YK4xw
</div><figcaption class="wp-element-caption"><em>Pyjama Cafe — Cortex-M CPU boot-up and vector-table behavior, including initial stack pointer and reset vector.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Stack and Heap Turn Remaining RAM Into Runtime Capacity</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The <strong>stack</strong> stores call frames, return state, local variables, saved registers, and interrupt or exception context. The <strong>heap</strong> supplies dynamic allocations such as <code>malloc()</code> when the firmware chooses to use them. In an <a href="https://bitcoinversus.tech/2026/10/05/osfec-002-real-time-firmware-scheduling-superloops-rtos-tasks-priorities-preemption-timing/">RTOS</a>, each task may also receive its own stack, making stack sizing a system-level memory-budget problem rather than one global number. Stack overflow, heap fragmentation, allocation failure, or stack/heap collision can corrupt unrelated data and create failures that look random. Engineers therefore inspect linker boundaries, RTOS stack high-water marks, static-analysis estimates, fault addresses, and worst-case call depth instead of assuming unused-looking RAM is safe capacity.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=U4HirlTbTBw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=U4HirlTbTBw
</div><figcaption class="wp-element-caption"><em>Embedded Programmer — stack versus heap and the .text, .data, and .bss memory segments in embedded C.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Load Address and Run Address Can Be Different</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Advanced linker layouts distinguish where bytes are <strong>stored</strong> from where they <strong>execute</strong>. Code can be stored in Flash but copied to RAM for faster execution; initialized data can be stored in Flash yet run from SRAM; bootloaders and application images can occupy separate Flash banks; and special sections can be aligned for DMA, caches, nonvolatile settings, or memory-protection boundaries. GNU linker scripts express these choices with region placement and load addresses, while startup code performs any required copying. This same concept matters during the <a href="https://bitcoinversus.tech/2026/10/06/osftc-004-firmware-flashing-interfaces-usb-dfu-swd-jtag-spi-programmers-bootloader-modes-write-verification/">firmware flashing</a> process because a programmer writes the stored image, not an abstract view of where every section will eventually execute.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=J8tf3JeQNC0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=J8tf3JeQNC0
</div><figcaption class="wp-element-caption"><em>STM32 linker-script example showing startup code in Flash and executable sections relocated to RAM.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Verify the Built Image Before Blaming the Hardware</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A firmware engineer should inspect the build artifacts before treating a boot failure as an electrical problem. The ELF file, linker map, section sizes, symbols, disassembly, and debugger memory reads can prove where the toolchain actually placed code and data. Useful GNU Arm commands include <code>arm-none-eabi-size firmware.elf</code>, <code>arm-none-eabi-objdump -h firmware.elf</code>, and <code>arm-none-eabi-nm -n firmware.elf</code>; the exact tool names depend on the installed toolchain. Then <a href="https://bitcoinversus.tech/2026/10/05/osfec-003-hardware-debugging-jtag-swd-openocd-gdb/">OpenOCD and GDB</a> can halt the target, inspect the program counter and stack pointer, compare the vector table against the ELF, and verify whether execution reached the reset handler or <code>main()</code>. This evidence-first workflow complements the checksums, golden images, and rollback discipline in <a href="https://bitcoinversus.tech/2026/10/05/osftc-003-firmware-backup-recovery-checksums-golden-images-rollback-validation/">OSFTC.003</a>.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=XGTtMYa7IiM","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=XGTtMYa7IiM
</div><figcaption class="wp-element-caption"><em>DigiKey — debugging embedded targets with OpenOCD and GDB, including breakpoints, stepping, and memory inspection.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Minimal GNU Linker-Script Example</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code" style="white-space:pre-wrap;max-width:100%"><code>MEMORY
{
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 512K
  RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{
  .isr_vector : { KEEP(*(.isr_vector)) } &gt; FLASH
  .text       : { *(.text*) *(.rodata*) } &gt; FLASH
  .data       : { *(.data*) } &gt; RAM AT&gt; FLASH
  .bss        : { *(.bss*) *(COMMON) } &gt; RAM
}</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Worked Example</h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li><strong>Flash:</strong> 512 KiB beginning at 0x08000000.</li><li><strong>SRAM:</strong> 128 KiB beginning at 0x20000000.</li><li><strong>.text + .rodata:</strong> 92 KiB stored and executed from Flash.</li><li><strong>.data:</strong> 6 KiB of initialized variables stored in the Flash image and copied to SRAM at reset.</li><li><strong>.bss:</strong> 18 KiB of SRAM zeroed during startup.</li><li><strong>RTOS task stacks:</strong> six tasks × 2 KiB = 12 KiB reserved.</li><li><strong>Remaining SRAM before heap, buffers, interrupt stack, and margin:</strong> approximately 92 KiB.</li><li><strong>Engineering conclusion:</strong> Flash utilization alone cannot establish memory safety; RAM must be budgeted across sections, stacks, buffers, heap, DMA needs, and reserve margin.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Engineering Checklist</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Confirm the MCU Flash and RAM origins and lengths from the device memory map.</li><li>Confirm the vector table is placed at the address expected after reset or bootloader handoff.</li><li>Verify .text, .rodata, .data, and .bss placement in the linker map.</li><li>Verify startup code copies initialized data and clears .bss before application use.</li><li>Check linker symbols used by Reset_Handler against the generated map file.</li><li>Budget stack, RTOS task stacks, heap, DMA buffers, and persistent buffers explicitly.</li><li>Check alignment requirements for vectors, DMA, caches, and special memory regions.</li><li>Inspect the ELF with size, objdump, nm, or equivalent toolchain utilities.</li><li>Compare debugger PC/SP and vector-table contents against the exact ELF build.</li><li>Archive the map file and build identity with the firmware release.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Explain why .data needs both a load address and a run address on a typical MCU.</li><li>Explain why .bss consumes RAM but usually does not need equivalent initialized bytes in the firmware image.</li><li>Draw the reset sequence from vector-table fetch through Reset_Handler to main().</li><li>Given 64 KiB SRAM, calculate remaining capacity after 8 KiB .data, 20 KiB .bss, and four 4 KiB task stacks.</li><li>Describe what could happen if the initial stack pointer in the vector table points outside valid SRAM.</li><li>Use a sample map file and identify the largest five symbols consuming SRAM.</li><li>Explain when executing selected code from RAM can be useful.</li><li>Describe how GDB can distinguish “never reached Reset_Handler” from “failed after entering main().”</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge Check + Answers</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>What does a linker script control?</strong> It assigns compiled sections and symbols to addresses and memory regions in the final executable image.</li><li><strong>Where does .text usually live?</strong> In nonvolatile program memory such as Flash.</li><li><strong>Why is .data copied at startup?</strong> Its initial values are stored in the firmware image, but writable variables must run from RAM.</li><li><strong>Why is .bss cleared?</strong> C and C++ require zero initialization for objects with static storage duration that do not have explicit nonzero initializers.</li><li><strong>What are the first two Cortex-M vector entries normally used for?</strong> The initial main stack pointer and reset-handler address.</li><li><strong>What does a map file provide?</strong> A human-readable view of linked sections, addresses, sizes, symbols, and object-file contributions.</li><li><strong>Why can an RTOS increase RAM pressure?</strong> Multiple tasks commonly require separate stacks plus kernel objects and communication buffers.</li><li><strong>Why keep the exact ELF and map file for a release?</strong> They let engineers translate addresses, crashes, and debugger state back to the exact firmware layout that shipped.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Elementary Conclusion</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A firmware program is like a set of supplies that must be placed in the correct rooms before work can begin. The linker script decides which pieces belong in Flash and which belong in RAM. The vector table tells the processor where its first stack and first instruction are. Startup code moves initialized information into RAM, clears the area that must begin at zero, and then starts the normal program. The stack holds temporary work for functions and interrupts, while the heap can supply memory that is requested while the system is running. When engineers read the map file and compare it with the real <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/">microcontroller memory map</a>, they can explain where every important byte went instead of guessing. That is what turns a compiled firmware file into a predictable system that can boot, run, and be debugged reliably.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=meiq0LsNaEw","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=meiq0LsNaEw
</div><figcaption class="wp-element-caption"><em>Embedded Software for Dummies — practical embedded-C explanation of static memory, stack, heap, RTOS task stacks, and linker-map analysis.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->