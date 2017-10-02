---
layout: core-developers
title: Element Annotation
---

# Element Annotation



{% snippet id=description|javadoc=true|url=com.opensymphony.xwork2.util.Element %}

#####Usage#####



{% snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.util.Element %}

#####Parameters#####



{% snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.util.Element %}

#####Examples#####



~~~~~~~

// The key property for User objects within the users collection is the <code>userName</code> attribute.
@Element( value = com.acme.User.class )
private Map userMap;

@Element( value = com.acme.User.class )
public List userList;

~~~~~~~
