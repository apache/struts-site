FROM jekyll/builder:4.2.2

USER 910

ENV GEM_HOME="$WORKSPACE/.gems"
ENV PATH="$GEM_HOME/bin:$PATH"
ENV BUNDLE_USER_HOME="$WORKSPACE/.bundle"

RUN bundle config set --local path $GEM_HOME
