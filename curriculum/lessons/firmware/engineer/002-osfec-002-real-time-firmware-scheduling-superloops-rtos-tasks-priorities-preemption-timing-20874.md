---
title: "OSFEC.002: Real-Time Firmware Scheduling — Superloops, RTOS Tasks, Priorities, Preemption, and Timing"
wordpress_post_id: 20874
source: BitcoinVersus.tech
published: 2026-10-05T00:27:22
modified: 2026-10-05T00:27:22
live_url: https://bitcoinversus.tech/2026/10/05/osfec-002-real-time-firmware-scheduling-superloops-rtos-tasks-priorities-preemption-timing/
track: firmware/engineer
lesson_number: 2
raw_source: 002-osfec-002-real-time-firmware-scheduling-superloops-rtos-tasks-priorities-preemption-timing-20874.gutenberg.html
---

<!-- wp:paragraph {"fontSize":"large"} --><p class="has-large-font-size"><strong>Real-time firmware is not defined by raw processor speed. It is defined by whether the system performs the required work within known timing constraints. Scheduling is therefore an engineering discipline: firmware must decide what runs, when it runs, what can preempt it, how long it may block, and whether every critical deadline remains achievable under worst-case load.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>OSFEC.002 continues the Open Source Firmware Engineer Certification track from <a href="https://bitcoinversus.tech/2026/10/04/osfec-001-microcontroller-architecture-memory-maps-registers-interrupts/"><strong>OSFEC.001: Microcontroller Architecture — Memory Maps, Registers, and Interrupts</strong></a>. The previous lesson established interrupts, latency, shared state, priorities, and the architectural bridge into context switching. This lesson develops those mechanisms into complete scheduling models.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The technician-level companion lesson is <a href="https://bitcoinversus.tech/2026/10/05/osftc-002-serial-console-boot-logs-uart-baud-rate-pinouts-capture-recovery/"><strong>OSFTC.002: Serial Console and Boot Logs — UART, Baud Rate, Pinouts, Capture, and Recovery</strong></a>. Technician work observes system behavior. Firmware engineering determines how execution is structured so the system behaves predictably in the first place.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Real-time means deadline-aware</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A system is real-time when correctness depends on both the logical result and the time at which that result is produced.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Hard real-time:</strong> missing a deadline is considered a system failure.</li><li><strong>Firm real-time:</strong> late results have little or no value, though an isolated miss may not be catastrophic.</li><li><strong>Soft real-time:</strong> deadline misses reduce quality or responsiveness but do not necessarily invalidate the system.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>Control loops, protection systems, motor commutation, power conversion, radio timing, industrial motion, and safety monitoring commonly contain real-time constraints. The correct scheduling architecture depends on the severity and frequency of the deadlines.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">MIT OpenCourseWare: real-time behavior</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=7dhuZ6V9tcY","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=7dhuZ6V9tcY
</div><figcaption class="wp-element-caption"><em>MIT OpenCourseWare — Real Time, from 6.004 Computation Structures. Develops the need for bounded response and timing-aware scheduling.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">The superloop model</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>The simplest firmware scheduler is often a <strong>superloop</strong>:</p><!-- /wp:paragraph -->

<!-- wp:preformatted --><pre class="wp-block-preformatted">initialize();
while (1) {
    read_inputs();
    update_control();
    service_comms();
    update_outputs();
}</pre><!-- /wp:preformatted -->

