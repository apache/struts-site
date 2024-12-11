#!/bin/sh

rm Gemfile.lock

docker build -t struts-jekyll .
docker run --rm -v "$PWD:/var/jekyll" -p 4000:4000 -it struts-jekyll
