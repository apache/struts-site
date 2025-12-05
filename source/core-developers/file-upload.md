---
layout: default
title: File Upload
parent:
  title: File Upload Interceptor
  url: file-upload-interceptor
---

# File Upload
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Since Struts 6.4.0 the `FileUploadInterceptor` is deprecated, and you should use [ActionFileUploadInterceptor](action-file-upload-interceptor) instead!
Please refer to the [action file upload](action-file-upload) page to understand how to use it.
{:.alert .alert-warning}

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

The `org.apache.struts2.interceptor.FileUploadInterceptor` interceptor is included as part of the `defaultStack` 
and named `fileUpload`. As long as the required libraries are added to your project you will be able to take 
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

The **fileUpload** interceptor will use setter injection to insert the uploaded file and related data into your Action
class. For a form field named `upload` you would provide the three setter methods shown in the following example:

### Example Action class:

```java
package com.example;

import java.io.File;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {
    private File file;
    private String contentType;
    private String filename;

    @StrutsParameter
    public void setUpload(File file) {
        this.file = file;
    }

    @StrutsParameter
    public void setUploadContentType(String contentType) {
        this.contentType = contentType;
    }

    @StrutsParameter
    public void setUploadFileName(String filename) {
        this.filename = filename;
    }

    public String execute() {
        //...
        return SUCCESS;
    }
}
```

The purpose of each one of these methods is described in the table below. Notice that if you have multiple file form
elements with different names you would be required to have another corresponding set of these methods for each file
uploaded.

| Method Signature                      | Description                                                                                                                                        |
|---------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| `setX(File file)`                     | The file that contains the content of the uploaded file. This is a temporary file and file.getName() will not return the original name of the file |
| `setXContentType(String contentType)` | The mime type of the uploaded file                                                                                                                 |
| `setXFileName(String fileName)`       | The actual file name of the uploaded file (not the HTML name)                                                                                      |

## Uploading Multiple Files

