---
layout: default
title: JasperReports Plugin
parent:
    url: ../
    title: Plugins
---

# JasperReports Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description
[JasperReports](http://jasperforge.org/sf/projects/jasperreports) is a powerful open source Java (LGPL) reporting
tool that has the ability to deliver rich content onto the screen, to the printer or into PDF, HTML, XLS, CSV and XML files.

The JasperReports plugin enables Actions to create high-quality reports as results.

## Features

- Allows actions to be rendered through JasperReports

## Usage

To use this plugin, have your packages that contain the target actions extend the provided `jasperreports-default` 
package, which contains the `jasper` result type.  Then, simply use the result type in the desired actions.  
The result takes the following parameters:
 
 - location (default) - the location where the compiled jasper report definition is (foo.jasper), relative from current URL
 - dataSource - the EL expression used to retrieve the datasource from the value stack (usually a List). Since 7.4.0
   it is optional: when neither `dataSource` nor `connection` is set, the report is filled from its parameters alone
   (see [Filling from report parameters](#filling-from-report-parameters))
 - parse - `true` by default, if set to false, the location param will not be parsed for EL expressions
 - format - the format in which the report should be generated. Valid  values can be found in `JasperReportConstants`. 
   If no format is specified, PDF will be used
 - contentDisposition - disposition (defaults to "inline", values are typically `filename="document.pdf"`)
 - documentName - name of the document (will generate the http header `Content-disposition = X; filename=X.[format]`)
 - delimiter - the delimiter used when generating CSV reports. By default, the character used is ","
 - imageServletUrl - name of the url that, when prefixed with the context page, can return report images
 - reportParameters - (since 2.1.2+) OGNL expression used to retrieve a map of report parameters from the value stack. 
   The parameters may be accessed in the report via the usual JR mechanism and might include data not part of the 
   dataSource, such as the user name of the report creator, etc.
 - exportParameters - (since 2.1.2+) OGNL expression used to retrieve a map of JR exporter parameters from the value stack.
   The export parameters are used to customize the JR export. For example, a PDF export might enable encryption 
   and set the user password to a string known to the report creator.
 - connection - (since 2.1.7+) JDBC Connection which can be passed to the report instead of dataSource
 - wrapField - (since 2.3.18+) defines if fields should warp with ValueStackDataSource see
   [WW-3698](https://issues.apache.org/jira/browse/WW-3698) for more details
 
This result follows the same rules from {@link StrutsResultSupport}. Specifically, all parameters will be parsed 
if the "parse" parameter is not set to false.

### Examples

```xml
<result name="success" type="jasper">
    <param name="location">foo.jasper</param>
    <param name="dataSource">mySource</param>
    <param name="format">CSV</param>
</result>
```

or for pdf:

```xml
<result name="success" type="jasper">
    <param name="location">foo.jasper</param>
    <param name="dataSource">mySource</param>
</result>
```

### Filling from report parameters

Since 7.4.0, when neither `dataSource` nor `connection` is set the result calls
`JasperFillManager.fillReport(report, parameters)` and JasperReports resolves the data from the parameter map,
exactly as it does when used standalone. Hand the object the report's query executer expects over via
`reportParameters` - a Hibernate `Session` under `HIBERNATE_SESSION`, a `CSV_INPUT_STREAM`, a `JSON_INPUT_STREAM`,
or a ready `REPORT_DATA_SOURCE` / `REPORT_CONNECTION`. The report keeps its own `queryString` (HQL, CSV, JSON, ...)
and no intermediate `List` has to be built in the action.

```xml
<result name="success" type="jasper">
    <param name="location">foo.jasper</param>
    <param name="reportParameters">reportParameters</param>
</result>
```

```java
public Map<String, Object> getReportParameters() {
    return Map.of("HIBERNATE_SESSION", session);
}
```

Query executers other than JDBC, CSV and XPath ship as separate JasperReports artifacts (for example
`net.sf.jasperreports:jasperreports-hibernate`); add the one your report needs to the application's dependencies.
When the parameter map carries nothing the executer can use, the outcome is JasperReports' own - it is not checked
by the plugin.

### Settings

This plugin doesn't provide any global settings.

### Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory.  
No other files need to be copied or created.

> See also [Compiling JasperReports JRXML Files with Maven](http://www.vitarara.org/cms/node/131http://www.vitarara.org/cms/node/131) (Mark Menard)
