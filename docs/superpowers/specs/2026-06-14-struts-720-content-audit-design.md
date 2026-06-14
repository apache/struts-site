# Struts 7.2.0 Documentation Content Audit — Design

**Date:** 2026-06-14
**Scope:** Content documentation only. The release-announcement mechanics
(`_config.yml` bump, `announce-YYYY.md`, `releases.md`, PR, `[ANN]` email) are
explicitly out of scope — they are handled by the `announcing-struts-release` skill.

## Background

The 7.2.0 release notes were audited against the existing site content. Several
items were already documented in earlier PRs:

- WW-5444 (HTML5 theme) — `tag-developers/html5-theme.md`, linked from `themes-and-templates.md` (PR #287)
- WW-5585 (dynamic `allowedTypes`/`allowedExtensions`) — `action-file-upload-interceptor.md` (PR #289)
- WW-5588 (Preparable per-method `prepare*()`) — `prepare-interceptor.md` (PR #289)
- WW-4291 (Spring bean name for type converter) — `type-conversion.md` + `plugins/spring/index.md` (PR #289)
- WW-5621 (XML parser hardening) — `security/index.md` (PR #289)

This design covers the **remaining gaps**: the `@StrutsParameter` authorization
expansion to three new channels, and the new JSON deserialization configuration.

## Source of truth

Every fact below is taken from the JIRA issue and confirmed against the
`STRUTS_7_2_0` git tag:

- `core/src/main/resources/org/apache/struts2/default.properties` →
  `struts.chaining.requireAnnotations=false`
- `plugins/json/src/main/resources/struts-plugin.xml` →
  `struts.json.maxElements=10000`, `struts.json.maxDepth=64`,
  `struts.json.maxLength=2097152`, `struts.json.maxStringLength=262144`,
  `struts.json.maxKeyLength=512`, `struts.json.writer=struts`,
  `struts.json.reader=struts`

## Changes by page

### 1. `source/core-developers/chaining-interceptor.md` — WW-5631

Add a **"Parameter Authorization"** subsection after the existing
`struts.xwork.chaining.copy*` constants.

- New global constant `struts.chaining.requireAnnotations` (default `false`).
- When `true`, chaining copies only properties whose target setters carry
  `@StrutsParameter`; rejected properties are skipped and logged at WARN.
- Uses the same `ParameterAuthorizer` service as `ParametersInterceptor`.
- **Fail-closed:** if the target action cannot be introspected, no properties are copied.
- **Global-only:** no per-interceptor override.
- Cross-link to `struts-parameter-annotation.md`.

### 2. `source/core-developers/cookie-interceptor.md` — WW-5627

Add a **"Parameter Authorization"** note (page last edited 2017).

- Cookie values now flow through `@StrutsParameter` authorization instead of a
  direct `stack.setValue`, aligning with `ParametersInterceptor`.
- **Behavior-change callout:** applications relying on cookies populating
  un-annotated setters must add `@StrutsParameter` to those setters (or drop the
  `cookiesName=*` configuration).
- Governed by the existing `struts.parameters.requireAnnotations` setting.
- Cross-link to `struts-parameter-annotation.md`.

### 3. `source/core-developers/struts-parameter-annotation.md` — hub (WW-5626/5631/5627)

Add a **"Where authorization applies"** section listing the channels now enforced:

- `ParametersInterceptor` (default, governed by `struts.parameters.requireAnnotations`)
- `ChainingInterceptor` (opt-in via `struts.chaining.requireAnnotations`)
- `CookieInterceptor`
- JSON / REST deserialization (per-property, during deserialization)

Each entry links to the relevant page. This makes the annotation page the hub
for the authorization story.

### 4. `source/plugins/json/index.md` — WW-5618 + WW-5626

- New **"Deserialization limits"** subsection (placed under *Accepting JSON*)
  documenting the five limit constants with defaults:
  - `struts.json.maxElements` = `10000`
  - `struts.json.maxDepth` = `64`
  - `struts.json.maxLength` = `2097152` (2 MB)
  - `struts.json.maxStringLength` = `262144` (256 KB)
  - `struts.json.maxKeyLength` = `512`
  - settable globally (constant) or per-interceptor (param), following the
    fileUpload pattern.
- Note the pluggable `struts.json.writer` / `struts.json.reader` (default `struts`).
- Note that JSON deserialization now enforces `@StrutsParameter` **per-property**
  (unauthorized fields are never set), cross-linking to `struts-parameter-annotation.md`.

### 5. `source/plugins/rest/index.md` — WW-5626

In the existing *Custom ContentTypeHandlers* section:

- Note the new `AuthorizationAwareContentTypeHandler` interface (property-level
  authorization callbacks extending `ContentTypeHandler`).
- Note that the built-in handlers now enforce `@StrutsParameter` during
  deserialization, matching `ParametersInterceptor` per-parameter semantics.

## Out of scope (flag-only — no suitable doc home)

- WW-5576 (Java 25 three-letter timezone deprecation) — internal handling.
- WW-5603 (xwork-default.xml shown as framework config file) — internal labeling.
- WW-5635 (TokenHelper logs session token) — internal logging.
- WW-5632 (commons-fileupload2 binary hardening) — no user-facing doc.
- Internal-only: WW-5256, WW-5560, WW-5563, WW-5589, WW-5617, WW-5622, WW-5587.

## Success criteria

- All five pages updated with accurate constant names, defaults, and behavior as
  verified against the `STRUTS_7_2_0` tag.
- The authorization story is discoverable from `struts-parameter-annotation.md`
  with working cross-links to chaining, cookie, JSON, and REST docs.
- No announcement-mechanics files touched (`_config.yml`, `announce-*`, `releases.md`).
