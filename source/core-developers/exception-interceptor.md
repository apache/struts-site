---
layout: core-developers
title: Exception Interceptor
---

# Exception Interceptor



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor {% endcomment %}
<p> <p>
 This interceptor forms the core functionality of the exception handling feature. Exception handling allows you to map
 an exception to a result code, just as if the action returned a result code instead of throwing an unexpected
 exception. When an exception is encountered, it is wrapped with an {@link ExceptionHolder} and pushed on the stack,
 providing easy access to the exception from within your result.
 </p>

 <p>
 <b>Note:</b> While you can configure exception mapping in your configuration file at any point, the configuration
 will not have any effect if this interceptor is not in the interceptor stack for your actions. It is recommended that
 you make this interceptor the first interceptor on the stack, ensuring that it has full access to catch any
 exception, even those caused by other interceptors.
 </p>

</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor {% endcomment %}

## Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor {% endcomment %}
<p>
 <ul>

 <li>logEnabled (optional) - Should exceptions also be logged? (boolean true|false)</li>
 
 <li>logLevel (optional) - what log level should we use (<code>trace, debug, info, warn, error, fatal</code>)? - defaut is <code>debug</code></li>
 
 <li>logCategory (optional) - If provided we would use this category (eg. <code>com.mycompany.app</code>).
 Default is to use <code>com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor</code>.</li>

 </ul>

 <p>
 The parameters above enables us to log all thrown exceptions with stacktace in our own logfile,
 and present a friendly webpage (with no stacktrace) to the end user.
 </p>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor {% endcomment %}

## Extending the Interceptor



{% comment %}start snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor {% endcomment %}
<p> <p>
 If you want to add custom handling for publishing the Exception, you may override
 {@link #publishException(com.opensymphony.xwork2.ActionInvocation, ExceptionHolder)}. The default implementation
 pushes the given ExceptionHolder on value stack. A custom implementation could add additional logging etc.
 </p>
</p>
{% comment %}end snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor {% endcomment %}

## Examples



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor {% endcomment %}

```xml
 <xwork>
     <package name="default" extends="xwork-default">
         <global-results>
             <result name="error" type="freemarker">error.ftl</result>
         </global-results>

         <global-exception-mappings>
             <exception-mapping exception="java.lang.Exception" result="error"/>
         </global-exception-mappings>

         <action name="test">
             <interceptor-ref name="exception"/>
             <interceptor-ref name="basicStack"/>
             <exception-mapping exception="com.acme.CustomException" result="custom_error"/>
             <result name="custom_error">custom_error.ftl</result>
             <result name="success" type="freemarker">test.ftl</result>
         </action>
     </package>
 </xwork>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor {% endcomment %}
