---
layout: default
title: OGNL
parent:
  title: Tag Developers Guide
  url: index
---

# OGNL
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

OGNL is the Object Graph Navigation Language (see [OGNL page](https://ognl.orphan.software/) for the full 
documentation of OGNL). Here, we will cover a few examples of OGNL features that co-exist with the framework. To review 
basic concepts, refer to [OGNL Basics](ognl-basics).

The framework uses a standard naming context to evaluate OGNL expressions. The top level object dealing with OGNL is 
a Map (usually referred as a context map or context). OGNL has a notion of there being a root (or default) object within 
the context. In expression, the properties of the root object can be referenced without any special "marker" notion. 
References to other objects are marked with a pound sign (`#`).

## Context

The framework sets the OGNL context to be our `ActionContext`, and the `ValueStack` to be the OGNL root object. 
(The `ValueStack` is a set of several objects, but to OGNL it appears to be a single object). Along with the value stack, 
the framework places other objects in the `ActionContext`, including maps representing the application, session, 
and request contexts. These objects coexist in the `ActionContext`, alongside the value stack (our OGNL root).

```
context map---|
              |--application
              |
              |--session
              |
              |--value stack(root)
              |
              |--action (the current action)
              |
              |--request
              |
              |--parameters
              |
              |--attr (searches page, request, session, then application scopes)
              |
```

## Referencing an Action property

The Action instance is always pushed onto the value stack. Because the Action is on the stack, and the stack is
the OGNL root, references to Action properties can omit the `#` marker. But, to access other objects in the ActionContext,
we must use the `#` notation so OGNL knows not to look in the root object, but for some other object in the ActionContext.

```jsp
<s:property value="postalCode"/>
```

Other (non-root) objects in the ActionContext can be rendered use the `#` notation.

```jsp
<s:property value="#session.mySessionPropKey"/> or
<s:property value="#session['mySessionPropKey']"/> or
<s:property value="#request['myRequestPropKey']"/>
```

You can also put expression for attributes that don't support dynamic content, like below:

```jsp
<c:set var="foo" value="bar" scope="request"/>
<s:textfield name="username" label="%{#request.foo}" />
```

## Collections (Maps, Lists, Sets)

Dealing with Collections (Maps, Lists, and Sets) in the framework comes often, so below please there are a few examples 
using tags. The [OGNL documentation](https://github.com/orphan-oss/ognl/blob/master/docs/LanguageGuide.md#collection-construction)
also includes some examples.

Syntax for a list: `{e1, e2, e3}`. This idiom creates a List containing the String "name1", "name2" and "name3". It also 
selects "name2" as the default value:

```jsp
<s:select label="label" name="name" list="{'name1','name2','name3'}" value="%{'name2'}" />
```

Syntax for a map: `#{key1:value1, key2:value2}`. This idiom creates a map that maps the string "foo" to the string 
"foovalue" and "bar" to the string "barvalue":

```jsp
<s:select label="label" name="name" list="#{'foo':'foovalue', 'bar':'barvalue'}" />
```

To determine if an element exists in a Collection, use the operations `in` and `not in`.

```jsp
<s:if test="'foo' in {'foo','bar'}">
   muhahaha
</s:if>
<s:else>
   boo
</s:else>

<s:if test="'foo' not in {'foo','bar'}">
   muhahaha
</s:if>
<s:else>
   boo
</s:else>
```

To select a subset of a collection, use a wildcard within the collection.

- `?` - All elements matching the selection logic
- `^` - Only the first element matching the selection logic
- `$` - Only the last element matching the selection logic

To obtain a subset of just male relatives from the object person:

```jsp
<s:iterator value="person.relatives.{? #this.gender == 'male'}">
  ...
</s:iterator>
```

You can also use projection to extract just a given property out of a bean:

```jsp
<s:iterator value="persons.{firstName}">
  <s:property/>
</s:iterator>
```

it's the same as using more expressive version:

```jsp
<s:iterator value="persons" var="person">
  <s:property value="person.firstName"/>
</s:iterator>
```

More details can can be found in OGNL documentation about [projection](https://ognl.orphan.software/language-guide#projecting-across-collections).
