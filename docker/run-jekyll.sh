#!/bin/sh

bundle install
bundle exec jekyll serve --watch --trace --host=0.0.0.0
