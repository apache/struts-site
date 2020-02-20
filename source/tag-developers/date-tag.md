---
layout: tag-developers
title: date tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# date

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Format Date object in different ways.

The date tag will allow you to format a Date in a quick and easy way. You can specify a **custom format** 
(eg. "dd/MM/yyyy hh:mm"), you can generate **easy readable notations** (like "in 2 hours, 14 minutes"), or you can just 
fall back on a **predefined format** with key `struts.date.format` in your properties file.

If that key is not defined, it will finally fall back to the default `DateFormat.MEDIUM` formatting.

> Note: If the requested Date object isn't found on the stack, a blank will be returned.

Configurable attributes are:
- name
- nice
- format

Following how the date component will work, depending on the value of nice attribute (which by default is false) 
and the format attribute.

**Condition 1**: With nice attribute as true

<table>
  <tr>
     <td>i18n key</td>
     <td>default</td>
  </tr>
  <tr>
     <td>struts.date.format.past</td>
     <td>{0} ago</td>
  </tr>
  <tr>
     <td>struts.date.format.future</td>
     <td>in {0}</td>
  </tr>
  <tr>
     <td>struts.date.format.seconds</td>
     <td>an instant</td>
  </tr>
  <tr>
     <td>struts.date.format.minutes</td>
     <td>{0,choice,1#one minute|1<{0} minutes}</td>
  </tr>
  <tr>
     <td>struts.date.format.hours</td>
     <td>{0,choice,1#one hour|1<{0} hours}{1,choice,0#|1#, one minute|1<, {1} minutes}</td>
  </tr>
  <tr>
     <td>struts.date.format.days</td>
     <td>{0,choice,1#one day|1<{0} days}{1,choice,0#|1#, one hour|1<, {1} hours}</td>
  </tr>
  <tr>
     <td>struts.date.format.years</td>
     <td>{0,choice,1#one year|1<{0} years}{1,choice,0#|1#, one day|1<, {1} days}</td>
  </tr>
</table>

**Condition 2**: With nice attribute as false and format attribute is specified eg. dd/MM/yyyyy

In this case the format attribute will be used.

**Condition 3**: With nice attribute as false and no format attribute is specified
 
|i18n key|default|
|--------|-------|
|struts.date.format|if one is not found DateFormat.MEDIUM format will be used|

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/date-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/date-attributes.html %}

## Examples

```jsp
  <s:date name="person.birthday" format="dd/MM/yyyy" />
  <s:date name="person.birthday" format="%{getText('some.i18n.key')}" />
  <s:date name="person.birthday" nice="true" />
  <s:date name="person.birthday" />
```
