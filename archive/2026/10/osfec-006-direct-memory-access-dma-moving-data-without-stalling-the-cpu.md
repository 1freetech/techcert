---
title: "OSFEC.006: Direct Memory Access (DMA) — Moving Data Without Stalling the CPU"
status: published
wordpress_id: 21952
live_url: "https://bitcoinversus.tech/2026/10/08/osfec-006-direct-memory-access-dma-moving-data-without-stalling-the-cpu/"
featured_media: 21951
seo_description: "OSFEC.006 teaches Direct Memory Access (DMA): how embedded firmware moves data between peripherals and RAM, uses circular buffers and completion interrupts, handles RTOS synchronization, and avoids cache-coherency failures."
---

<!-- wp:heading --><h2 class="wp-block-heading"><strong>Elementary Overview and Review</strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong>Direct Memory Access (DMA)</strong> is a hardware engine that moves data between memory and peripherals without making the <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/"><strong>CPU</strong></a> copy every byte itself. In <a href="https://bitcoinversus.tech/2026/10/05/osfec-002-real-time-firmware-scheduling-superloops-rtos-tasks-priorities-preemption-timing/">OSFEC.002</a>, we used tasks, priorities, interrupts, and timing to keep firmware responsive; in <a href="https://bitcoinversus.tech/2026/10/08/osfec-005-bootloader-design-firmware-update-architecture-image-validation-ab-slots-rollback-versioning-recovery/">OSFEC.005</a>, we built a safer firmware update path. DMA adds another production tool: let dedicated hardware move repetitive data while the processor keeps running control logic, protocol code, or an <strong>RTOS</strong>.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=qcRuzvB-zaE","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=qcRuzvB-zaE
</div><figcaption class="wp-element-caption"><em>Embedded Systems Tutorials — a focused introduction to Direct Memory Access in embedded systems.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>Why DMA Exists</strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>Without DMA, firmware often polls a peripheral register or services an interrupt for each small piece of data. With DMA, the firmware configures a transfer, the peripheral generates requests, and the DMA controller becomes a temporary <strong>bus master</strong> that reads from one address and writes to another. STMicroelectronics’ <a href="https://wiki.st.com/stm32mcu/wiki/Getting_started_with_DMA">DMA guide</a> describes the same model: high-speed peripheral-to-memory, memory-to-peripheral, or memory-to-memory transfers happen with little CPU action, which frees processor time for other work.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=OyVemnshlQQ","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=OyVemnshlQQ
</div><figcaption class="wp-element-caption"><em>Phil’s Lab — practical STM32 DMA with SPI and FreeRTOS, including transfer-complete handling.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>Anatomy of a DMA Transfer</strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>A DMA transfer is defined by a small set of parameters: <strong>source address</strong>, <strong>destination address</strong>, transfer count, element width, address-increment rules, request source, direction, and priority. If an ADC data register always lives at one <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/"><strong>memory-mapped register</strong></a>, the peripheral address stays fixed while the destination RAM address increments through a buffer. For a UART transmit operation, the opposite pattern is common: the RAM source increments while the UART data register stays fixed.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=QNHH-IUa39Y","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=QNHH-IUa39Y
</div><figcaption class="wp-element-caption"><em>ControllersTech — register-level DMA setup with half-transfer and transfer-complete interrupts.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>Circular Buffers Make Continuous Sampling Possible</strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>For continuous streams such as <strong>ADC</strong> samples, audio, sensor data, or serial traffic, DMA can operate in <strong>circular mode</strong>. The controller fills a buffer, wraps to the beginning, and keeps going. Half-transfer and transfer-complete events let software process one region while DMA fills the other. This is the foundation of ping-pong and double-buffer designs: ownership must be clear so the CPU never edits a region that DMA is actively writing.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=d0aO6HF2Eu0","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=d0aO6HF2Eu0
</div><figcaption class="wp-element-caption"><em>ControllersTech — STM32 ADC sampling from polling through interrupts and DMA, including continuous acquisition.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>DMA, Interrupts, and RTOS Tasks Must Share Ownership Cleanly</strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>DMA does not remove <strong>interrupts</strong>; it changes what they mean. Instead of interrupting the processor for every byte, firmware can receive one interrupt when a block is half full, complete, or in error. In an <a href="https://bitcoinversus.tech/2026/10/05/osfec-002-real-time-firmware-scheduling-superloops-rtos-tasks-priorities-preemption-timing/"><strong>RTOS</strong></a>, the DMA interrupt handler should usually do the minimum work required to acknowledge the event and wake the appropriate task with a queue, semaphore, notification, or event flag. The task then processes the finished buffer outside interrupt context.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=Kb8dX18xYuo","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=Kb8dX18xYuo
</div><figcaption class="wp-element-caption"><em>Eddie Amaya — practical STM32 DMA continuation showing how the transfer path is handled in firmware.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>Cache Coherency Can Break Correct-Looking DMA Code</strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>On processors with a data cache, especially Cortex-M7-class systems, the CPU and DMA engine may not immediately see the same bytes. The CPU can modify a cached buffer without writing it back to RAM, while DMA reads the older RAM copy; or DMA can update RAM while the CPU keeps reading stale cached data. Production firmware therefore needs an explicit policy: use non-cacheable DMA regions where appropriate, align buffers to cache-line boundaries, and perform the required <strong>cache clean</strong> or <strong>invalidate</strong> operations before ownership changes.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=6JMd-3q8Dnw","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=6JMd-3q8Dnw
</div><figcaption class="wp-element-caption"><em>STMicroelectronics — Cortex-M7 data-cache behavior and coherency, directly relevant to DMA buffer ownership.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>DMA Still Has Bandwidth and Latency Limits</strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p>DMA is not “free bandwidth.” The controller shares internal buses with the CPU and other masters, so arbitration, memory speed, peripheral timing, FIFO thresholds, burst size, and competing DMA channels all affect latency. ST’s <a href="https://www.st.com/resource/en/application_note/dm00046011-using-the-direct-memory-access-controller-on-stm32-microcontrollers-stmicroelectronics.pdf">AN4031</a> shows why firmware engineers must check whether the bus can sustain the required traffic. A simple first estimate is <strong>Required Bandwidth = samples per second × bytes per sample × channels</strong>; the real design then adds protocol overhead and safety margin.</p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://www.youtube.com/watch?v=eUA2TRX1NTc","type":"video","providerNameSlug":"youtube","responsive":true,"className":"wp-embed-aspect-16-9 wp-has-aspect-ratio"} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=eUA2TRX1NTc
</div><figcaption class="wp-element-caption"><em>EEVblog2 — STM32 DMA and ADC discussion focused on real data movement in an ARM microcontroller.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>Minimal DMA Configuration Model</strong></h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>// Pseudocode: ADC peripheral -&gt; RAM buffer

