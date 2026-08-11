---
layout: default
title: Action File Upload Interceptor
parent:
    title: Interceptors
    url: interceptors
---

# Action File Upload Interceptor
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Available since Struts 6.4.0 as replacement for [File Upload Interceptor](file-upload-interceptor)
{:.alert .alert-info}

See [this page](action-file-upload) for more examples and advanced configuration.

Interceptor that is based off of `MultiPartRequestWrapper`, which is automatically applied for any request that includes 
a file. If an action implements `org.apache.struts2.action.UploadedFilesAware` interface, the interceptor will pass
information and content of uploaded files using the callback method `withUploadedFiles(List<UploadedFile>)`.

See the example code section.

This interceptor will add several field errors, assuming that the action implements `ValidationAware`. These error messages 
are based on several i18n values stored in `struts-messages.properties`, a default i18n file processed for all i18n requests. 
You can override the text of these messages by providing text for the following keys:

 - `struts.messages.error.uploading` - a general error that occurs when the file could not be uploaded
 - `struts.messages.error.file.too.large` - occurs when the uploaded file is too large
 - `struts.messages.error.content.type.not.allowed` - occurs when the uploaded file does not match the expected content 
   types specified
 - `struts.messages.error.file.extension.not.allowed` - occurs when the uploaded file does not match the expected 
   file extensions specified
 - `struts.messages.error.upload.policy.unresolved` - occurs when a `${...}` parameter could not be resolved for the
   current invocation, so the file is rejected (since Struts 7.3.0)

## Parameters

 - `maximumSize` (optional) - the maximum size (in bytes) that the interceptor will allow a file reference to be set
   on the action. Note, this is <b>not</b> related to the various properties found in struts.properties.
   Default to approximately 2MB.
 - `allowedTypes` (optional) - a comma separated list of content types (ie: `text/html`) that the interceptor will allow
   a file reference to be set on the action. If none is specified allow all types to be uploaded.
 - `allowedExtensions` (optional) - a comma separated list of file extensions (ie: `.html`) that the interceptor will allow
   a file reference to be set on the action. If none is specified allow all extensions to be uploaded.

### Dynamic Parameter Evaluation

> Since Struts 7.2.0

The `allowedTypes`, `allowedExtensions`, and `maximumSize` parameters support `${...}` expression evaluation,
enabling per-request dynamic validation. This is available when used with `WithLazyParams`.

```xml
<interceptor-ref name="actionFileUpload">
  <param name="allowedTypes">${allowedContentTypes}</param>
  <param name="maximumSize">${maxFileSize}</param>
</interceptor-ref>
```

The expressions are evaluated against the ValueStack at the time of the upload, allowing your action to provide
dynamic values based on the current request context.

Since Struts 7.3.0 the resolved values are held in a per-invocation `org.apache.struts2.interceptor.UploadPolicy`
instead of being written onto the shared interceptor instance, so two concurrent requests can no longer be validated
against each other's policy — see [WW-5659](https://issues.apache.org/jira/browse/WW-5659).

Also since Struts 7.3.0, an expression that cannot be resolved makes the policy unusable and the upload is **rejected**
with the `struts.messages.error.upload.policy.unresolved` message, rather than silently validated against a
partially-resolved policy. A typo in a `${...}` parameter, or a parameter name with no matching property, now fails
closed instead of relaxing validation. The `disabled` parameter is exempt: unresolved it is simply `false`, which leaves
the interceptor running with the rest of the policy intact.
{:.alert .alert-warning}

## Extending the Interceptor

You can extend this interceptor and override the `acceptFile` method to provide more control over which files are
supported and which are not.

Since Struts 7.3.0 `acceptFile` takes the per-invocation policy as its first argument:

```java
protected boolean acceptFile(UploadPolicy policy, Object action, UploadedFile file,
                             String originalFilename, String contentType, String inputName)
```

Read `policy.getMaximumSize()`, `policy.getAllowedTypes()` and `policy.getAllowedExtensions()` instead of the former
interceptor fields, which are configuration-time state only. Subclasses overriding the old five-argument signature must
be updated — the old method is gone, so the compiler will point them out.
{:.alert .alert-warning}

The same release changed the `org.apache.struts2.interceptor.WithLazyParams` interface, which is now generic over an
`org.apache.struts2.interceptor.InterceptorParams` holder:

```java
public interface WithLazyParams<P extends InterceptorParams> {
    P newLazyParams();
    String intercept(ActionInvocation invocation, P lazyParams) throws Exception;
}
```

Third-party interceptors implementing `WithLazyParams` must supply a holder class (extend
`org.apache.struts2.interceptor.DisableParams` if the interceptor supports the `disabled` parameter) and move the
resolved values off the singleton into it.
{:.alert .alert-warning}

## Examples

See [this page](action-file-upload) for more examples and advanced configuration.

**Example action mapping:**

```xml
 <action name="doUpload" class="com.example.UploadAction">
     <interceptor-ref name="actionFileUpload"/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.jsp</result>
 </action>

```

Notice the interceptor configuration in the preceding example\. 

**Example JSP form tags:**

```xml
   <s:form action="doUpload" method="post" enctype="multipart/form-data">
       <s:file name="upload" label="File"/>
       <s:submit/>
   </s:form>

```

You must set the encoding to <code>multipart/form-data</code> in the form where the user selects the file to upload.

**Example Action class:**

```java
public class UploadAction extends ActionSupport implements UploadedFilesAware {
   private UploadedFile uploadedFile;
   private String contentType;
   private String fileName;
   private String originalName;

   @Override
   public void withUploadedFiles(List<UploadedFile> uploadedFiles) {
      if (!uploadedFiles.isEmpty()) {
         this.uploadedFile = uploadedFiles.get(0);
         this.fileName = uploadedFile.getName();
         this.contentType = uploadedFile.getContentType();
         this.originalName = uploadedFile.getOriginalName();
      }
   }

   public String execute() {
      //do something with the file
      return SUCCESS;
   }
}
```

**Setting parameters example:**

```xml
<interceptor-ref name="actionFileUpload">
  <param name="allowedTypes">
     image/png,image/gif,image/jpeg
  </param>
</interceptor-ref>
```

This part is optional and would be done in place of the `<interceptor-ref name="actionFileUpload"/>` line in the action mapping 
example above.
