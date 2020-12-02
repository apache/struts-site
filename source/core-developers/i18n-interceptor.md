---
layout: default
title: I18n Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# I18n Interceptor

## Description

An interceptor that handles setting the locale specified in a session as the locale for the current action request. 
In addition, this interceptor will look for a specific HTTP request parameter and set the locale to whatever value is 
provided, it also looks for specific cookie to read locale from. This means that this interceptor can be used to allow 
for your application to dynamically change the locale for the user's session or, alternatively, only for the current 
request. This is very useful for applications that require multi-lingual support and want the user to be able to set 
his or her language preference at any point. The locale parameter is removed during the execution of this interceptor, 
ensuring that properties aren't set on an action (such as request_locale) that have no typical corresponding setter 
in your action.

For example, using the default parameter name, a request to `foo.action?request_locale=en_US`, then the locale for 
US English is saved in the user's session and will be used for all future requests. If there is no locale set 
(for example with the first visit), the interceptor uses the browser locale.

## Parameters

 - `parameterName` (optional) - the name of the HTTP request parameter that dictates the locale to switch to and save 
   in the session. By default this is `request_locale`
 - `requestCookieParameterName` (optional) - the name of the HTTP request parameter that dictates the locale to switch 
   to and save in a cookie. By default this is `request_cookie_locale`
 - `requestOnlyParameterName` (optional) - the name of the HTTP request parameter that dictates the locale to switch to 
   for the current request only, without saving it in the session. By default this is `request_only_locale`
 - `attributeName` (optional) - the name of the session key to store the selected locale. By default this is `WW_TRANS_I18N_LOCALE`
 - `localeStorage` (optional) - the name of storage location, it can be `accept_language`, `request`, `session` or `cookie`,
   by default this is `session`.
 - `supportedLocale` (optional) - a set of comma separated locale supported by the application, once `storage` is set
   to `accept_language`, interceptor will try to match `supportedLocale` with locale provided in `Accept-Language` header.
   Also in case of using `session` or `cookie`, interceptor will try to first match with `Accept-Language` header 
   once `supportedLocale` has been defined. Since Struts 2.6. 

## Examples

```xml
<interceptor name="i18nCookie" class="org.apache.struts2.interceptor.I18nInterceptor"/>

<action name="someAction" class="com.examples.SomeAction">
    <interceptor-ref name="i18nCookie">
        <param name="localeStorage">cookie</param>
    </interceptor-ref>
    <interceptor-ref name="basicStack"/>
    <result name="success">good_result.ftl</result>
</action>
```
