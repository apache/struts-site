---
layout: default
title: Building Normal Release
parent:
  title: Creating and Signing a Distribution
  url: creating-and-signing-a-distribution
---

# Building Normal Release
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Getting ready

1. Ensure that the master POM and Struts Annotations have current releases
2. Review JIRA for any issues without a fix version set, and for any issues that should be resolved for the pending release.
3. Ensure that there are no `repositories` or `pluginRepositories` listed in the poms.
4. Release the upcoming version in JIRA (under Administration/Manage Releases) and tag the release date
5. Add next milestone version to the JIRA roadmap
6. Create DONE and TODO filters for the new version, share with all, and remove obsolete TODO filter
7. Create a new Version Notes page in Confluence, link from [Migration Guide](https://cwiki.apache.org/confluence/display/WW/Migration+Guide),
  and link to prior release page and JIRA DONE filters of the version to release

> Please remember to keep BOM subproject in sync - <struts-version.version>X.X.X</struts-version.version> - must be 
> the same as the parent pom. The latest Maven version handles this case very well, but it's worth checking if the bits 
> are in sync.

> If needed, you can use [Versions Maven Plugin](http://mojo.codehaus.org/versions-maven-plugin/) to set -SNAPSHOT version
> in all poms, like below:
> `mvn versions:set -DnewVersion=2.3.16.1-SNAPSHOT -DgenerateBackupPoms=false`

## Prepare release

Tag the release by using the "release:prepare" goal of Maven:

```
mvn release:prepare -DautoVersionSubmodules=true
```

For a [dry run](http://maven.apache.org/plugins/maven-release-plugin/usage.html), add `-DdryRun=true`. If you do a dry 
run, use `mvn release:clean` to clean up after you have looked at the output.

When prompted for the SCM tag name, follow this pattern: `STRUTS_2_5_[PATCH_VERSION]`

> If you get an error message, try to re-run `mvn release:prepare -DautoVersionSubmodules=true` command again,
> -Dresume flag is set to true by default and the plugin will resume the release process from where it failed before.

Follow the link to get [more information](http://maven.apache.org/plugins/maven-release-plugin/examples/prepare-release.html)
about performed operation by release plugin.

## Perform the release

```
mvn release:perform -DretryFailedDeploymentCount=10
```

Follow the link to get [more information](http://maven.apache.org/plugins/maven-release-plugin/examples/perform-release.html)
about performed operation by release plugin. After this step the artifacts will be hosted by [Nexus](http://repository.apache.org/).
 
The `-DretryFailedDeploymentCount=10` is needed when there are problems with network connection (used just in case).

If you need to run perform again, (or in a different box), do:

```
git checkout STRUTS_2_5_[PATCH_VERSION]
mvn javadoc:javadoc deploy --no-plugin-updates -DperformRelease=true -Papache-release
```

Next, log in to [Nexus](http://repository.apache.org/) and **close** staging repository.

> Repository is identified by user name and public IP address, so if in meantime your IP changed, a new staging repository 
> will be created, so you must drop the old one (check the dates!) - if IP is the same, artifacts will be uploaded 
> to the same repository as first attempt.

## Move the assemblies

To simplify testing, the assemblies have to be moved to the `https://dist.apache.org/repos/dist/dev/struts/$VERSION` dir.

After closing repository in Nexus, check if the release files are available from staging repository as bellow:

```
https://repository.apache.org/content/groups/staging/org/apache/struts/struts2-assembly/$VERSION/
```

In order to move the assemblies login to people.apache.org and execute the following code:

```
#!/bin/sh

#create the destination directory
echo "Creating working dir $VERSION"
mkdir $VERSION
cd $VERSION

# get the distro
echo "Getting distro $VERSION"
wget -erobots=off -nv  -l 1 --accept=jar,zip,md5,sha1,asc -r --no-check-certificate -nd -nH https://repository.apache.org/content/groups/staging/org/apache/struts/struts2-assembly/$VERSION

# rename files
echo "Renaming files"
for f in *2-assembly*.zip*
do
 mv $f `echo $f | sed s/2-assembly//g`
done

# remove unneeded files
echo "Removing uneeded files"
for f in struts2-assembly-*.pom*
do
 rm $f
done

# remove uneeded hashes
echo "Removing uneeded files"
rm *.md5
rm *.sha1

# generates sha signatures
echo "Generating SHA signatures"
for f in *.zip
do
  shasum -a 256 $f > $f.sha256
  shasum -a 512 $f > $f.sha512
done

cd ..

# checking out repo
echo "Publishing artifacts for test"
svn --no-auth-cache co --depth empty https://dist.apache.org/repos/dist/dev/struts/ struts-dev
mv $VERSION struts-dev/
cd struts-dev
svn add --force ./
svn --no-auth-cache commit -m "Updates test release $VERSION"

cd ..
rm -r struts-dev

echo "Done!"
```

After this step artifacts are available for test here [https://dist.apache.org/repos/dist/dev/struts/](https://dist.apache.org/repos/dist/dev/struts/)

## Announce availability

Send a short e-mail to `dev@struts.a.o` informing about the new packages and to give people enough time to test 
the distribution (actual bits). Wait around a week before posting Vote. If no show-stoppers reported, start a vote thread 
for build quality designation.

## Push changes

Do not forget to push your local changes to the Apache repo

```
git push
```

## Vote on it

Post a release/quality vote to the dev list (and **only** the dev list). The example mail is on [Sample announcements](sample-announcements)
page. If the vote result is for an ASF release (i.e. not test build), update site, announce. If the vote result is for GA, 
push to central.

## Copy files

After the vote, if the distribution is being mirrored (there was a favourable release vote) move all the artefacts from 
`dev` folder into `release` folder:

```
svn mv https://dist.apache.org/repos/dist/dev/struts/$VERSION/ https://dist.apache.org/repos/dist/release/struts/  
```

## Promote release

Log in again to [Nexus](http://repository.apache.org/) and **release** the repository, it will be automatically 
replicated across Maven Repositories. See [Releasing a Maven-based project](http://maven.apache.org/developers/release/apache-release.html)
for further details.

## Clean up old releases

Remove the old files from under [https://dist.apache.org/repos/dist/release/struts/](https://dist.apache.org/repos/dist/release/struts/)
to synchronise only the latest version with peers. All the files from [https://dist.apache.org/repos/dist/release/struts/](https://dist.apache.org/repos/dist/release/struts/)
are always mirrored to [http://archive.apache.org/dist/struts/](http://archive.apache.org/dist/struts/). You can use the below command:

```
svn del https://dist.apache.org/repos/dist/release/struts/2.3.x/
```

where `x` is the previous version to remove (or one more previous to keep current and one version back).

## Wait for rsync

Wait 2-4 hours before proceeding.

## Update site

Make sure you have linked your Apache and Github account in Apache GitBox (Dual Master Git allowing you to directly 
push to GitHub), see [https://gitbox.apache.org/setup/](https://gitbox.apache.org/setup/)

Please follow [the guideline](../updating-website) how to update the website, below are additional steps that should be performed:

- If a new DTD was defined, add it to `source/dtds`
- Update current version and release date in `struts-site/_config.yml`
- Update page source files
  - `struts-site/source/announce.md` (if applicable, refer also to corresponding security bulletin)
  - `struts-site/source/downloads.html` (Prior Releases section)
  - `struts-site/source/index.html` (some parts will updated automatically with values defined in `_config.yml`)
- You can generate the website locally with Docker Jekyll image
  - you must have Docker installed and running
  - if you are doing this the first time, download the official Struts image to build the site from 
    [https://hub.docker.com/r/theapachestruts/struts-site-jekyll/](https://hub.docker.com/r/theapachestruts/struts-site-jekyll/)
  - now you can use one of the bash scripts already provided in the `struts-site`:
    - `docker-run.sh` - used with Bash
    - `docker-run.fish` - to use with Fish Shell (via `fish docker-run.fish`)
  - now you can check the generated site at http://localhost:4000

Please remember about updating JavaDocs using a dedicated Jenkins job as described in [the guideline](../updating-website).

## Post announcements

We leave this as the last step, once the artifacts have had time to sync up on the mirrors. Target it to: 

 - user@struts.a.o
  - announcements@struts.a.o
  - announce@a.o
   
samples are available at [Sample announcements](sample-announcements) page.
