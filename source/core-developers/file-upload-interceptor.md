---
layout: core-developers
title: File Upload Interceptor
---

# File Upload Interceptor


  See [this page](file-upload.html) for more examples and advanced configuration

| 



~~~~~~~
{% snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor %}
~~~~~~~

#####Parameters#####



~~~~~~~
{% snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor %}
~~~~~~~

#####Extending the Interceptor#####



~~~~~~~
{% snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor %}
~~~~~~~

#####Examples#####

**Example action mapping:**


~~~~~~~
{% snippet id=example-configuration|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor %}
~~~~~~~

Notice the interceptor configuration in the preceding example\. 

**Example JSP form tags:**


~~~~~~~
{% snippet id=example-form|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor %}
~~~~~~~


~~~~~~~
{% snippet id=multipart-note|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor %}
~~~~~~~

**Example Action class:**


~~~~~~~
{% snippet id=example-action|lang=java|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor %}
~~~~~~~

**Setting parameters example:**


~~~~~~~

<interceptor-ref name="fileUpload">
  <param name="allowedTypes">
     image/png,image/gif,image/jpeg
  </param>
</interceptor-ref>

~~~~~~~

This part is optional and would be done in place of the 

~~~~~~~
<interceptor-ref name="fileUpload"/>
~~~~~~~
 line in the action mapping example above\.
