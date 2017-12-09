---
layout: default
title: KeyProperty Annotation
parent:
    title: Annotations
    url: annotations.html
---

# KeyProperty Annotation

Sets the `KeyProperty` for type conversion.

## Usage

The `KeyProperty` annotation must be applied at field or method level.

This annotation should be used with Generic types, if the key property of the key element needs to be specified.

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
 <td>id</td>
 <td>The key property value.</td>
 </tr>
 </tbody>
 </table>
</p>

## Examples

```java
 // The key property for User objects within the users collection is the <code>userName</code> attribute.
 @KeyProperty( value = "userName" )
 protected List<User> users = null;
```
