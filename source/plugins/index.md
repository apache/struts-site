---
layout: default
title: Plugins
---

# Plugin Developers Guide

Apache Struts 2 provides a simple [plugin architecture](plugins) so that developers can extend the framework just by
adding a JAR to the application's classpath. Since plugins are contained in a JAR, they are easy to share with others.
Several plugins are bundled with the framework, and others are available from third-party sources.

- [Plugins](plugins)
- [Extending an Application with Custom Plugins](extending-an-application-with-custom-plugins)

## Bundled Plugins

|Name| Versions | Note             |
|---|-------|------------------|
|[Bean Validation Plugin](bean-validation)| 2.5+  |
|[CDI (JSR 299) Plugin](cdi)| 2.3.1+ |
|[Codebehind Plugin](codebehind)| < 2.5 | removed since 2.5, use [Convention Plugin](convention) |
|[Config Browser Plugin](config-browser)|||
|[Convention Plugin](convention)| 2.1.3+ ||
|[DWR Plugin](dwr)|||
|[Embedded JSP Plugin](embedded-jsp)| 2.1.7+ | deprecated since 2.6 |
|[JasperReports Plugin](jasperreports)|||
|[Java 8 Support Plugin](java-8-support)| 2.3.21 - 2.5.2 ||
|[Javatemplates Plugin](javatemplates)| 2.1.3+ ||
|[JFreeChart Plugin](jfreechart)|||
|[JSF Plugin](jsf)| < 2.5 | removed since 2.5 |
|[JSON Plugin](json)| 2.1.7+ ||
|[JUnit Plugin](junit)|||
|[OVal Plugin](oval)| 2.1.7+ | deprecated since 2.6, use [Bean Validation Plugin](bean-validarion) |
|[OSGi Plugin](osgi)| 2.1.7+| deprecated since 2.6|
|[Plexus Plugin](plexus)|| deprecated since 2.6 |
|[Portlet Plugin](portlet)|| deprecated since 2.6 |
|[Portlet Tiles Plugin](portlet-tiles)| 2.3.5+ | deprecated since 2.6 |
|[REST Plugin](rest)| 2.1.1+ ||
|[SiteGraph Plugin](sitegraph)| < 2.5 | removed since 2.5|
|[SiteMesh Plugin](sitemesh)|||
|[Spring Plugin](spring)|||
|[Struts 1 Plugin](struts-1)| < 2.5 | removed since 2.5 |
|[TestNG Plugin](testng)|||
|[Tiles Plugin](tiles)|||
|[Tiles 3 Plugin](tiles-3)| < 2.5 | removed since 2.5 |

> For a complete list of bundled and third-party plugins, visit the [Plugin Registry](http://cwiki.apache.org/S2PLUGINS/Home).
