---
layout: core-developers
title: ParentPackage Annotation
---

# ParentPackage Annotation

The 

~~~~~~~
@ParentPackage
~~~~~~~
 annotation allows the definition of 

~~~~~~~
Action
~~~~~~~
's package for an action found via [Zero Configuration](zero-configuration.html)\.

## Usage

This annotation is placed at the class level\.

## Parameters

| Name | Type | Required | Description |
|------|------|----------|-------------|
| value | String | true | Names the package the action will inherit\. |
