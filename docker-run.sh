#!/bin/sh
export JEKYLL_VERSION=3.8

docker run --rm -v $PWD:/srv/jekyll -it -p 4000:4000 jekyll/jekyll:$JEKYLL_VERSION jekyll serve --watch --trace --host 0.0.0.0 --force_polling --incremental

