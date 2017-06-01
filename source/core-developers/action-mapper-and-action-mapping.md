---
layout: core-developers
title: Action Mapper & Action Mapping
---

# Action Mapper & Action Mapping

The ActionMapper fetches the ActionMapping object corresponding to a given request\. Essentially, the ActionMapping is a data transfer object that collects together details such as the Action class and method to execute\. The mapping is utilized by the Dispatcher and various user interface components\. It is customizable through 

~~~~~~~
struts.mapper.class
~~~~~~~
 entry in 

~~~~~~~
struts.properties
~~~~~~~
\.

####Customize####

Custom ActionMapper must implement ActionMapper interface and have a default constructor\.

> 

~~~~~~~

struts.mapper.class=foo.bar.MyCustomActionMapper

~~~~~~~


~~~~~~~

public class MyCustomActionMapper implements ActionMapper {
  public ActionMapping getMapping(HttpServletRequest request, 
                                  ConfigurationManager configManager) {
    ....
  }

  public String getUriFromActionMapping(ActionMapping mapping) { 
    ....
  }
}

~~~~~~~
