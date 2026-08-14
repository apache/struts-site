---
layout: default
title: Release Guidelines
---

# Release Guidelines
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

This document describes how an Apache Struts release is made: the policy that governs it, the
seven phases it runs through, and the command needed at each step. It is written for the release
manager, but every committer is encouraged to read it — releases are easier when more than one
person knows what the next step is.

This page is the source of truth for the release process. Where an older wiki page disagrees
with it, this page is current. For coding conventions see [Coding standards](coding-standards),
and for building the framework day to day see [Builds](builds).

## Release policy

A [point release](http://commons.apache.org/releases/versioning) should be made before and after
any product change that is not a "fully-compatible change" (see link). We should place any
fully-compatible changes in the hands of the community before starting on a change that is only
"interface" or "external-interface" compatible.

- Every committer is encouraged to participate in the release process, either as the release
  manager or a helper. Committers may also share the release manager role.
- Our dependencies should be in line with our own release status. A General Availability release
  may only have dependencies on other GA, final, or stable releases.
- Provide high-level API compatibility for any changes made within the same major release series
  (`#.x.x`). Changes which adversely affect compatibility should be slotted for the next major
  release series.
- Use your own discretion as to the detail needed in the Version Notes. A high-level description
  of the changes is more important than uninterpreted detail. At a minimum, new features and
  deprecations should be summarised, since these are commonly asked questions.
- Any formal release may be submitted for mirroring. All GA releases **must** be mirrored.
- If a serious flaw is found in a release candidate or a release, it may be withdrawn by a
  majority vote of the PMC and removed from ASF distribution channels.

## Before you start

### Two lines mean two releases

`main` is the 7.x line and `support/struts-6-x-x` is the 6.x line. Both are protected in
`.asf.yaml` and both must be green before you start.

| Line | Branch | Build check that must pass | JDK |
|---|---|---|---|
| 7.x | `main` | `Build and Test (JDK 17)` | 17 |
| 6.x | `support/struts-6-x-x` | `Build and Test (8)` | 8 |

A change that lands on both lines is **two releases** — each with its own tag, vote, site entry
and announcement, not one release mentioned twice. They can be cut and voted in parallel, and
usually are, but keep the version numbers independent: 6.11.0 and 7.3.0 shipped on the same day
and share nothing but a date.

### Check the JDK before building anything

The whole release is produced by whichever JDK happens to be active in your shell, and the line
dictates which one that must be. Cutting 6.x on JDK 17 produces artifacts that will not run for
the users that line exists for.

```bash
mvn -v    # reports the JDK Maven is actually using, not just $JAVA_HOME
```

{:.alert .alert-warning}
If it reports the wrong version, stop and switch before going any further.

### The version number is decided at release time

The `-SNAPSHOT` in the pom is a placeholder, not a decision. Pick the number from the semantic
versioning impact of what actually landed since the last tag, and state it before cutting — the
tag is the first irreversible act of the release.

The pom cannot tell you what the number is. Because releases are cut on a side branch, the root
pom on `main` still read `7.2.2-SNAPSHOT` after 7.3.0 had shipped.

### What you need access to

- A committer account with your Apache and GitHub accounts linked in
  [GitBox](https://gitbox.apache.org/setup/).
- A code signing key published in
  [`KEYS`](https://dist.apache.org/repos/dist/release/struts/KEYS) and in the ASF web of trust.
- ASF credentials for `dist.apache.org` (Subversion) and for
  [Nexus](https://repository.apache.org/).

## The seven phases

A release is seven phases with a gate between each. A phase is finished when its gate is
verifiable by someone other than you: "I ran the command" is not a gate, "the URL resolves" is.

| # | Phase | Gate before moving on |
|---|---|---|
| 1 | [Prepare](#phase-1--prepare) | Branch green, version decided, parent poms released |
| 2 | [Cut](#phase-2--cut) | Tag pushed, artifacts in a **closed** Nexus staging repository |
| 3 | [Stage](#phase-3--stage) | Assemblies in `dist/dev`, Version Notes page live, `[TEST]` mail sent |
| 4 | [Vote](#phase-4--vote) | 72 hours elapsed, three binding `+1`, result mail sent |
| 5 | [Promote](#phase-5--promote) | Nexus repository released, `dist/dev` → `dist/release`, 24 hour rsync waited |
| 6 | [Publish](#phase-6--publish) | Site updated, GitHub release un-flagged, `[ANN]` mail delivered |
| 7 | [Advisories](#phase-7--security-advisories) | Bulletins public, CVE records filled, advisory mails delivered |

Phase 7 exists only when the release carries a security fix, and it is strictly the last thing
that happens — see [Security advisories](#phase-7--security-advisories).

## Phase 1 — Prepare

Start from a clean, up-to-date checkout of the line you are releasing and confirm it builds.

```bash
git checkout main && git pull --ff-only
mvn clean install -DskipAssembly
```

Then:

- Decide the version number from its semantic versioning impact. Do not read it off the
  `-SNAPSHOT`.
- Confirm that `struts-master` and `struts-annotations` are released versions, not snapshots. The
  root pom's `<parent>` must not point at a snapshot.
- Review JIRA: every issue fixed since the last tag has a fix version set, and nothing unresolved
  carries the version you are about to release.
- Release the version in JIRA once the last issue is closed, and add the next version to the
  roadmap.

The BOM needs no version synchronisation. `bom/pom.xml` inherits the root version through its
`<parent>` and declares its members as `${project.version}`.

## Phase 2 — Cut

### Cut from a release branch, not from the line branch

```bash
git checkout -b release/7.3.0-RC1 main    # or off support/struts-6-x-x for the 6.x line
git push -u origin release/7.3.0-RC1
```

The two `[maven-release-plugin]` commits land on that branch and the line branch is never
touched. A failed vote is then a deleted branch rather than a revert.

### Prepare and perform

```bash
mvn release:prepare
```

No flags. `autoVersionSubmodules` is configured in the root pom, alongside the ASF parent's
`useReleaseProfile=false`, `goals=deploy` and `releaseProfiles=apache-release`. If you find
yourself passing `-D` to the release plugin, the setting belongs in the pom instead — a flag that
has to be remembered is a flag that will be forgotten.

{:.alert .alert-warning}
At the SCM tag prompt, type `STRUTS_X_Y_Z`. The plugin's default is derived from the root
artifactId and is wrong; every Struts tag in history uses the underscore form, and the GitHub
release, the Version Notes and the website all assume it.

For a [dry run](http://maven.apache.org/plugins/maven-release-plugin/usage.html) add
`-DdryRun=true`, then `mvn release:clean` before the real run. If the command fails part way
through, re-run it as is: `-Dresume` defaults to true and it picks up where it stopped.

The result is two commits on the release branch — `[maven-release-plugin] prepare release
STRUTS_X_Y_Z` and `[maven-release-plugin] prepare for next development iteration` — plus the tag.

```bash
mvn release:perform
```

`retryFailedDeploymentCount` is configured on `maven-deploy-plugin` in the root pom, not passed
here. It has to be in the pom to work at all: `release:perform` forks a fresh Maven build, and
that fork does not inherit `-D` properties from the outer invocation.

If you need to run the deployment again, or from a different machine:

```bash
git checkout STRUTS_X_Y_Z
mvn javadoc:javadoc deploy -DperformRelease=true -Papache-release
```

### Close the staging repository

Log in to [Nexus](https://repository.apache.org/), then **Staging Repositories** → select the
repository → **Close**.

{:.alert .alert-warning}
A successful `release:perform` leaves the repository *open*, and an open repository serves
nothing under the staging group URL. Until it is closed, every link in the Version Notes resolves
to nothing and no one can test the build.

The gate is that the artifacts resolve under:

```
https://repository.apache.org/content/groups/staging/org/apache/struts/struts2-core/$VERSION/
```

The staging repository is keyed by user *and* public IP address. If your address changed mid
release you will have two of them; check the dates and drop the stale one.

## Phase 3 — Stage

To make the build testable, the assemblies are moved out of Nexus into
`https://dist.apache.org/repos/dist/dev/struts/$VERSION`. The steps are scripted in
[`stage-assemblies.sh`](https://github.com/apache/struts/blob/main/.claude/skills/releasing-struts/scripts/stage-assemblies.sh);
run it from a scratch directory, since it creates `./$VERSION` and a temporary Subversion working
copy in the current directory.

```bash
cd "$(mktemp -d)"
VERSION=7.3.0 /path/to/stage-assemblies.sh
```

It fetches the `zip`, `md5`, `sha1` and `asc` files from the closed staging repository, strips
the `2-assembly` infix from their names, drops the `.pom` files and the legacy `md5`/`sha1`
hashes, generates `.sha256` and `.sha512` locally, prints what it is about to publish, and then
commits the directory to `dist/dev/struts`. In outline:

```bash
wget -erobots=off -nv -l 1 --accept=zip,md5,sha1,asc -r -nd -nH \
  https://repository.apache.org/content/groups/staging/org/apache/struts/struts2-assembly/$VERSION
for f in *2-assembly*.zip*; do mv "$f" "$(echo "$f" | sed s/2-assembly//g)"; done
rm -f struts2-assembly-*.pom* ./*.md5 ./*.sha1
for f in *.zip; do shasum -a 256 "$f" > "$f.sha256"; shasum -a 512 "$f" > "$f.sha512"; done
svn --no-auth-cache co --depth empty https://dist.apache.org/repos/dist/dev/struts/ struts-dev
mv $VERSION struts-dev/ && cd struts-dev
svn add --force ./
svn --no-auth-cache commit -m "Updates test release $VERSION"
```

The gate is `https://dist.apache.org/repos/dist/dev/struts/$VERSION/`, holding **six** assemblies
— `struts-$VERSION-all.zip`, `-apps.zip`, `-docs.zip`, `-lib.zip`, `-min-lib.zip` and `-src.zip`
— each with an `.asc`, `.sha256` and `.sha512` beside it: 24 files, no `.md5`, no `.sha1`, no
`.pom`. `KEYS` lives one level up, in `dist/release/struts/`.

{:.alert .alert-warning}
Count the files. The script stops on a step that fails, not on a download that quietly returns a
subset, so a short upload can reach `dist/dev` looking healthy.

The rest of this phase is paperwork:

- Create the **Version Notes** page in the wiki for the new version, linking the previous notes in
  the series, the JIRA issues fixed, and the staging repository, and link it from the
  [Migration Guide](https://cwiki.apache.org/confluence/display/WW/Migration+Guide).
- Create the **GitHub release** for the tag, flagged as a **prerelease**.
- Send a `[TEST]` mail to `dev@struts.apache.org` and `user@struts.apache.org` announcing that the
  build is available, and give people time to test the actual bits.

## Phase 4 — Vote

Post a release/quality vote to the dev list and only the dev list.

```
To: dev@struts.apache.org
Bcc: private@struts.apache.org
```

Never `user@`. `private@` is copied so that binding voters see the thread.

The vote runs for a **minimum of 72 hours** and needs **three binding `+1`** votes; PMC members'
votes are the binding ones. Close the vote with a result mail on the same thread.

If the vote fails, delete the release branch and start again from phase 1 with a new version
number. Nothing that has been published so far is promoted.

## Phase 5 — Promote

Move the assemblies from `dist/dev` to `dist/release`. This is the point at which they start
replicating to the mirrors. The step is scripted in
[`promote-dist.sh`](https://github.com/apache/struts/blob/main/.claude/skills/releasing-struts/scripts/promote-dist.sh):

```bash
svn mv https://dist.apache.org/repos/dist/dev/struts/$VERSION/ \
       https://dist.apache.org/repos/dist/release/struts/ \
       -m "Release Struts $VERSION"
```

Then log in to [Nexus](https://repository.apache.org/) again and **release** the staging
repository, which replicates the artifacts to Maven Central. See
[Releasing a Maven-based project](http://maven.apache.org/developers/release/apache-release.html)
for further details.

Old releases may be removed from `dist/release/struts/` to keep the mirror set small; everything
removed stays available from [archive.apache.org](https://archive.apache.org/dist/struts/).
Decide deliberately which versions to keep — in practice several supported versions from both
lines are kept — and do not prune on autopilot.

```bash
svn del https://dist.apache.org/repos/dist/release/struts/$OLD_VERSION/ -m "Removing old release"
```

{:.alert .alert-danger}
Wait **24 hours** after the move before anything in phase 6. This is the ASF mirroring
requirement, and announcing into an unmirrored release sends everyone to a 404.

## Phase 6 — Publish

### Update the website

The site is [apache/struts-site](https://github.com/apache/struts-site) and publishing is the
merge — there is no separate deploy step. Open a pull request against `main`; it is staged
automatically at [struts.staged.apache.org](https://struts.staged.apache.org/) for review.

`_config.yml` — these move together:

```yaml
current_version: 7.3.0
current_version_short: 730
prev_version: 6.11.0
prev_version_short: 6110
release_date: 1 August 2026
prev_release_date: 1 August 2026
release_date_short: 20260801
prev_release_date_short: 20260801-6110
```

`release_date` is the **tag** date, not the announcement date: 7.2.1 was tagged on 15 June and
announced on 30 June, and the site says 15 June. The `*_date_short` values are the anchors in
`announce-YYYY.md`; when two releases share a tag date, disambiguate the second one (as
`20260801-6110` above) so that each home page box links to its own entry.

Then:

- `source/announce-YYYY.md` — a new `####` entry at the top, newest first, with its
  `{% raw %}{#aYYYYMMDD}{% endraw %}` anchor.
- `source/releases.md` — the release table, and move the superseded version into
  **Prior Releases**. This one is easy to miss; a site update without it is incomplete.
- `source/index.html` — the GA boxes read their values from `_config.yml`; the security boxes are
  hand-edited.
- `source/dtds/` — only if a new DTD shipped.

`source/download.cgi` and `source/download.md` need no per-release edit: the first is a wrapper
around `mirrors.cgi`, and the second interpolates its versions from `_config.yml`.

### Un-flag the GitHub release

Remove the prerelease flag from the GitHub release created in phase 3. Title `Struts X.Y.Z`, tag
`STRUTS_X_Y_Z`.

{:.alert .alert-warning}
The release must stay flagged as a prerelease for the whole of the vote. Un-flagging it early
means voting on an artifact the world already treats as final.

### Announce it

```
To: user@struts.apache.org
Cc: announce@apache.org, announcements@struts.apache.org
```

`dev@` is not on it — the list already saw the `[TEST]` mail and the vote.

{:.alert .alert-danger}
The announcement must be **plain text** and sent from your `@apache.org` identity.
`announce@apache.org` rejects any message carrying a `text/html` part, and
`announcements@struts.apache.org` rejects anything not sent from an `@apache.org` address. One
list accepting the mail is not evidence that the format was right.

The body carries the General Availability boilerplate, a link to the Version Notes, a link to the
Migration Guide for a new major line, the minimum JDK and specification requirements for that
line, and the [download page](download.cgi).

## Phase 7 — Security advisories

This phase exists only when the release carries a security fix, and it happens **after** phase 6.
The bulletin itself is usually written when the report is triaged, which may be months before a
release carries the fix.

The ordering is not negotiable:

```
release GA  →  bulletin published  →  advisory mails  →  CVE record submitted
```

A bulletin published before the fixed artifact is downloadable tells attackers what to look for
and gives operators nothing to do about it.

{:.alert .alert-danger}
Nothing about an unpublished advisory goes into the release paperwork — not the Version Notes,
not the `[TEST]` mail, not the `[VOTE]`, not the commit messages, not the site entry. Neutral
tickets are what let the embargo survive a public release process.

A release containing *only* embargoed fixes is self-disclosing: the difference between the two
tags is the vulnerability, whatever the commit messages say. That is a reason to bundle such
fixes with unrelated work, or to publish the bulletins together with the release — not a reason
to pretend otherwise.

The CVE record goes `RESERVED → DRAFT → READY`, and `READY` is the last state the PMC sets. ASF
Security submits it to the CVE Program and sets it `PUBLIC`, so `cve.org` links return 404 until
they do. That is expected and is not a reason to delay the bulletin or the mails.

See [Security bulletins](security/) for how bulletins are written and published, and
[Reporting security issues](security) for how reports reach us in the first place.

## After the release

- Add a site announcement entry for any security advisory, in the same form as the GA one.
- Check the [NVD](https://nvd.nist.gov/) entry once a CVE goes public. The affected ranges have
  been wrong before; the fix is an email to `nvd@nist.gov` citing the CVE record.
- Answer any coordinator who is holding an advisory in their existing thread, once ours is live.
- Update the Version Notes page if the vote forced a re-cut.

## Red flags

Stop if any of these is about to happen:

- Cutting a tag before the version number has been stated and agreed.
- Inferring the release version from the `-SNAPSHOT` in the pom.
- A `[VOTE]` opened on a staging repository that is not closed, or on a link that 404s.
- Announcing before the 24 hour mirror wait.
- Any severity, CVE, `S2-XXX` or bulletin link appearing in release paperwork.
- A bulletin published before the fixed release is downloadable.
- One release "covering" both maintenance lines.

Next: [PMC Charter](bylaws)
