---
layout: tag-developers
title: action tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# action

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/action-description.html %}

Parameters can be passed to the action using nested [param](param-tag) tags.

## Placement in context

The action will not be published to the context until the whole tag is evaluated, meaning that inside the body of the tag, 
the action cannot be accessed, For example:

```jsp
<s:action var="myAction" name="MyAction" namespace="/">
    Is "myAction" null inside the tag? <s:property value="#myAction == null" />
</s:action>
    Is "myAction" null outside the tag? <s:property value="#myAction == null" />
```

Will print:
```
Is "myAction" null inside the tag? true

Is "myAction" null outside the tag? false
```

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/action-attributes.html %}

## Examples

```java
 public class ActionTagAction extends ActionSupport {

  public String execute() throws Exception {
      return "done";
  }

  public String doDefault() throws Exception {
      ServletActionContext.getRequest().setAttribute("stringByAction", "This is a String put in by the action's doDefault()");
      return "done";
  }
 }

```

```xml
   <struts>
      ....
     <action name="actionTagAction1" class="tmjee.testing.ActionTagAction">
         <result name="done">success.jsp</result>
     </action>
      <action name="actionTagAction2" class="tmjee.testing.ActionTagAction" method="default">
         <result name="done">success.jsp</result>
     </action>
      ....
   </struts>
```

The following action tag will execute result and include it in this page

```jsp
  <s:action name="actionTagAction" executeResult="true" />
```

The following action tag will do the same as above, but invokes method specialMethod in action</span>

```jsp
  <s:action name="actionTagAction!specialMethod" executeResult="true" />
```
  
The following action tag will not execute result, but put a String in request scope under an id `stringByAction` which 
will be retrieved using property tag</span>

```jsp
  <s:action name="actionTagAction!default" executeResult="false" />
  <s:property value="#attr.stringByAction" />
```
