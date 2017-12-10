---
layout: core-developers
title: Zero Configuration
---

# Zero Configuration

**(\!) Deprecated Plugin**


> 

> 

> Since 2\.1 this plugin has been deprecated in favor of the _Convention Plugin_ 

> 

A "Zero Configuration" Struts application or plugin uses no additional XML or properties files\. Metadata is expressed through convention and annotation\.  

As this is a new feature, and still being field\-tested, the documentation is sketchy\. But, here's what we have so far:

## Finding Actions

Set the "actionPackages" filter init param to a comma\-separated list of packages containing Action classes in web\.xml\. The packages and their subpackages will be scanned\. All classes in the designated packages that implement Action or end in "Action" are examined\.  The latter is to allow for POJO Actions that don't implement the Action interface\.

**Annotation Initialization actionPackages Filter Parameter in web\.xml**


```xml

<filter>
  <filter-name>struts2</filter-name>
  <filter-class>org.apache.struts2.dispatcher.FilterDispatcher</filter-class>
  <init-param>
    <param-name>actionPackages</param-name>
    <param-value>com.foo.bar,com.baz.quux</param-value>
  </init-param>
</filter>

```

We should probably add an action annotation, so that POJOs can itall with annotations\.

## Examples

The only example right now is in the showcase, where the person package uses the classpath scanning configuration\. 

## Action and Package name

The subpackage name makes the namespace, and the action class name makes the action name\.  If there is an "Action" suffix, it is dropped before creating the action name\. Therefore, if the configured package is _com\.myapp\.actions_  and the Action is _com\.myapp\.actions\._ **member**\.EditAction, you can access it via [http://server/myapp/member/edit\.action](http://server/myapp/member/edit\.action)\.  For multi\-word actions, the first letter is lower\-cased and the rest is left alone, so the Action `MyCustomAction` will map to `myCustom.action`\.

## Results

[Results](#PAGE_43811) are defined with the Result and Results annotations at the **class level**\. 

## Namespaces

The [Namespace Annotation](#PAGE_68488) overrides the namespace\.

## Parent Package

The [ParentPackage Annotation](#PAGE_68490) configures the XWork package (an XWork package is created per Java package) to extend one or more defined packages\. The best place for this annotation is on the package via the `package-info.java` file, however, for backward\-compatibility, they can be specified on one or more Actions in the package\.  To determine which parent packages should be set, first, it looks for the package annotation, then adds the action annotations as they are loaded\.  Because the load order of Actions is undetermined, it is highly recommended you avoid putting the @ParentPackage annotation on Action classes themselves\.

For example, if you wanted to set the parent package for the `com.mycompany.myapp.actions` package, create this package\-info\.java file:


```java

@ParentPackage("my-parent-package")
package com.mycompany.myapp.actions

import org.apache.struts2.config.ParentPackage;

```

To define multiple parent packages, list an array of package names:


```java

@ParentPackage({"my-parent-package1, my-parent-package2"})
package com.mycompany.myapp.actions

import org.apache.struts2.config.ParentPackage;

```

## Feedback

Stay tuned to this page for additional details and documentation\. If you have a chance to  try the zero configuration feature, please share any experiences on dev@ and here\.

## See also

+ _Zero Configuration Scanning_  Use Case

+ _Codebehind Plugin_ 

+ _RESTfulActionMapper_ 
