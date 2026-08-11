---
layout: default
title: Action File Upload
parent:
  title: Action File Upload Interceptor
  url: action-file-upload-interceptor
---

# Action File Upload
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The Struts 2 framework provides built-in support for processing file uploads that conform to [RFC 1867](http://www.ietf.org/rfc/rfc1867.txt), 
"Form-based File Upload in HTML". When correctly configured the framework will pass uploaded file(s) into your Action
class. Support for individual and multiple file uploads are provided. When a file is uploaded it will typically be
stored in a temporary directory. Uploaded files should be processed or moved by your Action class to ensure the data is
not lost. Be aware that servers may have a security policy in place that prohibits you from writing to directories other
than the temporary directory and the directories that belong to your web application.

## Dependencies

The Struts 2 framework leverages the Commons FileUpload library as a based library to support file upload in the framework.
The library is included in a base Struts 2 distribution.

## Basic Usage

The `org.apache.struts2.interceptor.ActionFileUploadInterceptor` interceptor is included as part of the `defaultStack` 
and named `actionFileUpload`. As long as the required libraries are added to your project you will be able to take 
advantage of the Struts 2 file upload capability. Configure an Action mapping for your Action class as you typically would.

### Example action mapping:

```xml
<action name="doUpload" class="com.example.UploadAction">
    <result name="success">good_result.jsp</result>
</action>

```

A form must be created with a form field of type file, `<INPUT type="file" name="upload">`. The form used to upload the
file must have its encoding type set to `multipart/form-data`, `<form action="doUpload" enctype="multipart/form-data" method="post">`.
The standard procedure for adding these elements is by using the Struts 2 tag libraries as shown in the following
example:

### Example JSP form tags:

```xml
<s:form action="doUpload" method="post" enctype="multipart/form-data">
    <s:file name="upload" label="File"/>
    <s:submit/>
</s:form>
```

The **actionFileUpload** interceptor will use a dedicated interface `org.apache.struts2.action.UploadedFilesAware` 
to transfer information and content of uploaded file. Your action should implement the interface to receive the uploaded file:

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
        // do something with the file
        return SUCCESS;
    }
}
```

## Uploading Multiple Files

As mentioned in the previous section one technique for uploading multiple files would be to simply have multiple form
input elements of type file all with different names. This would require a number of setter methods that was equal to 3
times the number of files being uploaded. Another option is to use Arrays or java.util.Lists. The following examples are
taken from the Showcase example application that is part sample applications you can download at [download](http://struts.apache.org/download.cgi).
For the Action mapping details  see `struts-fileupload.xml` in the sample application download.

`multipleUploadUsingList.jsp` Notice all file input types have the same name.

```html
<s:form action="multipleFileUploadUsingList" method="POST" enctype="multipart/form-data">
    <s:file label="File (1)" name="upload"/>
    <s:file label="File (2)" name="upload"/>
    <s:file label="FIle (3)" name="upload"/>
    <s:submit cssClass="btn btn-primary"/>
</s:form>
```

The `org.apache.struts2.action.UploadedFilesAware` interface already supports uploading multiple files:

```java
public class MultipleFileUploadUsingListAction extends ActionSupport implements UploadedFilesAware {

    private List<UploadedFile> uploads = new ArrayList<>();

    public List<UploadedFile> getUpload() {
        return this.uploads;
    }

    @Override
    public void withUploadedFiles(List<UploadedFile> uploads) {
        this.uploads = uploads;
    }

    private List<String> getUploadFileNames() {
        return this.uploads.stream()
                .map(UploadedFile::getOriginalName)
                .collect(Collectors.toList());
    }

    private List<String> getUploadContentTypes() {
        return this.uploads.stream()
                .map(UploadedFile::getContentType)
                .collect(Collectors.toList());
    }

