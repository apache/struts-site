<head><title>Apache Struts 1 EOL Announcement</title></head>

# Apache Struts 1 End-Of-Life (EOL) Announcement

**The Apache Struts Project Team would like to inform you that the Struts 1.x web framework has reached its end of life and is no longer officially supported.**

Started in 2000, Struts 1 had its last release - version 1.3.10 - in December 2008. In the meantime the Struts community
has focused on pushing the Struts 2 framework forward, with as many as 23 releases as of April 2013.
Taking this into account, announcing Struts 1 EOL is just the official statement that we have been lacking volunteer
support for some time now and that users should not rely on a properly maintained framework state when utilizing
Struts 1 in projects. See the following Q/A section for more details.

See also: [Apache Struts 1 EOL Press Release](struts1eol-press.html)

## Questions and Answers

*   **With the announcement of Struts 1 EOL, what happens to Struts 1 resources?**

    All resources will stay where they are. The documentation will still be accessible from the Apache Struts homepage, as well as the downloads for all released Struts 1.x versions. All of the Struts 1 source code can be found in the Apache Struts subversion repository, now and in future. All released Maven artifacts will still be accessible in Maven Central.

*   **Given a major security problem or a serious bug is reported for Struts 1 in near future, can we expect a new release with fixes?**

    As of now, actually no - that is what the EOL announcement essentially is about. Since the end of support is reached, you will either need to find mitigations, patch the existing Struts 1 source code yourself or migrate your project to another web framework.

*   **Is there an immediate need to eliminate Struts 1 from my projects?**

    As far as the Struts team is currently aware of, there is no urgent issue posing the immediate need to eliminate Struts 1 usage from your projects. However, you should be aware that security and bug fixes will no longer be provided. If in future such flaws are found you will need to take action as described in the preceding answer.

*   **We plan to start a new project based on Struts 1. Can we still do so?**

    Basically yes, but we would not recommend doing so. As long as no code line is written it is very easy to conceptually select an alternative web framework such as Struts 2.

*   **We want to migrate our project from Struts 1 to another web framework. What would you recommend?**

    You should be aware that there is currently no "drop-in" replacement for Struts 1. You will need to adapt your existing code to the framework of choice. Basically every action based Java web framework is a possible candidate. We as the Apache Struts Team can highly recommend investigating Struts 2 as a successor framework - it is modern, highly decoupled, feature rich, well maintained and successfully running in many mission critical projects in the wild. It shares the same basic principles with Struts 1, but offers a highly improved architecture and API. Other alternatives are e.g. Spring Web MVC, Grails or Stripes.

*   **My friends / colleagues and I would like to see Struts 1 being maintained again. What can we do?**

    You are free to put effort in Struts 1. There are basically two possible ways to do so: either fork the existing source, or engage in community building within the Apache Struts Project. If there are enough people demonstrating their will and ability to provide patches, maintenance and oversight in the long run, there is nothing holding us back from putting Struts 1 back into maintenance with the help of these volunteers.
