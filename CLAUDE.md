# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the Apache Struts website repository, which powers https://struts.apache.org/. The site is built with Jekyll 4.2 and uses a mix of Markdown and HTML files.

## Development Commands

### Running the Site Locally

```bash
# Using Docker (recommended, Apple Silicon)
./docker-build.sh          # Build image (only when Dockerfile changes)
./docker-arm64-serve.sh    # Serve site at http://localhost:4000

# Using Jekyll directly
bundle install             # Install dependencies
bundle exec jekyll serve -w --trace --host 0.0.0.0
```

## Architecture

### Directory Structure

- `source/` - All source content (Markdown/HTML), Jekyll source directory
  - `_layouts/` - Page templates: `default`, `main-page`, `core-developers`, `maven-archetypes`
  - `_includes/` - Shared partials: `header.html`, `footer.html`
  - `_plugins/` - Custom Liquid tags (see below)
  - `.htaccess` - Apache redirect rules (update when adding yearly announcement pages)
- `_config.yml` - Jekyll config and site-wide version/release variables
- `.asf.yaml` - ASF infrastructure config (deployment, notifications, branch protection)

### Content Sections

The `source/` directory contains these main content areas:
- `docs/` - Framework documentation
- `getting-started/` - Getting started guides
- `plugins/` - Plugin documentation
- `core-developers/` - Core developer guide (uses `core-developers` layout)
- `security/` - Security bulletins
- `tag-developers/` - Tag developer documentation
- `maven-archetypes/` - Maven archetype docs (uses `maven-archetypes` layout)
- `announce-YYYY.md/html` - Yearly announcement pages

### Site Variables in `_config.yml`

Version and release date variables (`current_version`, `prev_version`, `release_date`, etc.) are referenced throughout `source/index.html`, `source/download.md`, and `source/releases.md` using `{{ site.variable_name }}`. When preparing a new release, update these in `_config.yml` rather than editing individual pages.

### Custom Jekyll Plugins

Two custom Liquid tags in `source/_plugins/`:

- **`{% snippet %}`** - Fetches and embeds code snippets from remote sources (Apache Git repos). Supports parameters: `url=`, `id=` (for snippet markers), `lang=` (syntax highlighting), `javadoc=` (strip Javadoc formatting). Caches fetched content in `target/snippet_*.cache`.
- **`{% remote_file_content %}`** - Fetches and inlines content from a remote URL.

### Layouts

- `default` - Standard content page with "Edit on GitHub" link and optional parent breadcrumb
- `main-page` - Homepage layout (no sidebar, no edit link)
- `core-developers` - Like default but with hardcoded "back to Core Developers Guide" link
- `maven-archetypes` - Similar to core-developers

### Styling

Kramdown attribute syntax for Bootstrap classes:
- Alerts: `{:.alert .alert-warning}`, `{:.alert .alert-info}`, etc.
- Text: `{:.text-primary}`, `{:.text-danger}`, etc.
- See `source/updating-website.md` for complete examples.

## Deployment

### Branching

- `main` - Source branch for all changes/PRs
- `asf-site` - Production (auto-deployed, DO NOT MODIFY)
- `asf-staging` - Staging (auto-deployed, DO NOT MODIFY)

### Workflow

1. Push changes to `main` or open a PR against `main`
2. PRs auto-deploy to staging: https://struts.staged.apache.org/
3. After merge, auto-deployed to production via buildbot

### Common Tasks

**New release**: Update version variables in `_config.yml`, add announcement entry to the current year's `announce-YYYY.md`, and move the now-superseded version into the **Prior Releases** table in `source/releases.md`.

**New announcement year**: Create `source/announce-YYYY.md`, update the redirect in `source/.htaccess` (`RedirectMatch \/announce.html` line) to point to the new year.

**New security bulletin**: Add to `source/security/` directory.