---
layout: default
title: Helping
---

# How to Help FAQ

  - ### What can my company do to help support Apache Struts?

  Apache Struts is an all volunteer product. Our customers are the volunteers who donate their time and
  energy to supporting the product. If you want to support Apache Struts, and become one of our
  customers, then you need to get involved and become a volunteer.

  Our challenge to any team using an Apache Struts product is to donate the time of one team member
  one afternoon a week (or more if you can spare the resources).
  Have your team member browse [JIRA](#issues) for any issues without a [patch](#patches) or unit test,
  and [add the patch or test](#contribute). (Please note that we do not use @author tags in our
  JavaDocs an documentation.)
  If your patch includes an @author tag, we would have to ask that it be removed.

  If an Apache Struts product doesn't do what *you* want, it's up to **you** to step up and propose the patch.
  If an Apache Struts product doesn't ship as often as you would like, it's up to you to step up with
  the tests and fixes that get a release out the door.
  [(Like Craig McClanahan did for Tomcat)](http://jakarta.apache.org/site/contributing.html).

  If Struts does do what you want, help others become involved by turning your war stories into FAQs
  and how-tos that we can make part of the [documentation](#documentation).
  The mailing list is very active and trundling through the archives is no picnic. We can always use
  volunteers who can reduce the best threads to coherent articles we can share with others.

  We don't sell Struts for money, but anyone who wants to be our customer can pay us back by donating
  the time and energy that money represents.

  - ### <a class="anchor" name="patches"></a>How do I create a patch?

  A patch is a machine-readable script that can automatically recreate a change to a text file,
  including source code and documentation. The patch format is also human-readable. Developers often pass
  patches around to discuss a change before applying it to the main repository.

  The best way to affect a change to the source code or documentation is to provide a patch.
  Apache Struts committers can then review your patch and decide whether to apply it to the main repository.

  Please be aware that the Struts project follows general coding conventions. In short, these are
  the official Java coding conventions plus the rule to favor spaces over tabs for indenting. See more
  details at [Struts 2 Coding Conventions (Wiki)](https://cwiki.apache.org/confluence/display/S2WIKI/Struts+2+Coding+Conventions)

  To create a patch, you first have to [checkout](git-for-struts.html) a copy of the source code
  or documentation from the main repository. You can then change your copy, and create the patch using a simple
  [Git](http://git-scm.com/) command, like this:

        git diff Main.java >> patchfile.txt

  Then, create a [JIRA issue](#issues)about the change, and attach the patch file.

  Some Apache projects ask that you to submit your patch to the mailing list. We would prefer that you
  create a JIRA issue and then attach the patch to the issue. To do this, you must first create the issue,
  and then modify the report to add your patch. We realize this is a bit clumsy, but it keeps us from
  losing things, and helps to ensure that your patch will be attended.


  The [NetBeans community](http://www.netbeans.org/community/contribute/patches.html) also has a helpful section on the
  subject of creating patches.

  - ### <a class="anchor" name="issues"></a>How can I report defects or suggest features?

  Tracking of defect reports and enhancement suggestions for Apache Struts products is handled through the
  [Apache Struts JIRA instance](https://issues.apache.org/jira/browse/WW).
  Please select the appropriate Apache Struts product from the list, and then select the component to which
  you feel this report relates. You will automatically be notified by email as the status of your defect or
  enhancement report changes. Please be sure to read
  [How to Report Bugs Effectively](http://www.chiark.greenend.org.uk/~sgtatham/bugs.html)
  before posting a report.

  If you can't write a [patch](#patches) to address your issue, a unit test that demonstrates the problem is also welcome.
  (And, of course, unit tests that prove your patch works are equally welcome.)

  If the defect or feature is already being tracked, you can vote for the issue and call more attention to it.
  Each user can cast up to six votes at a time.

  If there is a patch attached to the issue, you can also try applying to your local copy of Struts,
  and report whether it worked for you. Feedback from developers regarding a proposed patch is really quite
  helpful.
  Don't hesitate to add a "works for me" note to a ticket if you've tried the patch yourself and found it useful.

  Feature suggestions are also maintained in the [JIRA issue tracker](https://issues.apache.org/jira/browse/WW).

  - ### <a class="anchor" name="contribute"></a>How can I contribute to the Struts source code?

  A very good place to start is by **reviewing the list of open issues** and pending feature suggestions in the
  [issue tracker](#issues).
  If you see an issue that needs a patch you can write, feel free to annex your patch. If you see an issue
  that needs a unit test to prove it's fixed, feel free to annex your test case.
  If someone has posted a patch to an issue you'd like to see resolved, apply the patch to your local development
  copy of Struts.
  Then let us know if it works for you, and if it does, cast your vote for the issue and its patch.

  If none of the pending issues scratch your itch, another good place to start is by **contributing unit tests**
  for existing features (even those that still work).

  You can upload a proposed [patch](#patches) to either the code or documentation by creating a feature
  suggestion in the [issue tracker](#issues).
  **After creating the ticket** you can go back and upload a file containing your patch.

  Our current approach to [unit testing](kickstart.html#tests) works fairly well for exercising most method-level
  stuff, but does not really address situations of dynamic behavior -- most particularly the execution of custom tags
  for Struts.
  You can try to fake what a JSP container does, but a much more reliable testing regime would actually execute
  the tag in a real container.

  - ### <a class="anchor" name="documentation"></a>How can I contribute to the documentation?

  The Struts 2 documentation is maintained using the Atlassian Confluence wiki software and automatically
  exported to HTML for viewing on the website. To help with the Struts 2 documentation, you must create
  an account at [cwki.apache.org/confluence](http://cwiki.apache.org/confluence), AND you must file a
  [Contributor License Agreement](http://apache.org/licenses/icla.txt) with the ASF.

  Other ways to help out with the documentation is to just leave a comment on a page that needs fixing.
  If you have a cwiki Confluence account, you can also create pages on the
  [Struts 2 Wiki](http://cwiki.apache.org/S2WIKI/home.html) without filing a CLA.

  If you are submitting new material, it is important to decide exactly where you would put this
  in relation to the rest of the documentation.
  Again, someone has to figure that out before it can be added, and that someone might as well be you.

  - ### <a class="anchor" name="release"></a>So when is the next release coming out?

  Here is the truth regarding releases:

  Apache products are released on the basis of merit, and ~not~ according to a strict timetable.
  The volunteers devote whatever time they can to work on the product. But all volunteers have real jobs
  and real lives, that do take precedence. Since Struts does not have paid personnel working on the project,
  we simply cannot make date-oriented commitments.

  The bottom line is that Apache takes releases very seriously. We do not compromise the quality of our software by
  watching the calendar (and then ship something ready or not). A release is ready when it is ready.

  That may sound flip, but it ~is~ the truth. The delivery of production-quality, leading-edge software
  is not something anyone can prognosticate. If anyone tries, they are lying to you.
  That, we won't do ;-)

  What we ~will~ do is release all of our development software as soon as it is developed.
  This way you can judge for yourself how quickly the development is proceeding, and whether what is being
  developed will meet your needs.
  If you need a feature right now, you can use the nightly build, or roll your own patch. There are no internal
  code repositories, private development lists, secret chat rooms, or conference calls.
  What you see is what we got. If you are following the DEV list, then you know everything the developers know.
  Really, you do.

  *So, what do you tell your team*?
  If you can ship your application based on the nightly build of your choice, then consider that an option.
  You can still ship yours, even if we don't ship ours, and you will have access to all the latest patches or
  enhancements. (Just like we were working down the hall.) If you can only ship your application based on a release
  build of Struts, then you should base your development on the release build of Struts,
  and keep an eye on what is coming down the pipeline.
  This way you are at least forewarned and forearmed.

  - ### <a class="anchor" name="release_help"></a>What can I do to help the next release along?

    - Most importantly, download the latest [nightly build](builds.html#NightlyBuilds) or development release
      and test it against your own applications. Report any and all issues or suspected issues to
      [the issue tracker](#issues).
      The sooner we resolve any problems, the fewer betas or release candidates we will have to distribute before we are done.
      (How do we know when we're done? -- When we run out of issues =:o) The sooner we find them, the sooner we are done.)

    - **Contribute [unit tests](kickstart.html#tests)**. The closer we get to a release, the more we worry
      about breaking something. The more tests we have, the more confident we can be when applying patches.
      Tests that prove that a pending issue is actually a defect are the most welcome ones.
      But we are eager for any and all tests for any and all features, even those that still work =:0).

    - **Review the list of issues**  at [the issue tracker](#issues). If there are any to which you can respond, please
      do. If there any patches posted, feel free to test them your system, report the results, and cast your vote
      if they work.

    - *Confirm an issue's category and status*. Newbies often post feature suggestions or help-desk
      questions as "bugs". This bloats the list of fixes we (apparently) need to apply before the next
      beta, making it hard to see the forest for the trees.
      If an issue doesn't seem to be categorized correctly, exercise your best judgment and change it.
      If one ticket seems like a duplicate of another, go ahead and enter the change.
      Every modification to the ticket is echoed to the DEV list and automatically subjected to peer review.
      Err on the side of doing.

    - Use the issue tracker to **vote for issues** you feel should be handled first. If an issue on your
      ballot doesn't include a patch, feel free to try coding one yourself. (In a meritocracy, patches are
      the only votes that matter.)
      Dozens of developers have contributed code or documentation to Struts. You can too =:0)

    - **Answer questions on the user list**. The Committers only have a limited amount of time to volunteer.
      If Developers are supporting each other on the lists, the Committers have more time to spend on the next
      release.

  - ### <a class="anchor" name="decides_help"></a>How can I help make the decisions?

  A guiding principle of the Apache Software Foundation is "them that do the work, make the decisions".
  This phrase is actually a double-entendre. A project will make some decisions by voting (very few),
  but the real decisions are made when a volunteer actually does the work. Unless someone volunteers to do the work,
  other decisions are meaningless.

  In an ASF project, like Apache Struts, volunteers who make sustained contributions to the project
  are invited to become "Committers". In due course, Committers are invited to join the Project Management
  Committee (PMC).
  A goal of the ASF is for all Committers to be on the PMC.

  By "sustained", we mean that an individual has been active in the project for at least six months.
  The contributions should come in the form of both patches (to code or documentation), and posts to the mailing
  lists. Patches must be competent and accepted into the repository. Posts must be consistently helpful, friendly,
  and collaborative. The most important characteristic in a prospective Committer is an
  amicable demeanor that fosters goodwill.

  As PMC members take note of Struts developers who meet our qualifications, one of us will call for a vote on
  the internal PMC mailing list. (This usually happens when someone gets tired of applying
  the volunteer's patches!) The internal list is rarely used, and it is never used for development discussions.
  If the PMC vote passes, we will send the developer a invitation privately, to give the individual a chance to accept
  or discretely decline.
  If the candidate is able to accept, the PMC will announce the new member on the dev list.

  For more about decision-making, see [How the ASF Works](http://apache.org/foundation/how-it-works.html)
  and the [Apache Struts Charter](bylaws.html). For more about project infrastructure,
  see "Project Maintenance and Resources" in the [Struts 1 wiki](http://wiki.apache.org/struts/).
