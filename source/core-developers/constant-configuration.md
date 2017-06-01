---
layout: core-developers
title: Constant Configuration
---

# Constant Configuration


Constants provide a simple way to customize a Struts application by defining key settings that modify framework and plugin behavior\. There are two key roles for constants\. First, they are used to override settings like the maximum file upload size or whether the Struts framework should be in "devMode" or not, and so on\. Second, they specify which [Bean](#PAGE_29601) implementation, among multiple implementations of a given type, should be chosen\.

Constants can be declared in multiple files\. By default, constants are searched for in the following order, allowing for subsequent files to override previous ones:

1. [struts-default.xml](struts-default-xml.html)

2. struts-plugin.xml

3. [struts.xml](struts-xml.html)

4. [struts.properties](struts-properties.html)

5. [web.xml](web-xml.html)

 (\!)  The 

~~~~~~~
struts.properties
~~~~~~~
 file is provided for backward\-compatiblity with WebWork\.

#####Constant#####

In the various XML variants, the constant element has two required attributes: 

~~~~~~~
name
~~~~~~~
 and 

~~~~~~~
value
~~~~~~~
\.

|Attribute|Required|Description|
|---------|--------|-----------|
|name|**yes**|the name of the constant|
|value|**yes**|the value of the constant|

In the [struts.properties](struts-properties.html) file, each entry is treated as a constant\.

In the [web.xml](web-xml.html) file, any FilterDispatcher initialization parameters are loaded as constants\.

__Value substitution__

Since Apache Struts 2\.5\.6 it is possible to use value substitution when defining 

~~~~~~~
constant
~~~~~~~
s in 

~~~~~~~
struts.xml
~~~~~~~
 file\. You can also define a default value if given System property or ENV variable is missing, see example below:


~~~~~~~
<struts>
    <constant name="os" value="Current OS = ${os.name}"/>


    <constant name="struts.devMode" value="${env.STRUTS_DEV_MODE:false}"/>
</struts>
~~~~~~~

Note: substitution is limited to System properties and ENV variables and works only for 

~~~~~~~
constant
~~~~~~~
s (as for now)\.

__Sample usage__

**Constant Example (struts\.xml)**


~~~~~~~
<struts>

  <constant name="struts.devMode" value="true" />

  ... 

</struts>

~~~~~~~

**Constant Example (struts\.properties)**


~~~~~~~
struts.devMode = true

~~~~~~~

**Constant Example (web\.xml)**


~~~~~~~
<web-app id="WebApp_9" version="2.4" 
	xmlns="http://java.sun.com/xml/ns/j2ee" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">

    <filter>
        <filter-name>struts</filter-name>
        <filter-class>org.apache.struts2.dispatcher.FilterDispatcher</filter-class>
        <init-param>
        	<param-name>struts.devMode</param-name>
        	<param-value>true</param-value>
        </init-param>
    </filter>

    ...

</web-app>

~~~~~~~