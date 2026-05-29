---
name: announcing-struts-release
description: Use when a new Apache Struts version has been released and you need to publish the website announcement (announce-YYYY.md, _config.yml, releases.md), open the PR, and draft the user-list email.
---

# Announcing a Struts Release

## Overview

Publishing a release announcement on the struts-site repo is a fixed, repeatable
procedure: add an announcement entry, bump the right version variables, move the
superseded version to Prior Releases, open a draft PR, and draft the `[ANN]` email
(the email is NOT committed — it is sent to the mailing list after merge).

Model PRs: #292 (6.9.0 GA), this skill was derived from the 6.10.0 release.

## Inputs to gather first

1. **Version** (e.g. `6.10.0`) and **release date** (e.g. `25 May 2026`).
2. **Version Notes URL** — `{{ site.wiki_url }}/Version+Notes+<version>`. Fetch it
   (use the cwiki page) to confirm date, bug fixes, dependency bumps, security fixes.
3. **Which GA line?** Struts ships two lines tracked separately in `_config.yml`:
   - `current_version` = newest overall (the **7.x** line)
   - `prev_version` = newest **6.x** maintenance release
   A 6.x release updates the `prev_*` variables; a 7.x release updates the
   `current_*`/`release_*` variables. **Don't touch the other line.**
4. **Security bulletin** — does a `S2-0XX` number exist? If the Version Notes
   mention a security fix but no bulletin number is published, leave bulletin
   links empty (match how the prior superseded row is listed).

## Workflow

1. **`source/announce-YYYY.md`** — add a new entry at the **top** of the list (newest
   first), using the announcement template below. Anchor is `#a<YYYYMMDD>`.
2. **`_config.yml`** — bump the variables for the released line:
   - 6.x: `prev_version`, `prev_version_short` (digits only, e.g. `6100`),
     `prev_release_date`, `prev_release_date_short` (`YYYYMMDD`).
   - 7.x: `current_version`, `current_version_short`, `release_date`, `release_date_short`.
3. **`source/index.html`** — usually **no edit needed**: the GA box renders from the
   variables. **Read the relevant `<a href="announce-YYYY#a{{ site.…_release_date_short }}">`
   line and compare its `announce-YYYY` to the year of your new entry.** If they differ
   (the announcement crossed into a new year file), update the `announce-YYYY` part to the
   new year — the anchor itself is variable-driven. If they already match, no edit.
   Note: a brand-new year file is the "New announcement year" task in CLAUDE.md — also
   create `source/announce-YYYY.md` and update the `.htaccess` redirect.
4. **`source/releases.md`** — move the now-superseded version of the **same line** into
   the **Prior Releases** table, newest first. Match the column widths and the
   vulnerability-cell style of the row above it (empty if no published bulletin).
5. **Branch + commit + draft PR** — branch `docs/announce-<version>`, commit type
   `docs:`, then `gh pr create --draft --base main`. Return a clickable PR link.
6. **Draft the email** — output the `[ANN]` email (below) in chat. Do **not** commit it.

## Announcement template (`announce-YYYY.md`)

```markdown
#### <DD Month YYYY> - Apache Struts version <X.Y.Z> General Availability {#a<YYYYMMDD>}

The Apache Struts group is pleased to announce that Apache Struts version <X.Y.Z> is available as a "General Availability"
release. The GA designation is our highest quality grade.

The Apache Struts is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+<X.Y.Z>) to find more details about performed
> bug fixes and improvements.

**All developers are strongly advised to perform this upgrade.**

The 6.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 3.1, JSP API 2.1, and Java 8.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.
```

For a **7.x** release adjust the spec-versions paragraph to the 7.x requirements
(Servlet 5.0 / Jakarta / Java 17 — copy from the most recent 7.x announcement).

## Email template (`[ANN]` — NOT committed, sent to announcements list)

Sent by the release manager to `announcements@struts.apache.org` (cc user list).
Plain text, full URLs inline, signed off. Mirror the website announcement wording:

```text
Subject: [ANN] Apache Struts <X.Y.Z>

The Apache Struts group is pleased to announce that Apache Struts
version <X.Y.Z> is available as a "General Availability" release. The GA
designation is our highest quality grade.

The Apache Struts is an elegant, extensible framework for creating
enterprise-ready Java web applications. The framework has been
designed to streamline the full development cycle, from building, to
deploying, to maintaining applications over time.

Please read the Version Notes to find more details about performed bug
fixes and improvements.
https://cwiki.apache.org/confluence/display/WW/Version+Notes+<X.Y.Z>

All developers are strongly advised to perform this upgrade.

The 6.x series of the Apache Struts framework has a minimum
requirement of the following specification versions: Servlet API 3.1,
JSP API 2.1, and Java 8.

Should any issues arise with your use of any version of the Struts
framework, please post your comments to the user list, and, if
appropriate, file a tracking ticket.
https://issues.apache.org/jira/projects/WW/

You can download this version from our download page.
https://struts.apache.org/download.cgi#struts-ga

Regards
Lukasz
```

If the release fixes a security issue with a published bulletin, add a line after
the Version Notes link pointing to `https://cwiki.apache.org/confluence/display/WW/S2-0XX`.

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Bumping `current_version` for a 6.x release | 6.x updates `prev_*`; 7.x updates `current_*`. Lines are independent. |
| Editing `index.html` when staying in the same year | It auto-renders from variables; only edit when the year file changes. |
| Adding the new version to Prior Releases | Move the **superseded** (previous) version of that line, not the one just released. |
| Forgetting `*_short` variables | Short forms are digits-only version (`6100`) and `YYYYMMDD` date — anchors break otherwise. |
| Committing the email | The email is drafted in chat and sent to the list manually — never committed. |
| Inventing an `S2-0XX` number | Only link a bulletin that actually exists; otherwise leave it out. |
```
