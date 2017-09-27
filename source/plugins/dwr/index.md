---
layout: plugin
title: DWR Plugin
---

# DWR Plugin

The DWR plugin provides integration with the Ajax framework [Direct Web Remoting](http://getahead.org/dwr)

This plugin works by allowing DWR to execute a Struts 2 action and return any validation errors.

This plugin is only available with Struts 2.1.1 or later.

## Features

+ Expose Struts 2 validations via DWR

## Usage

To expose Struts 2 validations via DWR, add this to your DWR configuration:

{% snippet id=dwrConfiguration|lang=xml|javadoc=true|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/dwr/src/main/java/org/apache/struts2/validators/DWRValidator.java;hb=HEAD %}

## Settings

This plugin doesn't support any global settings.

## Installation

To install, simply include the DWR Plugin in your `WEB-INF/lib` directory.  Ensure that DWR has been correctly installed and configured.