    public String execute() throws Exception {
        System.out.println("files:");
        for (UploadedFile u : uploads) {
            System.out.println("*** " + u + "\t" + u.length());
        }
        System.out.println("filenames:");
        for (String n : getUploadFileNames()) {
            System.out.println("*** " + n);
        }
        System.out.println("content types:");
        for (String c : getUploadContentTypes()) {
            System.out.println("*** " + c);
        }
        System.out.println("\n\n");
        return SUCCESS;
    }
}
```

## Advanced Configuration

The Struts 2 `default.properties` file defines several settings that affect the behavior of file uploading. You may find
it necessary to change these values. The names and default values are:

```
struts.multipart.parser=jakarta
struts.multipart.saveDir= # Filesystem location to save parsed request data
struts.multipart.maxSize=2097152 # Max combined size of files per request
struts.multipart.maxFiles=256 # Max number of files per request
struts.multipart.maxParameterCount=256 # Max number of normal fields per request (since Struts 7.3.0)
struts.multipart.maxFileSize= # Max size per file per request
struts.multipart.maxStringLength=4096 # Max length of a string parameter (a normal field) in a multipart request (since Struts 6.1.2.1)
```

You can also set the max options to unlimited by setting their value to `-1`, but please see the sections below for
further details on these options first.

### Files Number Limit

Since Struts 6.1.2 a new option was added to limit how many files can be uploaded at once, in one request. By default it
is set to **256**. Please always set this to a finite value to prevent DoS attacks.

To change this value define a constant in `struts.xml` as follows:

```xml
<struts>
    <constant name="struts.multipart.maxFiles" value="500"/>
</struts>
```

### Parameters Number Limit

> Since Struts 7.3.0

`struts.multipart.maxFiles` now counts **uploaded files only**, and a companion option
`struts.multipart.maxParameterCount` (default **256**) limits the number of normal, non-file fields in a multipart
request. The two limits are independent: a request may carry up to `maxFiles` files **and** up to `maxParameterCount`
form fields. Both are enforced identically by the `jakarta` and the `jakarta-stream` parser.

```xml
<struts>
    <constant name="struts.multipart.maxFiles" value="500"/>
    <constant name="struts.multipart.maxParameterCount" value="1000"/>
</struts>
```

Exceeding either limit is fail-closed: parsing is aborted, an upload error is recorded, and the action receives **no**
parameters and **no** files — never a partially populated request.

**Behaviour change in Struts 7.3.0**: before 7.3.0, `struts.multipart.maxFiles` capped files *and* normal fields
together (`jakarta` parser) or counted distinct file field names (`jakarta-stream` parser), so a form with many normal
fields and few files could be rejected — see [WW-5474](https://issues.apache.org/jira/browse/WW-5474). Such requests now
pass, while a request with more than `maxParameterCount` normal fields is rejected with the new
`struts.messages.upload.error.FileUploadParameterCountLimitException` message. If you raised `maxFiles` only to
accommodate large forms, lower it back to a realistic file count and raise `struts.multipart.maxParameterCount` instead.
{:.alert .alert-warning}

### File Size Limits

There are multiple methods to enforce file size limits.

There is `struts.multipart.maxSize` which is loaded from the Struts configuration. This setting exists for security
reasons to prohibit a malicious user from uploading extremely large files to fill up your server's disk space. This
setting defaults to approximately 2MB and should be adjusted to the maximum size (2GB) that you expect to parse. If you
are uploading more than one file in a single request, the `struts.multipart.maxSize` applies to the combined total, not
the individual files.

There is also `struts.multipart.maxFileSize` which is not enforced by default, but can be enabled to enforce a max size
on a per-file basis.

The other setting, `maximumSize`, is an interceptor setting that is used to ensure a particular Action does not receive
a file that is too large. Note that the aforementioned settings are applied at the request parsing level and take
precedence over this interceptor setting.

Notice the locations of these settings in the following example:

```xml
<struts>
    <constant name="struts.multipart.maxSize" value="1000000"/>
    <constant name="struts.multipart.maxFileSize" value="750000"/>

    <action name="doUpload" class="com.example.UploadAction">
        <interceptor-ref name="basicStack"/>
        <interceptor-ref name="actionFileUpload">
            <param name="maximumSize">500000</param>
        </interceptor-ref>
        <interceptor-ref name="validation"/>
        <interceptor-ref name="workflow"/>

        <result name="success">good_result.jsp</result>
    </action>