<!-- wp:paragraph --><p>This architecture can be appropriate when every operation is short, execution time is bounded, timing requirements are loose, and task interactions remain simple.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The superloop becomes difficult when one function can block, when events arrive asynchronously, when some work is much more urgent than other work, or when a long operation delays everything behind it.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Cooperative scheduling</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>In cooperative scheduling, each unit of work runs until it voluntarily yields, blocks, or returns control to the scheduler.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The model is attractive because context changes occur at explicit locations. Shared-state reasoning can be simpler than in a fully preemptive system. The main risk is that one poorly behaved task can delay every other task.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A cooperative scheduler therefore requires a strong rule: <strong>no cooperative task may execute longer than the maximum latency tolerated by more urgent work</strong>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Preemptive scheduling</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>In a preemptive scheduler, a higher-priority ready task can interrupt execution of a lower-priority task. The processor state of the interrupted task is preserved so it can resume later.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>FreeRTOS describes its default single-core policy as fixed-priority preemptive scheduling with optional round-robin time slicing among equal-priority ready tasks. See <a href="https://www.freertos.org/Documentation/02-Kernel/02-Kernel-features/01-Tasks-and-co-routines/04-Task-scheduling">FreeRTOS — Task Scheduling</a>.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Preemption reduces response time for urgent work, but it introduces new engineering problems: shared resources, race conditions, non-reentrant code, priority inversion, stack sizing, context-switch overhead, and more complex worst-case timing analysis.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">MIT OpenCourseWare: strong priorities and preemption</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=PmOq8G_hs4o","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=PmOq8G_hs4o
</div><figcaption class="wp-element-caption"><em>MIT OpenCourseWare — Strong Priorities, from 6.004 Computation Structures. Examines priority-based scheduling and why preemption is required for stronger timing guarantees.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Task states</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>RTOS scheduling becomes easier to reason about when tasks are treated as state machines.</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Running:</strong> currently executing on a processor core.</li><li><strong>Ready:</strong> able to execute but waiting because another task has the processor.</li><li><strong>Blocked:</strong> waiting for time or an event such as a queue item, semaphore, notification, or I/O completion.</li><li><strong>Suspended:</strong> explicitly removed from scheduling until resumed.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>FreeRTOS documents these task states and emphasizes that blocked tasks do not consume processor time while waiting. See <a href="https://www.freertos.org/Documentation/02-Kernel/02-Kernel-features/01-Tasks-and-co-routines/02-Task-states">FreeRTOS — Task States</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Ready is different from running</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A task can be fully prepared to execute and still receive no CPU time because a higher-priority task remains ready. This distinction is central to real-time analysis.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A task that continuously performs work without blocking can starve lower-priority tasks. High-priority tasks therefore usually need a clear event-driven reason to run, then should block again when the urgent work is complete.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Priorities should represent urgency, not importance</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A common design mistake is assigning high priority to code because the feature is “important.” In a real-time scheduler, priority should primarily reflect timing urgency and deadline structure.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A logging task may be operationally important but able to tolerate milliseconds of delay. A current-control loop may perform very little computation yet require service every 50 microseconds. The control loop should usually have higher scheduling urgency.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Fixed-priority scheduling</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Many embedded RTOSes use fixed priorities. Each task is assigned a scheduling priority, and the highest-priority ready task runs.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>This model is conceptually simple and maps well to periodic and event-driven embedded workloads. It also allows useful worst-case analysis when execution times, blocking, and activation rates are bounded.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The current University of Texas at Austin ECE445M real-time operating-systems course explicitly covers context switching, cooperative and preemptive multitasking, round-robin scheduling, thread states, synchronization, blocking semaphores, priority scheduling, and performance measurement. See <a href="https://users.ece.utexas.edu/~valvano/EE445M/lectures.html">UT Austin ECE445M — Embedded and Real-Time Operating Systems</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Time slicing</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Time slicing allows equal-priority ready tasks to share processor time. It improves fairness but does not automatically improve real-time determinism.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For deadline-sensitive tasks, equal priority can make worst-case response dependent on how many peers are ready and where execution falls within the time slice. Systems with strict timing constraints should assign priorities intentionally and avoid relying on time slicing as a substitute for timing analysis.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Digi-Key: RTOS task scheduling</h2><!-- /wp:heading -->

<!-- wp:embed {"url":"https://www.youtube.com/watch?v=95yUbClyf3E","type":"video","providerNameSlug":"youtube","responsive":true} --><figure class="wp-block-embed is-type-video is-provider-youtube wp-block-embed-youtube"><div class="wp-block-embed__wrapper">
https://www.youtube.com/watch?v=95yUbClyf3E
</div><figcaption class="wp-element-caption"><em>Digi-Key Electronics — Introduction to RTOS: Task Scheduling. Demonstrates Ready, Running, Blocked, and Suspended states, priorities, preemption, and equal-priority time slicing in FreeRTOS.</em></figcaption></figure><!-- /wp:embed -->

