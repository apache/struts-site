---
layout: default
title: JBoss 5
parent:
  title: Application Servers
  url: application-servers
---

# JBoss 5

## Convention plugin support

To have proper support of the _Convention Plugin_ in JBoss AS 5, especially when you put actions inside a jar 
(which is embedded in war or ear) and not directly into `WEB-INF/classes`, you must add the following line into 
`$JBOSS_HOME/bin/run.conf` or into `$JBOSS_HOME\bin\run.conf.bat`

**Linux/OSX - $JBOSS_HOME/bin/run.conf**

```
JAVA_OPTS="$JAVA_OPTS -Djboss.vfs.forceVfsJar=true"
```

**Windows - $JBOSS_HOME\bin\run.conf.bat**

```
set "JAVA_OPTS=%JAVA_OPTS% -Djboss.vfs.forceVfsJar=true"
```

You can find more details about JBoss VFS [here](http://docs.jboss.org/jbossas/docs/Installation_And_Getting_Started_Guide/5/html_single/index.html#d0e495).
