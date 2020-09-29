---
layout: default
title: Precise Error Reporting
parent:
  title: Contributors Guide
  url: index.html
---

# Precise Error Reporting
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

With the multiple levels of configuration, constant overrides, and bean selection, it can be confusing as to how 
the framework is configured and how it got there. To assist debugging and provide the ability to continue to provide 
more line-precise error reporting, the configuration loader remembers the location of not only XML elements, 
but also Java Properties file properties.

How it works is instead of storing configuration properties in a plain `java.util.Properties` object, we have a special 
`LocatableProperties` class. This class leverages the location classes to store location information for the whole 
properties file but also individual properties.  We use this to gather configuration properties during configuration loading. 
This will allow us to display at any given point the location of each property setting. This capability should be very 
useful when trying to determine what XML or Properties file overwrote what and when.

Interestingly, in addition to remembering the URI and line number of Properties properties, the parser we "borrowed" 
from Commons Configuration even gathers preceding comments, which are also stored in the Location object. This means 
we can leverage the Properties comment-based documentation that we have in the o.a.s.default.properties file
or the user's struts.properties file to further provide useful information in error reports.

There are some very interesting possibilities here to increase the transparency of the framework in error and debugging conditions.
