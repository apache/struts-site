---
layout: default
title: Download a Release
---

# Download a Release of the Apache Struts {#download}
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The Apache Struts web framework is a free open-source solution for creating Java web applications.

You can start with Apache Struts using [Apache Maven](//maven.apache.org) and optionally provided
[archetypes](/maven-archetypes) for easier dependency management and version upgrade.
Or download some of the distributions for fully offline development.

Use the links below to download a release of Apache Struts from one of our mirrors. You must
[verify the integrity](#verify) of the downloaded files using signatures downloaded from our
main distribution directory.

## Full Releases {#struts-ga}

### Struts {{ site.current_version }} {#struts{{ site.current_version_short }}}

The [Apache Struts {{ site.current_version }}](//struts.apache.org)  is an elegant, extensible framework
for creating enterprise-ready Java web applications. It is available in a full distribution, or as separate library, 
source, example and documentation distributions. Struts {{ site.current_version }} is the "best available" 
version of Struts in the 6.x series.

- [Version Notes]({{ site.wiki_url }}/Version+Notes+{{ site.current_version }})
- Source:
  - [struts-{{ site.current_version }}-src.zip]([preferred]struts/{{ site.current_version }}/struts-{{ site.current_version }}-src.zip) (6.8MB)
    [PGP](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-src.zip.asc)
    [SHA256](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-src.zip.sha256)
    [SHA512](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-src.zip.sha512)
- Full Distribution:
  - [struts-{{ site.current_version }}-all.zip]([preferred]struts/{{ site.current_version }}/struts-{{ site.current_version }}-all.zip) (70MB)
    [PGP](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-all.zip.asc)
    [SHA256](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-all.zip.sha256)
    [SHA512](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-all.zip.sha512)
- Example Applications:
  - [struts-{{ site.current_version }}-apps.zip]([preferred]struts/{{ site.current_version }}/struts-{{ site.current_version }}-apps.zip) (35MB)
    [PGP](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-apps.zip.asc)
    [SHA256](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-apps.zip.sha256)
    [SHA512](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-apps.zip.sha512)
- Essential Dependencies Only:
  - [struts-{{ site.current_version }}-min-lib.zip]([preferred]struts/{{ site.current_version }}/struts-{{ site.current_version }}-min-lib.zip) (5.9MB)
    [PGP](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-min-lib.zip.asc)
    [SHA256](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-min-lib.zip.sha256)
    [SHA512](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-min-lib.zip.sha512)
- All Dependencies:
  - [struts-{{ site.current_version }}-lib.zip]([preferred]struts/{{ site.current_version }}/struts-{{ site.current_version }}-lib.zip) (25.5MB)
    [PGP](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-lib.zip.asc)
    [SHA256](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-lib.zip.sha256)
    [SHA512](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-lib.zip.sha512)
- Documentation:
  - [struts-{{ site.current_version }}-docs.zip]([preferred]struts/{{ site.current_version }}/struts-{{ site.current_version }}-docs.zip) (2.5MB)
    [PGP](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-docs.zip.asc)
    [SHA256](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-docs.zip.sha256)
    [SHA512](https://downloads.apache.org/struts/{{ site.current_version }}/struts-{{ site.current_version }}-docs.zip.sha512)

## Prior releases

If you are looking for other versions than above please check the <a href="https://archive.apache.org/dist/struts/">Apache Archive</a> site.

## Verify the integrity of the files {#verify}

We recommend that you verify the integrity of the downloaded files using the PGP or MD5/SHA256 signatures.

The PGP signatures can be verified using PGP or GPG. First download the [KEYS](//downloads.apache.org/struts/KEYS) 
as well as the <code>asc</code> signature file for the particular distribution. Make sure you get these files from 
the [main distribution directory](//downloads.apache.org/struts/), rather than from a mirror.
Then verify the signatures using

```
% pgpk -a KEYS
% pgpv ${filename}.tar.gz.asc
```
or
```
% pgp -ka KEYS
% pgp ${filename}.tar.gz.asc
```
or
```
% gpg --import KEYS
% gpg --verify ${filename}.tar.gz.asc ${filename}.tar.gz
```

Alternatively, you can verify the MD5 signature on the files. A Unix program called `md5` or `md5sum` is included
in many Unix distributions. It is also available as part of [GNU Textutils](https://www.gnu.org/software/textutils/textutils.html).
Windows users can get binary md5 programs from [here](https://www.fourmilab.ch/md5/), [here](http://www.pc-tools.net/win32/freeware/console/)
or [here](https://www.slavasoft.com/fsum/).
