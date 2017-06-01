---
layout: core-developers
title: XSL Result
---

# XSL Result


####Description####

XSLTResult uses XSLT to transform an action object to XML\. The recent version has been specifically modified to deal with Xalan flaws\. When using Xalan you may notice that even though you have a very minimal stylesheet like this one


~~~~~~~
<xsl:template match="/result">
<result/>
</xsl:template>
~~~~~~~

Xalan would still iterate through every property of your action and all its descendants\.

If you had double\-linked objects, Xalan would work forever analysing an infinite object tree\. Even if your stylesheet was not constructed to process them all\. It's because the current Xalan eagerly and extensively converts
everything to its internal DTM model before further processing\.

That's why there's a loop eliminator added that works by indexing every object\-property combination during processing\. If it notices that some object's property was already walked through, it doesn't go any deeper\. Say you have two objects, x and y, with the following properties set (pseudocode):


~~~~~~~
x.y = y;
and
y.x = x;
action.x=x;
~~~~~~~

Due to that modification, the resulting XML document based on x would be:


~~~~~~~
<result>
<x>
<y/>
</x>
</result>
~~~~~~~

Without it there would be endless 

~~~~~~~
x/y/x/y/x/y/...
~~~~~~~
 elements\.

The 

~~~~~~~
XSLTResult
~~~~~~~
 code tries also to deal with the fact that DTM model is built in a manner that children are processed before siblings\. The result is that if there is object x that is both set in action's x property, and very deeply under action's a property then it would only appear under a, not under x\. That's not what we expect, and that's why 

~~~~~~~
XSLTResult
~~~~~~~
 allows objects to repeat in various places to some extent\.

Sometimes the object mesh is still very dense and you may notice that even though you have a relatively simple stylesheet, execution takes a tremendous amount of time\. To help you to deal with that obstacle of Xalan, you may attach regexp filters to elements paths (xpath)\.



| In your \.xsl file the root match must be named **result**\. This example will output the username by using **getUsername** on your action class:

| \<xsl:template match="result"\>
 \<html\>
 \<body\>
   Hello \<xsl:value\-of select="username"/\> how are you?
 \</body\>
 \</html\>
 \</xsl:template\>

In the following example the XSLT result would only walk through action's properties without their childs\. It would also skip every property that has 

~~~~~~~
hugeCollection
~~~~~~~
 in their name\. Element's path is first compared to 

~~~~~~~
excludingPattern
~~~~~~~
 \- if it matches it's no longer processed\. Then it is compared to 

~~~~~~~
matchingPattern
~~~~~~~
 and processed only if there's a match\.


~~~~~~~
<result name="success" type="xslt">
  <param name="stylesheetLocation">foo.xslt</param>
  <param name="matchingPattern">^/result/[^/*]$</param>
  <param name="excludingPattern">.*(hugeCollection).*</param>
</result>
~~~~~~~

In the following example the XSLT result would use the action's user property instead of the action as it's base document and walk through it's properties\. The 

~~~~~~~
exposedValue
~~~~~~~
 uses an OGNL expression to derive it's value\.


~~~~~~~
<result name="success" type="xslt">
  <param name="stylesheetLocation">foo.xslt</param>
  <param name="exposedValue">${user}</param>
</result>
~~~~~~~

####Parameters####

This result type takes the following parameters:

+ **stylesheetLocation** (default) \- the location to go to after execution\.

+ **location** (deprecated) \- the same as **stylesheetLocation** but it was dropped since Struts 2\.5\.

+ **encoding **\- character encoding used in XML, default UTF\-8\.

+ **parse** \- 

~~~~~~~
true
~~~~~~~
 by default\. If set to false, the location param will not be parsed for Ognl expressions\.

+ **matchingPattern **\- 

~~~~~~~
Pattern
~~~~~~~
 that matches only desired elements, by default it matches everything\.

+ **excludingPattern** \- 

~~~~~~~
Pattern
~~~~~~~
 that eliminates unwanted elements, by default it matches none\.



~~~~~~~
struts.properties
~~~~~~~
 related configuration:

+ **struts\.xslt\.nocache** \- Defaults to false\. If set to true, disables stylesheet caching\. Good for development, bad for production\.

####Examples####



~~~~~~~
<result name="success" type="xslt">foo.xslt</result>
~~~~~~~

 