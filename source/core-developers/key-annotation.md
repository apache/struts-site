---
layout: core-developers
title: Key Annotation
---

# Key Annotation



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.util.Key {% endcomment %}
<p> <p>Sets the Key for type conversion.</p>
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.util.Key {% endcomment %}

#####Usage#####



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.util.Key {% endcomment %}
<p> <p>The Key annotation must be applied at field or method level.</p>
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.util.Key {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.util.Key {% endcomment %}
<p> <table summary="">
 <thead>
 <tr>
 <th>Parameter</th>
 <th>Required</th>
 <th>Default</th>
 <th>Description</th>
 </tr>
 </thead>
 <tbody>
 <tr>
 <td>value</td>
 <td>no</td>
 <td>java.lang.Object.class</td>
 <td>The key property value.</td>
 </tr>
 </tbody>
 </table>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.util.Key {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.util.Key {% endcomment %}

```java
 // The key property for User objects within the users collection is the <code>userName</code> attribute.
 @Key( value = java.lang.Long.class )
 private Map<Long, User> userMap;

```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.util.Key {% endcomment %}
