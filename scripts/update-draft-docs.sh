#!/bin/sh

# This script is used to periodically update Development version of docs - Draft docs
# The docs are available here http://struts.apache.org/development/2.x/docs/

svn co https://svn.apache.org/repos/infra/websites/production/struts/content/development/2.x/docs struts2-draft-docs --no-auth-cache

# Grab docs from Confluence
wget -erobots=off -nH -nv -E -L --directory-prefix=cwiki --no-check-certificate -r https://cwiki.apache.org/WW/

# Remove the old docs
rm -R struts2-draft-docs/*

# Move the new docs
mv cwiki/WW/* struts2-draft-docs/

cd struts2-draft-docs

touch PLACEHOLDER

# Check for changes
DIFF=`svn status`
if [ -n "$DIFF" ]; then
    # echo "Changes detected - add and commit"
    # Add all the file
    svn add ./ --force
    # Commit changes
    svn commit -m "Updates draft docs" --no-auth-cache
fi

cd ..

# Cleanup
rm -R struts2-draft-docs
rm -R cwiki

# echo "Success!"