As mentioned in the previous section one technique for uploading multiple files would be to simply have multiple form
input elements of type file all with different names. This would require a number of setter methods that was equal to 3
times the number of files being uploaded. Another option is to use Arrays or java.util.Lists. The following examples are
taken from the Showcase example application that is part sample applications you can download
at [http://struts.apache.org/download.cgi](http://struts.apache.org/download.cgi). For the Action mapping details
see `struts-fileupload.xml` in the sample application download.

### Uploading Multiple Files using Arrays

`multipleUploadUsingArray.jsp` Notice all file input types have the same name.

```html
<s:form action="doMultipleUploadUsingArray" method="POST" enctype="multipart/form-data">
    <s:file label="File (1)" name="upload"/>
    <s:file label="File (2)" name="upload"/>
    <s:file label="FIle (3)" name="upload"/>
    <s:submit cssClass="btn btn-primary"/>
</s:form>
```

**MultipleFileUploadUsingArrayAction.java**

```java
public class MultipleFileUploadUsingArrayAction extends ActionSupport {
    private File[] uploads;
    private String[] uploadFileNames;
    private String[] uploadContentTypes;

    public String upload() throws Exception {
        System.out.println("\n\n upload2");
        System.out.println("files:");
        for (File u : uploads) {
            System.out.println("*** " + u + "\t" + u.length());
        }
        System.out.println("filenames:");
        for (String n : uploadFileNames) {
            System.out.println("*** " + n);
        }
        System.out.println("content types:");
        for (String c : uploadContentTypes) {
            System.out.println("*** " + c);
        }
        System.out.println("\n\n");
        return SUCCESS;
    }

    public File[] getUpload() {
        return this.uploads;
    }

    @StrutsParameter
    public void setUpload(File[] upload) {
        this.uploads = upload;
    }

    public String[] getUploadFileName() {
        return this.uploadFileNames;
    }

    @StrutsParameter
    public void setUploadFileName(String[] uploadFileName) {
        this.uploadFileNames = uploadFileName;
    }

    public String[] getUploadContentType() {
        return this.uploadContentTypes;
    }

    @StrutsParameter
    public void setUploadContentType(String[] uploadContentType) {
        this.uploadContentTypes = uploadContentType;
    }
}
```

### Uploading Multiple Files using Lists

`multipleUploadUsingList.jsp` Notice all file input types have the same name.

```html
<s:form action="doMultipleUploadUsingList" method="POST" enctype="multipart/form-data">
    <s:file label="File (1)" name="upload"/>
    <s:file label="File (2)" name="upload"/>
    <s:file label="FIle (3)" name="upload"/>
    <s:submit cssClass="btn btn-primary"/>
</s:form>
```

`MultipleFileUploadUsingListAction.java`

```java
public class MultipleFileUploadUsingListAction extends ActionSupport {
    private List<File> uploads = new ArrayList<File>();
    private List<String> uploadFileNames = new ArrayList<String>();
    private List<String> uploadContentTypes = new ArrayList<String>();

    public List<File> getUpload() {
        return this.uploads;
    }

    @StrutsParameter
    public void setUpload(List<File> uploads) {
        this.uploads = uploads;
    }

    public List<String> getUploadFileName() {
        return this.uploadFileNames;
    }

    @StrutsParameter
    public void setUploadFileName(List<String> uploadFileNames) {
        this.uploadFileNames = uploadFileNames;
    }

    public List<String> getUploadContentType() {
        return this.uploadContentTypes;
    }

    @StrutsParameter
    public void setUploadContentType(List<String> contentTypes) {
        this.uploadContentTypes = contentTypes;
    }

    public String upload() throws Exception {
        System.out.println("\n\n upload1");
        System.out.println("files:");
        for (File u : uploads) {
            System.out.println("*** " + u + "\t" + u.length());
        }
        System.out.println("filenames:");
        for (String n : uploadFileNames) {
            System.out.println("*** " + n);
        }
        System.out.println("content types:");
        for (String c : uploadContentTypes) {
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
struts.multipart.maxFileSize= # Max size per file per request
struts.multipart.maxStringLength=4096 # Max length of a string parameter (a normal field) in a multipart request (since Struts 6.1.2.1)
```

You can also set the max options to unlimited by setting their value to `-1`, but please see the sections below for
further details on these options first.

### Files Number Limit

Since Struts 6.1.2 a new option was added, which uses Commons FileUpload feature to limit how many files can be
uploaded at once, in one request. This option requires to use Commons FileUpload ver. 1.5 at least and by default is set
to **256**. Please always set this to a finite value to prevent DoS attacks.

To change this value define a constant in `struts.xml` as follows:

```xml
<struts>
    <constant name="struts.multipart.maxFiles" value="500"/>
</struts>
```

**Note**: This limit also affects number of normal fields in the request, there is an open bug in the Commons FileUpload 
library to address this problem, see [FILEUPLOAD-351](https://issues.apache.org/jira/browse/FILEUPLOAD-351).
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
The defeault limit is set to 4096 bytes:

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

| Error Key                                                      | Description                                                                                            |
|----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| `struts.messages.error.uploading`                              | A general error that occurs when the file could not be uploaded                                        |
| `struts.messages.error.file.too.large`                         | Occurs when the uploaded file is too large as specified by maximumSize.                                |
| `struts.messages.error.content.type.not.allowed`               | Occurs when the uploaded file does not match the expected content types specified                      |
| `struts.messages.error.file.extension.not.allowed`             | Occurs when uploaded file has disallowed extension                                                     |
| `struts.messages.upload.error.SizeLimitExceededException`      | Occurs when the upload request (as a whole) exceed configured **struts.multipart.maxSize**             |
| `struts.messages.upload.error.FileSizeLimitExceededException`  | Occurs when a file within the upload request exceeds configured **struts.multipart.maxFileSize**       |
| `struts.messages.upload.error.FileCountLimitExceededException` | Occurs when the number of files in the upload request exceeds configured **struts.multipart.maxFiles** |
| `struts.messages.upload.error.<Exception class SimpleName>`    | Occurs when any other exception took place during file upload process                                  |

### Temporary Directories

All uploaded files are saved to a temporary directory by the framework before being passed in to an Action. Depending on
the allowed file sizes it may be necessary to have the framework store these temporary files in an alternate location.
To do this change `struts.multipart.saveDir`
to the directory where the uploaded files will be placed. If this property is not set it defaults
to `javax.servlet.context.tempdir`. Keep in mind that on some operating systems, like Solaris, `/tmp` is memory based
and files stored in that directory would consume an amount of RAM approximately equal to the size of the uploaded file.

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

Please read [RFC1341](https://www.w3.org/Protocols/rfc1341/7_2_Multipart.html) the **Multipart section** for more
details,
existing Struts `Multipart` parsers support only `multipart/form-data` content type. This option is available since
Struts 2.3.11.

### Disabling file upload support

You can alternatively disable the whole file upload mechanism defining a constant in `struts.xml`:

```xml
<constant name="struts.multipart.enabled" value="false"/>
```

With this constant in place, Struts will ignore a `Content-Type` header and will treat each request as an ordinary http
request. This option is available since Struts 2.3.11. 
