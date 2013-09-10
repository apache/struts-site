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

    git svn init -s https://svn.apache.org/repos/asf/struts/struts2/
    git svn rebase


You might need to accept SSL certificates from Apache. Please check the 
[fingerprint of the servers](http://www.apache.org/dev/machines).
If in doubt, ask at Struts mailing list or Apache infra. 

If you are frequently asked on the certificates or if you get that error:

    Unable to determine upstream SVN information from working tree history

...then you should make sure you are using SVN version 1.7 (not 1.8, not 1.6).
Please also consult the [troubleshooting page](troubleshooting-git-svn.html).

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

## Contributing with GitHub

If you would like to contribute using the GitHub tools you need to know we can only
accept your work if we have your [ICLA](http://www.apache.org/licenses/icla.txt) on file.
Please read the document carefully, sign and send it to us. Basically this document
protects you and the end users for legal problems. It allows the Apache Software Foundation
to use your code and distribute it.
You should receive an email a few days after you submitted it and appear in the 
[committer index](http://people.apache.org/committer-index.html) in the section "unlisted CLAs".

Once done, you can clone the [Apache Struts mirror on GitHub](https://github.com/apache/struts2):

    git clone git@github.com:apache/struts2.git struts2-mirror.git

Please create an issue on our [issue tracker](https://issues.apache.org/jira/browse/WW).
You'll receive an issue number which you should use to create a working branch (for example WW-4196).

If you are sending a pull request, please send it to the Apache Struts teams repo and not
the official mirror. We cannot accept and close pull requests there which is the reason
we have an own account. You can find it here:

    [https://github.com/apachestruts/struts2](https://github.com/apachestruts/struts2)

It is of course possible to add us as upstream repo:

    git remote add upstream https://github.com/apachestruts/struts2


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
