---
layout: default
title: Key Annotation
parent:
    title: Annotations
    url: annotations.html
---

# Key Annotation

Sets the Key for type conversion.

## Usage

The Key annotation must be applied at field or method level.

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
 <td>The key property value.</td>
 </tr>
 </tbody>
 </table>
</p>

## Examples

```java
 // The key property for User objects within the users collection is the <code>userName</code> attribute.
 @Key( value = java.lang.Long.class )
 private Map<Long, User> userMap;

```
