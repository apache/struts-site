---
layout: default
title: Converting application from Codebehind to Convention Plugin (WIP)
---

[<< back to Convention Plugin](./)

# Converting application from Codebehind to Convention Plugin

## Changes required

 - Replace `org.apache.struts2.config.Namespace` with `org.apache.struts2.convention.annotation.Namespace`
 - Replace `org.apache.struts2.config.Results` with `org.apache.struts2.convention.annotation.Results`
 - Replace `org.apache.struts2.config.Result` with `org.apache.struts2.convention.annotation.Result`
 - Update `@Result` uses to use result **name** instead of `Class<Result>`
 - Update `@Result` uses to use **location** instead of value attribute
 - Update `web.xml` and remove Codebehind params from filter
 - Update CamelCase action results and references to match Convention. For example:

   ```
    Previously in Codebehind:
    Given an action named AnExampleAction, a request to /anExample -> AnExampleAction.execute() -> > anExample-index.ftl

    Now in Convention:
    Given an action named AnExampleAction, a request to /an-example -> AnExampleAction.execute() -> an-example-index.ftl    
   ```

## When REST plugin is used

Add these constants to `struts.xml`

```xml
<constant name="struts.convention.action.suffix" value="Controller"/>
<constant name="struts.convention.action.mapAllMatches" value="true"/>
<constant name="struts.convention.default.parent.package" value="rest-default"/>
<constant name="struts.convention.package.locators" value="example"/>
```