<!-- wp:heading --><h2 class="wp-block-heading">Context switching</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A context switch changes execution from one task to another. The kernel must preserve enough processor state to resume the outgoing task later and restore the incoming task's state.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Typical saved context includes general-purpose registers, stack pointer state, processor status, and architecture-specific state. RTOS ports may also manage floating-point context, privilege state, memory-protection configuration, and other features.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Arm's 2026 Cortex-M learning path demonstrates kernel-style switching using SysTick and thread state, including a simple two-thread example. See <a href="https://learn.arm.com/learning-paths/embedded-and-microcontrollers/context-switch-cortex-m/">Arm Learning Paths — Context Switching on Cortex-M</a>.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">The scheduler tick</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Many RTOSes use a periodic hardware timer interrupt as a scheduler tick. The tick advances software time, releases delayed tasks whose wait period has expired, and may trigger a scheduling decision.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A 1 kHz tick provides 1 ms nominal tick resolution. That does not mean every task is limited to 1 ms timing precision; hardware timers, direct interrupts, tickless operation, and event-driven wakeups can provide finer timing where required.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Period and deadline are not the same concept</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A periodic task may activate every 10 ms but still have a 2 ms deadline. The system must therefore distinguish:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>period:</strong> interval between task activations;</li><li><strong>release time:</strong> instant when a job becomes ready;</li><li><strong>deadline:</strong> latest acceptable completion time;</li><li><strong>execution time:</strong> processor time required to complete the job;</li><li><strong>response time:</strong> elapsed time from release to completion.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Worst-case execution time</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Real-time analysis depends on a defensible bound for <strong>worst-case execution time (WCET)</strong>. Average execution time is not enough.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>WCET can be influenced by:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>input-dependent branches;</li><li>cache behavior;</li><li>flash wait states;</li><li>DMA or bus contention;</li><li>interrupt interference;</li><li>critical sections;</li><li>driver latency;</li><li>memory allocation;</li><li>logging;</li><li>compiler optimization;</li><li>fault handling or retries.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">CPU utilization is necessary but not sufficient</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A processor running at 40% average utilization can still miss a critical deadline if several tasks demand CPU time at the same instant.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Real-time design therefore evaluates the arrival pattern and interference among tasks, not only average load.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">A scheduling example</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Assume a single-core system contains these periodic tasks:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>control loop: period 1 ms, WCET 200 µs;</li><li>sensor processing: period 5 ms, WCET 600 µs;</li><li>communications: period 10 ms, WCET 800 µs;</li><li>logging: period 100 ms, WCET 2 ms.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>A simple utilization estimate is:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>U = Σ(C<sub>i</sub> / T<sub>i</sub>)</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For the example:</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>U = 0.2/1 + 0.6/5 + 0.8/10 + 2/100 = 0.42</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The average modeled CPU demand is approximately 42%. This is useful capacity information, but it is not a proof that every deadline is met. Blocking, release phasing, interrupt load, preemption cost, and priority assignment still matter.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Rate-monotonic intuition</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>For independent periodic tasks with deadlines equal to their periods, a common fixed-priority rule is to assign higher priority to shorter periods. This is the intuition behind rate-monotonic scheduling.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Production systems rarely satisfy every textbook assumption. Shared resources, sporadic events, different deadlines, DMA, interrupts, and non-preemptible sections must be included in the real analysis.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Blocking versus busy-waiting</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A busy-wait loop consumes CPU while waiting. A blocked task yields the processor until the required event occurs.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>For example, waiting 20 ms for a queue item by repeatedly polling a flag wastes processor time and can starve lower-priority work. Blocking on the queue allows the scheduler to run useful work until the event arrives.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Interrupt service routines and tasks have different jobs</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>An ISR should usually handle the time-critical edge of an event, capture the necessary state, clear or acknowledge the source, and signal a task for larger processing.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>The task can then perform parsing, filtering, protocol work, storage, or other operations without extending interrupt latency unnecessarily.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Priority inversion</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Priority inversion occurs when a high-priority task is blocked by a resource held by a lower-priority task, while medium-priority tasks continue preempting the lower-priority owner and delay release of the resource.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Mutex implementations often use <strong>priority inheritance</strong> to reduce this problem by temporarily raising the priority of the resource owner. Priority inheritance limits one class of inversion but does not replace careful resource architecture.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Critical sections</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A critical section protects a shared operation that must not be interrupted by conflicting access. Critical sections should be as short and bounded as possible because they increase blocking and can increase interrupt or scheduler latency.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Disabling interrupts around large computations is not a general synchronization strategy. It can silently destroy the timing guarantees that the RTOS was intended to provide.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Queues, semaphores, mutexes, and task notifications</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li><strong>Queue:</strong> transfers data and synchronization between producers and consumers.</li><li><strong>Binary semaphore:</strong> commonly signals an event or resource availability.</li><li><strong>Counting semaphore:</strong> tracks multiple available events or resources.</li><li><strong>Mutex:</strong> protects ownership of a shared resource and may support priority inheritance.</li><li><strong>Task notification:</strong> lightweight direct signaling to a specific task in RTOSes that support it.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>The synchronization primitive should match the communication model. Using one mechanism for every problem usually creates unnecessary complexity.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Stack sizing</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Every task needs stack space for local variables, function calls, saved context, and architecture-specific state. Stack demand can increase through deep call chains, large local arrays, printf-family routines, floating-point context, recursion, and library behavior.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Engineering practice should include stack high-water measurements, fault detection, and margin rather than guessing stack size and assuming success because the system boots.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Jitter</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Jitter</strong> is variation in the timing of repeated events. A control task intended to run every 1 ms may actually begin at 0.99 ms, 1.02 ms, 0.98 ms, and so forth.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Jitter can result from higher-priority interrupts, critical sections, scheduler behavior, DMA contention, cache/memory effects, or variable execution paths.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Measure scheduling behavior</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Real-time firmware should expose evidence of its own timing behavior. Useful measurements include:</p><!-- /wp:paragraph -->

