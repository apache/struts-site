---
layout: tag-developers
title: Tag Developers Guide
---

# JSP Tags

JSP tags are extensions of the generic tags provided by the framework. You can get started almost immediately by simply 
knowing the generic structure in which the tags can be accessed: `<s:tag> ... </s:tag>`, where tag is any of the tags 
supported by the framework.

## Tag Library Definition (TLD)

The JSP TLD is included in the `struts-core.jar`. To use, just include the usual red-tape at the top of your JSP.

```jsp
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <body>
    <p>Now you can use the tags, like so:</p>
    <s:iterator value="people">
      <s:property value="lastName"/>, <s:property value="firstName"/>
    </s:iterator>
    ...
```
