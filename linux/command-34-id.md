---
title: "Linux Command #34 – id (Linux OS)"
status: published
wordpress_post_id: 19970
published: "2026-10-02T08:35:15"
live_url: "https://bitcoinversus.tech/2026/10/02/linux-command-34-id/"
series: "Linux Commands"
lesson_number: "34"
command: "id"
featured_media_id: 19979
featured_image_url: "https://bitcoinversus.wordpress.com/wp-content/uploads/2026/10/linux-command-34-id-cover-v2.jpg"
featured_image_dimensions: "1200x630"
youtube: "https://www.youtube.com/watch?v=uiZrWIHX32Y"
---

# Linux Command #34 – id (Linux OS)

The Linux `id` command shows the identity Linux uses for a user: the user ID, primary group ID, and every supplementary group the account belongs to. It is a fast, read-only way to answer, “Who is this account, and which group permissions can it use?”

## Definition

**`id`** is an identity-reporting command. A **UID** is the number Linux assigns to a user account. A **GID** is the number Linux assigns to a group. Supplementary groups give the user additional group-based access.

## Basic Syntax

```bash
id
```

A typical result looks like this:

```text
uid=1000(bitcoin) gid=1000(bitcoin) groups=1000(bitcoin),27(sudo)
```

- `uid=1000(bitcoin)` means the username is `bitcoin` and its numeric user ID is `1000`.
- `gid=1000(bitcoin)` identifies the account’s primary group.
- `groups=...` lists the primary group plus supplementary groups. Membership in `sudo` may allow administrative commands when the system’s sudo policy permits them.

## Check Another Account

Add a username to inspect that account without switching users:

```bash
id alice
```

If the account does not exist, `id` reports that no such user is available.

## Video Walkthrough

https://www.youtube.com/watch?v=uiZrWIHX32Y

This short walkthrough demonstrates the `id` command and its most useful options.

## Useful Options

| Command | What it prints |
| --- | --- |
| `id -u` | Effective numeric user ID |
| `id -un` | Effective username |
| `id -g` | Effective primary group ID |
| `id -gn` | Effective primary group name |
| `id -G` | All group IDs |
| `id -Gn` | All group names |

The `-n` option asks for a name instead of a number. Use it with `-u`, `-g`, or `-G`.

## `whoami` vs. `id`

`whoami` prints only the current effective username. `id` provides the broader identity picture: user number, primary group, and supplementary groups. In most ordinary shells, `whoami` and `id -un` print the same username.

## Practical Troubleshooting

Suppose a technician receives `Permission denied` while accessing a shared directory. Run:

```bash
id
ls -ld /path/to/shared-directory
```

Compare the user’s groups with the directory’s owner, group, and permission bits. If the required group is absent from the `id` output, group membership may explain the failure. After an administrator changes group membership, the user may need to sign out and back in before a new session receives it.

## Safety Note

`id` only reads and displays identity information; it does not change accounts, groups, passwords, or permissions. It is safe to run during routine troubleshooting.

## Practice Lab

1. Run `id` and identify your UID, primary GID, and supplementary groups.
2. Run `id -un` and compare the result with `whoami`.
3. Run `id -Gn` and explain what each listed group could control.
4. If another local username is available, run `id username` to compare its identity.

## Knowledge Check

- What is the difference between a UID and a GID?
- Which command prints only group names?
- Why can group membership affect access even when the username is correct?

## Continue the Linux Series

- [Linux Command #33 – whoami (Linux OS)](https://bitcoinversus.tech/2026/10/01/linux-command-33-whoami/)
- [Linux File Permissions and Ownership](https://bitcoinversus.tech/2025/03/15/linux-file-permissions-and-ownership/)
- [Linux Command #1 – sudo (Linux OS)](https://bitcoinversus.tech/2024/11/19/command-1-sudo-linux-os/)

## Reference

For the complete option reference, see the [GNU Coreutils `id` manual](https://www.gnu.org/software/coreutils/manual/html_node/id-invocation.html) or run `man id` in a terminal.

## Key Takeaway

Use `id` to confirm the exact user and group identity Linux will use when evaluating access. It turns a vague permissions problem into concrete UID, GID, and group-membership facts.
