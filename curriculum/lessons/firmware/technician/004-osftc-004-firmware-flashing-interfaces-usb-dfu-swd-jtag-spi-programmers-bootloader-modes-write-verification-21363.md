---
title: "OSFTC.004: Firmware Flashing Interfaces — USB DFU, SWD/JTAG, SPI Programmers, Bootloader Modes, and Write Verification"
wordpress_post_id: 21363
source: BitcoinVersus.tech
published: 2026-10-06T18:03:32
modified: 2026-10-06T18:07:02
live_url: https://bitcoinversus.tech/2026/10/06/osftc-004-firmware-flashing-interfaces-usb-dfu-swd-jtag-spi-programmers-bootloader-modes-write-verification/
track: firmware/technician
lesson_number: 4
raw_source: 004-osftc-004-firmware-flashing-interfaces-usb-dfu-swd-jtag-spi-programmers-bootloader-modes-write-verification-21363.gutenberg.html
---

<!-- wp:heading --><h2 class="wp-block-heading">Elementary Overview</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/04/osftc-001-firmware-images-safe-flashing-bootloaders-recovery-basics/"><strong>Firmware flashing</strong></a> means writing a new program image into nonvolatile memory so a device can boot and run it later. The same firmware file can sometimes be written through several different paths: a built-in USB bootloader, a <a href="https://bitcoinversus.tech/2026/10/05/osfec-003-hardware-debugging-jtag-swd-openocd-gdb/">SWD/JTAG debug probe</a>, a serial bootloader, or a direct <strong>SPI flash programmer</strong>. The technician’s first job is therefore not simply to “flash the file,” but to identify the correct hardware, memory device, interface, voltage, image, and recovery path. This lesson builds on <a href="https://bitcoinversus.tech/2026/10/05/osftc-002-serial-console-boot-logs-uart-baud-rate-pinouts-capture-recovery/">OSFTC.002 serial consoles</a> and <a href="https://bitcoinversus.tech/2026/10/05/osftc-003-firmware-backup-recovery-checksums-golden-images-rollback-validation/">OSFTC.003 backup and recovery</a>.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Kx7yWVi8kbU","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Kx7yWVi8kbU
</div><figcaption class="wp-element-caption"><em>STMicroelectronics — using the STM32 built-in USB DFU bootloader to program or upgrade device firmware.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Choose the Flashing Path Before Connecting a Programmer</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>The correct flashing path depends on the device architecture and the failure state. A working device may accept a signed update through its normal application, while a partially broken device may need a ROM bootloader, SWD/JTAG probe, or direct flash access. Check the board schematic, service manual, <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/">microcontroller memory map</a>, flash part number, and boot-mode straps before attaching anything. Confirm logic voltage as well: 1.8 V, 3.3 V, and 5 V interfaces are not automatically interchangeable. On boards such as ESP32- or STM32-based systems, boot pins and reset sequencing decide whether the processor starts the normal application or enters a programming mode. Technician work should begin with identification, not trial-and-error wiring.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=x_5rYfAyqq0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=x_5rYfAyqq0
</div><figcaption class="wp-element-caption"><em>Phil’s Lab — custom STM32 hardware programming with SWD, USB, SPI, and ST-Link connections.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">USB DFU Uses a Bootloader Instead of an External Debug Probe</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>USB Device Firmware Upgrade (DFU)</strong> lets supported hardware receive firmware over USB while a bootloader controls the erase and write operations. This can be convenient because no external debug probe is required, but the device must enter the correct DFU state and the image must target the correct memory layout. A typical workflow is: identify the DFU device, verify the firmware file, program it, reset the device, then confirm the new version and normal boot. Do not assume a file with a familiar name is correct; compare version, hardware revision, expected size, and checksum against the approved release. The same principle applies to practical update workflows such as <a href="https://bitcoinversus.tech/2026/09/14/how-to-update-your-bitaxe-firmware-v2-9-0/">Bitaxe firmware updating</a>.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=VlCYI2U-qyM","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=VlCYI2U-qyM
</div><figcaption class="wp-element-caption"><em>Phil’s Lab — STM32 programming over USB DFU using STM32CubeProgrammer.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">SWD and JTAG Provide Low-Level Access to Internal Flash</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><a href="https://bitcoinversus.tech/2026/10/05/osfec-003-hardware-debugging-jtag-swd-openocd-gdb/"><strong>SWD and JTAG</strong></a> let a debug probe communicate directly with a microcontroller’s debug interface. For technician flashing, that means the probe can often identify the target, halt the CPU, erase or program internal flash, verify the result, and reset the device even when the normal application will not boot. Common probes include ST-Link and SEGGER J-Link. Match the target voltage reference, ground, clock/data pins, reset wiring, and processor family before programming. A useful OpenOCD-style workflow is <code>program firmware.elf verify reset exit</code>, because writing without read-back verification leaves a major uncertainty unresolved.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=0Jtp0FRvwP4","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=0Jtp0FRvwP4
</div><figcaption class="wp-element-caption"><em>SEGGER Microcontroller — J-Link Commander for target communication and flash-programming workflows.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Direct SPI Programming Is the Recovery Path When the Host Cannot Help</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Some systems store firmware in an external <strong>SPI NOR flash</strong> chip. If the processor, bootloader, or motherboard firmware is too damaged to perform an in-system update, a technician may read and write that flash directly with a programmer such as a CH341A-class device or a professional in-circuit programmer. Before writing, read the original chip more than once, compare the dumps, save the known-good backup, confirm the flash-part ID, and make sure the programmer voltage matches the chip. In-circuit programming can be complicated by other components loading the SPI bus, so a clip that physically fits is not proof that the electrical setup is safe. This is exactly why the backup discipline from <a href="https://bitcoinversus.tech/2026/10/05/osftc-003-firmware-backup-recovery-checksums-golden-images-rollback-validation/">OSFTC.003</a> comes before erase/write operations.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=2Y06x1f22B0","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=2Y06x1f22B0
</div><figcaption class="wp-element-caption"><em>deftdawg — using a CH341A SPI programmer and test clip to read and write flash chips with flashrom.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Serial Bootloaders Turn UART or USB Into a Recovery Channel</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Many microcontrollers contain a factory ROM bootloader or a project-specific bootloader that accepts firmware through UART, USB, CAN, Ethernet, or another interface. On ESP32 systems, for example, <strong>esptool</strong> communicates with the chip’s serial bootloader and writes specific images to specific flash offsets. The important technician concept is that a firmware image is not always one monolithic file: bootloader, partition table, application, calibration, or configuration regions may occupy different addresses. Writing the right bytes to the wrong offset can still produce a non-booting device. Capture the <a href="https://bitcoinversus.tech/2026/10/05/osftc-002-serial-console-boot-logs-uart-baud-rate-pinouts-capture-recovery/">serial boot log</a> after flashing so you can tell whether the bootloader, application, or hardware initialization failed.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=kKFVH-o4YQA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=kKFVH-o4YQA
</div><figcaption class="wp-element-caption"><em>Leon Anavi — using esptool to flash ESP32-C3 bootloader and firmware images at defined flash addresses.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">A Successful Write Is Not a Successful Repair Until It Is Verified</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Always separate <strong>write completion</strong> from <strong>functional validation</strong>. The programmer should first verify memory contents by read-back comparison, CRC, hash, or the tool’s own verify operation. Then reset the device and inspect the first boot for version, hardware detection, configuration migration, watchdog resets, unexpected recovery loops, and peripheral initialization. If the image uses secure boot or signed firmware, signature validation may reject a file that was electrically written without error. Save the programmer log and post-flash boot log as evidence. A robust update path therefore looks like: <strong>backup → identify → erase/write → verify → reset → boot-log check → functional test → rollback readiness</strong>.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=iwxWuUbizVA","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=iwxWuUbizVA
</div><figcaption class="wp-element-caption"><em>ControllersTech — complete STM32 bootloader firmware update with image metadata, flash programming, CRC32 verification, and safe application start.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Useful Command Examples</h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code># List USB DFU devices
dfu-util -l

