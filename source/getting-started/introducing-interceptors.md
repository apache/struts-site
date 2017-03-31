---
layout: default
title: Introducing Interceptors
---
## Introducing Interceptors

The example code for this tutorial, interceptors, is available at [https://github.com/apache/struts-examples](https://github.com/apache/struts-examples)

> 

#####Introduction#####

So far our tutorials have not delved into the inner workings of the Struts 2 framework. But in this tutorial we'll introduce a key set of classes the Struts 2 framework relies upon to do most of the work whenever an Action is executed. In this tutorial's example project there is a register link that is mapped in the Struts XML configuration file (struts.xml) to the execute method of class Register. Before that execute method is called much work is done behind the scenes by the Struts 2 framework. For example:

1. Handling any exceptions generated

2. Converting the String request parameters to the Register class's instance fields where the name values match

3. Calling the validate method and/or the external XML validation

After the execute method is completed more work must be done

1. Handling any exceptions generated

2. Converting the Register class's instance fields to String values for display in the view page

3. Forwarding to the correct view page depending on the result String returned by the execute method


The above list of tasks are not complete - several other tasks are done before and after the execution of the Action.

| 

The benefit of using Struts 2 is all this work happens automatically. You can focus on the logic of the controller (the Struts 2 ActionSupport class), the Service layer, the data access layer, your domain models, etc.



| The [Struts 2 user mailing list](http://struts.apache.org/mail.html)^[http://struts.apache.org/mail.html] is an excellent place to get help. If you are having a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find an answer to your problem, post a question on the mailing list.

| 

#####Introducing Interceptors#####

The tasks that are done by the Struts 2 framework before and after an Action is executed are done by Struts 2 interceptors. Interceptors are standard Java classes included in the Struts 2 core jar which are executed in a specific order.

In our example application there is a package node in struts.xml. The package node has an attribute of extends with a value of "struts-default." The value "struts-default" identifies to the framework the specific stack of interceptors that will be executed before and after the Actions in that package.

If you want to learn more about the inner workings of interceptors, what interceptors belong to the struts default stack, and what are all the interceptors included with Struts 2, visit _Understanding Interceptors_ .

Sometime the Struts 2 default stack of interceptors are not exactly what you need for a particular action. You may want to use interceptors that are not part of the Struts 2 default stack. For an individual Action or for the entire package of Actions, you can specify a different stack of interceptors that the Action or package should use. Below is how you would specify that the register Action should use both the _logger_  and _timer_  interceptors in addition to the interceptors provided by the default stack.

**Specify Specific Interceptors For An Action**


~~~~~~~
<action name="register" class="org.apache.struts.register.action.Register" method="execute">
	<interceptor-ref name="timer" />
	<interceptor-ref name="logger" />
	<interceptor-ref name="defaultStack">
		<param name="exception.logEnabled">true</param>
		<param name="exception.logLevel">ERROR</param>
	</interceptor-ref>
	<result name="success">thankyou.jsp</result>
	<result name="input">register.jsp</result>
</action>


~~~~~~~

The logger interceptor logs the start and end of the execution of an Action. The timer interceptor logs the amount of time (in milliseconds) for execution of the Action. These two interceptors used together can provide developers useful feedback.

In the code example above note the three interceptor-ref nodes. Each one has a value for the name attribute. For the register Action we are instructing the framework to use the timer, logger, and defaultStack interceptors. The defaultStack are all the interceptors normally executed for an Action.

How did I know to use the value of timer for the name attribute and even that there is a timer interceptor? On the _Interceptors_  web page in the Struts 2 documentation are a list of interceptors that come with the Struts 2 framework and what the name value is for each interceptor.

How did I know that the timer interceptor isn't part of the defaultStack of interceptors already? Again on the Interceptors documentation web page is a list of which interceptors belong to the defaultStack.

Note the param nodes. These nodes are used to provide a value to the setLogEnabled and setLogLevel methods of the _Exception Interceptor_ . Providing the values of true and ERROR will cause the Struts 2 framework to log any exceptions not caught by the application's code and to log those exceptions at the ERROR level.

#####Run The Example#####

In the example application follow the README instructions to build, deploy, and run the application. View the output sent to the JVM console to see the log messages generated by the logger and timer interceptors. You should see log messages similar to the following:

INFO: Starting execution stack for action //register
 Nov 20, 2010 9:55:48 AM com.opensymphony.xwork2.util.logging.jdk.JdkLogger info

INFO: Finishing execution stack for action //register

Nov 20, 2010 9:55:48 AM com.opensymphony.xwork2.util.logging.jdk.JdkLogger info

INFO: Executed action [//register\!execute](https://cwiki.apache.org/register\!execute)^[https://cwiki.apache.org/register\!execute] took 177 ms.

If you wanted to have the logger and timer interceptors executed for all Actions in a package you would use the following in struts.xml:

**Specify Specific Interceptors For A Package**


~~~~~~~
<package name="basicstruts2" extends="struts-default" > 


       <interceptors> 

         <interceptor-stack name="appDefault"> 

            <interceptor-ref name="timer" /> 

            <interceptor-ref name="logger" /> 

            <interceptor-ref name="defaultStack" /> 

         </interceptor-stack> 

        </interceptors>          

        <default-interceptor-ref name="appDefault" /> 

       <!-- rest of package omitted --> 

</package> 


~~~~~~~

In the code above we use the interceptors node to define a new stack of interceptors that includes the timer, logger, and defaultStack interceptors. We give this new interceptor stack a name of appDefault. Then we use the default-interceptor-ref node to specify that for all Actions defined inside this package node the appDefault stack of interceptors are to be used. Thus the timer and logger interceptor will be executed for each Action in this package.

Note that in both examples we are still executing all the other interceptors by including the defaultStack as one of the interceptor-ref nodes. When you specify what interceptors you want to use for an Action or a package then only those interceptors are executed. So if in the example we had left out the interceptor-ref for defaultStack only the logger and timer interceptors would have executed.

#####Create Your Own Interceptor#####

In addition to specifying your own stack of interceptors, you can also write your own new interceptor and add it to the stack that is executed. The Struts _Writing Interceptors_  guide explains how to do this. For example, you could create your own interceptor to handle authentication and authorization.

#####Summary#####

Interceptors provide the Struts 2 framework with both power and flexibility. Developers may add additional interceptors (either ones provided by Struts 2 or ones they create) to the stack of interceptors executed when an Action class is called.

For more information about interceptors consult the Struts 2 _Interceptor_  documentation.

##Preparable Interface## {#PAGE_27839279}

The example code for this tutorial, preparable_interface, is available at [https://github.com/apache/struts-examples](https://github.com/apache/struts-examples).

> 

#####Introduction#####

Often the data used to populate a form control is dynamically generated, perhaps from a database. When the user submits the form, the Struts 2 validation interceptor attempts to validate the user's form input. If validation fails the Struts 2 framework returns the value "input" but the "input" action is not re-executed. Rather the view associated with the "input" result is rendered to the user. Usually this view is the page that displayed the original form.

This work-flow can cause a problem if one or more of the form fields or some other data displayed depends on a dynamic look-up that that is accomplished in the Action class's input method. Since the Action class's input method is not re-executed when validation fails, the view page may no longer have access to the correct information to create the form or other display information.



| The [Struts 2 user mailing list](http://struts.apache.org/mail.html)^[http://struts.apache.org/mail.html] is an excellent place to get help. If you are having a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find an answer to your problem, post a question on the mailing list.

| 

#####Preparable Interface#####

Struts 2 provides the [Preparable interface](http://struts.apache.org/2.3.1/xwork-core/apidocs/com/opensymphony/xwork2/Preparable.html)^[http://struts.apache.org/2.3.1/xwork-core/apidocs/com/opensymphony/xwork2/Preparable.html] to overcome this problem. An Action class that implements this interface must override the prepare method. The prepare method will always be called by the Struts 2 framework's [prepare interceptor](http://struts.apache.org/2.3.1.2/docs/prepare-interceptor.html)^[http://struts.apache.org/2.3.1.2/docs/prepare-interceptor.html] whenever any method is called for the Action class and also when validation fails before the view is rendered.

In the prepare method you should put any statements that must be executed no matter what other Action class method will be called and also statements that should be executed if validation fails. Usually statements in the prepare method set the value for Action class instance fields that will be used to populate form controls and get the values that will be used to set the initial form field values.

In addition to automatically running the prepare method the [prepare interceptor](http://struts.apache.org/2.3.1.2/docs/prepare-interceptor.html)^[http://struts.apache.org/2.3.1.2/docs/prepare-interceptor.html] will also call a method named prepare\[ActionMethodName\]. For example, define a prepare method and a prepareInput method in the Action class that implements preparable. When the Struts 2 framework calls the input method, the prepare interceptor will call the prepareInput and the prepare methods before calling the input method.

#####Example Application#####

If you examine class EditAction in the example application (see above) you'll see that it implements the Preparable Interface. In the prepare method is this code:

**EditAction.java prepare Method**


~~~~~~~
		
   carModelsAvailable = carModelsService.getCarModels() ;
		
   setPersonBean( editService.getPerson() );


~~~~~~~

The above statements get the car model values used to populate the car model check boxes displayed in the form and also get the information about the Person object being edited.

When you run the example application, look in the log to see when the prepare method is called in relation to the input and execute methods. Running the example application and examining the log should help you understand the impact of implementing the Preparable Interface and the prepare method.

#####Summary#####

When your application requires specific statements to be executed no matter which method of the Action class is called or when validation fails, you should implement the Preparable interface and override the prepare method.
