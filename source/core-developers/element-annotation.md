---
layout: default
title: Element Annotation
parent:
    title: Annotations
    url: annotations.html
---

# Element Annotation

Sets the `Element` for type conversion.

## Usage

The `Element` annotation must be applied at field or method level.

## Parameters

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

## Examples

```java
// The key property for User objects within the users collection is the <code>userName</code> attribute.
@Element( value = com.acme.User.class )
private Map userMap;

@Element( value = com.acme.User.class )
public List userList;
```
