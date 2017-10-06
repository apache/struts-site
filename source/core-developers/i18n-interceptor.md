---
layout: core-developers
title: I18n Interceptor
---

# I18n Interceptor

##### Description

An interceptor that handles setting the locale specified in a session as the locale for the current action request\. In addition, this interceptor will look for a specific HTTP request parameter and set the locale to whatever value is provided, it also looks for specific cookie to read locale from\. This means that this interceptor can be used to allow for your application to dynamically change the locale for the user's session or, alternatively, only for the current  request\. This is very useful for applications that require multi\-lingual support and want the user to be able to set his or her language preference at any point\. The locale parameter is removed during the execution of this interceptor, ensuring that properties aren't set on an action (such as request\_locale) that have no typical corresponding setter in your action\.

For example, using the default parameter name, a request to **foo\.action?request\_locale=en\_US**, then the locale for US English is saved in the user's session and will be used for all future requests\. If there is no locale set (for example with the first visit), the interceptor uses the browser locale\.

##### Parameters

+ **parameterName** (optional) \- the name of the HTTP request parameter that dictates the locale to switch to and save in the session\. By default this is **request\_locale**

+ **requestCookieParameterName** (optional) \- the name of the HTTP request parameter that dictates the locale to switch to and save in a cookie\. By default this is **request\_cookie\_locale**

+ **requestOnlyParameterName** (optional) \- the name of the HTTP request parameter that dictates the locale to switch to for the current request only, without saving it in the session\. By default this is **request\_only\_locale**

+ **attributeName** (optional) \- the name of the session key to store the selected locale\. By default this is **WW\_TRANS\_I18N\_LOCALE**

+ **localeStorage** (optional) \- the name of storage location, it can be **none**, **session** or **cookie**\. By default this is **session**

##### Examples



~~~~~~~
<interceptor name="i18nCookie" class="org.apache.struts2.interceptor.I18nInterceptor"/>

<action name="someAction" class="com.examples.SomeAction">
    <interceptor-ref name="i18nCookie">
        <param name="localeStorage">cookie</param>
    </interceptor-ref>
    <interceptor-ref name="basicStack"/>
    <result name="success">good_result.ftl</result>
</action>
~~~~~~~
