---
layout: plugin
title: DWR Plugin
parent:
    url: index.html
    title: Plugins
---

# DWR Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

The DWR plugin provides integration with the Ajax framework [Direct Web Remoting](http://getahead.org/dwr)
This plugin works by allowing DWR to execute a Struts 2 action and return any validation errors.
This plugin is only available with Struts 2.1.1 or later.

## Features

- Expose Struts 2 validations via DWR

## Usage

To expose Struts 2 validations via DWR, add this to your DWR configuration:

```xml
 <dwr>
    <allow>
      <create creator="new" javascript="validator" class="org.apache.struts2.validators.DWRValidator"/>
      <convert converter="bean" match="com.opensymphony.xwork2.ValidationAwareSupport"/>
    </allow>
 </dwr>


```

## Settings

This plugin doesn't support any global settings.

## Installation

To install, simply include the DWR Plugin in your `WEB-INF/lib` directory.  Ensure that DWR has been correctly installed and configured.
