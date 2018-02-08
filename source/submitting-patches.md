---
layout: default
title: Submitting patches
---

# Submitting patches
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Committers

Struts uses Git so you must install a git client locally and then you can clone Struts repository:

either using Apache GitBox

    git clone https://gitbox.apache.org/repos/asf/struts.git    
    
or GitHub
   
    git clone https://github.com/apache/struts.git

and done!

Please remember that the `master` branch should be used only for small fast commits, if you are working on a large
change it is better to do it on a dedicated branch via GitHub. Please remember that pushing other branches to the repo
will replicate them to all the clones, that's why using GitHub is a preferred way.

## Non-committers 

If you aren't a committer you can still the repo from Apache Gitbox but you won't be able push any changes to it.
That's why it is better to use GitHub

    git clone https://gitbox.apache.org/repos/asf/struts.git

## Security patches

**Please read carefully, this is very important!**

If you prepared a patch to solve security issue in the Apache Struts, in the first step contact us via
[Security Mailing List](mailto:security@struts.apache.org). **Don't publish any information about possible vulnerability**.
Thus will allow us coordinate the work and review if the information about issue can be disclosed publicly.
We don't want to inform hackers before we can protect our users :-)

**Be responsible!!!**

## Contributing with GitHub

Using GitHub mirror is the simplest way to contribute to the Apache Struts if you are not a member
of the Struts Committers group.

First you must have an account created at GitHub to be able perform the next step. If you don't,
go ahead and create one just right now! Please remember to setup
[SSH keys](https://help.github.com/articles/generating-ssh-keys) and test them! You don't have to use SSH Keys 
and base only on user/password authentication.

When ready go to [https://github.com/apache/struts](https://github.com/apache/struts) and click `Fork` button
in top right corner. This will fork the Apache Struts' repository and will create your private (but public) repository
with the source code.

Next step is to clone the original repo locally

    git clone https://github.com/apache/struts.git
    
This will be an `origin`, you cannot push changes to the `origin` but don't worry, you will use your fork.

Now is time to add your fork as a remote

    git remote add fork https://github.com/my-username/struts.git 

Right now you should have two remotes defined for the repo, `origin` and `fork`, use below command to confirm that

    git remote -v 

Now you are ready to work with the Apache Struts' code base. Start with switching to `master` branch (if not already on it)

    git checkout master
    
now is time to fetch any changes from remote repository

    git fetch
    git pull
    
you should create a branch to keep your changes and it must be done off the `master` branch

    git checkout -b my-branch

Do your changes and commit them to `my-branch`, when you're done you can push the changes to GitHub, to your fork.

    git push -u fork my-branch
    
If you still need to change something, please remember to commit and push changes, but this time you can use just

    git push
    
as `my-branch` was already connected with the remote branch.

The final step is to open a Pull Request (short: PR) against the original Apache Struts repo. Go to the 
[Apache Struts mirror](https://github.com/apache/struts), then to [Pull request](https://github.com/apache/struts/pulls)
and hit [New Pull Request](https://github.com/apache/struts/compare/) button.

If not already selected, click on `compare across forks.` Right now you must select from the dropdowns on right
your fork and branch to compare the differences with the Apache Struts' `master` branch.

Finally hit `Create Pull Request` button and you are done!

After your PR got accepted and merged you must clean up your local repo, please switch your current branch to `master`

    git checkout master
    
and fetch updates from remote

    git fetch -p
    git pull
    
and now you can delete your local branch

    git branch -d my-branch
    
and you are ready to start working on another feature/issue.

### How to merge Pull Requests

The Apache Struts is using the Apache [Gitbox](https://gitbox.apache.org/) - a bidirectional service to mirror repos
between Apache and GitHub.

First of all you must have an account on GitHub and [link it](https://gitbox.apache.org/setup/) to your Apache account.
After that you can directly merge PRs using GitHub's UI.

## Further reading

 * [Git at Apache](http://wiki.apache.org/general/GitAtApache)

## Google's Patch Reward program

During [SFHTML5](http://www.meetup.com/sfhtml5/) Google announced that they adding the Apache Struts project to
[the Google's Security Patch Reward Program](https://www.google.com/about/appsecurity/patch-rewards/).

What does it mean?

If you prepared a patch that eliminates a security vulnerability or improves existing security mechanism
you can get a bounty :-) You will find more details on
[the Google's blog](http://googleonlinesecurity.blogspot.com/2013/10/going-beyond-vulnerability-rewards.html)
 or under the link above, just to give you a quick guideline how does it work:

- if you found a way to improve security of the framework but this isn't a vulnerability: 
  - prepare a patch and submit it to our [JIRA](https://issues.apache.org/jira/browse/WW),
    it can be a Pull Request on GitHub as well, but must reference the JIRA ticket.
  - let us know that you did something great, post a message to [Struts Dev mailing list](dev-mail.html)
- if you found a vulnerability and prepared a patch that fixes the vulnerability:
  - please contact us using the Security Mailing list [security@struts.apache.org](mailto:security@struts.apache.org)
  - keep all information in secret, do not publish any data about the vulnerability nor Proof-of-Concept, etc.
- we will review the patch and if it's a real great thing then we will merge it into our code base
- just wait on official release of the Apache Struts and now you can request the reward from Google :-)

Please be aware that the committee is focused on awarding patches that are more significant than individual bug fixes.
It means that the contribution should have _demonstrable_, _significant_, and _proactive_ impact on security.
{:.alert .alert-success}

**NOTE**

If you are concerned that your patch can disclose a security vulnerability, instead of submitting it as a ticket,
send it directly to the [Struts Security team](mailto:security@struts.apache.org). This will give us the possibility
to prepare a new release with your patch in secret.

Have fun and code!
