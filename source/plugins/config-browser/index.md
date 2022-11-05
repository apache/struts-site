---
layout: plugin
title: Config Browser Plugin
parent:
    url: index.html
    title: Plugins
---

# Config Browser Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

The Config Browser Plugin is a simple tool to help view an application's configuration at runtime.

This plugin should be used only during development phase and access to it should be strictly restricted!

## Features

- Browsable view of loaded configuration
- Shows all accessible action URLs

## Usage

To use the plugin, simply copy the jar into your application.  Once installed, you can access the tool by opening 
to the action named _index_  in the _config-browser_  namespace.

> In most cases (if you are using the default _ActionMapper_ ), the URL is something like http://localhost:8080/starter/config-browser/index.action or http://localhost:8080/starter/config-browser/index.

## Example

![config-browser-example.png](../attachments/att30966155_config-browser-example.png)

## Settings

This plugin provides no customizable settings.

## Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory.  No other files need to be copied or created.
