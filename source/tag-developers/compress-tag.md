---
layout: default
title: compress tag
parent:
  title: Tag Reference
  url: tag-reference
---

# compress

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Compresses HTML output by removing unnecessary whitespace between tags while preserving content within tags. This helps
reduce the size of generated HTML output, improving page load times and bandwidth usage.

The compress tag can be controlled globally via the `struts.tag.compress.enabled` configuration property and is
automatically disabled in development mode for easier debugging.

{%
remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/compress-description.html %}

## Attributes

{%
remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/compress-attributes.html %}

## Security Features

- Body content truncation in logs prevents sensitive data exposure
- Maximum size limits (10MB default) prevent DoS attacks via large inputs
- Regex operations include ReDoS safeguards with 50MB hard limit

## Examples

**Basic usage:**

```jsp
<s:compress>
    <div>
        <p>This HTML will be compressed</p>
        <span>Whitespace between tags will be removed</span>
    </div>
</s:compress>
```

**Force compression in development mode:**

```jsp
<s:compress force="true">
    <div>
        <p>This will be compressed even in devMode</p>
    </div>
</s:compress>
```

**Configuration:**

Control compression globally in `struts.xml`:

```xml

<constant name="struts.tag.compress.enabled" value="true"/>
<constant name="struts.tag.compress.maxSize" value="10485760"/>
```

Or in `struts.properties`:

```properties
struts.tag.compress.enabled=true
struts.tag.compress.maxSize=10485760
```

## Related Configuration

- `struts.tag.compress.enabled` - Controls whether compression is enabled globally (default: true)
- `struts.tag.compress.maxSize` - Maximum size in bytes of content that can be compressed (default: 10485760 = 10MB)
- `struts.tag.compress.log.maxLength` - Maximum length of body content in log messages (default: 200)

## Since

Available since Struts 7.2.0
