---
layout: default
title: Exclude parameters
---
## Exclude Parameters

The example code for this tutorial, exclude_parameters, is available at [https://github.com/apache/struts-examples](https://github.com/apache/struts-examples).

__Introduction__

When [Struts development mode is set to true](//struts.apache.org/docs/strutsproperties.html) (also see [Debugging Struts](debugging-struts.html)) the framework writes many informative messages to the log file. These messages include ones that indicate whether or not a specific parameter will be handled by the parameter interceptor and made available to the Action class. These log messages can be helpful in clearly identifying parameters that you do not want the parameter interceptor to process for security or other reasons. This article discusses how to exclude parameters from being handled by the parameter interceptor.

The [Struts 2 user mailing list](http://struts.apache.org/mail.html) is an excellent place to get help. If you are having a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find an answer to your problem, post a question on the mailing list.

__Processing Request Parameters__

Most request parameters are by default processed by the parameter interceptor and Struts 2 will attempt to modify the state of those Action class fields that match up to a parameter name by calling a corresponding public set method. For example if the request includes a parameter of lastName with a value of Phillips, Struts 2 will try to call a public method with a signature of setLastName(String lastName). However, there may be request parameters that you do not want Struts 2 to try to set the value of in the Action class.

Consider this code which creates a form:

**Struts 2 Form Tags**

```html
<s:form action="save" method="post">
    <s:textfield key="personBean.firstName" /> 
    <s:textfield key="personBean.lastName" /> 
    <s:textfield key="personBean.email" />
    <s:textfield key="personBean.phoneNumber" />
    <s:select key="personBean.sport" list="sports" />
    <s:radio key="personBean.gender" list="genders" />
    <s:select key="personBean.residency" list="states" listKey="stateAbbr" listValue="stateName" />
    <s:checkbox key="personBean.over21" />
    <s:checkboxlist key="personBean.carModels" list="carModelsAvailable" />
    <s:submit key="submit" />
</s:form>
```

The s:submit tag will create a submit button with a name of submit. Since the Action class probably doesn't have a setSubmit(String name) method you will see the following log messages (only if Struts development mode is set to true):

**Log Messages**

```
Dec 31, 2012 3:43:53 PM 
com.opensymphony.xwork2.util.logging.commons.CommonsLogger warn
WARNING: Parameter [submit] is not on the excludeParams list of patterns and will be appended to action!

Dec 31, 2012 3:43:53 PM com.opensymphony.xwork2.util.logging.commons.CommonsLogger error
SEVERE: Developer Notification (set struts.devMode to false to disable this message):
Unexpected Exception caught setting 'submit' on 'class org.apache.struts.edit.action.EditAction: Error setting expression 'submit' with value ['Save Changes', ]
```

__Excluding Request Parameters From Struts 2 Processing__

If you're not familiar with setting up a custom interceptor stack for your Struts 2 application review [Introducing Interceptors](introducing-interceptors.html).

To exclude specific parameters from being processed by the Struts 2 framework you need to add those parameter names to the list of excluded parameters. One way to do this is by adding those parameter names to the collection of excludedParams for the Parameters interceptor. You can do this by modifying the Parameters interceptor in setting up the stack of interceptors used by your Struts 2 application. For example:

**Setup Interceptor Stack To Exclude submit Parameter**

```xml
<interceptors>
    <interceptor-stack name="appDefault">
        <interceptor-ref name="defaultStack">
            <param name="exception.logEnabled">true</param>
            <param name="exception.logLevel">ERROR</param>
            <param name="params.excludeParams">dojo..*,^struts..*,^session..*,^request..*,^application..*,^servlet(Request|Response)..*,parameters...*,submit</param>
        </interceptor-ref>
    </interceptor-stack>
</interceptors>
		
<default-interceptor-ref name="appDefault" />
```

The value of node `<param name="params.excludeParams">` is a comma-delimited list of regular expressions or simple Strings that identify request parameters that should NOT be processed by the Parameters interceptor. To exclude the submit parameter (which is the name of the submit button in the form code above), I just added submit to the list.

See the [Basic Stack of Interceptors described here](//struts.apache.org/docs/struts-defaultxml.html) to view the initial set of parameter names/regular expressions to exclude. Be sure to copy over the list of parameters already being excluded and then add your own parameters to the end separated by commas.

__Example Application__

Download the example application, [Exclude_Params_Struts2_Mvn](http://code.google.com/p/struts2-examples/downloads/list) that demonstrates excluding a request parameter. The download is a zipped Maven project. You should be able to unzip it and import the project into any Maven-aware Java IDE. See the project's README.txt file for how to build and run the application.

To see the log messages written when not excluding the submit parameter remove the ",submit" from the list of excluded parameter values in the struts.xml file. Then rebuild and redeploy the application and view the console when running the application.

__Summary__

It's a nice feature of the Struts 2 framework that it logs during development which request parameters will and will not be processed. During development of a Struts 2 web application it's a good practice to review these log messages to determine if there are any parameters that the framework should not process. For those parameters the Struts 2 framework should not process add the parameter name (or a regular expression that can be used to identify multiple parameter names) to the comma-delimited list that is the value for the `<param name="params.excludeParams">` node.

|Return to [Preparable Interface](preperable-interface.html)|or|back to [Getting started](index.html)|
