---
layout: core-developers
title: Velocity Result
---

# Velocity Result

Using the Servlet container's {@link JspFactory}, this result mocks a JSP execution environment and then displays
a Velocity template that will be streamed directly to the servlet output.

## Parameters

- location (default) - the location of the template to process.
- parse (true by default) - if set to false, the location param will not be parsed for Ognl expressions.

This result follows the same rules from {@link StrutsResultSupport}.

## Examples

```xml
<result name="success" type="velocity">

    <param name="location">foo.vm</param>

</result>
```
