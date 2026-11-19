# BitcoinVersus.Tech canonical OS lesson title and number policy

**Status:** Mandatory for all published lessons, drafts promoted to publish, SEO metadata, archive metadata and rotation records.
**Audit date:** November 19, 2026.

## Canonical visible title

Every standalone educational lesson must start its **WordPress post title** with the track acronym and a three-digit number, followed by a colon and the lesson topic:

`{CanonicalAcronym}.{NNN}: {Topic}`

Examples:
- `OSPowerShell.006: PowerShell Conditionals...`
- `OSBash.007: Bash Command-Line Options...`
- `OSGo.006: Go Arrays and Slices...`
- `OSC#.006: C# Methods, Parameters, Return Values, and Overloading`
- `OSC++.035: std::bind_back...`

The topic wording may vary; the exact prefix must not vary from the track registry. A title without the OS prefix is **not publication-ready**, even if the slug contains the number. Do not add the same prefix twice.

## Source of truth

1. Resolve the subject in `coding-curriculum.json`, then confirm the current acronym in `lesson-rotation.json` -> `track_state`.
2. Reconcile every published and unpublished WordPress lesson in the track with the GitHub lesson archive. Search for the candidate identifier before creating a new post.
3. Derive the **next unique** number from the verified actual history; do not rely solely on the rotation cursor.
4. Set the WordPress title with the canonical prefix **at draft creation**. The SEO title must also include the same prefix. Ensure excerpts, section headings and archive records do not contradict the title.
5. Verify `title.raw`, public H1, SEO title, canonical URL and in-article lesson identifier after publication.
6. Preserve existing public URLs when correcting titles; do not break inbound links or modify slugs merely for cosmetic consistency.
7. Record exceptions with exact source evidence. Never rewrite titles based solely on an old slug.

## Legacy URL exceptions

WordPress posts 23605, 24017, 24223, and 25078 carry historical `osetc-` URL slugs but currently belong to the **OSNTC** network technician curriculum. Their visible OSNTC titles are correct according to the active `network_technician` track state. Preserve both public URLs and correct titles; rename only with a separately verified migration/redirect plan.

## November 19, 2026 title audit

Scanned **457** published computer-programming category posts and **1,607** published Tech Docs category posts, including overlapping items. Published OS-numbered lesson titles matched their canonical visible prefixes apart from the four documented legacy URL/title exceptions. Later posts must undergo the same strict check.

## Publication gate

Fail QA if the title is absent, if the visible title does not start with its track and number, if the SEO title omits the canonical identifier, if the identifier is duplicated, or if another published/draft/scheduled post already uses that lesson number. Fix, recheck, then publish.
