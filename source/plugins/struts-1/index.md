---
layout: plugin
title: Struts 1 Plugin
parent:
    url: index.html
    title: Plugins
---

# Struts 1 Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description
The Struts 1 plugin allows you to use existing Struts 1 Actions and ActionForms in Struts 2 applications

This plugin provides a generic Struts 2 Action class to wrap an existing Struts 1 Action, `org.apache.struts2.s1.Struts1Action`.  The wrapper class provides the expected calls to the legacy Struts 1 Action and ActionForm, converting incoming and outgoing objects into the expected forms.  It works by using the [scoped model driven](/core-developers/scoped-model-driven-interceptor)  technique that uses a single Object as the model for every page, very similar to how the Struts 1 ActionForm works.  The plugin also provides several interceptors to emulate Struts 1 logic:

+ `org.apache.struts2.s1.ActionFormValidatorInterceptor` - Integrates the validation of ActionForms into the workflow of Struts 2

+ `org.apache.struts2.s1.ActionFormResetInterceptor` - Calls the `reset()` method on any discovered ActionForms

The Struts 1 plugin is currently only intended to allow you to run Strust 1 actions inside a Struts 2 application. It DOES NOT allow you to continue to use the Struts 1 tag libraries in your JSPs. Your JSPs must be converted to use the Struts 2 tag library.

There is a [JIRA ticket](https://issues.apache.org/struts/browse/WW-2157) open for enhancing this plugin to allow a more seamless transition from Struts 1 to Struts 2 by supporting continued use of the Struts 1 tag libraries in JSPs, however, there is not a scheduled time frame for that functionality to be made available. (Patches are welcomed!) 

## Features

+ Can use Struts 1 Actions and ActionForms with no code changes

+ Supports Commons Validator-enabled ActionForms

## Usage

To use existing Struts 1 Actions and ActionForms in a Struts 2 application, create a normal Struts 2 configuration package in `struts.xml`, but have it extend `struts1-default`.  The `struts1-default` package contains several interceptors and a default interceptor stack that work the plugin into the Struts 2 request process.

In the most simple case, where you have a Struts 1 Action that you want to use in Struts 2, configure a Struts 2 action using the wrapper:

**Simple Struts 1 configuration**

```xml

<action name="myAction" class="org.apache.struts2.s1.Struts1Action">
  <param name="className">com.mycompany.myapp.MyAction</param>
  <result>myAction.jsp</result>
</action>

```

Most likely, you will have an ActionForm that your Struts 1 Action expects.  To use an ActionForm, the setup is a little more complicated because you'll need an interceptor that manages the creation and scope (to support request and session scoping like Struts 1) of the ActionForm. 

**Struts 1 Action with a session-scoped ActionForm**

```xml


<action name="myFormAction" class="org.apache.struts2.s1.Struts1Action">
  <param name="className">com.mycompany.myapp.MyAction</param>

  <interceptor-ref name="scopedModelDriven">
    <param name="className">com.mycompany.myapp.MyForm</param>
    <param name="name">gangsterForm</param>
    <param name="scope">session</param>
  </interceptor-ref>
  <interceptor-ref name="struts1Stack"/>

  <result>myAction.jsp</result>
</action>

```

## Example

This example shows a few Struts 1 Actions, a session-scoped ActionForm, and validation that uses Commons Validator:

{% comment %}start snippet lang=xml|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=apps/showcase/src/main/resources/struts-conversion.xml;hb=HEAD {% endcomment %}

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE struts PUBLIC
	"-//Apache Software Foundation//DTD Struts Configuration 2.5//EN"
	"http://struts.apache.org/dtds/struts-2.5.dtd">
	
<struts>
	<package name="conversion" namespace="/conversion" extends="struts-default">
	
        <action name="index">
            <result>/WEB-INF/conversion/index.jsp</result>
        </action>
        
		<!-- Example populating a List inside an Action -->
		<action name="enterPersonsInfo" method="input"
				class="org.apache.struts2.showcase.conversion.PersonAction">
			<result>/WEB-INF/conversion/enterPersonInfo.jsp</result>
		</action>
		<action name="submitPersonInfo" method="submit"
				class="org.apache.struts2.showcase.conversion.PersonAction">
			<result>/WEB-INF/conversion/showPersonInfo.jsp</result>
			<result name="input">/WEB-INF/conversion/enterPersonInfo.jsp</result>
		</action>
		<action name="showPersonJspCode">
			<result type="plainText">/WEB-INF/conversion/enterPersonInfo.jsp</result>
		</action>
		<action name="showPersonActionJavaCode">
			<result type="plainText">/WEB-INF/conversion/PersonAction.java.txt</result>
		</action>
		<action name="showPersonJavaCode">
			<result type="plainText">/WEB-INF/conversion/Person.java.txt</result>
		</action>
		
		
		<!-- Example populating a Set inside an Action -->
		<action name="enterAddressesInfo" class="org.apache.struts2.showcase.conversion.AddressAction" method="input">
			<result>/WEB-INF/conversion/enterAddressInfo.jsp</result>
		</action>
		<action name="submitAddressesInfo" class="org.apache.struts2.showcase.conversion.AddressAction" method="submit">
			<result>/WEB-INF/conversion/showAddressInfo.jsp</result>
			<result name="input">/WEB-INF/conversion/enterAddressInfo.jsp</result>
		</action>
		<action name="showAddressJspCode">
			<result type="plainText">/WEB-INF/conversion/enterAddressInfo.jsp</result>
		</action>
		<action name="showAddressActionJavaCode">
			<result type="plainText">/WEB-INF/conversion/AddressAction.java.txt</result>
		</action>
		<action name="showAddressJavaCode">
			<result type="plainText">/WEB-INF/conversion/Address.java.txt</result>
		</action>
		
		
		<!-- Example populating a List with Tiger 5 Enum  -->		
		<action name="enterOperationEnumInfo" class="org.apache.struts2.showcase.conversion.OperationsEnumAction" method="input">
			<result>/WEB-INF/conversion/enterOperations.jsp</result>
		</action>
		<action name="submitOperationEnumInfo" class="org.apache.struts2.showcase.conversion.OperationsEnumAction" method="submit">
			<result>/WEB-INF/conversion/showOperations.jsp</result>
			<result name="input">/WEB-INF/conversion/enterOperations.jsp</result>
		</action>
		<action name="showEnumJspCode">
			<result type="plainText">/WEB-INF/conversion/enterOperations.jsp</result>
		</action>
		<action name="showOperationsEnumJavaCode">
			<result type="plainText">/WEB-INF/conversion/OperationsEnum.java.txt</result>
		</action>
		<action name="showOperationEnumActionJavaCode">
			<result type="plainText">/WEB-INF/conversion/OperationsEnumAction.java.txt</result>
		</action>
		<action name="showEnumTypeConverterJavaCode">
			<result type="plainText">/WEB-INF/conversion/EnumTypeConverter.java.txt</result>
		</action>
		<action name="showOperationsEnumActionConversionProperties">
			<result type="plainText">/WEB-INF/conversion/OperationsEnumActionConversion.txt</result>
		</action>
		
	</package>
</struts>	

```

{% comment %}end snippet lang=xml|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=apps/showcase/src/main/resources/struts-conversion.xml;hb=HEAD {% endcomment %}

## Settings

This plugin doesn't support any global settings.

## Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory.  It will need the Struts 1 jar in order to function correctly.