<!-- wp:list --><ul class="wp-block-list"><li>task execution time;</li><li>response time;</li><li>deadline misses;</li><li>interrupt latency;</li><li>context-switch count;</li><li>CPU utilization;</li><li>stack high-water mark;</li><li>queue depth;</li><li>mutex hold time;</li><li>scheduler lock duration;</li><li>maximum critical-section duration;</li><li>jitter.</li></ul><!-- /wp:list -->

<!-- wp:paragraph --><p>GPIO timing pins, cycle counters, RTOS trace tools, logic analyzers, SWO/ITM, ETM, SEGGER SystemView, Percepio Tracealyzer, and vendor profilers can all contribute depending on the platform.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Tickless systems</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>Tickless idle reduces periodic scheduler interrupts when the system has no near-term work. This can reduce power consumption and unnecessary wakeups.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>Tickless operation changes the timing implementation but not the requirement: the next deadline must still be serviced within its allowed bound.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Watchdogs belong in the scheduling model</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p>A watchdog should prove that required progress is occurring, not merely that one high-priority task is alive.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p>A robust design may require several subsystems to report healthy progress before a watchdog service is permitted. Otherwise a scheduler fault could leave one task running continuously while the watchdog continues to be refreshed and the rest of the system remains failed.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Scheduling design checklist</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>List every periodic, sporadic, and event-driven activity.</li><li>Define period, deadline, and maximum acceptable response time.</li><li>Estimate or measure worst-case execution time.</li><li>Identify interrupt-driven work.</li><li>Assign priorities from timing urgency.</li><li>Identify every shared resource.</li><li>Bound critical sections and non-preemptible regions.</li><li>Identify all blocking operations.</li><li>Check for priority inversion.</li><li>Size task stacks with measurement and margin.</li><li>Measure CPU load and worst-case latency.</li><li>Track jitter and deadline misses.</li><li>Validate behavior under worst-case event phasing.</li><li>Repeat analysis after major firmware changes.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Exercises</h2><!-- /wp:heading -->

