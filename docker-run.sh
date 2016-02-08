#!/bin/sh

docker run -v $(pwd):/srv/jekyll -it -p 4000:4000 theapachestruts/struts-site-jekyll bundle exec jekyll serve --watch --trace --host=0.0.0.0

