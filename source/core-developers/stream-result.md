---
layout: default
title: Stream Result
parent:
    title: Result types
    url: result-types
---

# Stream Result

A custom Result type for sending raw data (via an InputStream) directly to the HttpServletResponse. Very useful for 
allowing users to download content. If you are running your app server under HTTPS and having issues with PDF's or other 
file streams you should take a look at [HTTPS and IE Issues](https-and-ie-issues)

## Parameters

- `contentType` - the stream mime-type as sent to the web browser (default = `text/plain`).
- `contentLength` - the stream length in bytes (the browser displays a progress bar).
- `contentDisposition` - the content disposition header value for specifying the file name (default = `inline`, values 
  are typically `attachment;filename="document.pdf"`.
- `inputName` - the name of the InputStream property from the chained action (default = `inputStream`).
- `bufferSize` - the size of the buffer to copy from input to output (default = `1024`).
- `allowCaching` - if set to 'false' it will set the headers `Pragma` and `Cache-Control` to `no-cahce`, and prevent 
  client from caching the content (default = `true`).
- `contentCharSet` - if set to a string, ';charset=value' will be added to the content-type header, where value is the string 
  set. If set to an expression, the result of evaluating the expression will be used. If not set, then no charset will 
  be set on the header

These parameters can also be set by exposing a similarly named getter method on your Action. For example, you can provide 
`getContentType()` to override that parameter for the current action. To do it you you must explicitly define this param 
as an expression i.e. `<param name="contentType">${contentType}</param>`

Please be aware that this was changed since Struts 2.5.2, previously each parameter was automatically resolved by looking 
throughout the `ValueStack`, now you must explicitly define which parameter must be evaluated, even `inputName`.
{:.alert .alert-success}

## Examples

### Annotation based Configuration

To configure Actions and Results with Annotations you need to activate the Struts2 [Convention Plugin](../plugins/convention/) 
in your Struts2 application.

```java
package com.mycompany.webapp.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

@Result(
	name = "success", 
	type = "stream", 
	params = { 
		"contentType", "${type}", 
		"inputName", "${stream}", 
		"bufferSize", "1024", 
		"contentDisposition", "attachment;filename=\"${filename}\"" 
	}
)
public class FileDisplay extends ActionSupport {

	private String type = "image/jpeg";
	private String filename;
	private InputStream stream;

	public String execute() throws Exception {

		filename = "myimage.jpg";
		File img = new File("/path/to/image/image.jpg");
		stream = new FileInputStream(img);

		return Action.SUCCESS;
	}
	
	private String getType() {
		return this.type;
	}
	
	private String getFilename() {
		return this.filename;
	}
	
	private InputStream getStream() {
		return this.stream;
	}
}
```

### XML based Configuration

```xml
<result name="success" type="stream">
  <param name="contentType">image/jpeg</param>
  <param name="inputName">${imageStream}</param>
  <param name="contentDisposition">attachment;filename="document.pdf"</param>
  <param name="bufferSize">1024</param>
</result>
```
