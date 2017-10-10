---
layout: core-developers
title: DebuggingInterceptor
---

# DebuggingInterceptor



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.debugging.DebuggingInterceptor {% endcomment %}
<p> <p>
 Provides several different debugging screens to provide insight into the
 data behind the page.
 </p>
</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.debugging.DebuggingInterceptor {% endcomment %}


{% comment %}start snippet id=remarks|javadoc=true|url=org.apache.struts2.interceptor.debugging.DebuggingInterceptor {% endcomment %}
<p> This interceptor only is activated when devMode is enabled in
 struts.properties. The 'debug' parameter is removed from the parameter list
 before the action is executed. All operations occur before the natural
 Result has a chance to execute.
</p>
{% comment %}end snippet id=remarks|javadoc=true|url=org.apache.struts2.interceptor.debugging.DebuggingInterceptor {% endcomment %}

## Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.debugging.DebuggingInterceptor {% endcomment %}
<p> <ul>
 <li> <code>xml</code> - Dumps the parameters, context, session, and value
 stack as an XML document.</li>
 <li> <code>console</code> - Shows a popup 'OGNL Console' that allows the
 user to test OGNL expressions against the value stack. The XML data from
 the 'xml' mode is inserted at the top of the page.</li>
 <li> <code>command</code> - Tests an OGNL expression and returns the
 string result. Only used by the OGNL console.</li>
 <li><code>browser</code> Shows field values of an object specified in the 
 <code>object</code> parameter (#context by default). When the <code>object</code>
 parameters is set, the '#' character needs to be escaped to '%23'. Like
 debug=browser&object=%23parameters</li>
 </ul>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.debugging.DebuggingInterceptor {% endcomment %}

## Example



{% comment %}start snippet id=example|javadoc=true|url=org.apache.struts2.interceptor.debugging.DebuggingInterceptor {% endcomment %}
<p>  http://localhost:8080/Welcome.action?debug=xml
</p>
{% comment %}end snippet id=example|javadoc=true|url=org.apache.struts2.interceptor.debugging.DebuggingInterceptor {% endcomment %}
