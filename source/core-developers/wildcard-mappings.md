---
layout: core-developers
title: Wildcard Mappings
---

# Wildcard Mappings
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Wildcards

As an application grows in size, so will the number of action mappings. Wildcards can be used to combine similar 
mappings into one more generic mapping.

The best way to explain wildcards is to show an example and walk through how it works. This example modifies 
a conventional mapping to use wildcards to match all pages that start with `/edit`:

```xml
<action name="/edit*" class="org.apache.struts.webapp.example.Edit{1}Action">
    <result name="failure">/mainMenu.jsp</result>
    <result>{1}.jsp</result>
</action>
```

The "*" in the name attribute allows the mapping to match the request URIs `/editSubscription`, `editRegistration`, 
or any other URI that starts with `/edit`, however `/editSubscription/add` would not be matched. The part of the URI 
matched by the wildcard will then be substituted into various attributes of the action mapping and its action results 
replacing `{1}`. For the rest of the request, the framework will see the action mapping and its action results containing 
the new values.

Mappings are matched against the request in the order they appear in the framework's configuration file. If more than 
one pattern matches **the last one wins**, so less specific patterns must appear before more specific ones. However, 
if the request URL can be matched against a path without any wildcards in it, no wildcard matching is performed 
and order is not important. Also, note that wildcards are not greedy, meaning they only match until the first 
occurrence of the following string pattern.  For example, consider the following mapping:

```xml
<action name="List*s" class="actions.List{1}s">
  <result>list{1}s.jsp</result>
</action>
```

This mapping would work correctly for the URI `ListAccounts` but not `ListSponsors`, because the latter would turn into 
this configuration:

```xml
<action name="ListSpons" class="actions.ListSpons">
  <result>listSpons.jsp</result>
</action>
```

Wildcard patterns can contain one or more of the following special tokens:

|*|Matches zero or more characters excluding the slash ('/') character.|
|-|--------------------------------------------------------------------|
|**|Matches zero or more characters including the slash ('/') character.|
|\\character|The backslash character is used as an escape sequence. Thus `\\*` matches the character asterisk ("*"), and `'\\'` matches the character backslash ("\\").|

Patterns can optionally be matched "loosely". When the end of the pattern matches `*[^*]*$` (wildcard, no wildcard, 
wildcard), if the pattern fails, it is also matched as if the last two characters didn't exist. The goal is to support 
the legacy `*!*` syntax, where the `!*` is optional.

In the action mapping and action results, the wildcard-matched values can be accessed with the token `{N}` where N is 
a number from 1 to 9 indicating which wildcard-matched value to substitute. The whole request URI can be accessed with 
the `{0}` token.

Also, the action mapping and action result properties will accept wildcard-matched strings in their value attribute, like:

```xml
<action name="/edit/*" class="org.apache.struts.webapp.example.Edit{1}Action">
    <param name="id">{1}</param>
    <result>
      <param name="location">/mainMenu.jsp</param>
      <param name="id">{1}</param> 
    </result>
</action>
```

> See also [Wildcard Method](../getting-started/wildcard-method-selection.html)

## Parameters in namespaces

From Struts 2.1+ namespace patterns can be extracted as request parameters and bound to the action. To enable this 
feature, set the following constant in struts.xml:

```xml
<constant name="struts.patternMatcher" value="namedVariable"/>
```

With that in place, namespace definitions can contain {PARAM_NAME} patterns which will be evaluated against the request 
URL and extracted as parameters, for example:

```java
@Namespace{"/users/{userID}");
public class DetailsAction exends ActionSupport {
  private Long userID;
  public void setUserID(Long userID) {...}
}
```

If the request URL is `/users/10/detail`, then the `DetailsAction` will be executed and its userID field will be set 
to _10_. 

> Only one `PatternMatcher` implementation can be used at a time.  The two implementations included with Struts 2 are 
> mutually exclusive.  You cannot use Wildcards and Named Variable patterns at the same application (if that were required, 
> you'd need to create a custom PatternMatcher implementation).

> Some tags tags not are 100% compatible with variables in the namespace. For instance, they may write the literal 
> namespace into the HTML (eg.: `/{user}/2w`) instead of the path used in the request (ie. `/brett/24`).  This usually 
> affects attributes that attempt to guess the namespace of an action (eg. Form tag, Action tag, action=). This problem 
> can be avoided by using HTML tags directly with relative paths or explicit URLs.

Similar functionality can also be implemented using a custom `ActionMapper`. The `ActionMapper` will need to parse 
the namespace and request itself to set parameters on the matched action.  The default `ActonMapper` is responsible 
for invoking the `PatternMatcher`.

## Parameters after the action name

To use parameters in the URL, after the action name, make sure this is set:

```xml
<constant name="struts.enable.SlashesInActionNames" value="true"/>
<constant name="struts.mapper.alwaysSelectFullNamespace" value="false"/>
```

Then the action mapping will look like:

```xml
<package name="edit" extends="struts-default" namespace="/edit">
    <action name="/person/*" class="org.apache.struts.webapp.example.EditAction">
        <param name="id">{1}</param>
        <result>/mainMenu.jsp</result>
    </action>   
</package>
```

When a URL like `/edit/person/123` is requested, `EditAction` will be called, and its "id" field will be set to 123. 

## Advanced Wildcards

From 2.1.9+ regular expressions can be defined defined in the action name. To use this form of wild card, the following 
constants must be set:

```xml
<constant name="struts.enable.SlashesInActionNames" value="true"/>
<constant name="struts.mapper.alwaysSelectFullNamespace" value="false"/>
<constant name="struts.patternMatcher" value="regex" />

<constant name="struts.matcher.appendNamedParameters" value="true"/>   <!-- Required from 2.5.25+ -->
```

The regular expressions can be in two forms, the simplest one is `{FIELD_NAME}`, in which case the field with 
the `FIELD_NAME` in the action will be populated with the matched text, for example:

```xml
<package name="books" extends="struts-default" namespace="/">
    <action name="/{type}/content/{title}" class="example.BookAction">
	<result>/books/content.jsp</result>
    </action>
</package>
```

In this example, if the url `/fiction/content/Frankenstein` is requested, BookAction's field "type" will be set to 
"fiction", and the field "title" will be set to "Frankenstein". 

The regular expression can also be in the form `{FIELD_NAME:REGULAR_EXPRESSION}`. The regular expression is a normal 
Java regular expression. For example:

```xml
<package name="books" extends="struts-default" namespace="/">
    <action name="/{type}/{author:.+}/list" class="example.ListBooksAction">
	<result>/books/list.jsp</result>
    </action>
</package>
```

In this example, if the url `/philosophy/AynRand/list` is requested, ListBooksAction's field "type" will be set to 
"philosophy" and "author" to "AynRand". 

The matched groups can still be accessed using the `{X}` notation, like:

```xml
<package name="books" extends="struts-default" namespace="/">
    <action name="/books/{ISBN}/content" class="example.BookAction">
	<result>/books/{1}.jsp</result>
    </action>
</package>
```
