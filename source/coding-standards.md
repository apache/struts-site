---
layout: default
title: Coding standards
---

# Coding standards
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## In the first place

Please remember that most of the time others will read your code. Focusing on that allow you to gain required perspective
about how code should look like. Defaults, margins, convention doesn't matter if what you write is hard to read.

**Readability is the first rule!**

## Separation of concern

If you want to reformat given file, part of class, etc do it in a dedicated commit. Never ever mix bug fixing,
new feature implementation with code reformatting. Thus only confuses people reviewing your code.

**Reformat different than coding!**

## Ask!

If something isn't clear, you have doubts and anything else - ask! Maybe during materialising your thoughts as text
you will gain the answer - Rubber Duck effect :-) Anyway, instead spending time on looking for solution - ask.

The best place to ask question is Struts Developers List [dev@struts.apache.org](mailto:dev@struts.apache.org)

## WIP

If you have any idea how to improve this guideline, don't hesitate to send them to us! Any help is welcome!

# Examples

Below examples shows how you should proceed when adjusting given part of source code via reformatting, extracting
or improving.

## From defaults to extractions

The original source code:

    // Hidden input section
    a = new Attributes();
    a.add("type", "hidden")
        .add("id", "__multiselect_" + StringUtils.defaultString(StringEscapeUtils.escapeHtml4(id)))
        .add("name", "__multiselect_" + StringUtils.defaultString(StringEscapeUtils.escapeHtml4(name)))
        .add("value", "").addIfTrue("disabled", disabled);
    start("input", a);
    end("input");

After applying default reformatting (80 columns margin):

    // Hidden input section
    a = new Attributes();
    a.add("type", "hidden")
        .add("id",
            "__multiselect_"
                + StringUtils
                    .defaultString(StringEscapeUtils
                        .escapeHtml4(id)))
        .add("name",
            "__multiselect_"
                + StringUtils
                    .defaultString(StringEscapeUtils
                        .escapeHtml4(name)))
        .add("value", "").addIfTrue("disabled", disabled);
    start("input", a);
    end("input");

Some suggestions how to improve the code:

- use static imports

        a.add("type", "hidden")
         .add("id", "__multiselect_" + defaultString(escapeHtml4(id)));

- use dedicated method

        a.add("type", "hidden")
         .add("id", "__multiselect_" + safeId(id));

- use builder

        a.add("type", "hidden")
         .add("id", HtmlID.with("__multiselect_").withSafeId(id).create());

As you can see, reformatting a code is just the beginning, you shouldn't stop there and think *how can I improve
readability* and follow that path to the end.
