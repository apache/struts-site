---
name: documenting-struts-release
description: Use when a new Apache Struts version has been released and you need to audit its release notes (JIRA / Version Notes) and update the website's feature/behavior documentation to match, including spotting breaking / backward-incompatible changes that need migration notes. For the GA announcement mechanics (announce-YYYY, _config.yml, releases.md, [ANN] email) use announcing-struts-release instead.
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

## Breaking changes — always run this pass

Breaking changes are the highest-value thing to document, and the easiest to
miss: they rarely sit under *New Feature*, and the JIRA notes have no "breaking"
category. They hide inside *Improvement*, *Bug*, *Task*, and *Dependency* items.
A breaking change needs a migration / behaviour-change callout
(`{:.alert .alert-warning}`) on the affected page, even when the item itself has
no obvious "feature" page.

**Shortlist first, then judge.** Don't eyeball ~60 issues — filter titles for the
words that signal breakage, then read the source diff for each hit:

```
enforce|authoriz|deprecat|remove|delete|rename|narrow|private|require|
default|harden|bump|upgrade|migrat|incompat|minimum|drop|reject
```

Then scan **every** shortlisted issue (all types, not just New Feature/Improvement)
against this checklist:

- **Changed default** — a constant/default flips so existing apps behave differently.
- **New enforcement** — stricter validation/authorization now rejects input that
  previously worked (e.g. `@StrutsParameter` enforcement reaching a new channel).
- **Removed / deprecated / narrowed API** — deleted methods, `protected`→`private`
  field changes that break subclasses, renamed/removed config keys.
- **Raised minimum requirement** — higher Java / Servlet / Jakarta / Spring /
  Tomcat baseline. Confirm against the tag's `pom.xml` / parent POM and compare to
  the previous tag; do **not** trust the announcement's copied boilerplate paragraph.
- **Dependency major bump that changes a user-facing API** — e.g. OGNL or
  commons-fileupload method renames. These are NOT "purely internal" if user code
  or config touches them. Several JIRA "Bump X from A to B" tickets may stack for
  one dependency; verify the **net** version delta in the tag's `pom.xml` against
  the *previous* tag, not the single hop shown in any one ticket.
- **Output/encoding changes** — altered rendered HTML, escaping, redirect bodies.

Check the **Version Notes** page (`{{ site.wiki_url }}/Version+Notes+<X.Y.Z>`) for
an upgrade/migration section — but treat it as a bonus, not the source of truth: it
is often empty for a release. The JIRA scan above is the primary discovery method.
Verify each suspected breaking change against the source tag (see Workflow step 4)
before writing the migration note. If a breaking change touches minimum runtime
requirements, also flag it for `announcing-struts-release` (its spec-versions
paragraph and the getting-started prerequisites may need updating).

## Workflow

1. **Get the itemized release notes.** Fetch the JIRA `ReleaseNote.jspa` URL and
   list **every** issue (all types) with its `WW-XXXX` key. Mark each as: a
   documentation candidate (New Feature, Improvement, or a *Bug* implying a
   user-visible change — changed default, new option, behavior change) and/or a
   **breaking change** per the checklist above. An item can be both.

2. **Check existing coverage FIRST — before planning any edit.** For each candidate:
   - `git log --oneline -- <likely page>` and search recent commits/PRs for the
     version or issue keys: `git log --oneline --all | grep -iE "<version>|WW-XXXX"`.
   - `grep -rn "<feature keyword / constant>" source/`.
   Many items will already be documented by a prior PR. Drop those.

3. **Map each remaining item to its page**, then classify it:
   - **documented** — already covered (drop).
   - **gap** — has a doc home, not yet covered (fix it).
   - **no-doc-home** — *purely* internal (perf, refactors, IDE-plugin, logging,
     dependency bumps with no user-facing effect) → list as out-of-scope, do not
     invent a page. Note: a dependency bump or removal that breaks user code/config
     is a **breaking change**, not no-doc-home — it still needs a migration note.

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
| Only scanning New Feature/Improvement for changes | Breaking changes hide in Bug/Task/Dependency items — run the breaking-changes pass over **every** issue. |
| Dropping dependency bumps as "internal" | A dep bump/removal that changes a user-facing API (OGNL, fileupload renames) is breaking — document it, don't drop it. |
| Re-copying the announcement's minimum-requirements paragraph | Verify Java/Servlet/Jakarta baselines against the tag's POM vs the previous tag; flag raised minimums. |