</struts>
```

### Normal Field Size Limit

Since Struts 6.1.2.1 a new option has been introduced to limit the size of a normal string field in the multipart request.
The default limit is set to 4096 bytes:

```
struts.multipart.maxStringLength=4096
```

This options prevents attacks, which consists of multiple large objects in the multipart request. Such attack can exhaust 
the available memory and finally produce `OutOfMemoryException`. If the limit is too low you can increase it by defining
the following constant in `struts.xml`:

```xml
<struts>
    <constant name="struts.multipart.maxStringLength" value="10000"/>

    <action name="doUpload" class="com.example.UploadAction">
          ...
    </action>
</struts>
```

### File Types

There are two ways to limit the uploaded file type, decoratively and programmatically. To decoratively limit the file
type a comma separated list of allowedTypes can be specified as a fileUpload interceptor param as shown in the following
example:

```xml
<action name="doUpload" class="com.example.UploadAction">
    <interceptor-ref name="basicStack"/>
    <interceptor-ref name="actionFileUpload">
        <param name="allowedTypes">image/jpeg,image/gif</param>
    </interceptor-ref>
    <interceptor-ref name="validation"/>
    <interceptor-ref name="workflow"/>

    <result name="success">good_result.jsp</result>
</action>
```

When the uploaded file type does not match one of the MIME types specified a field error will be created as described in
the next section entitled Error Messages. Programmatically limiting the file type means using the information passed in
to your Action class via the `setXContentType(String contentType)` method. The benefit to this type of approach would be
that it's more flexible and no interceptor configuration would be needed if file sizes are keep under 2 megs.

### Error Messages

If an error occurs several field errors will be added assuming that the action
implements `com.opensymphony.xwork2.ValidationAware`
or extends `com.opensymphony.xwork2.ActionSupport`. These error messages are based on several i18n values stored in
struts-messages.properties, a default i18n file processed for all i18n requests. You can override the text of these
messages by providing text for the following keys:

| Error Key                                                             | Description                                                                                                                         |
|-----------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| `struts.messages.error.uploading`                                     | A general error that occurs when the file could not be uploaded                                                                     |
| `struts.messages.error.file.too.large`                                | Occurs when the uploaded file is too large as specified by maximumSize.                                                             |
| `struts.messages.error.content.type.not.allowed`                      | Occurs when the uploaded file does not match the expected content types specified                                                   |
| `struts.messages.error.file.extension.not.allowed`                    | Occurs when uploaded file has disallowed extension                                                                                  |
| `struts.messages.error.upload.policy.unresolved`                      | Occurs when a `${...}` interceptor parameter could not be resolved, see [Dynamic Parameter Evaluation](action-file-upload-interceptor#dynamic-parameter-evaluation) (since Struts 7.3.0) |
| `struts.messages.upload.error.FileUploadSizeException`                | Occurs when the upload request (as a whole) exceeds configured **struts.multipart.maxSize**                                         |
| `struts.messages.upload.error.FileUploadByteCountLimitException`      | Occurs when a file within the upload request exceeds configured **struts.multipart.maxFileSize**                                    |
| `struts.messages.upload.error.FileUploadFileCountLimitException`      | Occurs when the number of files in the upload request exceeds configured **struts.multipart.maxFiles**                              |
| `struts.messages.upload.error.FileUploadParameterCountLimitException` | Occurs when the number of normal fields in the upload request exceeds configured **struts.multipart.maxParameterCount** (since Struts 7.3.0) |
| `struts.messages.upload.error.<Exception class SimpleName>`           | Occurs when any other exception took place during file upload process                                                               |

The exception-based keys above are the Commons FileUpload 2 names used since Struts 7.0.0. Struts 6.x uses the Commons
FileUpload 1.x names instead: `SizeLimitExceededException`, `FileSizeLimitExceededException`
and `FileCountLimitExceededException`.
{:.alert .alert-info}

### Temporary Directories

All uploaded files are saved to a temporary directory by the framework before being passed in to an Action. Depending on
the allowed file sizes it may be necessary to have the framework store these temporary files in an alternate location.
To do this change `struts.multipart.saveDir`
to the directory where the uploaded files will be placed. If this property is not set it defaults
to `javax.servlet.context.tempdir`. Keep in mind that on some operating systems, like Solaris, `/tmp` is memory based
and files stored in that directory would consume an amount of RAM approximately equal to the size of the uploaded file.

### In-Memory Uploads

> Since Struts 7.3.0

Small uploads (below the parser's disk-spill threshold, around 8 KB) are kept in memory and are **no longer written to a
temporary file eagerly** — see [WW-5413](https://issues.apache.org/jira/browse/WW-5413). The temporary file is written
lazily, only when something asks for a `java.io.File`. Uploads rejected by size, content-type or extension checks
therefore never touch the filesystem at all.

Two methods were added to `org.apache.struts2.dispatcher.multipart.UploadedFile` to support this. Both are `default`
methods, so existing third-party implementations keep compiling:

| Method                            | Purpose                                                                                            |
|-----------------------------------|----------------------------------------------------------------------------------------------------|
| `InputStream getInputStream()`    | Reads the uploaded content without forcing it to disk — the preferred way to consume an upload      |
| `boolean isMissing()`             | Reports a failed upload with no content, answered without materialising the content                 |

```java
public void withUploadedFiles(List<UploadedFile> uploadedFiles) {
    for (UploadedFile file : uploadedFiles) {
        try (InputStream in = file.getInputStream()) {
            // process the bytes; no temporary file is created for small uploads
        } catch (IOException e) {
            // handle
        }
    }
}
```

`getContent()` and `getAbsolutePath()` still return a `java.io.File` as before, so existing code — including actions
using the legacy `File`-typed property — keeps working unchanged; the first such call simply materialises the temporary
file at that point. Prefer `getInputStream()` in new code when you only need the bytes.
{:.alert .alert-info}

### Alternate Libraries

The `struts.multipart.parser` used by the fileUpload interceptor to handle HTTP POST requests, encoded using the
MIME-type `multipart/form-data`, can be changed out. Currently there are two choices, jakarta and pell. The jakarta
parser is a standard part of the Struts 2 framework needing only its required libraries added to a project. The pell
parser uses Jason Pell's multipart parser instead of the Commons-FileUpload library. The pell parser is a Struts 2
plugin, for more details see: [Pell multipart plugin](../plugins/pell/). There was a third alternative, cos, but it was
removed due to licensing incompatibilities.

As from Struts version 2.3.18 a new implementation of `MultiPartRequest` was added - `JakartaStreamMultiPartRequest`. It
can be used to handle large files, see [WW-3025](https://issues.apache.org/jira/browse/WW-3025) for more details, but
you can simple set

```
<constant name="struts.multipart.parser" value="jakarta-stream" />
```

in struts.xml to start using it.

### Request validation

The `struts.multipart.validationRegex` is used to define a RegEx to be used to validate if the incoming request is a
multipart request. The request must use the `POST` method and match the RegEx, by default the RegEx is defined as
follow:

```
^multipart/form-data(?:\\s*;\\s*boundary=[0-9a-zA-Z'()+_,\\-./:=?]{1,70})?(?:\\s*;\\s*charset=[a-zA-Z\\-0-9]{3,14})?
```

Please read [RFC1341](https://www.w3.org/Protocols/rfc1341/7_2_Multipart.html) the **Multipart section** for more details, existing Struts `Multipart` parsers support 
only `multipart/form-data` content type. This option is available since Struts 2.3.11.

### Disabling file upload support

You can alternatively disable the whole file upload mechanism defining a constant in `struts.xml`:

```xml
<constant name="struts.multipart.enabled" value="false"/>
```

With this constant in place, Struts will ignore a `Content-Type` header and will treat each request as an ordinary http
request. This option is available since Struts 2.3.11. 
