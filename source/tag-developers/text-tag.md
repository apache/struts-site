---
layout: default
title: Tag Developers Guide (WIP)
---

# text

Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



~~~~~~~
{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Text %}
~~~~~~~

For more details on using resource bundles with Struts 2 read the _localization guide_ .

__Parameters__



~~~~~~~
{% snippet id=tagattributes|javadoc=false|url=struts2-tags/text.html %}
~~~~~~~

__Examples__



~~~~~~~
{% snippet id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.Text %}
~~~~~~~


~~~~~~~
{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Text %}
~~~~~~~

Other example


~~~~~~~

<s:text name="format.money"><s:param name="value" value="myMoneyValue"/></s:text>

~~~~~~~

where the following is in a regular (possibly locale-specific) properties file:


~~~~~~~

format.money={0,number,currency}

~~~~~~~

For more about formatting text, see

1. [http://java.sun.com/j2se/1.4.2/docs/api/java/text/MessageFormat.html](http://java.sun.com/j2se/1.4.2/docs/api/java/text/MessageFormat.html)

2. [http://java.sun.com/docs/books/tutorial/i18n/format/decimalFormat.html](http://java.sun.com/docs/books/tutorial/i18n/format/decimalFormat.html)

__If you wish to use i18n in your tag attributes__

This will **not** work:


~~~~~~~

<s:textfield name="lastName" label="<s:text name="person.lastName"/>" ../>

~~~~~~~

Instead, you should use the getText() method that you inherit when your Action extends XWork's ActionSupport:


~~~~~~~

<s:textfield name="lastName" label="getText('person.lastName')" ../>

~~~~~~~
