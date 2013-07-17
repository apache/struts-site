#!/bin/sh

# This script is used to periodically update Development version of docs - Draft docs

# Grab docs from Confluence
mvn clean package -Pupdate-draft-docs

# The docs are available here http://struts.apache.org/development/2.x/docs/
svn co https://svn.apache.org/repos/infra/websites/production/struts/content/development/2.x/docs target/struts2-draft-docs --no-auth-cache

# Remove the old docs
rm -R target/struts2-draft-docs/*

# Move the new docs
mv target/cwiki/WW/docs/* target/struts2-draft-docs/

cd target/struts2-draft-docs

touch PLACEHOLDER

# Check for changes
DIFF=`svn status`
if [ -n "$DIFF" ]; then
    # echo "Changes detected - add and commit"
    # Add all the file
    svn add ./ --force
    # Remove already removed files
    svn status | grep '^\!' | sed 's/! *//' | awk 'BEGIN {FS="\t"};{print "\""$1"\""}' | xargs svn del --force
    # Commit changes
    svn commit -m "Updates draft docs" --no-auth-cache
fi

cd ../..

# Cleanup
mvn clean

# echo "Success!"