<!-- wp:list --><ul class="wp-block-list"><li>A control task runs every 2 ms and requires 300 µs of CPU time. Calculate its processor utilization.</li><li>Explain why 40% average CPU utilization does not guarantee that all deadlines are met.</li><li>Compare a superloop, cooperative scheduler, and preemptive RTOS for a system containing a 100 µs protection deadline and a 500 ms logging task.</li><li>Explain why a high-priority task that never blocks can starve lower-priority tasks.</li><li>Describe a priority-inversion scenario using high-, medium-, and low-priority tasks sharing a mutex-protected resource.</li><li>Identify the difference between task period, deadline, execution time, and response time.</li><li>Design an ISR-to-task handoff for a UART receive interrupt using a queue or task notification.</li><li>Create a timing-measurement plan that records WCET, jitter, interrupt latency, stack high-water mark, and deadline misses.</li></ul><!-- /wp:list -->

<!-- wp:heading --><h2 class="wp-block-heading">Knowledge check</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>What makes a system real-time?</strong><br>Correctness depends on completing required work within defined timing constraints, not only on producing the correct logical result.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>What is preemption?</strong><br>The scheduler suspends a currently running task so a higher-priority ready task can execute.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>What is the difference between Ready and Blocked?</strong><br>A Ready task can execute but is waiting for CPU time; a Blocked task is waiting for an event or time condition and is not eligible to run.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Why should priority reflect urgency rather than business importance?</strong><br>Scheduling priority exists to satisfy timing constraints and deadlines.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>What is WCET?</strong><br>A defensible bound on the maximum processor execution time required by a task or code path under the analyzed conditions.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>What is priority inversion?</strong><br>A high-priority task is indirectly delayed by a lower-priority task that owns a required resource.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>Why should an ISR usually defer large work to a task?</strong><br>Long ISRs increase interrupt latency, block lower-priority interrupts, and make timing harder to bound.</p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><strong>What is jitter?</strong><br>Variation in the timing of repeated events or task activations around their intended schedule.</p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading">Key takeaway</h2><!-- /wp:heading -->

<!-- wp:paragraph --><p><strong>Real-time firmware scheduling is the controlled allocation of processor time under deadlines. A correct design does not merely create tasks and assign priorities; it defines task states, event flow, blocking behavior, execution-time bounds, preemption rules, shared-resource protection, context-switch cost, watchdog logic, and measurable timing evidence. The scheduler is only a mechanism. The timing architecture is the engineering work.</strong></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Engineering note: Timing examples in this lesson are educational. Production real-time analysis must use measured or justified WCET, actual interrupt rates, scheduler configuration, hardware timing, synchronization behavior, compiler settings, cache/memory characteristics, RTOS version, and the target processor's architecture and errata.</em></p><!-- /wp:paragraph -->

<!-- wp:paragraph --><p><em>Display note: this lesson uses standard Gutenberg paragraphs, headings, lists, preformatted code, and media embeds only. No decorative text-box or callout-box layout is used.</em></p><!-- /wp:paragraph -->

<!-- wp:heading --><h2 class="wp-block-heading"><strong><em>BitcoinVersus.Tech</em></strong></h2><!-- /wp:heading -->
<!-- wp:paragraph --><p><strong><em>Advertisement</em></strong></p><!-- /wp:paragraph -->
<!-- wp:embed {"url":"https://twitter.com/1BitcoinVersus/status/1937006164555993338","type":"rich","providerNameSlug":"x","responsive":true} --><figure class="wp-block-embed is-type-rich is-provider-x wp-block-embed-x"><div class="wp-block-embed__wrapper">
https://twitter.com/1BitcoinVersus/status/1937006164555993338
</div><figcaption class="wp-element-caption"><em>BitcoinVersus.Tech advertisement.</em></figcaption></figure><!-- /wp:embed -->
<!-- wp:paragraph --><p><strong><em>Editor's Note:</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p><strong><em>We volunteer daily to ensure the credibility of the information on this platform is Verifiably True. If you would like to support our research initiatives, please donate here: 3C9o19EH5HSiwEPyCTmEKzxhNCbo2X6TTb</em></strong></p><!-- /wp:paragraph -->
<!-- wp:paragraph --><p>BitcoinVersus.tech is not a financial advisor. This media platform reports on financial subjects purely for informational purposes.</p><!-- /wp:paragraph -->