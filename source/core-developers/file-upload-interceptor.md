---
layout: core-developers
title: File Upload Interceptor
---

# File Upload Interceptor


  See [this page](file-upload.html) for more examples and advanced configuration

| 



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}
<p> <p>
 Interceptor that is based off of {@link MultiPartRequestWrapper}, which is automatically applied for any request that
 includes a file. It adds the following parameters, where [File Name] is the name given to the file uploaded by the
 HTML form:
 </p>
 <ul>

 <li>[File Name] : File - the actual File</li>

 <li>[File Name]ContentType : String - the content type of the file</li>

 <li>[File Name]FileName : String - the actual name of the file uploaded (not the HTML name)</li>

 </ul>

 <p>You can get access to these files by merely providing setters in your action that correspond to any of the three
 patterns above, such as setDocument(File document), setDocumentContentType(String contentType), etc.
 <br>See the example code section.
 </p>

 <p> This interceptor will add several field errors, assuming that the action implements {@link ValidationAware}.
 These error messages are based on several i18n values stored in struts-messages.properties, a default i18n file
 processed for all i18n requests. You can override the text of these messages by providing text for the following
 keys:
 </p>

 <ul>

 <li>struts.messages.error.uploading - a general error that occurs when the file could not be uploaded</li>

 <li>struts.messages.error.file.too.large - occurs when the uploaded file is too large</li>

 <li>struts.messages.error.content.type.not.allowed - occurs when the uploaded file does not match the expected
 content types specified</li>

 <li>struts.messages.error.file.extension.not.allowed - occurs when the uploaded file does not match the expected
 file extensions specified</li>

 </ul>

</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}
<p>
 <ul>

 <li>maximumSize (optional) - the maximum size (in bytes) that the interceptor will allow a file reference to be set
 on the action. Note, this is <b>not</b> related to the various properties found in struts.properties.
 Default to approximately 2MB.</li>

 <li>allowedTypes (optional) - a comma separated list of content types (ie: text/html) that the interceptor will allow
 a file reference to be set on the action. If none is specified allow all types to be uploaded.</li>

 <li>allowedExtensions (optional) - a comma separated list of file extensions (ie: .html) that the interceptor will allow
 a file reference to be set on the action. If none is specified allow all extensions to be uploaded.</li>
 </ul>


</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}

##### Extending the Interceptor



{% comment %}start snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}
<p> <p>
 You can extend this interceptor and override the acceptFile method to provide more control over which files
 are supported and which are not.
 </p>
</p>
{% comment %}end snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}

##### Examples

**Example action mapping:**


{% comment %}start snippet id=example-configuration|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}

```xml
 <action name="doUpload" class="com.example.UploadAction">
     <interceptor-ref name="fileUpload"/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.jsp</result>
 </action>

```

{% comment %}end snippet id=example-configuration|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}

Notice the interceptor configuration in the preceding example\. 

**Example JSP form tags:**


{% comment %}start snippet id=example-form|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}

```xml
   <s:form action="doUpload" method="post" enctype="multipart/form-data">
       <s:file name="upload" label="File"/>
       <s:submit/>
   </s:form>

```

{% comment %}end snippet id=example-form|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}


{% comment %}start snippet id=multipart-note|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}
<p> <p>
 You must set the encoding to <code>multipart/form-data</code> in the form where the user selects the file to upload.
 </p>
</p>
{% comment %}end snippet id=multipart-note|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}

**Example Action class:**


{% comment %}start snippet id=example-action|lang=java|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}

```java
    package com.example;

    import java.io.File;
    import com.opensymphony.xwork2.ActionSupport;

    public UploadAction extends ActionSupport {
       private File file;
       private String contentType;
       private String filename;

       public void setUpload(File file) {
          this.file = file;
       }

       public void setUploadContentType(String contentType) {
          this.contentType = contentType;
       }

       public void setUploadFileName(String filename) {
          this.filename = filename;
       }

       public String execute() {
          //...
          return SUCCESS;
       }
  }

```

{% comment %}end snippet id=example-action|lang=java|javadoc=true|url=org.apache.struts2.interceptor.FileUploadInterceptor {% endcomment %}

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
