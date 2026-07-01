# Jenkins JavaDocs Pipeline Conversion Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the shell-based `Struts-site-javadocs` freestyle Jenkins job with a version-controlled declarative pipeline, `Jenkinsfile.javadocs`.

**Architecture:** A declarative Jenkins pipeline at the repo root, run on the ASF `git-websites` agent, manually triggered with a `STRUTS_TAG` parameter. Stage 1 clones + builds Struts and stages its Maven site under the gitignored `target/`; Stage 2 publishes the staged site into `source/maven/` on `main` and pushes to the `asf` gitbox remote. Mirrors the existing root `Jenkinsfile` conventions.

**Tech Stack:** Jenkins declarative pipeline (Groovy DSL), shell, Maven (`mvn` on the ASF agent via `MAVEN_3_LATEST_HOME`), git (gitbox).

## Global Constraints

- Spec: `docs/superpowers/specs/2026-07-01-jenkins-javadocs-pipeline-design.md`.
- Behavior must match the current shell script exactly, except two intended deviations:
  - Build with plain `mvn`, not `./mvnw`.
  - Push via the explicit `asf` remote, not `origin`.
- Commit message that publishes the site MUST be exactly `Updates Maven site by Jenkins`.
- Empty-commit guard MUST be preserved: `git diff --cached --quiet || git commit ...`.
- Clone location MUST remain `target/struts` (under the gitignored `target/`).
- `STRUTS_TAG` default is `main`; any other value is treated as a git tag (`tags/${STRUTS_TAG}`).
- Do NOT modify the existing root `Jenkinsfile` (that is the separate `Struts-site` job).
- Declarative pipelines cannot be validated by a standalone `groovy` binary; local checks are structural only, real acceptance is a manual Jenkins run (Task 2).

---

### Task 1: Author `Jenkinsfile.javadocs`

**Files:**
- Create: `Jenkinsfile.javadocs`
- Reference (do not modify): `Jenkinsfile` (source of the `post` email blocks and style)

**Interfaces:**
- Consumes: ASF Jenkins agent env var `MAVEN_3_LATEST_HOME`; agent label `git-websites`; `emailext` and `DevelopersRecipientProvider` (provided by the Jenkins controller, same as the existing `Jenkinsfile`).
- Produces: a pipeline definition file that the Jenkins job (Task 2) points at via "Pipeline script from SCM".

- [ ] **Step 1: Create the file with the full pipeline**

Create `Jenkinsfile.javadocs` with exactly this content:

```groovy
#!groovy

pipeline {
  agent {
    label 'git-websites'
  }
  parameters {
    string(name: 'STRUTS_TAG', defaultValue: 'main',
           description: 'Struts release tag (e.g. STRUTS_7_2_1) or "main"')
  }
  options {
    buildDiscarder logRotator(numToKeepStr: '5')
    timeout(90)
    disableConcurrentBuilds()
    skipStagesAfterUnstable()
  }
  tools {
    // Provisions `mvn` and JDK 17 on PATH via Jenkins tool installers, matching
    // the apache/struts build. Struts 7 requires JDK 17.
    jdk 'jdk_17_latest'
    maven 'maven_3_latest'
  }
  environment {
    MAVEN_OPTS = '-Xmx2048m -Dhttps.protocols=TLSv1.2 -DfailOnError=false'
  }
  stages {
    stage('Build Struts & Maven site') {
      steps {
        sh '''
          echo "Building Struts ${STRUTS_TAG} and staging the Maven site"

          rm -rf target/struts
          git clone https://gitbox.apache.org/repos/asf/struts.git target/struts

          cd target/struts
          if [ "${STRUTS_TAG}" = "main" ]; then
            git checkout main
          else
            git checkout "tags/${STRUTS_TAG}"
          fi

          mvn -B -V clean install -DskipTests
          # Skip the OWASP dependency-check report: its aggregate goal downloads the
          # full NVD CVE database (~360k records) with no API key, blowing the timeout.
          mvn -B -V site:site site:stage -Ddependency-check.skip=true
        '''
      }
    }
    stage('Publish to source/maven') {
      steps {
        sh '''
          echo "Publishing the staged Maven site into source/maven on main"

          if ! git config remote.asf.url > /dev/null; then
            git remote add asf https://gitbox.apache.org/repos/asf/struts-site.git
          fi

          git fetch asf
          # Check out asf/main explicitly: the Pipeline SCM checkout also leaves an
          # origin/main, so a bare `git checkout main` is ambiguous across two remotes.
          git checkout -B main asf/main

          rm -rf source/maven
          mkdir -p source/maven
          mv target/struts/target/staging/* source/maven/

          git add source/maven
          git status

          git diff --cached --quiet || git commit -m "Updates Maven site by Jenkins"
          git push asf main
        '''
      }
    }
  }
  post {
    // If this build failed, send an email to the developers.
    failure {
      script {
        emailext(
            recipientProviders: [[$class: 'DevelopersRecipientProvider']],
            from: "Mr. Jenkins <jenkins@builds.apache.org>",
            subject: "Jenkins job ${env.JOB_NAME}#${env.BUILD_NUMBER} failed",
            body: """
There is a build failure in ${env.JOB_NAME}.

Build: ${env.BUILD_URL}
Logs: ${env.BUILD_URL}console
Changes: ${env.BUILD_URL}changes

--
Mr. Jenkins
Director of Continuous Integration
"""
        )
      }
    }
    // Send an email, if the last build was not successful and this one is.
    fixed {
      script {
        emailext(
            recipientProviders: [[$class: 'DevelopersRecipientProvider']],
            from: 'Mr. Jenkins <jenkins@builds.apache.org>',
            subject: "Jenkins job ${env.JOB_NAME}#${env.BUILD_NUMBER} back to normal",
            body: """
The build for ${env.JOB_NAME} completed successfully and is back to normal.

Build: ${env.BUILD_URL}
Logs: ${env.BUILD_URL}console
Changes: ${env.BUILD_URL}changes

--
Mr. Jenkins
Director of Continuous Integration
"""
        )
      }
    }
  }
}
```

