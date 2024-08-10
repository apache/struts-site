FROM ruby:2.5.0

WORKDIR /var/jekyll

COPY . .

RUN gem install bundler -v '2.3.23'
RUN bundle install

CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0", "--incremental"]

EXPOSE 4000