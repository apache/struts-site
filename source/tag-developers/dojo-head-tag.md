---
layout: default
title: Tag Developers Guide
---

# dojo head

> NOTE: Ajax template (Dojo plugin) is deprecated and won't be supported any longer.

__Description__


{% comment %}start snippet id=notice|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}
<p> The "head" tag renders required JavaScript code to configure Dojo and is required in order to use
 any of the tags included in the Dojo plugin.</p>
</p>
{% comment %}end snippet id=notice|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}
<p> <p></p>
 
 <p>To debug javascript errors set the "debug" attribute to true, which will display Dojo 
 (and Struts) warning and error messages at the bottom of the page. Core Dojo files are by default
 compressed, to improve loading time, which makes them very hard to read. To debug Dojo and Struts
 widgets, set the "compressed" attribute to true. Make sure to turn this option off before
 moving your project into production, as uncompressed files will take longer to download.
 </p>
 <p>For troubleshooting javascript problems the following configuration is recommended:</p>
 <pre>
   <sx:head debug="true" cache="false" compressed="false" />
 </pre>

 <p>Dojo files are loaded as required by the Dojo loading mechanism. The problem with this
 approach is that the files are not cached by the browser, so reloading a page or navigating
 to a different page that uses the same widgets will cause the files to be reloaded. To solve 
 this problem a custom Dojo profile is distributed with the Dojo plugin. This profile contains
 the files required by the tags in the Dojo plugin, all in one file (524Kb), which is cached 
 by the browser. This file will take longer to load by the browser but it will be downloaded 
 only once. By default the "cache" attribute is set to false.</p>
 
 <p>Some tags like the "datetimepicker" can use different locales, to use a locale
 that is different from the request locale, it must be specified on the "extraLocales" 
 attribute. This attribute can contain a comma separated list of locale names. From
 Dojo's documentation:</p>
 
 <p>
 The locale is a short string, defined by the host environment, which conforms to RFC 3066 
 (http://www.ietf.org/rfc/rfc3066.txt) used in the HTML specification. 
 It consists of short identifiers, typically two characters 
 long which are case-insensitive. Note that Dojo uses dash separators, not underscores like 
 Java (e.g. "en-us", not "en_US"). Typically country codes are used in the optional second 
 identifier, and additional variants may be specified. For example, Japanese is "ja"; 
 Japanese in Japan is "ja-jp". Notice that the lower case is intentional -- while Dojo 
 will often convert all locales to lowercase to normalize them, it is the lowercase that 
 must be used when defining your resources.
 </p>
 
 <p>The "locale" attribute configures Dojo's locale:</p>
 
 <p>"The locale Dojo uses on a page may be overridden by setting djConfig.locale. This may be 
 done to accomodate applications with a known user profile or server pages which do manual
 assembly and assume a certain locale. You may also set djConfig.extraLocale to load 
 localizations in addition to your own, in case you want to specify a particular 
 translation or have multiple languages appear on your page."</p>
 
 <p>To improve loading time, the property "parseContent" is set to false by default. This property will
 instruct Dojo to only build widgets using specific element ids. If the property is set to true
 Dojo will scan the whole document looking for widgets.</p>
 
 <p>Dojo 0.4.3 is distributed with the Dojo plugin, to use a different Dojo version, the 
 "baseRelativePath" attribute can be set to the URL of the Dojo root folder on your application.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}


> 

> 

> If you are planning to nest tags from the Dojo plugin, make sure you set parseContent="false", otherwise each request made by the inner tags will be performed twice.

> 

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/head.html {% endcomment %}
<p>		<table width="100%">

			<tr>

				<td colspan="6"><h4>Dynamic Attributes Allowed:</h4> false</td>

			</tr>

			<tr>

				<td colspan="6">&nbsp;</td>

			</tr>

			<tr>

				<th align="left" valign="top"><h4>Name</h4></th>

				<th align="left" valign="top"><h4>Required</h4></th>

				<th align="left" valign="top"><h4>Default</h4></th>

				<th align="left" valign="top"><h4>Evaluated</h4></th>

				<th align="left" valign="top"><h4>Type</h4></th>

				<th align="left" valign="top"><h4>Description</h4></th>

			</tr>

				<tr>

					<td align="left" valign="top">baseRelativePath</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">/struts/dojo</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Context relative path of Dojo distribution folder</td>

				</tr>

				<tr>

					<td align="left" valign="top">cache</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Use Struts Dojo profile, which contains all Struts widgets in one file, making it possible to be chached by the browser</td>

				</tr>

				<tr>

					<td align="left" valign="top">compressed</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Use compressed version of dojo.js</td>

				</tr>

				<tr>

					<td align="left" valign="top">debug</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Enable Dojo debug messages</td>

				</tr>

				<tr>

					<td align="left" valign="top">extraLocales</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma separated list of locale names to be loaded by Dojo, locale names must be specified as in RFC3066</td>

				</tr>

				<tr>

					<td align="left" valign="top">locale</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Default locale to be used by Dojo, locale name must be specified as in RFC3066</td>

				</tr>

				<tr>

					<td align="left" valign="top">parseContent</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Parse the whole document for widgets</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/head.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}

```xml
 <%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
 <head>
   <title>My page</title>
   <sx:head/>
 </head>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}


{% comment %}start snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}

```xml
 <%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
 <head>
   <title>My page</title>
   <sx:head debug="true" extraLocales="en-us,nl-nl,de-de"/>
 </head>

```

{% comment %}end snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}
