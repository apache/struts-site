---
layout: plugin
title: JasperReports Plugin
---

# JasperReports Plugin

[JasperReports](http://jasperforge.org/sf/projects/jasperreports) is a powerful open source Java (LGPL) reporting tool that has the ability to deliver rich content onto the screen, to the printer or into PDF, HTML, XLS, CSV and XML files.

The JasperReports plugin enables Actions to create high-quality reports as results.

## Features

+ Allows Actions to be rendered through JasperReports

## Usage

To use this plugin, have your packages that contain the target actions extend the provided `jasperreports-default` package, which contains the `jasper` result type.  Then, simply use the result type in the desired actions.  The result takes the following parameters:

{% comment %}start snippet id=description|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  {% endcomment %}
<p> <p>
 Generates a JasperReports report using the specified format or PDF if no
 format is specified.
 </p></p>
{% comment %}end snippet id=description|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  {% endcomment %}

{% comment %}start snippet id=params|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  {% endcomment %}
<p>
 <ul>

 <li><b>location (default)</b> - the location where the compiled jasper report
 definition is (foo.jasper), relative from current URL.</li>
 <li><b>dataSource (required)</b> - the EL expression used to retrieve the
 datasource from the value stack (usually a List).</li>
 <li><b>parse</b> - true by default. If set to false, the location param will
 not be parsed for EL expressions.</li>
 <li><b>format</b> - the format in which the report should be generated. Valid
 values can be found in {@link JasperReportConstants}. If no format is
 specified, PDF will be used.</li>
 <li><b>contentDisposition</b> - disposition (defaults to "inline", values are
 typically <i>filename="document.pdf"</i>).</li>
 <li><b>documentName</b> - name of the document (will generate the http header
 <code>Content-disposition = X; filename=X.[format]</code>).</li>
 <li><b>delimiter</b> - the delimiter used when generating CSV reports. By
 default, the character used is ",".</li>
 <li><b>imageServletUrl</b> - name of the url that, when prefixed with the
 context page, can return report images.</li>
 <li>
 <b>reportParameters</b> - (2.1.2+) OGNL expression used to retrieve a map of
 report parameters from the value stack. The parameters may be accessed
 in the report via the usual JR mechanism and might include data not
 part of the dataSource, such as the user name of the report creator, etc.
 </li>
 <li>
 <b>exportParameters</b> - (2.1.2+) OGNL expression used to retrieve a map of
 JR exporter parameters from the value stack. The export parameters are
 used to customize the JR export. For example, a PDF export might enable
 encryption and set the user password to a string known to the report creator.
 </li>
 <li>
 <b>connection</b> - (2.1.7+) JDBC Connection which can be passed to the
 report instead of dataSource
 </li>
 <li><b>wrapField</b> - (2.3.18+) defines if fields should warp with ValueStackDataSource
 see https://issues.apache.org/jira/browse/WW-3698 for more details
 </li>
 </ul>
 <p>
 This result follows the same rules from {@link StrutsResultSupport}.
 Specifically, all parameters will be parsed if the "parse" parameter
 is not set to false.
 </p></p>
{% comment %}end snippet id=params|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  {% endcomment %}

### Examples

{% comment %}start snippet id=example1|lang=xml|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  {% endcomment %}

```xml
 <result name="success" type="jasper">
   <param name="location">foo.jasper</param>
   <param name="dataSource">mySource</param>
   <param name="format">CSV</param>
 </result>
```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  {% endcomment %}

or for pdf:

{% comment %}start snippet id=example2|lang=xml|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  {% endcomment %}

```xml
 <result name="success" type="jasper">
   <param name="location">foo.jasper</param>
   <param name="dataSource">mySource</param>
 </result>
```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  {% endcomment %}

### Settings

This plugin doesn't provide any global settings.

### Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory.  No other files need to be copied or created.

---

> See also [Compiling JasperReports JRXML Files with Maven](http://www.vitarara.org/cms/node/131http://www.vitarara.org/cms/node/131) (Mark Menard)
