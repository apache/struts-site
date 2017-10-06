---
layout: core-developers
title: Velocity Result
---

# Velocity Result



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.result.VelocityResult {% endcomment %}
<p>

 Using the Servlet container's {@link JspFactory}, this result mocks a JSP

 execution environment and then displays a Velocity template that will be

 streamed directly to the servlet output.


</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.result.VelocityResult {% endcomment %}

####Parameters####



{% comment %}start snippet id=params|javadoc=true|url=org.apache.struts2.result.VelocityResult {% endcomment %}
<p>

 <ul>



 <li><b>location (default)</b> - the location of the template to process.</li>



 <li><b>parse</b> - true by default. If set to false, the location param will

 not be parsed for Ognl expressions.</li>



 </ul>

 <p>

 This result follows the same rules from {@link StrutsResultSupport}.

 </p>


</p>
{% comment %}end snippet id=params|javadoc=true|url=org.apache.struts2.result.VelocityResult {% endcomment %}

####Examples####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.result.VelocityResult {% endcomment %}


```xml

 <result name="success" type="velocity">

   <param name="location">foo.vm</param>

 </result>


```


{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.result.VelocityResult {% endcomment %}
