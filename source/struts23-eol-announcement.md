---
layout: default
title: Apache Struts 2.3.x EOL Announcement
---

# Apache Struts 2.3.x End-Of-Life (EOL) Announcement

**The Apache Struts Project Team would like to inform you that the Struts 2.3.x web framework will reach its end of life in 6 months and won't be longer officially supported.**

This announcement takes place on 2018-11-14 and starting from that date we will only support Apache Struts 2.3.x in case of security vulnerabilities.
Within those 6 months period you can expect that we do our best to keep Struts 2.3.x branch secure but some of the security related changes
cannot happen without architectural changes that can affect backward compatibility. This what happened to Struts 2.5.x, we introduced some
internal changes to improve overall framework's security.  

## Questions and Answers

*   **With the announcement of Struts 2.3.x EOL, what happens to Struts 2.3.x resources?**

    All resources will stay where they are. The documentation will still be accessible from the Apache Struts homepage, as well as the downloads 
    for all released Struts 2.3.x versions. All of the Struts 2.3.x source code can be found in the Apache Struts Git repository under branch 
    [support/struts-2-3-x(https://github.com/apache/struts/tree/support/struts-2-3-x), now and in the future.
    All released Maven artifacts will still be accessible in Maven Central.

*   **Given a major security problem or a serious bug is reported for Struts 2.3.x in near future, can we expect a new release with fixes?**

    Yes, we will continue to support Struts 2.3.x in case of security issues for the next 6 months, after that time we won't support this branch
    in any case.   

*   **Is there an immediate need to eliminate Struts 2.3.x from my projects?**

    As far as the Struts team is currently aware of, there is no urgent issue posing the immediate need to eliminate Struts 2.3.x usage from 
    your projects. However, you should consider migration to the latest available version as we stop supporting this version in 6 months.

*   **We plan to start a new project based on Struts 2.3.x. Can we still do so?**

    Basically yes, but we would not recommend doing so. As long as no code line is written, it is very easy to conceptually select 
    the latest version of Struts 2.

*   **My friends / colleagues and I would like to see Struts 2.3.x being maintained again. What can we do?**

    You are free to put effort in Struts 2.3.x. There are basically one possibility: fork the existing source and support it on your own.

*   **I'm using Apache Struts 2.5.x, what will happen with this version?**

    Struts 2.5.x is still actively supported, we are working on new versions as well as we are preparing a new Struts 2.6 version. Migration from Struts 2.5.x to Struts 2.6 will a way smoother than switching from Struts 2.3.x to Struts 2.5.x.
