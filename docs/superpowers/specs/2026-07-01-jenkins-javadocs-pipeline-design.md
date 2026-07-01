# Convert the Struts-site-javadocs Jenkins job to a declarative pipeline

**Date:** 2026-07-01
**Status:** Approved — ready for implementation plan

## Problem

The `Struts-site-javadocs` Jenkins job (https://ci-builds.apache.org/job/Struts/job/Struts-site-javadocs/)
is currently a freestyle job with an inline `#!/bin/sh` build step. It:

1. Clones `apache/struts` into `target/struts`, checks out `main` or a release tag.
2. Builds the project and generates + stages the Maven site.
3. Publishes the staged site into `source/maven/` on the `struts-site` `main` branch,
   commits, and pushes. The ASF Jekyll buildbot then republishes `main → asf-site`.

We want this expressed as a declarative Jenkins pipeline (Groovy), consistent with the
existing website-build pipeline already in this repo.

## Goals

- Replace the shell freestyle job with a reviewable, version-controlled declarative pipeline.
- Preserve current behavior exactly, except for the two deliberate changes below.
- Match the conventions of the existing root `Jenkinsfile` (the `Struts-site` job).

## Non-goals

- No change to what content is published or where (`source/maven/` on `main`).
- No change to the ASF `main → asf-site` republish mechanism.
- Removing the `mvnw`/`.mvn/` wrapper files from the **apache/struts** repo (separate
  repo, separate commit — see Follow-ups).

## Deliberate changes vs. the current shell script

1. **`./mvnw` → `mvn`.** Use the Maven installation on the ASF agent instead of the
   Struts project's Maven wrapper. This makes the `MAVEN_3_LATEST_HOME` PATH entry
   load-bearing (it is what resolves `mvn`), so it is kept.
2. **`git push origin main` → `git push asf main`.** Mirror the existing `Jenkinsfile`'s
   explicit `asf` remote pattern rather than relying on the ambient `origin`.

## Design

### Placement

A new file **`Jenkinsfile.javadocs`** at the repo root. The `Struts-site-javadocs` job is
reconfigured in Jenkins as **Pipeline script from SCM** → this repo, branch `main`, script
path `Jenkinsfile.javadocs`. Both job definitions then live in git.

### Trigger & parameters

Manually triggered ("Build with Parameters"). One parameter:

```groovy
parameters {
  string(name: 'STRUTS_TAG', defaultValue: 'main',
         description: 'Struts release tag (e.g. STRUTS_7_2_1) or "main"')
}
```

### Agent, options, environment

```groovy
agent { label 'git-websites' }

options {
  buildDiscarder logRotator(numToKeepStr: '5')
  timeout(90)                    // full Struts build + site:site is slow
  disableConcurrentBuilds()
  skipStagesAfterUnstable()
}

environment {
  MAVEN_OPTS = '-Xmx2048m -Dhttps.protocols=TLSv1.2 -DfailOnError=false'
  PATH = "${MAVEN_3_LATEST_HOME}:${env.PATH}"   // required: resolves `mvn` on the ASF agent
}
```

### Stages

**Stage 1 — Build Struts & Maven site**

Single `sh` step, all work under the gitignored `target/` so the struts clone never
pollutes the site repo:

- `rm -rf target/struts`
- clone `https://gitbox.apache.org/repos/asf/struts.git` into `target/struts`
- checkout: if `STRUTS_TAG == main` → `git checkout main`, else `git checkout "tags/${STRUTS_TAG}"`
- `mvn -B -V clean install -DskipTests`
- `mvn -B -V site:site site:stage`

**Stage 2 — Publish to source/maven**

Mirror the existing `Jenkinsfile` deploy pattern:

- add the `asf` remote if missing → `https://gitbox.apache.org/repos/asf/struts-site.git`
- `git checkout main` && `git pull asf main`
- `rm -rf source/maven && mkdir -p source/maven`
- `mv target/struts/target/staging/* source/maven/`
- `git add source/maven`
- `git diff --cached --quiet || git commit -m "Updates Maven site by Jenkins"`
- `git push asf main`

### Post

Copy the `post { failure {} fixed {} }` `emailext` blocks verbatim from the existing
root `Jenkinsfile` (from "Mr. Jenkins", recipients via `DevelopersRecipientProvider`).

## Behavior parity checklist

| Aspect                        | Shell script            | Pipeline                | Same? |
|-------------------------------|-------------------------|-------------------------|-------|
| Clone location                | `target/struts`         | `target/struts`         | ✅    |
| Tag/main selection            | `STRUTS_TAG`            | `STRUTS_TAG` param      | ✅    |
| Build command                 | `./mvnw clean install`  | `mvn clean install`     | ⚠️ intended |
| Site command                  | `./mvnw site:site …`    | `mvn site:site …`       | ⚠️ intended |
| MAVEN_OPTS                     | same                    | same                    | ✅    |
| Publish target                | `source/maven` on main  | `source/maven` on main  | ✅    |
| Commit message                | "Updates Maven site …"  | identical               | ✅    |
| Empty-commit guard            | `git diff --cached -q`  | identical               | ✅    |
| Push remote                   | `origin`                | `asf`                   | ⚠️ intended |

## Follow-ups (out of scope for this change)

- Delete `mvnw`, `mvnw.cmd`, and `.mvn/` from the **apache/struts** repo so the wrapper and
  the CI job do not drift now that CI uses plain `mvn`.
- Optional: revisit PR #293's note that the javadocs job is the "sole source of truth" for
  `maven/` on `asf-site`, to confirm the `source/maven` on `main` publish path is still the
  intended flow.
