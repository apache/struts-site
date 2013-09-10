# Using Git with Struts

So far, Struts 2 is using SVN. There are plans to move on to GIT but
the plannings have not been completed yet. In addition we'll only
move with new versions of Struts to Git. Struts 1 will stay in SVN.

Luckily there is a way to work with Git backed by SVN. This document
explains, how a developer:

 * can work on outdated code like Struts 1 with Git
 * can synchronize Git from Github with the Struts 2 repository

This page reflects some knowledge from the
[Git at Apache project](http://wiki.apache.org/general/GitAtApache).

## Setting up your Struts environment

    git clone git://git.apache.org/struts2.git
    cd struts2/.git
    wget http://git.apache.org/authors.txt
    cd ..
    git config svn.authorsfile ".git/authors.txt"

    # check if your username and email are identical to those in the author file
    git config user.name
    git config user.email

    # if they are not identical, set the ASF values locally
    # git config user.name <Your Name>
    # git config user.email <Your Email>

    git svn init --prefix=origin/ --tags=tags --trunk=trunk --branches=branches https://svn.apache.org/repos/asf/struts/struts2
    git svn rebase


You might need to accept SSL certificates from Apache. Please check the fingerprint of the servers.
If in doubt, ask at Struts mailing list if somebody can confirm the server. It also might
happen that the last command quits with:

    Unable to determine upstream SVN information from working tree history

You can go on for now and ignore this message.
After this, you'll need to fetch the old history.

    git svn fetch --log-window-size 10000

Heads up: this command above will need a good while to run - please plan accordingly.
When you change something in the code, you can commit it with:

    git svn dcommit

This will commit all your git commits to svn. One git commit == 1 svn revision. Consider rebase.


## Working with SVN branches

Create a new local branch and switch to it in GIT:

    git checkout -b mybranch-svn origin/mybranch

Map the GIT branch to the according SVN branch:

    git reset --hard origin/mybranch

For reference, you can override the commit url:

    git svn dcommit --commit-url https://svn.apache.org/repos/asf/struts/struts2/branches/mybranch

## Working with remote branches from GitHub

You can add a remote branch from GitHub like this:

    git remote add opensourceio https://github.com/opensourceio/struts.git

Pull changes with:

    git pull opensourceio anotherbranch

When merge conflicts happen, these can be resolved using:

    git mergetool

After the merge, you need to commit the changes to svn with:

    git svn dcommit

## Further reading

 * [Git at Apache](http://wiki.apache.org/general/GitAtApache)
 * [git-svn is a gateway drug](http://www.robbyonrails.com/articles/2008/04/10/git-svn-is-a-gateway-drug)
