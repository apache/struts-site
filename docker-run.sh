#!/bin/sh

docker run -v $(pwd):/srv/jekyll -t -p 4000:4000 theapachestruts/struts-site-jekyll bundle exec jekyll serve --watch

