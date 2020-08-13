#!/usr/local/bin/fish

docker run --rm -v $PWD:/srv/jekyll -it -p 4000:4000 jekyll/jekyll:3.8 jekyll serve --watch --trace --host 0.0.0.0 --force_polling --incremental
