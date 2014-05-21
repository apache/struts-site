---
layout: default
title: Submitting patches
---

# Submitting patches

Struts uses Git and to manage the repository the git-flow was adopted, to read more about that please follow the links below:

- http://nvie.com/posts/a-successful-git-branching-model/
- https://github.com/nvie/gitflow

First step is to install git-flow locally on your box, please follow the steps from this link

https://github.com/nvie/gitflow/wiki/Installation

Now you can clone Struts repository locally

    git clone https://git-wip-us.apache.org/repos/asf/struts.git    

After cloning the repository locally you must initialize git-flow:

     git flow init -d

and done!

Please remember that `master` branch cannot be modified directly from now on!

## Non-committers

If you aren't a committer you must use this link below or mirror at GitHub

    git clone git://git.apache.org/struts.git struts-copy

## Security patches

**Please read carefully, this is very important!**

If you prepared a patch to solve security issue in Apache Struts, in the first step contact us via
[Security Mailing List](mailto:security@struts.apache.org). Don't publish any information about possible vulnerability.
Thus will allow us coordinate the work and review if the information about issue can be disclosed publicly.
We don't want to inform hackers before we can protect our users :-)

**Be responsible!!!**

## Contributing with GitHub

Using GitHub mirror is the simplest way to contribute to Apache Struts if you are not a member
of Struts Comitters group.

First you must have an account created at GitHub to be able perform the next step. If you don't,
go ahead and create one just right now! Please remember to setup
[SSH keys](https://help.github.com/articles/generating-ssh-keys) and test them!

When ready go to [https://github.com/apache/struts](https://github.com/apache/struts) and click `Fork` button
in top right corner. This will fork Apache Struts repository and will create your private (but public) repository
with the source code.

Next step is to clone your repo locally, information how to do this you will find on right sidebar of your repo
under `SSH clone URL` headline.

Now you are ready to work with Apache Struts code base. Perform your changes, commit them and
next push to GitHub! Remember: commit in Git is different than commit in Subversion!

With your changes pushed to GitHub you can prepare a Pull Request (short: PR). Go to Apache Struts
mirror - [https://github.com/apache/struts](https://github.com/apache/struts) - then to
[Pull request](https://github.com/apache/struts/pulls) and hit
[New Pull Request](https://github.com/apache/struts/compare/) button.

If not already selected, click on `compare across forks.` Right now you must select from the dropdowns on right
your fork and branch to compare the differences with Apache Struts develop branch.

Finally hit `Create Pull Request` button and you are done!

## Further reading

 * [Git at Apache](http://wiki.apache.org/general/GitAtApache)
