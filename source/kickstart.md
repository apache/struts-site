---
layout: default
title: Kickstart FAQ
---

# Kickstart FAQ
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## General

### I'm new to Apache Struts. How do I get started?

The best place to start is with the "best available" [release](releases.html).
If you are new to Java or web development, as well as Apache Struts, be sure to review the
[Key Technologies Primer](primer.html).

The main Struts web site includes documentation for the latest "General Availability" release
in each major release series. The development section of the site inclues draft documentation
for upcoming releases. If you are just getting started, focus on the latest General
Availability release, Documentation for past [releases](releases.html) is also available.

If you have questions, you can search the [User Mailing List archives](mail.html#archives),
or [post your own question to the list](mail.html). (Plain old Google usually works too!)

### Looking at the releases page, some versions seem to be missing. What happened to them?
{:#releases}

Apache Struts uses a "milestone build" system to create releases. First, we create a build
with a milestone version number, like Struts 2.0.42, and post the distribution in the development area.
The development group tests the distribution, and then we decide whether or not to release it.
The distribution includes everything that would be released, including the documentation and the release notes
for this version.

If we find a significant problem with the distribution, we may decide not to release it, and just leave
the distribution as a "test build". The testing may take several days, and in the meantime, we want to keep
the project moving, and so we just go onto the next version number.
Using our example, the next distribution would be labeled 2.0.43, even if version 2.0.42 was never officially
released.

Often we will first grade a release as a "beta", and invite other users to test it too. If this second
round of beta testing goes well, then we may mark the release "General Availability".
Usually, that designation would also make it the new "Best Available" release. In this case, we don't create
another distribution, but simply adjust the status of the same set of bits that people have been testing all along.

In practice, the milestone build system is fast and efficient and creates the fewest number of "candidate builds"
between releases.

### Why is the project called "Struts"?

It's a reference to "struts" in the architectural sense, a reminder of the nearly invisible pieces that hold up
buildings, houses, and bridges.

### How is Apache Struts licensed?

All Apache Struts products are copyrighted software available under the [Apache License](http://www.apache.org/licenses),
a &quot;free-to-use, business-friendly license&quot;.

### Can Apache Struts be used in a commercial product?

Yes. The only requirements you must meet are those listed in the [Apache License](http://www.apache.org/licenses).

### Do I have to credit Apache Struts on my own web site?

You need to credit Apache Struts if you **redistribute your own framework** based on our products
for other people to use. (See the [Apache License](http://www.apache.org/LICENSE) for details.)
But you do **not** need to credit Apache Struts just because your web application utilizes one of our products.
It's the same situation as using the Apache HTTPD server or Tomcat. Not required if its just running your web site.
Required if you've used the source code to create your own server that you are redistributing to other people.

### Are there ISPs that will host my Java web application?

For a listing of some Java and Struts ISPs, visit the [Struts Community Resources](http://struts.sf.net/community/index.html)
area on SourceForge.

### Is there a particularly good IDE to use?

The frameworks should work well with any development environment that you would like to use, as well as with any
programmers editor. The members of the Apache Struts development group each use their own tools such as
[Emacs](http://www.gnu.org/software/emacs/emacs.html), [IntelliJ IDEA](http://www.jetbrains.com/idea/),
[Eclipse](http://www.eclipse.org/), and [NetBeans](http://www.netbeans.org/).

For more, see the [IDE discussion page](http://wiki.apache.org/struts/StrutsMyFavoriteIDE) in the Struts wiki.

## Product Support

### Where can I get help with Apache Struts?

Each release of Struts comes with a User Guide or set of Tutorials to introduce people to the framework
and its underlying technologies. Various components also have their own in-depth Developers Guide, to cover
more advanced topics. Comprehensive Javadocs are provided for each release, along with the **full source code**.

The [Struts user mailing list](mail.html) is also very active, and welcomes posts from new users. Before
posting a new question, be sure to consult the **[MAILING LIST ARCHIVE](mail.html#Archives)**
and the very excellent [How To Ask Questions The Smart Way](http://www.catb.org/~esr/faqs/smart-questions.html)
by Eric Raymond. Please do be sure to [turn off HTML](http://expita.com/nomime.html) in your
email client before posting.

### Is commercial support available?

The Apache Software Foundation does not provide commercial support for any of our software products,
including Apache Struts. However, third parties may offer different degrees of support.

### If a product doesn't do what I want, can I request that a feature be added?

First, it's important to remember that Apache Struts is an all-volunteer project. We don't charge anyone
anything to use Apache Struts products. Committers and other developers work on Apache Struts products because
they need to use it with their own applications. If others can use it too, that's "icing on the cake".
If you [submit a patch](helping.html) for a feature that a Committer finds useful, then that
Committer may choose to volunteer his or her time to apply the patch.
If you just submit an idea without a patch, it is much less likely to be added (since first someone else has to
volunteer their time to write the patch).

We are grateful for any patches, and we welcome new ideas, but the best way to see that something gets added
to the framework is to do as much of the work as you can, rather than rely on the "kindness of strangers".
Worst case, you can apply the patch to your copy of the framework and still use the feature in your own application.
(Which is what open source is *really* all about.)

### Is there a press kit for Apache Struts?

Except for our [announcements page](announce.html), there is not a formal press or media kit for Apache Struts.
Queries from the press (and ONLY queries from the press, NOT support questions or anything else!)
should go to our media relations address: [press@apache.org](mailto:press@apache.org).

### Where can I report a potential security vulnerability?

If you believe you've found a security vulnerability in Apache Struts, please contact our security address - any
emails not relating to security vulnerabilities will be ignored without a reply (all security related information
will be kept confidential unless otherwise indicated): [security@struts.apache.org](mailto:security@struts.apache.org).

## Mailing Lists

### Is there a digest for the User list?

Yes. Send a blank message to [user-digest-subscribe@struts.apache.org](mailto:user-digest-subscribe@struts.apache.org).

If you are subscribed to the digest, you can also post to the list. Just be sure to send your post to
the [user list](mailto:user@struts.apache.org) rather than trying to reply to the digest.

### Is there an Apache Struts newsgroup?

Not a usenet group, but the Apache Struts User list can be accessed with your favorite newsgroup reader from
the [GMane News Site](http://news.gmane.org/). Subscribe to groups `gmane.comp.jakarta.struts.user`
for the user list.

### Why didn't my posting show up on the user list?

You must be subscribed to the [user list](mailto:user-subscribe@struts.apache.org) or
[user digest](mailto:user-digest-subscribe@struts.apache.org) before posting (or use the
[GMane Newsgroups](http://news.gmane.org) instead).


### Are there separate user lists for Struts 1 and Struts 2?

No. Each major version has it's own JIRA project, but we share the mailing lists.

To get the best response to an inquiry, please specify which version of Struts is being used,
including the milestone ("Struts 1.2.9", for example). You can also include the label **\[s1]**
or **\[s2]** in the subject line of your post.

### How do I unsubscribe from the mailing list?

**From the email account used to subscribe to the list**, send a blank message to
[user-unsubscribe@struts.apache.org](mailto:user-unsubscribe@struts.apache.org).

If you are receiving the digest, you must send a blank email to
[user-unsubscribe@struts.apache.org](mailto:user-digest-unsubscribe@struts.apache.org) instead.
