# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the Apache Struts website repository, which powers https://struts.apache.org/. The site is built with Jekyll and uses a mix of Markdown and HTML files.

## Development Commands

### Running the Site Locally

The site can be run locally using Jekyll or Docker:

**Using Jekyll directly:**
```bash
bundle exec jekyll serve -w --trace --host 0.0.0.0
```

**Using Docker (recommended):**
```bash
# Build the Docker image (only needed when Dockerfile changes)
./docker-build.sh

# Run the site in Docker
./docker-arm64-serve.sh  # For ARM64 architecture (Apple Silicon)
```

The site will be available at http://localhost:4000

### Installing Dependencies

```bash
bundle install
```

## Directory Structure

- `source/` - All source content files (Markdown and HTML)
  - `source/_layouts/` - Jekyll layout templates (main-page, default, core-developers, maven-archetypes)
  - `source/_includes/` - Reusable HTML partials (header, footer)
  - `source/.htaccess` - Redirect rules
- `content/` - Generated output (not committed to git)
- `_config.yml` - Jekyll configuration and site variables

## Site Configuration

The `_config.yml` file contains important site-wide variables:

- `current_version` / `prev_version` - Struts version tracking
- `release_date` / `prev_release_date` - Release date tracking
- `archetype_version` - Maven archetype version
- `repository_url` - GitHub repository for edit links
- `apidocs` - Path to API documentation
- `wiki_url` - Confluence wiki URL
- `archive_url` - Archive distribution URL
- `jira_url` - JIRA issue tracking URL

These variables are used throughout the site for dynamic content.

## Content Guidelines

### Page Front Matter

All Markdown pages should start with YAML front matter:

```yaml
---
layout: default
title: Page Title
---
```

Available layouts: `default`, `main-page`, `core-developers`, `maven-archetypes`

### Styling Classes

Use these Kramdown-style classes for formatting:

**Text alignment:** `{:.text-left}`, `{:.text-center}`, `{:.text-right}`, `{:.text-justify}`

**Text colors:** `{:.text-primary}`, `{:.text-info}`, `{:.text-success}`, `{:.text-warning}`, `{:.text-danger}`

**Backgrounds:** `{:.bg-primary}`, `{:.bg-info}`, `{:.bg-success}`, `{:.bg-warning}`, `{:.bg-danger}`

**Labels:** `{:.label .label-primary}`, etc.

**Alert panels:** `{:.alert .alert-info}`, `{:.alert .alert-success}`, `{:.alert .alert-warning}`, `{:.alert .alert-danger}`

See `source/updating-website.md` for complete styling examples.

## Deployment Process

### Branching Strategy

- `main` - Source branch for all changes and PRs
- `asf-site` - Production site (auto-deployed, DO NOT MODIFY MANUALLY)
- `asf-staging` - Staging site (auto-deployed, DO NOT MODIFY MANUALLY)

### Workflow

1. Make changes to the `main` branch
2. Small changes: Push directly to `main` (for contributors)
3. Larger changes: Open a Pull Request against `main`
4. PRs are automatically built and deployed to the staging site: https://struts.staged.apache.org/
5. After PR merge, changes are automatically built and deployed to production via buildbot

### Build Infrastructure

- `.asf.yaml` - Controls ASF infrastructure integration (notifications, JIRA linking, Jekyll deployment)
- Buildbot job builds and deploys the main site
- Jenkins job builds and deploys the staging site and JavaDocs

### JavaDocs Deployment

JavaDocs are deployed via a dedicated Jenkins job. Provide the Git tag (e.g., `STRUTS_2_5_22`) to generate and deploy JavaDocs for a specific release.

## Jekyll Configuration

- Uses Kramdown markdown processor with GFM (GitHub Flavored Markdown) input
- Syntax highlighting via Rouge
- Auto-generates IDs for headings
- Table of contents levels: 1-3
- Source directory: `source/`
- Encoding: UTF-8