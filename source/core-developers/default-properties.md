---
layout: default
title: default.properties
parent:
  title: Core Developers
  url: index
---

# default.properties

> All properties can also be set using [Constant Configuration](constant-configuration) in an XML configuration file.

The framework uses a number of properties that can be changed to fit your needs\. To change any of these properties, 
specify the property key and value in an `default.properties` file. The properties file can be locate anywhere 
on the classpath, but it is typically found under `/WEB-INF/classes`.

The list of properties can be found in `default.properties` (inside `struts2-core.jar`).

**default.properties**

{% highlight txt %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/org/apache/struts2/default.properties %}
{% endhighlight %}
