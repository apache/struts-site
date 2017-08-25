---
layout: core-developers
title: Formatting Dates and Numbers
---

# Formatting Dates and Numbers

## Defining Formats

Struts2 supports localization (l10n) aware formatting of dates, times and numbers very easily, utilizing Java's 
built-in date formatting features.

As seen in the [Localization](localization.html) chapter, it is quite easy to define hierarchical resource bundles 
with Struts2, giving the developer the opportunity to define locale dependent message formats. This is the entry point 
to define the needed date, time and number formats. Your default properties could contain the following generic formats:

```
format.time = {0,time}
format.number = {0,number,#0.0##}
format.percent = {0,number,##0.00'%'}
format.money = {0,number,\u00A4##0.00}
```

An appropriate en_US format definition extension could look like this:

```
format.date = {0,date,MM/dd/yy}
```

In parallel, you could add the following to your de_DE bundle:

```
format.date = {0,date,dd.MM.yyyy}
```

Read more on how to define message formats in Sun's Java API docs for [MessageFormat](http://java.sun.com/j2se/1.5.0/docs/api/java/text/MessageFormat.html).

Now that we have our formats set up, it is quite easy to use them in our views.

## Formatting output using the s:text tag

Given you had a Float value myMoneyValue, accessible through the getter getMyMoneyValue in your action, the following 
code would print out localized representation of the value as a currency amount, using the format.money message 
format defined above with a `s:text` tag:

```jsp
<s:text name="format.money">
    <s:param name="value" value="myMoneyValue"/>
</s:text>
```

The (first) parameter defines the value which is to replace the '0' placeholder in the defined message format.

Another example, formatting a date value:

```jsp
<s:text name="format.date"><s:param value="dueDate"/></s:text>
```

> While the `s:text` tag is very useful to format numbers, date formatting has become a lot easier thanks 
> to the `s:date` tag.

## Localizing form data with getText

Placing a textfield in a form like this

```jsp
<s:textfield key="orderItem.price" />
```

to input a number, one might have noticed that the number is always shown in the Java default number format. Not only
that this is not "nice", if you are in a non-en locale, it will also cause trouble when submitting the form since type 
conversion is locale aware. The solution is to again use the message formats as defined above, by using the getText 
method of ActionSupport:

```jsp
<s:textfield key="orderItem.price" value="%{getText('format.number',{orderItem.price})}" />
```

This maps to the method signature `getText( String key, Object[] params )` in ActionSupport.

## Using getFormatted() with conversion support

A new method getFormatted was added to ActionSupport (which can be implemented in your base action) to support 
formatting and conversion errors with I10N.

You can place a code like below

```jsp
<s:textfield key="user.born" value="%{getFormatted('format.number','user.born')}" />
```

to get support for I10N and also to support conversion errors.
