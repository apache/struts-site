---
layout: default
title: Building Struts Master
parent:
  title: Creating and Signing a Distribution
  url: creating-and-signing-a-distribution
---

# Building Struts Master
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Building Steps (Struts)

### Obtain a fresh checkout

```
git clone https://gitbox.apache.org/repos/asf/struts-master.git
```

### Change site target

Apply needed changes, in most cases it will be upgrade to the latest Apache Parent POM, eg. from 9 to 10,
commit the change.

### Prepare release

Tag the release by using the "release:prepare" goal of Maven: 

```
mvn release:prepare -DautoVersionSubmodules=true
```

For a [dry run](http://maven.apache.org/plugins/maven-release-plugin/usage), add `-DdryRun=true`. If you do a dry run,
use `mvn release:clean` to clean up after you have looked at the output. 

When prompted for the SCM tag name, follow this pattern: `STRUTS_MASTER_[PATCH_VERSION]`

If for some reason, the release plugin might fail to tag the release, if it fails, run:

```
mvn release:prepare -Dresume 
```

This step will ([more information](http://maven.apache.org/plugins/maven-release-plugin/examples/prepare-release)):

- Check that there are no uncommitted changes in the sources
- Check that there are no SNAPSHOT dependencies
- Change the version in the poms from x-SNAPSHOT to a new version (you will be prompted for the versions to use)
- Transform the SCM information in the POM to include the final destination of the tag
- Run the project tests against the modified POMs to confirm everything is in working order
- Commit the modified POMs
- Tag the code in the SCM with a version name (this will be prompted for)
- Bump the version in the POMs to a new value y-SNAPSHOT (these values will also be prompted for)
- Commit the modified POMs

### Perform the release

```
mvn release:perform
```

This step will ([more information](http://maven.apache.org/plugins/maven-release-plugin/examples/perform-release)):

- Checkout from an SCM URL with optional tag
- Run the predefined Maven goals to release the project (by default, deploy site-deploy)

After this step the artifacts will be hosted by [Nexus](http://repository.apache.org/)

If you need to run perform again, (or in a different box), do:

```
git co tags/$VERSION
mvn deploy site-deploy --no-plugin-updates -DperformRelease=true 
```

Next, log in to [Nexus](http://repository.apache.org/) and **close** staging repository.

### Announce availability

Send a short e-mail to `dev@struts.a.o` informing about the new packages and to give people enough time to test 
the distribution (actual bits). Wait around a week before posting Vote. If no show-stoppers reported, start a vote 
thread for build quality designation.

The new build is available from staging repository: `https://repository.apache.org/content/groups/staging/org/apache/struts/struts-master/[PATCH_VERSION]/`

### Vote on it

Post a release/quality vote to the dev list (and **only** the dev list). The example mail is on [Sample Announcements](sample-announcements) page. 

If the vote result is for an ASF release (i.e. not test build), update site, announce. If the vote result is for GA, push to central.

### Promote release

Log in again to [Nexus](http://repository.apache.org/) and **release** the repository, it will be automatically replicated across Maven Repositories

See [Releasing a Maven-based project](http://maven.apache.org/developers/release/apache-release) for further details.

### Wait for rsync

Wait 2-6 hours before proceeding. 

### Post announcements

We leave this as the last step, once the artifacts have had time to sync up on the mirrors. Target it to:

- user@struts.a.o
- announcements@struts.a.o
 
samples are available at [Sample announcements](sample-announcements) page.
