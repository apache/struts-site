FROM alpine
MAINTAINER Lukasz Lenart <lukaszlenart@apache.org>
LABEL Description="This image is used to support building Apache Struts main website"
RUN \
  apk update && \
  apk upgrade && \
  apk add bash sudo curl-dev ruby-dev build-base libffi-dev && \
  apk add ruby ruby-io-console ruby-bundler nodejs && \
  gem clean && gem install bundler io-console --pre --no-document && \
  sudo rm -rf /usr/lib/ruby/gems/*/cache/*.gem && \
  rm -rf /var/cache/apk/* && \
  addgroup -S -g 1000 jekyll && \
  adduser -S -G jekyll -u 1000 -h /home/jekyll -D jekyll && \
  mkdir -p /srv/jekyll && \
  chown jekyll:jekyll /srv/jekyll && \
  echo "jekyll ALL=NOPASSWD:ALL" >> /etc/sudoers

EXPOSE 4000
WORKDIR /srv/jekyll
USER jekyll
ENTRYPOINT bundle install && bundle exec jekyll build && bundle exec jekyll serve --watch --trace --host=0.0.0.0 --force_polling --incremental
