---
layout: default
title: fielderror tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# fielderror

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Render field errors if they exists. Specific layout depends on the particular theme. The field error strings will be 
html escaped by default.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/fielderror-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/fielderror-attributes.html %}

## Examples

**Example 1**: display all field errors

```jsp
<s:fielderror />
```

**Example 2**: display field errors only for _field1_ and _field2_

```jsp
<s:fielderror>
     <s:param>field1</s:param>
     <s:param>field2</s:param>
</s:fielderror>
<s:form .... >
   ....
</s:form>
```

or

```jsp
<s:fielderror>
  <s:param value="%{'field1'}" />
  <s:param value="%{'field2'}" />
</s:fielderror>
<s:form .... >
   ....
</s:form>
```

or

```jsp
<s:fielderror fieldName="field1" />
<s:fielderror fieldName="field1" />
```
