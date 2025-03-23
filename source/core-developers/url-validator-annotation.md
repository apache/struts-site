---
layout: default
title: UrlValidator Annotation
parent:
    title: Annotations
    url: annotations.html
---

# UrlValidator Annotation

This validator checks that a field is a valid URL.

## Usage

  The annotation must be applied at method level.

## Parameters

| Parameter|Required|Default|Notes|
|----------|--------|-------|-----|
|message|yes| |field error message|
|key|no| |i18n key from language specific properties file|
|messageParams|no| |additional params to be used to customize message - will be evaluated against the Value Stack|
|fieldName|no| |field name under validation|
|shortCircuit|no|false|if this validator should be used as shortCircuit|
|urlRegex|no| |defines regex to use to validate url|
|urlRegexExpression|no| |defines regex as expression to validate url, expression will be evaluated against current stack to get proper regex|
|type|yes|ValidatorType.FIELD|Enum value from ValidatorType. Either FIELD or SIMPLE can be used here|

## Examples

### UrlValidator usage example

```java
@UrlValidator(message = "Default message", key = "i18n.key", shortCircuit = true)
```

### UrlValidator usage example

```java
@UrlValidator(message = "Default message", key = "i18n.key", urlRegexExpression = "${urlRegex}")
```

If no `urlRegex` neither `urlRegexExpression` is defined, default regex will be used instead, 
based on [StackOverflow answer](http://stackoverflow.com/questions/161738/what-is-the-best-regular-expression-to-check-if-a-string-is-a-valid-url)

### Default URL regex

```java
return "^(https?|ftp):\/\/" +
       "(([a-z0-9$_\.\\+!\\*\\'\\(\\),;\\?&=-]|%[0-9a-f]{2})+" +
       "(:([a-z0-9$_\.\\+!\\*\\'\\(\\),;\\?&=-]|%[0-9a-f]{2})+)?" +
       "@)?(#?" +
       ")((([a-z0-9]\.|[a-z0-9][a-z0-9-]*[a-z0-9]\.)*" +
       "[a-z][a-z0-9-]*[a-z0-9]" +
       "|((\\d|[1-9]\\d|1\\d{2}|2[0-4][0-9]|25[0-5])\.){3}" +
       "(\\d|[1-9]\\d|1\\d{2}|2[0-4][0-9]|25[0-5])" +
       ")(:\\d+)?" +
       ")(((\\/+([a-z0-9$_\.\\+!\\*\\'\\(\\),;:@&=-]|%[0-9a-f]{2})*)*" +
       "(\\?([a-z0-9$_\.\\+!\\*\\'\\(\\),;:@&=-]|%[0-9a-f]{2})*)" +
       "?)?)?" +
       "(#([a-z0-9$_\.\\+!\\*\\'\\(\\),;:@&=-]|%[0-9a-f]{2})*)?" +
       "$";
```
