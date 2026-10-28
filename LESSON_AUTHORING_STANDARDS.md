# TechCert Lesson Authoring Standards

## Authoritative Lesson Presentation Standard — October 28, 2026

**All newly published educational lessons use a textbook / wiki / encyclopedia / dictionary style, always. Never display sequential lesson numbering in public lesson headlines, section headings, or prose as a navigation device.** Use concept-first, descriptive titles (for example, `Hashboard Signal Chains — Clock, Command, and Return Paths`, not `OSHRE.002: ...` or `Lesson 2: ...`). Section headings must be descriptive topics such as `Signal Path Basics`, `Electrical Characteristics`, `History`, `Failure Modes`, `Examples`, and `References`, **not** `1. Signal Path Basics` or `Chapter 2`. Write cohesive reference prose with accurate definitions, cross-linked terminology, specifications, documented examples, relevant media and citations. Retain exercises or knowledge checks as appropriate but do not frame the article as a sequential numbered lecture. Number items only where genuine ordered procedures, ranked data, or a technical standard requires an order, never for decorative article structure.

**Keep unique course-track IDs and existing 000–999 slots privately in publishing metadata, curriculum registries and archive records** to preserve deduplication, progression, and existing course references; do not renumber historical lessons or erase old identifiers. The internal tracking identifier must not be the reader-facing title. This October 28 instruction overrides any older rule requiring visible `OSXXX.NNN`, `Linux Command #NN`, `Windows Command #NN`, or numbered lesson headings. Do not retroactively change already-published articles unless separately requested. All existing independent media, cover, sourcing, hyperlink, QA, and archival requirements still apply.

## Elementary Framing For Complex Lessons

Every complex or advanced technical lesson must include two plain-language framing sections in addition to the full technical material.

### Elementary Overview

Place an `Elementary Overview` near the beginning of the lesson, before the main advanced explanation. Write it in full informational paragraphs at roughly the conceptual level of a clear, intelligent 10-year-old reader. Keep a neutral Wikipedia-style tone: simple, precise, coherent, and factual rather than childish. Explain the main object, system, or idea, what it does, and the simplest mental model needed before introducing equations, specialist vocabulary, or advanced mechanisms.

### Elementary Conclusion

Place an `Elementary Conclusion` at the end of the lesson, after the advanced material and before the BitcoinVersus.Tech footer. Restate what the lesson means in plain language at roughly the conceptual level of a clear, intelligent 10-year-old reader. Use full informational paragraphs, preserve technically correct terminology, connect the advanced equations or mechanisms back to a simple mental model, and explain why the concept matters.

These sections do not replace the technical lesson. They frame it so a new learner can understand the concept before and after encountering the advanced material.

If the lesson's video policy requires explanatory video support for substantive paragraphs, the elementary sections must follow that rule too. Use directly relevant videos and do not duplicate a video URL already used elsewhere in the same lesson.

## BitcoinVersus Internal Wiki Linking

Treat BitcoinVersus.Tech as an internal technical wiki. Throughout every lesson, naturally hyperlink important technical terms, components, hardware, software, protocols, standards, companies, systems, scientific concepts, people, organizations, and recurring subject keywords to the most specific relevant existing BitcoinVersus.Tech article whenever one exists.

Examples include terms such as `PN junction`, `diode`, `p-type semiconductor`, `n-type semiconductor`, `charge carrier`, `forward bias`, `reverse bias`, `Shockley equation`, `ideality factor`, `resistance`, `capacitance`, `GPU`, `ASIC`, `IPv4`, `RJ45`, `fiber`, `Linux`, `Python`, and similar concepts appropriate to the lesson.

There is **no numerical hyperlink limit**. If a meaningful term has a relevant BitcoinVersus.Tech article, lesson, story, or category, hyperlink that term on every meaningful occurrence where the link remains accurate and useful. Prefer the most specific matching BitcoinVersus.Tech page over a generic category page, and prefer a prior explanatory article or lesson over linking a term back to the current page itself. The required result is Wikipedia-like cross-navigation entirely within BitcoinVersus.Tech, not a lightly linked article.

This internal-wiki linking rule applies to the Elementary Overview, the advanced lesson body, worked examples, exercises, knowledge checks, reference sections, and the Elementary Conclusion.

## 999-Lesson Track Scope

Each certification subject is designed to support up to 999 lessons. Keep each individual lesson modular and focused on one bounded concept instead of turning a single lesson into an entire textbook chapter.

Use these approximate targets unless the subject genuinely requires more or less: basic/easy lessons 600–900 words; normal technical lessons 900–1,300 words; complex engineering lessons 1,300–1,800 words; unusually deep safety, troubleshooting, lab, or equation-heavy lessons may extend to about 2,200 words. When a topic is broader than the target, split it into later numbered lessons rather than overloading the current lesson.

## Lesson Cover Style

Every lesson requires one unique featured cover with an original source size of exactly 1200×630.

**BANNED: minimal diagram photos, sparse minimalist diagrams, generic minimal cards, and the old minimal-style lesson cover treatment. Never use them.**

Use a visually rich realistic technical scene, realistic technical illustration, or another already accepted expressive style such as realistic color-pencil, comic-book, anime, or detailed dark/neon technical art. A black or dark technical base with neon-green accents remains appropriate, but the image must have a clear, substantial main subject and real visual depth rather than a sparse diagram.

Use one main subject, make the subject technically relevant to the lesson, avoid watermarks and reused art, and never reuse the featured cover as a body image. Verify the original WordPress media dimensions are exactly 1200×630 before declaring the lesson complete.