- [ ] **Step 2: Structural sanity checks**

Run:
```bash
# Balanced braces (should print: braces OK)
awk '{for(i=1;i<=length($0);i++){c=substr($0,i,1);if(c=="{")n++;if(c=="}")n--}} END{print (n==0)?"braces OK":"UNBALANCED: "n}' Jenkinsfile.javadocs

# Required blocks are present (each grep should print a match)
grep -n "agent {" Jenkinsfile.javadocs
grep -n "string(name: 'STRUTS_TAG'" Jenkinsfile.javadocs
grep -n "mvn -B -V clean install -DskipTests" Jenkinsfile.javadocs
grep -n "mvn -B -V site:site site:stage" Jenkinsfile.javadocs
grep -n 'git push asf main' Jenkinsfile.javadocs
grep -n 'Updates Maven site by Jenkins' Jenkinsfile.javadocs

# The wrapper must NOT be referenced anymore (should print: no mvnw refs OK)
grep -q './mvnw' Jenkinsfile.javadocs && echo "FOUND mvnw — must be removed" || echo "no mvnw refs OK"
```
Expected: `braces OK`; every `grep -n` prints its line; final line prints `no mvnw refs OK`.

- [ ] **Step 3: Confirm the existing Jenkinsfile is untouched**

Run: `git status --porcelain Jenkinsfile`
Expected: no output (the `Struts-site` job's file is unchanged).

- [ ] **Step 4: Commit**

```bash
git add Jenkinsfile.javadocs
git commit -m "ci: add declarative pipeline for the javadocs job

Converts the shell-based Struts-site-javadocs freestyle job into
Jenkinsfile.javadocs. Builds Struts with plain \`mvn\` and publishes the
staged Maven site into source/maven on main via the asf remote.

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"
```

---

### Task 2: Wire up and verify the Jenkins job (operational — runs in Jenkins, not the repo)

This task has no repo commit; its deliverable is a green build that publishes the site. It cannot be done until Task 1's branch is merged to `main` (the job checks out `main`).

**Interfaces:**
- Consumes: `Jenkinsfile.javadocs` on `main`; ASF Jenkins credentials on the `git-websites` agent.
- Produces: an updated `source/maven/` on `main` (and, via the ASF Jekyll buildbot, `asf-site`).

- [ ] **Step 1: Merge Task 1 to `main`**

Open a PR from the Task 1 branch and merge it, so `Jenkinsfile.javadocs` exists on `main`.

- [ ] **Step 2: Reconfigure the Jenkins job**

In `Struts-site-javadocs` → Configure:
- Definition: **Pipeline script from SCM**
- SCM: Git, repo `https://gitbox.apache.org/repos/asf/struts-site.git`, branch `*/main`
- Script Path: `Jenkinsfile.javadocs`
- Save.

- [ ] **Step 3: Dry-run against `main`**

Trigger **Build with Parameters** with `STRUTS_TAG=main`.
Expected: both stages green; console shows `mvn` (not `mvnw`) being used; final step either commits `Updates Maven site by Jenkins` and pushes to `asf` `main`, or reports nothing to commit if the site is unchanged.

- [ ] **Step 4: Verify the published output**

On `main` after the run, confirm `source/maven/` contains freshly generated Maven site HTML (e.g. `source/maven/index.html` present, timestamps current). Confirm the ASF buildbot republished to `asf-site` (check https://struts.apache.org/maven/).

- [ ] **Step 5: (Optional) Tag run**

Re-run with a real tag (e.g. `STRUTS_TAG=STRUTS_7_2_1`) to confirm the `tags/${STRUTS_TAG}` checkout path works.

---

## Follow-ups (tracked in the spec, not part of this plan)

- Delete `mvnw`, `mvnw.cmd`, `.mvn/` from the **apache/struts** repo (separate repo/commit) so the wrapper and CI don't drift now that CI uses plain `mvn`.
- Revisit PR #293's "sole source of truth" note to confirm the `source/maven` on `main` publish path is still intended.
