---
layout: core-developers
title: struts-default.vm
---

# struts-default.vm

If Velocity is being use, the 

~~~~~~~
struts-default.vm
~~~~~~~
 supplies some VelocityMacros that might be useful\.

**struts\-default\.vm**


~~~~~~~

#macro(bean $bean_name $name)
   #set ($name = $action.bean($bean_name))
#end

#macro(includeservlet $name)
  $action.include($name,$req,$res)
#end

#macro(url $name)
   #set ($name = $action.bean("org.apache.struts.util.URLBean"))
   $name.setRequest($req)
   $name.setResponse($res)
#end

#macro(property $object $property)
$!{ognl.findValue($property, $object)}
#end

~~~~~~~
