---
layout: default
title: struts-default.xml
parent:
  title: Configuration Files
  url: configuration-files
---

# struts-default.xml

A base configuration file named `struts-default.xml` is included in the `struts2-core.jar` file. This file is 
automatically included into `struts.xml` file to provide the standard configuration settings without having 
to copy them.

> To exclude the `struts-default.xml` or to provide your own version, see the `struts.configuration.files`
> setting in [default.properties](default-properties).

The content of `struts-default.xml` is here:

{% highlight xml %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/struts-default.xml %}
{% endhighlight %}

This file defines all of the default bundled results and interceptors and many interceptor stacks which you can use 
either as-is or as a basis for your own application-specific interceptor stacks. 

**Notice the name of the package is "struts-default"**
