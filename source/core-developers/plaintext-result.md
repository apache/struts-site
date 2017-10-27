---
layout: default
title: PlainText Result
parent:
    title: Core Developers Guide
    url: index.html
---

# PlainText Result

## Description

A result that send the content out as plain text. Useful typically when needed
to display the raw content of a JSP or Html file for example.

## Parameters

 - `location` (default) - location of the file (jsp/html) to be displayed as plain text.
 - `charSet` (optional) - character set to be used. This character set will be used to set the response type 
   (eg. `Content-Type=text/plain; charset=UTF-8`) and when reading using a `Reader`. Some example of charSet would be 
   UTF-8, ISO-8859-1 etc.

## Examples

```xml
<action name="displayJspRawContent" >
  <result type="plainText">/myJspFile.jsp</result>
</action>

<action name="displayJspRawContent" >
  <result type="plainText">
     <param name="location">/myJspFile.jsp</param>
     <param name="charSet">UTF-8</param>
  </result>
</action>
```
