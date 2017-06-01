---
layout: core-developers
title: Glassfish 2.x
---

# Glassfish 2.x

__Convention plugin support__

To have proper support of the _Convention Plugin_  in Glassfish 2\.x when packed as EAR archive add the following constant to 

~~~~~~~
struts.xml
~~~~~~~



~~~~~~~
<constant name="struts.convention.exclude.parentClassLoader" value="false" />

~~~~~~~

Thanks to [pavpal](http://stackoverflow.com/a/22490925/1805267)!
