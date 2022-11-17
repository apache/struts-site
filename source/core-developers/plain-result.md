---
layout: default
title: Plain Result
parent:
    title: Result types
    url: result-types
---

# Plain Result

## Description

You create this result programmatically in an action and return it as a result of the action. No result definition
is needed in `struts.xml`. See the examples below how to use it. Please notice that the method result type is `PlainResult`
instead of `String`. Please explore the API for more methods - if any is missing you can either extend the interface
or report it in [JIRA](https://issues.apache.org/jira/projects/WW/).

> NOTE: This result is available since Struts 6.0.0 

## Parameters

no parameters
 
## Examples

```Java
public class UserAction {

    private String id;

    public PlainResult execute() {
        return response -> response.write("User Id: " + id);
    }

    public PlainResult html() {
        return response -> response.write("<b>test</b>").withContentTypeTextHtml();
    }

}
```
