#!/bin/sh
export JEKYLL_VERSION=4.2.2

docker run --rm -v $PWD:/srv/jekyll -it jekyll/builder:$JEKYLL_VERSION jekyll build

