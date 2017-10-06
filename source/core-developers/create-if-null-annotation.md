---
layout: core-developers
title: CreateIfNull Annotation
---

# CreateIfNull Annotation



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.util.CreateIfNull {% endcomment %}
<p> <p>Sets the CreateIfNull for type conversion.</p>
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.util.CreateIfNull {% endcomment %}

##### Usage



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.util.CreateIfNull {% endcomment %}
<p> <p>The CreateIfNull annotation must be applied at field or method level.</p>
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.util.CreateIfNull {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.util.CreateIfNull {% endcomment %}
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
 <td>false</td>
 <td>The CreateIfNull property value.</td>
 </tr>
 </tbody>
 </table>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.util.CreateIfNull {% endcomment %}

##### Examples



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.util.CreateIfNull {% endcomment %}

```java
 @CreateIfNull( value = true )
 private List<User> users;

```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.util.CreateIfNull {% endcomment %}
