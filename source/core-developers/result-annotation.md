---
layout: core-developers
title: Result Annotation
---

# Result Annotation

The 

~~~~~~~
@Result
~~~~~~~
 annotation allows the definition of 

~~~~~~~
Action
~~~~~~~
 results in the 

~~~~~~~
Action
~~~~~~~
 class rather than an XML file\.



| The @Result annotation lives at the Action_class_  level and not the method level\. This matches what is found in an XML\-based Action configuration\. **Do not be tempted to annotate your Action's methods; it will not work\.**

| 

In order for 

~~~~~~~
@Result
~~~~~~~
 and 

~~~~~~~
@Results
~~~~~~~
 annotations to be configured correctly you must set the 

~~~~~~~
actionPackages
~~~~~~~
 filter 

~~~~~~~
init-param
~~~~~~~
 to a comma\-separated list of packages containing the annotated 

~~~~~~~
Action
~~~~~~~
 classes\. See [Zero Configuration](zero-configuration.html) for further information; there are 

~~~~~~~
Action
~~~~~~~
 class naming conventions if you don't implement the 

~~~~~~~
Action
~~~~~~~
 interface and other tidbits there\.

##### @Result Annotation Parameters



~~~~~~~
{float:right|width=300px}
  {info}
    See org.apache.struts2.config.Result annotation JavaDocs.
  {info}
{float}
~~~~~~~

+ name \- Result name; default 

~~~~~~~
Action.SUCCESS
~~~~~~~

+ value \- Value of result (result destination)

+ type \- Type of result; default 

~~~~~~~
NullResult
~~~~~~~
\. For example:
	

  + 

~~~~~~~
NullResult.class
~~~~~~~

  + 

~~~~~~~
FreemarkerResult.class
~~~~~~~

  + 

~~~~~~~
PlainTextResult.class
~~~~~~~

  + 

~~~~~~~
VelocityResult.class
~~~~~~~

  + 

~~~~~~~
ServletDispatcherResult.class
~~~~~~~

  + 

~~~~~~~
ServletRedirectResult.class
~~~~~~~

  + 

~~~~~~~
ServletActionRedirectResult.class
~~~~~~~
 \- equivalent to the 

~~~~~~~
redirectAction
~~~~~~~
 type in XML config

  + 

~~~~~~~
TilesResult.class
~~~~~~~

  + \.\. (for more result, please consult the API docs, and look for implementations of the XWork 

~~~~~~~
Result
~~~~~~~
 interface)

+ params \- An Array of the parameters in the form \{key1, value1, key2, value2\}

##### @Result – Defining a Single Result

Map the "success" result (explicitly named) to a Tile definition named "/home\.page"\.

**Defining a Single Result**


~~~~~~~

@Result(name="success", value="/home.page", type=TilesResult.class)
public class HomeAction extends ActionSupport {
    // ...
}

~~~~~~~

##### @Results – Defining Multiple Results

Defines a set of results for an 

~~~~~~~
Action
~~~~~~~
\.

**Defining Multiple Results**


~~~~~~~

@Results({
    @Result(name="success", value="/home.page", type=TilesResult.class),
    @Result(name="homeError", value="/homeError.page", type=TilesResult.class)
})
public class HomeAction extends ActionSupport {
    // ....
}

~~~~~~~
