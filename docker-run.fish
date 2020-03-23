#!/usr/local/bin/fish

docker run --rm -v $PWD:/srv/jekyll -it jekyll/jekyll:3.8 jekyll serve --watch --trace --force_polling --incremental
