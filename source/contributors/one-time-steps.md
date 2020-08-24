---
layout: default
title: One time steps
parent:
  title: Contributors Guide
  url: index.html
---

# One time steps
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Keys and configuration

### Create and install a SSH key

| See [OpenSSH Public Key Authentication](http://sial.org/howto/openssh/publickey-auth/)

If you get hung up during release:perform because Maven can't verify the authenticity of a host, then there could be 
one of two  different problems. The first problem, which is an easy fix, is to go to the command line and use SSH 
to log in to that host. You should receive a prompt to add the host to your known_hosts file. If you add the host 
to your `known_hosts` file from the command line  SSH, then you should be able to try `release:perform` again 
and have more success. There is a chance though that this won't fix maven.

Maven doesn't appear to understand hashed `known_hosts` files. There is some information here - [known_hosts file Hashing](http://itso.iu.edu/Hashing_the_OpenSSH_known__hosts_File). 

If your `known_hosts` file is hashed, you can solve this one of a few different ways. If you perform a `deploy:deploy` 
instead of `release:perform`, then maven will leave a prompt open for you to type `yes` and have maven add the host 
(in a way that Jsch, the library which provides Maven Wagon with the SSH/SCP functionality, understands) 
to your `known_hosts` file. Another option is to remove your `known_hosts` file, update your SSH configuration so that 
it does not hash the hostname in `known_hosts` and try to log in from the command line. 

```
mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -q -f ~/.ssh/id_rsa -t rsa
#Enter a passphrase
chmod go-rwx ~/.ssh/*

#copy the public key to people.apache.org
scp ~/.ssh/id_rsa.pub people.apache.org:/home/$USERNAME

# next, setup the public key on server
ssh people.apache.org
mkdir ~/.ssh
chmod 700 ~/.ssh
cat ~/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
rm ~/id_rsa.pub
```

### Create a PGP key

```
svn co https://svn.apache.org/repos/asf/struts/maven/trunk/build struts-maven-build
cd struts-maven-build
(gpg --fingerprint --list-sigs <your name> && gpg --armor --export <your name>) >> KEYS
scp KEYS people.apache.org:/www/www.apache.org/dist/struts
svn commit KEYS -m "Add public key"
```

### Update Maven settings for our servers

Create a `settings.xml` under `~/.m2` and follow below instructions:
- create profile - [Releasing a Maven-based](http://maven.apache.org/developers/release/apache-release.html\#Prerequisites)
- enable Apache servers [Committer Settings](http://maven.apache.org/developers/committer-settings.html)

```xml
<settings xmlns="http://maven.apache.org/POM/4.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <servers>
    <!-- To publish a snapshot of some part of Maven -->
    <server>
      <id>apache.snapshots.https</id>
      <username> <!-- YOUR APACHE LDAP USERNAME --> </username>
      <password> <!-- YOUR APACHE LDAP PASSWORD --> </password>
    </server>
    <!-- To stage a release of some part of Maven -->
    <server>
      <id>apache.releases.https</id>
      <username> <!-- YOUR APACHE LDAP USERNAME --> </username>
      <password> <!-- YOUR APACHE LDAP PASSWORD --> </password>
    </server>
  </servers>
  <profiles>
    <profile>
      <id>apache-release</id>
      <properties>
        <gpg.passphrase> <!-- YOUR KEY PASSPHRASE --> </gpg.passphrase>
      </properties>
    </profile>
  </profiles>
</settings>
```

### Increase Memory Settings for Maven

To complete a full build and all the tests, it may be necessary to increase the amount of memory available to Maven. 
The simplest thing is to set an environment variable.

```
MAVEN_OPTS=-Xmx512m
```

or even 

```
MAVEN_OPTS=-Xmx1024m
```

## Resources

- Apache Struts [Release Guidelines](http://struts.apache.org/releases.html\#Releases)
- [Struts Maintenance Guide for Maven ](http://wiki.apache.org/struts/StrutsMaintenanceMaven)
- [Signing Releases](http://apache.org/dev/release-signing.html)
- [Wendy's notes on Release Signing](http://wiki.wsmoak.net/cgi-bin/wiki.pl?ReleaseSigning)
- Apache [Mirroring Guidelines](http://apache.org/dev/mirrors.html)

## Retagging

If a tagged build needs to be retagged, be sure to delete the old tag first.

```
git push --delete origin STRUTS_#_#_#
```
