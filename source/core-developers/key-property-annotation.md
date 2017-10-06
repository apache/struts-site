---
layout: core-developers
title: KeyProperty Annotation
---

# KeyProperty Annotation



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.util.KeyProperty {% endcomment %}
<p> <p>Sets the KeyProperty for type conversion.</p>
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.util.KeyProperty {% endcomment %}

##### Usage



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.util.KeyProperty {% endcomment %}
<p> <p>The KeyProperty annotation must be applied at field or method level.</p>
 <p>This annotation should be used with Generic types, if the key property of the key element needs to be specified.</p>
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.util.KeyProperty {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.util.KeyProperty {% endcomment %}
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
 <td>id</td>
 <td>The key property value.</td>
 </tr>
 </tbody>
 </table>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.util.KeyProperty {% endcomment %}

##### Examples



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.util.KeyProperty {% endcomment %}

```java
 // The key property for User objects within the users collection is the <code>userName</code> attribute.
 @KeyProperty( value = "userName" )
 protected List<User> users = null;

```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.util.KeyProperty {% endcomment %}
