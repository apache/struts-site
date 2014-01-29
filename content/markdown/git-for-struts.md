<head><title>Git for Struts</title></head>

# Using Git with Struts

Struts uses Git and to manage the repository the git-flow was adopted, to read more about that please follow the links below:
- http://nvie.com/posts/a-successful-git-branching-model/
- https://github.com/nvie/gitflow

## Contributing with GitHub

If you would like to contribute using the GitHub tools you need to know we can only
accept your work if we have your [ICLA](http://www.apache.org/licenses/icla.txt) on file.
Please read the document carefully, sign and send it to us. Basically this document
protects you and the end users for legal problems. It allows the Apache Software Foundation
to use your code and distribute it.
You should receive an email a few days after you submitted it and appear in the 
[committer index](http://people.apache.org/committer-index.html) in the section "unlisted CLAs".

Once done, you can clone the [Apache Struts mirror on GitHub](https://github.com/apache/struts):

    git clone git@github.com:apache/struts.git struts-mirror.git

Please create an issue on our [issue tracker](https://issues.apache.org/jira/browse/WW).
You'll receive an issue number which you should use to create a working branch (for example WW-4196).

If you are sending a pull request, please send it to the Apache Struts teams repo and not
the official mirror. We cannot accept and close pull requests there which is the reason
we have an own account. You can find it here:

[https://github.com/apachestruts/struts]

Please send the pull request to "trunk".

It is of course possible to add us as upstream repo:

    git remote add upstream git@github.com:apachestruts/struts

## Working with remote branches from GitHub

You can add a remote branch from GitHub like this:

    git remote add opensourceio git@github.com:opensourceio/struts

Pull changes with:

    git pull opensourceio anotherbranch

When merge conflicts happen, these can be resolved using:

    git mergetool

After the merge, you need to commit the changes to Apache Git with:

    git commit

## Further reading

 * [Git at Apache](http://wiki.apache.org/general/GitAtApache)
