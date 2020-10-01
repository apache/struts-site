---
layout: default
title: Documentation Style Guide
parent:
  title: Contributors Guide
  url: index.html
---

# Documentation Style Guide
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

It's well-known that a consistent user interface is easier to use. Consistency helps users focus on the task rather 
than the user interface. Likewise, a consistent documentation style helps users focus on the information, rather 
than the formatting.

A related goal is to design the documentation so that it is easy to maintain, so that it tends to remain internally 
consistent with the framework itself.

## Do it now. Do it once. Do it well.

Overall, there are three goals for the documentation system.

- Say it all
- Say it once
- Say it well

First, we want the documentation to be both complete and concise. This is job one! The documentation should also be a quick 
but practical introduction to the framework, so newcomers can get started as easily as possible. To keep people coming back, 
the documentation should also be a repository of the tips and tricks we use in our own applications, so that people can find 
it here instead of asking over and over again on the list.  

Second, the documentation should be easy to maintain. Ideally, we should cover the detail of each topic once, and draw 
as much detail from the source code and examples as possible (using the _snippet macro_).

Third, the documentation should be text-book quality; if not in the first draft, then in the next. Don't hesitate 
to hack in a new page. Better that we have the page than we don't. (See Job One!) But, as time allows, we should try 
to make each page the best that it can be. A great many people access the documentation, and it's worth the effort 
to make the "documentation experience" productive and enjoyable.

## Capitalization of common terms

- Java
- Javadoc
- HTML
- XML

## General Punctuation and Grammar

Good online resources for punctuation, grammar, and text style include

- [Wikipedia Manual of Style](https://en.wikipedia.org/wiki/Wikipedia:Manual_of_Style)

In print, two excellent (and inexpensive!) resources are

- [The Elements of Style](https://www.amazon.com/exec/obidos/tg/detail/-/020530902X/apachesoftwar-20/)
- [Associated Press Stylebook](https://www.amazon.com/exec/obidos/tg/detail/-/0465004881/apachesoftwar-20/)

Also excellent, but more expensive: 

- [Chicago Manual of Style](https://www.chicagomanualofstyle.org/)

## Quick Tips

- Use as few words as possible. Instead of "but there are some quirks about it" try "but there are quirks".
- If a list of items includes both a term and an explanation, consider using a table instead of bullets.
- Avoid using "This" by itself. Instead of "This lets us" try "This strategy lets us".
  - Ask yourself: "This what?"
- References to other wiki pages can be unqualified. For example: "See ."

## Don't be smurfy!

A lot of API members use the term "action". We have

- action extensions on pages,
- action attributes in forms,
- action elements in configuration files, and
- Action Java classes, some of which may implement the
- Action interface.

Here are some terms that can be used to help clarify which action is which.

- Use "the framework" or "Struts 2" to refer to the codebase as a whole, including any frameworks we use internally, like OGNL.
- Use "Action class" or "action handler" to refer to the Java class incorporated by the action element.
- Use "action mapping" to refer to the object created by the action element.

## Page Save Comment

Try to include a brief description of a change when saving a page. The comments are included in the page's history. 
The comments are also included on the daily change report. In a group environment, it's important to help each other follow along.

## Parent Pages

Use the Parent Page feature to create a hierarchy of pages. The parent pages are reflected in the "bread crumb" menu. 
If properly used, parent pages can help browsers "visualize" the documentation as an outline. 

The root of the documentation is the "Home" page, which is also the "Welcome" page. The documentation is ordered into 
three main areas: Tutorials, FAQs, and Guides. Each area has a contents page, whose parent is Home. Other pages within 
each section can also serve as parents, to help organize the documentation into a coherent outline. 

## Labels

Pages can be cross-indexed with the Label feature. Labels are not be used much yet, except for internal authoring. 

| FIXME | A page that mentions a problem in the distribution that we intend to fix. Review these pages before tagging a distribution to see if the issue has been resolved. |
|-------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| TODO | A page that is incomplete. Try to complete these pages before tagging a distribution |

## Avoid skipping headers

The headers form an outline for the page. When writing term papers, it is not a good practice to skip outline levels.
When writing hypertext, it is not a good practice to skip heading levels either. Try not to skip from a `h2` to a `h4`.

> If you find yourself writing too many h2 headings in a single page, consider breaking the page into child pages.

## More on Text Effects

Text effects like **strong**, _emphasis_ , and inserted can be used in the usual way to denote important parts of a sentence.

`Monospaced` should be used to files, tags, and methods, like `struts.xml`, `<xmltag />`, and `execute`. 
Class and Interface names may be left in normal face, like Action and Interceptor.

A panel should be preferred to a block quote. The color fonts should be avoided or used only with great care. 
Some people have difficulty seeing some colors, and the colors may not be apparent if the page is printed.

## Text Breaks

Text breaks should not be used to format blocks on the screen. If there is an issue with the way paragraphs or headings 
are being rendered, we should customize the stylesheet.

## Lists

Unordered lists should be created only with the `-` notation.

Ordered list should be used when numbering the items is important. Otherwise, prefer unordered lists.

- This is an unordered list in star notation;
- Items can have sub-items
  - That can have sub-items
    - That can have sub-items ...
      - What is the limit?
- Mixing ordered and unordered lists is possible:
  1. One;
  2. Two;
  3. Three.

## Images

Avoid using external images for bullets or icons. Prefer the equivalents provided with Confluence.

Images can be included by URL or annexing the binary to the page. Prefer annexing when possible, since URLs are subject to change.

Always observe copyright issues. Do not annex images unless it an original or public domain work, or the author has donated the image to the foundation.

Example: 

![http://struts.apache.org/images/struts-power.gif](http://struts.apache.org/images/struts-power.gif)

## Tables

Prefer lists for single-value entries. Prefer tables for lists with multiple columns.

Tables are very useful when lists just don't do it. Meaning: don't write a table when a list suffices. Tables are more 
organized, because you can align the text in columns. Since the markup text for tables in Confluence is not easy to read, 
complex and big tables can be hard to maintain.

| File | Optional | Location (relative to webapp) | Purpose |
|------|----------|-------------------------------|---------|
|`web.xml` | no | /WEB-INF/ | Web deployment descriptor to include all necessary WebWork components |
|`struts.xml` | no | /WEB-INF/classes/ | Main configuration, contains result/view types, action mappings, interceptors, and so forth |

## Advanced Formatting

Try to specify the language for \`\`\` ... \`\`\` blocks.

**HelloWorld.java**

```java
/** Hello World class. */
public class HelloWorld {
  /** Main method. */
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
```

Avoid tabs in code blocks, use two spaces instead. Long lines should be formatted to fit in a 800x600 resolution screen, 
without resorting to horizontal scrolling.

A typical example of "non-lang" block would be the command line statements to compile and run the code above.

The terminal notation `$` should be used to represent a system prompt.

**Compiling and Running Hello World**

```
$ javac HelloWorld.java

$ java HelloWorld
Hello, World!
```

## Change Happens

Anyone who has worked with databases knows the value of normalizing the schema. Ideally, we want to store each fact 
exactly once, and then use query system to retrieve that fact wherever it is needed. If we store a fact once, we only 
need to update it once, and we avoid inconsistencies in our data set.

To the extent possible, we want to "normalize" our technical documentation. Like a database, all technical documentation 
is subject to change. When change happens, we want the documentation to be as easy to update as possible. One way to do 
that is to try and minimize redundancy (without sacrificing ease of use).
