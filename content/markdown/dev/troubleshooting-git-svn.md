# Troubleshooting Git-Svn

## Git-Svn shows certificate errors

Most likely this is caused because you are having a SVN client v1.6 on
your path. Please upgrade to SVN 1.7.

## Git-Svn exits with Code 6

To the date of this writing, Git-Svn is not compatible with SVN client
v1.8. You most likely need to downgrade your client to v1.7.

If you are running MacPorts you can check if you have subversion 1.7 already
installed with:

    port intalled

If you have, you can activate it with:

    port activate subversion @1.7.10_1

Please note, subversion 1.7 needs a specific depedency to be activated as well.
Otherwise you will receive a "dyld: Library not loaded: /opt/local/lib/libserf-1.0.dylib" error.
You can do this with:

    port activate serf1 @1.2.1_1

If you have these version not installed on your system, you'll need to a
bit more work because MacPorts doesn't support installing older packages out of the box.

You'll need to manually checkout a specific revision of the portfiles. Please activate the
latest subversion version you have and make sure it is running. Then:

    # checkout the revision with subversion 1.7 
    svn co -r 106653 http://svn.macports.org/repository/macports/trunk/dports/devel/subversion/
    cd subversion
    port install
    # Subversion 1.7 should install now
    cd ..
    rm -rf subversion

Do the same with serf1:

    # checkout serf1 1.2.1_1
    svn co -r 108607 http://svn.macports.org/repository/macports/trunk/dports/www/serf1
    cd serf1
    port install
    # Serf1 1.2.1 should install now
    cd ..
    rm -rf serf1

"port install" should now list the desired packages. Activate them.

Further reading:

 * [Downgrading Subversion](http://www.philipp.haussleiter.de/2013/08/downgrading-subversion-from-1-8-to-1-7-in-macports/)
 * [Installing older ports](https://trac.macports.org/wiki/howto/InstallingOlderPort)

## Git-Svn is not installed

If you see:

    # git svn --version
    git: 'svn' is not a git command. See 'git --help'.

On Macs running MacPort you can easily install it with:

    port install git-core +svn

Make sure you have the "+svn" there, otherwise git will install without
svn support. If that was your error, you'll need to uninstall git-core and reinstall it
again.

If you are seeing an error like this:

    Error: org.macports.activate for port python27 returned: Image error: /Applications/MacPorts/Python 2.7/Build Applet.app/Contents/Info.plist already exists and does not belong to a registered port.  Unable to activate port python27. Use 'port -f activate python27' to force the activation.

It means you have already had a previous Python 2.7 installation running. This can happen
if you have reinstalled MacPorts. Try to remove the folder. Please make a backup beforehand.