volatile uint16_t adc_samples[256];

void dma_start(void) {
    dma_disable(CHANNEL_ADC);

    dma_set_source(CHANNEL_ADC, &amp;ADC_DATA_REGISTER);
    dma_set_destination(CHANNEL_ADC, adc_samples);
    dma_set_count(CHANNEL_ADC, 256);

    dma_set_width(CHANNEL_ADC, 16_bits);
    dma_source_increment(CHANNEL_ADC, false);
    dma_destination_increment(CHANNEL_ADC, true);

    dma_enable_half_transfer_irq(CHANNEL_ADC);
    dma_enable_transfer_complete_irq(CHANNEL_ADC);
    dma_enable_circular_mode(CHANNEL_ADC);

    dma_enable(CHANNEL_ADC);
    adc_enable_dma_requests();
}</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>DMA Buffer Ownership Pattern</strong></h2><!-- /wp:heading -->
<!-- wp:code --><pre class="wp-block-code"><code>DMA fills first half
        |
        v
Half-transfer interrupt
        |
        +----&gt; CPU/task processes first half

DMA fills second half
        |
        v
Transfer-complete interrupt
        |
        +----&gt; CPU/task processes second half

DMA wraps and repeats</code></pre><!-- /wp:code -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>Engineering Checklist</strong></h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>Identify the exact peripheral request that triggers the DMA channel.</li><li>Confirm source and destination addresses from the microcontroller reference manual.</li><li>Set source/destination increment rules correctly.</li><li>Match transfer width to the peripheral data width.</li><li>Decide whether normal, circular, or double-buffer operation fits the workload.</li><li>Keep DMA buffers alive for the entire transfer; never use a temporary stack buffer that disappears early.</li><li>Define who owns each buffer region: DMA or CPU.</li><li>Keep DMA interrupt handlers short and move processing into tasks where practical.</li><li>Check cache maintenance requirements on cached cores.</li><li>Calculate required bandwidth and allow margin for arbitration and competing traffic.</li><li>Handle transfer error, FIFO error, underrun, overrun, and timeout cases.</li><li>Use <a href="https://bitcoinversus.tech/2026/10/05/osfec-003-hardware-debugging-jtag-swd-openocd-gdb/"><strong>JTAG, SWD, OpenOCD, or GDB</strong></a> to inspect DMA registers, counters, buffers, and interrupt flags when the transfer stalls.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>Exercises</strong></h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li>A 4-channel ADC samples each channel at 50 kS/s with 16-bit samples. Calculate the raw DMA bandwidth in bytes per second.</li><li>For a peripheral-to-memory transfer, decide which address should increment and which should remain fixed.</li><li>Draw a 512-sample circular buffer split into two 256-sample processing regions.</li><li>Explain why a DMA buffer allocated inside a short-lived function can become unsafe after the function returns.</li><li>Describe what a half-transfer interrupt allows the CPU to do before the full buffer is complete.</li><li>Explain why cache invalidation may be required after DMA writes into RAM on a Cortex-M7 system.</li><li>List three reasons a DMA channel can be configured correctly but still miss real-time deadlines.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>Knowledge Check + Answers</strong></h2><!-- /wp:heading -->
<!-- wp:list {"ordered":true} --><ol class="wp-block-list"><li><strong>What is DMA?</strong> A hardware mechanism that moves data between memory and peripherals, or between memory regions, with little CPU involvement.</li><li><strong>Why is DMA useful?</strong> It reduces repetitive CPU copying and interrupt load while supporting high-throughput I/O.</li><li><strong>What does “fixed peripheral address” mean?</strong> The DMA repeatedly accesses the same hardware register while the memory address can advance through a buffer.</li><li><strong>What is circular DMA?</strong> A mode in which the DMA automatically wraps to the beginning of a buffer and continues transferring.</li><li><strong>What is a half-transfer interrupt?</strong> A notification that the first half of a programmed block is complete and can often be processed while DMA fills the second half.</li><li><strong>Does DMA eliminate interrupts?</strong> No. DMA commonly generates fewer, block-level interrupts such as half complete, complete, and error.</li><li><strong>Why can cache coherency matter?</strong> The CPU cache and RAM can temporarily contain different versions of the same buffer while DMA accesses RAM directly.</li><li><strong>Is DMA bandwidth unlimited?</strong> No. DMA still competes for buses, memory, and peripheral access and must satisfy real timing limits.</li><li><strong>What is the raw bandwidth for 4 × 50,000 samples/s × 2 bytes?</strong> 400,000 bytes per second, or about 400 kB/s before overhead.</li><li><strong>What is the most important ownership rule?</strong> The CPU and DMA should never modify the same buffer region at the same time unless the design explicitly guarantees that access is safe.</li></ol><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong>Remember</strong></h2><!-- /wp:heading -->
<!-- wp:list --><ul class="wp-block-list"><li>DMA moves data; the CPU still controls policy.</li><li>Configure addresses, widths, counts, triggers, and increment rules deliberately.</li><li>Circular DMA is ideal for continuous streams when buffer ownership is explicit.</li><li>Block-level interrupts reduce CPU overhead but still need correct synchronization.</li><li>Cached systems require a coherency strategy.</li><li>Always prove the required bandwidth and latency on real hardware.</li></ul><!-- /wp:list -->