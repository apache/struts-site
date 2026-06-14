---
name: documenting-struts-release
description: Use when a new Apache Struts version has been released and you need to audit its release notes (JIRA / Version Notes) and update the website's feature/behavior documentation to match. For the GA announcement mechanics (announce-YYYY, _config.yml, releases.md, [ANN] email) use announcing-struts-release instead.
---

# Documenting a Struts Release

## Overview

A new release ships bug fixes, improvements, and new features. Some of them
change documented behavior or add new configuration; many do not. This skill is
the **content audit**: map each release-note item to the page that documents it,
and update only the real gaps. It is separate from the release *announcement*
(see `announcing-struts-release`).

**Core principle: find the gap, don't re-document.** Most items are either already
documented by an earlier PR or have no doc home. Blindly "documenting the release
notes" produces duplicate or wrong content.

## Where the docs actually live

`source/docs/` is **only an index** — do not grep it for feature guides. Real
content lives in:

- `source/core-developers/` — interceptors, configuration, conversion, validation, file upload (~166 pages)
- `source/tag-developers/` — tags, themes, templates
- `source/plugins/<name>/` — per-plugin docs (json, rest, spring, convention, …)
- `source/security/` — security bulletins

## Workflow

1. **Get the itemized release notes.** Fetch the JIRA `ReleaseNote.jspa` URL and
   list **every** issue under *New Feature* and *Improvement* verbatim with its
   `WW-XXXX` key, plus any *Bug* whose title implies a user-visible change
   (changed default, new option, behavior change). Ignore purely internal items.

2. **Check existing coverage FIRST — before planning any edit.** For each candidate:
   - `git log --oneline -- <likely page>` and search recent commits/PRs for the
     version or issue keys: `git log --oneline --all | grep -iE "<version>|WW-XXXX"`.
   - `grep -rn "<feature keyword / constant>" source/`.
   Many items will already be documented by a prior PR. Drop those.

3. **Map each remaining item to its page**, then classify it:
   - **documented** — already covered (drop).
   - **gap** — has a doc home, not yet covered (fix it).
   - **no-doc-home** — internal (perf, refactors, dependency bumps, IDE-plugin,
     logging) → list as out-of-scope, do not invent a page.

4. **Verify exact details against the released source tag — NOT JIRA.** JIRA
   descriptions are *proposals*; constant names, defaults, and class names often
   differ in the merged code. Confirm against the `STRUTS_<X>_<Y>_<Z>` git tag, e.g.:
   - `core/src/main/resources/org/apache/struts2/default.properties`
   - `plugins/<name>/src/main/resources/struts-plugin.xml`

   Fetch `https://raw.githubusercontent.com/apache/struts/STRUTS_X_Y_Z/<path>`.

5. **Edit the gap pages.** Follow each page's existing structure and the repo's
   Kramdown conventions (e.g. `{:.alert .alert-warning}` for callouts). Cross-link
   related pages; for parameter-authorization topics, link the
   `core-developers/struts-parameter-annotation.html` hub. Confirm every internal
   link target file exists.

6. **Commit per page** (`docs:` type, with the `Co-Authored-By` trailer) on a
   branch off `main` (e.g. `docs/struts-<version>-content-audit`). Do **not** touch
   announcement files (`_config.yml`, `announce-*`, `releases.md`).

7. **Verify.** Run `bundle exec jekyll build --trace` (or note if the local Ruby
   env is broken — the PR auto-builds on staging). Grep-confirm new content and
   links. `git diff --name-only origin/main...HEAD` should show only the intended
   doc files.

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Documenting items already covered | Step 2: check git history + grep existing pages first; drop covered items. |
| Grepping `source/docs/` for feature pages | It is only an index — search `core-developers/`, `tag-developers/`, `plugins/`. |
| Trusting JIRA for constant names/defaults | JIRA is a proposal; verify against the `STRUTS_X_Y_Z` tag source. |
| Inventing a page for an internal change | If there is no doc home, list it as out-of-scope. |
| Bundling announcement changes | Announcement mechanics belong to `announcing-struts-release`; keep this branch content-only. |
| Claiming the build passed when it didn't run | Say the local build couldn't run and rely on staging; never assert unverified success. |
