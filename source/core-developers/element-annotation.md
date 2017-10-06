---
layout: core-developers
title: Element Annotation
---

# Element Annotation



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.util.Element {% endcomment %}
<p> <p>Sets the Element for type conversion.</p>
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.util.Element {% endcomment %}

##### Usage



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.util.Element {% endcomment %}
<p> <p>The Element annotation must be applied at field or method level.</p>
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.util.Element {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.util.Element {% endcomment %}
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
 <td>The element property value.</td>
 </tr>
 </tbody>
 </table>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.util.Element {% endcomment %}

##### Examples



~~~~~~~

// The key property for User objects within the users collection is the <code>userName</code> attribute.
@Element( value = com.acme.User.class )
private Map userMap;

@Element( value = com.acme.User.class )
public List userList;

~~~~~~~
