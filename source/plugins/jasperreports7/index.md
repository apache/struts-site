---
layout: default
title: JasperReports 7 Plugin
parent:
    url: ../
    title: Plugins
---

# JasperReports 7 Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description
[JasperReports](https://community.jaspersoft.com/project/jasperreports-library) is a powerful open source Java (LGPL)
reporting tool that has the ability to deliver rich content onto the screen, to the printer or into PDF, HTML, XLSX,
CSV, RTF and XML files.

The JasperReports 7 plugin (`struts2-jasperreports7-plugin`, since Struts 7.1.0) enables Actions to create high-quality
reports as results using the JasperReports 7.x line. Applications still on JasperReports 6.x should use the
[JasperReports Plugin](../jasperreports) instead; the two plugins are independent and are not meant to be used
together.

## Features

- Allows actions to be rendered through JasperReports 7.x
- Exporters are pluggable: each output format is a `JasperReport7ExporterProvider` bean that can be replaced or extended

## Usage

To use this plugin, have your packages that contain the target actions extend the provided `jasperreports7-default`
package, which contains the `jasperReport7` result type. Then, simply use the result type in the desired actions.
The result takes the following parameters:

 - location (default) - the location where the compiled jasper report definition is (foo.jasper), relative from current URL
 - dataSource - the EL expression used to retrieve the datasource from the value stack (usually a List). Since 7.4.0
   it is optional: when neither `dataSource` nor `connection` is set, the report is filled from its parameters alone
   (see [Filling from report parameters](#filling-from-report-parameters))
 - parse - `true` by default, if set to false, the location param will not be parsed for EL expressions
 - format - the format in which the report should be generated. Valid values are the lower-case constants from
   `JasperReport7Constants`: `pdf`, `xml`, `html`, `xlsx`, `csv` and `rtf`. The value selects the exporter bean by
   name, so it is case-sensitive. If no format is specified, `pdf` will be used
 - contentDisposition - disposition (defaults to "inline", values are typically `filename="document.pdf"`)
 - documentName - name of the document (will generate the http header `Content-disposition = X; filename=X.[format]`)
 - reportParameters - OGNL expression used to retrieve a map of report parameters from the value stack.
   The parameters may be accessed in the report via the usual JR mechanism and might include data not part of the
   dataSource, such as the user name of the report creator, etc.
 - connection - JDBC Connection which can be passed to the report instead of dataSource
 - wrapField - defines if fields should wrap with ValueStackDataSource see
   [WW-3698](https://issues.apache.org/jira/browse/WW-3698) for more details
 - timeZone - ID of the time zone passed to the report as `REPORT_TIME_ZONE`, e.g. `Europe/Warsaw`

This result follows the same rules from `StrutsResultSupport`. Specifically, all parameters will be parsed
if the "parse" parameter is not set to false.

### Examples

```xml
<result name="success" type="jasperReport7">
    <param name="location">foo.jasper</param>
    <param name="dataSource">mySource</param>
    <param name="format">csv</param>
</result>
```

or for pdf:

```xml
<result name="success" type="jasperReport7">
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
<result name="success" type="jasperReport7">
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

### Hooking into report generation

An action can implement `JasperReport7Aware` to take part in the report lifecycle. All methods have default
implementations, so override only what you need:

 - `beforeReportGeneration(ActionInvocation)` - called before the report is filled
 - `afterReportGeneration(ActionInvocation, JasperReport)` - called with the loaded report after it has been filled,
   before it is exported
 - `getCsvDelimiter(ActionInvocation)` - per-action CSV delimiter; return `null` to fall back to the global one
   (see [Settings](#settings))
 - `getReportLocale(ActionInvocation)` - locale passed to the report as `REPORT_LOCALE`; defaults to the locale
   of the current invocation

```java
public class SalesReportAction extends ActionSupport implements JasperReport7Aware {

    @Override
    public String getCsvDelimiter(ActionInvocation invocation) {
        return ";";
    }

    @Override
    public Locale getReportLocale(ActionInvocation invocation) {
        return Locale.GERMANY;
    }
}
```

### Custom exporters

Each format is served by a `JasperReport7ExporterProvider` bean registered under the format name (`pdf`, `csv`,
`html`, `xlsx`, `xml`, `rtf`). To add a format the plugin does not ship, implement the interface and register the
bean under a new name in `struts.xml`; that name is then a valid `format` value. Bean names must be unique, so a
bundled exporter cannot be replaced this way - register it under a different name, or override
`JasperReport7Result.exportReport` in a subclass.

```java
public class DocxExporterProvider implements JasperReport7ExporterProvider<JRDocxExporter> {

    @Override
    public JRDocxExporter createExporter(ActionInvocation invocation, JasperPrint jasperPrint) throws StrutsException {
        HttpServletResponse response = invocation.getInvocationContext().getServletResponse();
        response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");

        JRDocxExporter exporter = new JRDocxExporter();
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        try {
            exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(response.getOutputStream()));
        } catch (IOException e) {
            throw new StrutsException(e);
        }
        return exporter;
    }
}
```

```xml
<bean name="docx"
      class="com.example.DocxExporterProvider"
      type="org.apache.struts2.views.jasperreports7.export.JasperReport7ExporterProvider"/>
```

```xml
<result name="success" type="jasperReport7">
    <param name="location">foo.jasper</param>
    <param name="dataSource">mySource</param>
    <param name="format">docx</param>
</result>
```

The provider is responsible for setting the response content type and wiring the exporter output to the response
stream; the result calls `exportReport()` and flushes the response. The format name is also used as the file
extension when `documentName` is set.

### Settings

| Constant                                         | Default    | Description                                                             |
|--------------------------------------------------|------------|-------------------------------------------------------------------------|
| `struts.jasperReport7.csv.defaultDelimiter`      | `,`        | field delimiter used by the CSV exporter                                |
| `struts.jasperReport7.html.imageServletUrl`      | `/images/` | URL that, when prefixed with the context path, returns report images    |

```xml
<constant name="struts.jasperReport7.csv.defaultDelimiter" value=";"/>
<constant name="struts.jasperReport7.html.imageServletUrl" value="/report-images/"/>
```

### Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory. The plugin
brings the JasperReports 7 core library with it, but the PDF exporter lives in a separate JasperReports artifact
which is an optional dependency of the plugin. As `pdf` is the default format, most applications need to add it:

```xml
<dependencies>
   ...
   <dependency>
       <groupId>org.apache.struts</groupId>
       <artifactId>struts2-jasperreports7-plugin</artifactId>
       <version>STRUTS_VERSION</version>
   </dependency>
   <dependency>
       <groupId>net.sf.jasperreports</groupId>
       <artifactId>jasperreports-pdf</artifactId>
       <version>JASPERREPORTS_VERSION</version>
   </dependency>
   ...
</dependencies>
```

Use the same `JASPERREPORTS_VERSION` as the `jasperreports` artifact pulled in by the plugin.

## Migrating from the JasperReports plugin

The result parameters shared with the [JasperReports Plugin](../jasperreports) behave the same way. What changed:

 - the package is `jasperreports7-default` and the result type is `jasperReport7`
 - `format` values are lower-case (`pdf` instead of `PDF`); `xls` is gone, use `xlsx`
 - the `delimiter` and `imageServletUrl` result parameters are gone; use the constants from [Settings](#settings)
   or `JasperReport7Aware.getCsvDelimiter` instead
 - the `exportParameters` result parameter is gone; exporter configuration is done in code by a
   [custom exporter](#custom-exporters)
 - `JasperReport7Aware` is new; there is no equivalent hook in the 6.x plugin
 - the PDF exporter is no longer bundled, add `jasperreports-pdf` (see [Installation](#installation))
