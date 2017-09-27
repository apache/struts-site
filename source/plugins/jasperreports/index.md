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

{% snippet id=description|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  %}

{% snippet id=params|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  %}

### Examples

{% snippet id=example1|lang=xml|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  %}

or for pdf:

{% snippet id=example2|lang=xml|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java;hb=HEAD  %}

### Settings

This plugin doesn't provide any global settings.

### Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory.  No other files need to be copied or created.

---

> See also [Compiling JasperReports JRXML Files with Maven](http://www.vitarara.org/cms/node/131http://www.vitarara.org/cms/node/131) (Mark Menard)
