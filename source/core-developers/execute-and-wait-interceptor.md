---
layout: core-developers
title: Execute and Wait Interceptor
---

# Execute and Wait Interceptor



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.ExecuteAndWaitInterceptor {% endcomment %}
<p> <p>
 The ExecuteAndWaitInterceptor is great for running long-lived actions in the background while showing the user a nice
 progress meter. This also prevents the HTTP request from timing out when the action takes more than 5 or 10 minutes.
 </p>

 <p> Using this interceptor is pretty straight forward. Assuming that you are including struts-default.xml, this
 interceptor is already configured but is not part of any of the default stacks. Because of the nature of this
 interceptor, it must be the <b>last</b> interceptor in the stack.
 </p>

 <p> This interceptor works on a per-session basis. That means that the same action name (myLongRunningAction, in the
 above example) cannot be run more than once at a time in a given session. On the initial request or any subsequent
 requests (before the action has completed), the <b>wait</b> result will be returned. <b>The wait result is
 responsible for issuing a subsequent request back to the action, giving the effect of a self-updating progress
 meter</b>.
 </p>

 <p> If no "wait" result is found, Struts will automatically generate a wait result on the fly. This result is
 written in FreeMarker and cannot run unless FreeMarker is installed. If you don't wish to deploy with FreeMarker, you
 must provide your own wait result. This is generally a good thing to do anyway, as the default wait page is very
 plain.
 </p>

 <p>Whenever the wait result is returned, the <b>action that is currently running in the background will be placed on
 top of the stack</b>. This allows you to display progress data, such as a count, in the wait page. By making the wait
 page automatically reload the request to the action (which will be short-circuited by the interceptor), you can give
 the appearance of an automatic progress meter.
 </p>

 <p>This interceptor also supports using an initial wait delay. An initial delay is a time in milliseconds we let the
 server wait before the wait page is shown to the user. During the wait this interceptor will wake every 100 millis
 to check if the background process is done premature, thus if the job for some reason doesn't take to long the wait
 page is not shown to the user.
 <br> This is useful for e.g. search actions that have a wide span of execution time. Using a delay time of 2000
 millis we ensure the user is presented fast search results immediately and for the slow results a wait page is used.
 </p>

 <p><b>Important</b>: Because the action will be running in a separate thread, you can't use ActionContext because it
 is a ThreadLocal. This means if you need to access, for example, session data, you need to implement SessionAware
 rather than calling ActionContext.getSession().
 </p>

 <p>The thread kicked off by this interceptor will be named in the form <b><u>actionName</u>BackgroundProcess</b>.
 For example, the <i>search</i> action would run as a thread named <i>searchBackgroundProcess</i>.
 </p>
</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.ExecuteAndWaitInterceptor {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.ExecuteAndWaitInterceptor {% endcomment %}
<p>
 <ul>

 <li>threadPriority (optional) - the priority to assign the thread. Default is <code>Thread.NORM_PRIORITY</code>.</li>
 <li>delay (optional) - an initial delay in millis to wait before the wait page is shown (returning <code>wait</code> as result code). Default is no initial delay.</li>
 <li>delaySleepInterval (optional) - only used with delay. Used for waking up at certain intervals to check if the background process is already done. Default is 100 millis.</li>

 </ul>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.ExecuteAndWaitInterceptor {% endcomment %}

##### Extending the Interceptor



{% comment %}start snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.ExecuteAndWaitInterceptor {% endcomment %}
<p> <p>
 If you wish to make special preparations before and/or after the invocation of the background thread, you can extend
 the BackgroundProcess class and implement the beforeInvocation() and afterInvocation() methods. This may be useful
 for obtaining and releasing resources that the background process will need to execute successfully. To use your
 background process extension, extend ExecuteAndWaitInterceptor and implement the getNewBackgroundProcess() method.
 </p>
</p>
{% comment %}end snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.ExecuteAndWaitInterceptor {% endcomment %}

##### Examples



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.ExecuteAndWaitInterceptor {% endcomment %}

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="completeStack"/>
     <interceptor-ref name="execAndWait"/>
     <result name="wait">longRunningAction-wait.jsp</result>
     <result name="success">longRunningAction-success.jsp</result>
 </action>

 <%@ taglib prefix="s" uri="/struts" %>
 <html>
   <head>
     <title>Please wait</title>
     <meta http-equiv="refresh" content="5;url=<s:url includeParams="all" />"/>
   </head>
   <body>
     Please wait while we process your request.
     Click <a href="<s:url includeParams="all" />"></a> if this page does not reload automatically.
   </body>
 </html>
 </pre>

 <p><u>Example code2:</u></p>
 <p>
 This example will wait 2 second (2000 millis) before the wait page is shown to the user. Therefore
 if the long process didn't last long anyway the user isn't shown a wait page.
 </p>

 <pre>
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="completeStack"/>
     <interceptor-ref name="execAndWait">
         <param name="delay">2000<param>
     <interceptor-ref>
     <result name="wait">longRunningAction-wait.jsp</result>
     <result name="success">longRunningAction-success.jsp</result>
 </action>
 </pre>

 <p><u>Example code3:</u></p>
 <p>
 This example will wait 1 second (1000 millis) before the wait page is shown to the user.
 And at every 50 millis this interceptor will check if the background process is done, if so
 it will return before the 1 second has elapsed, and the user isn't shown a wait page.
 </p>

 <pre>
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="completeStack"/>
     <interceptor-ref name="execAndWait">
         <param name="delay">1000<param>
         <param name="delaySleepInterval">50<param>
     <interceptor-ref>
     <result name="wait">longRunningAction-wait.jsp</result>
     <result name="success">longRunningAction-success.jsp</result>
 </action>
 </pre>


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.ExecuteAndWaitInterceptor {% endcomment %}
