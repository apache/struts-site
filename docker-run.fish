#!/usr/local/bin/fish
docker run -v $PWD:/srv/jekyll -it -p 4000:4000 theapachestruts/struts-site-jekyll bundle exec jekyll serve --watch