# Identify an ESP32-family target before any change
esptool --port /dev/ttyUSB0 chip-id

# Confirm the installed OpenOCD tool version
openocd --version

# Verify the approved firmware file checksum
sha256sum firmware.bin</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading">Technician Flashing Checklist</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Identify device model, board revision, microcontroller, and flash part.</li><li>Confirm the approved firmware version and file checksum.</li><li>Back up existing flash or configuration when possible.</li><li>Choose the correct interface: application updater, DFU, UART bootloader, SWD/JTAG, or direct SPI.</li><li>Confirm logic voltage, ground, pinout, reset, and boot-mode straps.</li><li>Record current firmware version and serial/asset information.</li><li>Perform erase/write using the manufacturer-approved tool or documented open-source equivalent.</li><li>Run the tool’s verify/read-back operation.</li><li>Reset or power-cycle according to the procedure.</li><li>Capture the first boot log and confirm the expected firmware version.</li><li>Test critical peripherals and configuration.</li><li>Keep the backup, logs, checksum, tool version, and rollback method with the work record.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Given a board with USB DFU and SWD access, explain when you would choose one over the other.</li><li>Describe the risks of connecting a 3.3 V SPI flash to a programmer configured for the wrong voltage.</li><li>Write a recovery sequence for a device whose application is corrupt but whose ROM bootloader still responds.</li><li>Explain why two matching backup reads are stronger evidence than one successful read.</li><li>List the evidence you would save after flashing ten identical devices in a production-support job.</li><li>Explain the difference between memory verification and functional validation.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge Check + Answers</h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>What is DFU?</strong> A bootloader-based method for downloading firmware to supported hardware over USB.</li><li><strong>Why use SWD/JTAG?</strong> It provides low-level access for programming, target identification, debugging, and recovery when the normal application path is unavailable.</li><li><strong>Why back up SPI flash before writing?</strong> The original chip may contain unique calibration, serial, configuration, or recoverable firmware data.</li><li><strong>What is a flash offset?</strong> The address where a particular image or region is stored within flash memory.</li><li><strong>What does verify mean?</strong> Confirming that the bytes actually stored in flash match the intended image, usually by read-back comparison, hash, CRC, or programmer verification.</li><li><strong>Why inspect the first boot log?</strong> A verified write can still fail during boot because of configuration, compatibility, signature, hardware, or initialization problems.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Elementary Conclusion</h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A firmware technician can think of flashing as choosing the safest door into a device’s memory. USB DFU is one door, SWD/JTAG is another, a serial bootloader is another, and a direct SPI programmer is the emergency door when the processor cannot help. The important part is not how quickly the new file can be written. The important part is knowing that the file belongs to the hardware, the voltage and wiring are correct, the old data is recoverable, the new bytes were written correctly, and the device actually boots and works afterward. A careful technician always leaves evidence and a recovery path instead of treating “program completed” as the end of the job.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=vgG24lzVwxE","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=vgG24lzVwxE
</div><figcaption class="wp-element-caption"><em>SEGGER Microcontroller — J-Flash demonstration of programming MCU internal flash.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->