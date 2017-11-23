---
layout: core-developers
title: JBoss 5
---

# JBoss 5

__Convention plugin support__

To have proper support of ﻿﻿the _Convention Plugin_  in JBoss AS 5, especially when you put actions inside a jar (which is embedded in war or ear) and not directly into `WEB-INF/classes`, you must add the following line into `$JBOSS_HOME/bin/run.conf` or into `$JBOSS_HOME\bin\run.conf.bat`
**Linux/OSX \- \$JBOSS\_HOME/bin/run\.conf**


~~~~~~~

JAVA_OPTS="$JAVA_OPTS -Djboss.vfs.forceVfsJar=true"

~~~~~~~

**Windows \- \$JBOSS\_HOME\\bin\\run\.conf\.bat**


~~~~~~~

set "JAVA_OPTS=%JAVA_OPTS% -Djboss.vfs.forceVfsJar=true"

~~~~~~~

You can find more details about JBoss VFS [here](http://docs\.jboss\.org/jbossas/docs/Installation\_And\_Getting\_Started\_Guide/5/html\_single/index\.html\#d0e495)^[http://docs\.jboss\.org/jbossas/docs/Installation\_And\_Getting\_Started\_Guide/5/html\_single/index\.html\#d0e495]\.
