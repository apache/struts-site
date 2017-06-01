---
layout: core-developers
title: Debugging
---

# Debugging

Modern IDEs provide excellent support for debugging\. In addition, the framework provides support for inspecting framework\-specific objects at runtime\.

The [Debugging Interceptor](debugging-interceptor.html) provides three debugging modes to provide insight into the data behind the page\. The 

~~~~~~~
xml
~~~~~~~
 mode formats relevant framework objects as an XML document\. The 

~~~~~~~
console
~~~~~~~
 mode provides a OGNL command line that accepts entry of runtime expressions, and the 

~~~~~~~
browser
~~~~~~~
 mode adds an interactive page that display objects from the Value Stack\.

To use the debugging, first be sure that 

~~~~~~~
struts.devMode
~~~~~~~
 is set to 

~~~~~~~
true
~~~~~~~
 is enabled through the [struts\.properties](struts-properties.html) file or 

~~~~~~~
struts.xml
~~~~~~~
 file, like:


~~~~~~~
<constant name="struts.devMode" value="true" />

~~~~~~~

Then, whenever a page needs debugging, add 

~~~~~~~
?debug=xml
~~~~~~~
 or 

~~~~~~~
?debug=console
~~~~~~~
 or 

~~~~~~~
?debug=browser
~~~~~~~
 to the URL\.


~~~~~~~
- <debug>
  <parameters /> 
- <context>
- <struts.actionMapping>
  <class>class org.apache.struts2.dispatcher.mapper.ActionMapping</class> 
  <name>showcase</name> 
  <namespace>/</namespace> 
  </struts.actionMapping>
  <attr /> 
  <__devMode>true</__devMode> 
  <report.conversion.errors>false</report.conversion.errors> 
  </context>
  <request /> 
  <session /> 
- <valueStack>
- <value>
  <actionErrors /> 
  <actionMessages /> 
  <class>class com.opensymphony.xwork2.ActionSupport</class> 
  <errorMessages /> 
  <errors /> 
  <fieldErrors /> 
- <locale>
  <ISO3Country>USA</ISO3Country> 
  <ISO3Language>eng</ISO3Language> 
  <class>class java.util.Locale</class> 
  <country>US</country> 
  <displayCountry>United States</displayCountry> 
  <displayLanguage>English</displayLanguage> 
  <displayName>English (United States)</displayName> 
  <displayVariant /> 
  <language>en</language> 
  <variant /> 
  </locale>
  </value>
- <value>
  <class>class com.opensymphony.xwork2.DefaultTextProvider</class> 
  </value>
  </valueStack>
  </debug>

~~~~~~~



| For ?debug=xml use Internet Explorer or an [IE tab in FireFox](http://ietab\.mozdev\.org/)^[http://ietab\.mozdev\.org/]

| 


For ?debug=console you may need to relax any popup blockers

| 