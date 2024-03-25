#!/bin/sh

docker run --rm -v "$PWD:/var/jekyll" -p 4000:4000 -it mrxder/jekyll-docker-arm64:latest jekyll serve --host=0.0.0.0 --incremental
