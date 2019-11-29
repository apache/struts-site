#!/bin/sh
export JEKYLL_VERSION=3.8

docker run --rm -v $PWD:/srv/jekyll -it jekyll/jekyll:$JEKYLL_VERSION jekyll build

