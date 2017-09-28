---
layout: default
title: Tag Developers Guide (WIP)
---

# autocompleter

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/autocompleter.html %}

__Examples__

Get list from an action:


{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Uses a list:


{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Autocompleter that reloads its content everytime the text changes (and the length of the text is greater than 3):


{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Linking two autocompleters:


{% snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Set/Get selected values using JavaScript:


{% snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Using beforeNotifyTopics:


{% snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Using errorNotifyTopics:


{% snippet id=example7|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Using errorNotifyTopics:


{% snippet id=example8|lang=html|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Using valueNotifyTopics:


{% snippet id=example9|lang=html|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

__Caveats__

+ The service that is producing the HTTP Response with JSON response to the Autocompleter tag must set the HTTP Header Response Content-Type to 

~~~~~~~
text/json
~~~~~~~
. JSON has its own MIME type, which this tag expects.

+ Since 2.0.9, there is a change in the value:key order. Now, the value **must** come before the key.

