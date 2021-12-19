---
layout: default
title: Project Management Committee Charter
---

# Project Management Committee Charter
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Apache Struts PMC Charter

Struts is a Project of the [Apache Software Foundation](https://www.apache.org/foundation) (ASF), formed by a resolution
of the [ASF Board of Directors](https://www.apache.org/foundation/board/). As an ASF Project, Struts is subject to the
[ASF Bylaws](https://www.apache.org/foundation/bylaws) and the direction of the ASF Board.

The Project Charter incorporates by reference the current version
of [How the ASF works](https://www.apache.org/foundation/how-it-works), with the additional guidelines
and clarifications found herein.

## Roles and Responsibilities

The roles and responsibilities that people can assume in the project are based on merit.
Everybody can help no matter what their role. Those who have been long term or valuable contributors to
the project can earn the right to commit directly to the source repository and to cast binding votes during
the decision-making process.

## Users

Users are the people who use the products of the Project. People in this role aren't contributing code,
but they are using the products, reporting bugs, making feature requests, and such. This is by far
the most important category of people as, without users, there is no reason for the Project.
When a user starts to contribute code or documentation patches, they become a Contributor.

## Contributors

Contributors are the people who write code or documentation patches or contribute positively to the project
in other ways. When a volunteer's patch is applied, the contribution is recognized in the version control log.


## Committers

Contributors who give frequent and valuable contributions to a subproject of the Project can have their status
promoted to that of a "*Committer*" for that subproject. A Committer has write access to the source code repository.
Committer status is granted by the Project Management Committee by majority vote.


## Project Management Committee (PMC)

Committers and other volunteers who frequently participate with valuable contributions may have their status promoted
to that of a "*Project Management Committee Member*". The PMC is responsible for the day-to-day management
of the Project.

### Management

The Vice President is appointed by the ASF Board. The Vice President is assisted by the Project Management Committee
(PMC) and also serves as the PMC chair. The PMC may nominate new members. Nominees may then be approved
with a 3/4 majority vote of the PMC. Membership can be revoked by a unanimous vote of all the active PMC members
other than the member in question. The list of active PMC members can be found on our [Volunteers page](volunteers).

### PMC Duties

The PMC is responsible for the day-to-day management of the Struts Project. The PMC oversees all changes
made to the codebase. The PMC must ensure that all code under a Apache Struts repository is the lawful property
of the Foundation and may be distributed under the [Apache Software License](https://www.apache.org/licenses/).
All releases of a Struts subproject must be sanctioned by the Project Management Committee.

### Subprojects

Subprojects are the Project's unit of release. Each subproject should represent an implementation of a Struts framework
or a related component. Each subproject should focus on creating, maintaining, and releasing a single software
product or "deliverable".

All PMC Members have voting rights in all subprojects. Members not familiar with a subproject codebase may abstain
from any given vote. All Committers have write access to all subprojects. Subprojects are units of release, not
units of work.

PMC members may propose the creation of new subprojects. Proposals are to contain the scope of the project,
identify the initial source from which the project is to be populated, identify any mailing lists or
repositories, if any, which are to be created. Creation of a new subproject requires approval by a 3/4 majority
vote of the PMC.

## Decision Making

All [Volunteers](https://www.apache.org/foundation/how-it-works.html#roles) (Users, Developers, Committers, PMC Members)
are encouraged to participate in the decision-making process, but binding decisions are made only
by the Project Management Committee.

### Voting

Any subscriber to the list may [vote](https://www.apache.org/foundation/voting) on any issue or action item.
Votes from Developers and Committers are especially welcome. However, the only binding votes are those cast by a PMC
Member.

The act of voting carries certain obligations. Voters are not only stating their opinion, they are also agreeing
to help do the work.

Each vote can be made in one of three flavors:

<table class="bodyTable">
    <tr class="a">
        <td>
            <strong>+1</strong>
        </td>
        <td>
            "Yes" "Agree," or "the action should be performed".
            On some issues this is only binding if the voter has tested the action on their own system(s).
        </td>
    </tr>
    <tr class="b">
        <td>
            <strong>+/-0</strong>
        </td>
        <td>
            "Abstain", "no opinion".
            An abstention may have detrimental effects if too many people abstain.
        </td>
    </tr>
    <tr class="a">
        <td>
            <strong>-1</strong>
        </td>
        <td>
            "No".

            On issues where consensus is required, this vote counts as a **veto**.
            All vetos must contain an explanation of why the veto is appropriate. Vetos with no explanation are void.
            A veto cannot be overruled. If you disagree with the veto, you should lobby the person who
            cast the veto. Voters intending to veto an action item should make their opinions known to the group
            immediately so that the problem can be remedied as early as possible.

            If a Committer tries to "override" a veto by restoring a vetoed change, the PMC may ask the infrastructure
            group to revoke that Committer's write privileges.
        </td>
    </tr>
</table>

An action requiring consensus approval must receive at least **3 binding +1** votes and **no binding vetoes**.
An action requiring majority approval must receive at least **3 binding +1** votes and more **+1** votes than
**-1** votes. All other action items are considered to have lazy approval until somebody votes**-1**, after which
point they are decided by either consensus or majority vote, depending on the type of action item.

Voting represent consensus and votes are never final. Circumstances change, and so may votes. A veto may be converted
to a +1 after discussion, and likewise a +1 may be converted to a -1. By convention, Committers should allow a vote
to circulate for 72 hours before taking action.

## Action Items

All decisions revolve around "*Action Items*". Action Items consist of the following:
- Long Term Plans
- Short Term Plans
- Product Changes
- Showstoppers (or "blockers")
- Release Plan
- Release Grade

### Long Term Plans

Long term plans are simply announcements that group members are working on particular issues related to the Project.
These items are not voted on, but Committers and PMC Members who do not agree with a particular plan, or think that
an alternative plan would be better, are obligated to inform the group of their feelings.

### Short Term Plan

Short term plans are announcements that a volunteer is working on a particular set of documentation or code files
with the implication that other volunteers should avoid them or try to coordinate their changes.

### Product Changes

All product changes to the repository are subject to lazy consensus.

### Showstoppers

Showstoppers are issues that require a fix be in place before the next public release. They are designated as "blockers"
in the issue tracker in order to focus special attention on these problems. An issue becomes a showstopper when it is
designated as such in the issue tracker by a PMC member and remains so by lazy consensus.

### Release Plan

A release plan must be used to keep all volunteers aware of when a release is desired, whether it will be a major,
minor, or milestone release, who will be the release manager, when the repository will be tagged to create
the distribution, and other assorted information to keep volunteers from tripping over each other. A release
plan must be incorporated into the product documentation, or otherwise announced to the DEV list.
Lazy majority decides each issue in a release plan.

### Release Grade

After a proposed release is built, it must be tested and classified before being released to the general public.
The proposed release may be assigned "Alpha", "Beta" or "General Availability" classifications by majority vote.
Once a release is classified by the PMC Members, it may be distributed to the general public on behalf of the Foundation.
Distributions may be reclassified or withdrawn by majority vote, but the release number may not be reused by another distribution.

## Sandbox

Pursuant to the ["Rules for Revolutionaries"](http://incubator.apache.org/learn/rules-for-revolutionaries),
any committer may submit experimental material to the Sandbox area of the repository at his or her own discretion.

Material must be moved from the sandbox to the main repository before it can be released. If a sandbox whiteboard 
becomes dormant for six or more months, it may be moved to the archive section of the repository.

Experimental material that is outside the scope of the Struts project may also be  submitted to the
[Apache Labs](http://labs.apache.org/)

Next: [Volunteers](volunteers)
