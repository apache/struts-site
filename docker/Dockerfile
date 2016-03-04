FROM debian
MAINTAINER Lukasz Lenart <lukaszlenart@apache.org>
LABEL Description="This image is used to support building Apache Struts main website"
RUN \
  apt-get update && \
  apt-get install -y \
    make \
    gcc \
    sudo \
    netcat \
    iproute \
    net-tools \
    vim \
    bzip2 \
    git-core \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    node \
    curl && \
  apt-get clean && \

  addgroup --system --gid 1000 jekyll &&  \
  adduser --system --ingroup jekyll --uid 1000 --home /home/jekyll --disabled-password jekyll && \
  mkdir -p /srv/jekyll && \
  chown jekyll:jekyll /srv/jekyll && \
  echo "jekyll ALL=NOPASSWD:ALL" >> /etc/sudoers
ADD run-jekyll.sh /usr/bin/run-jekyll.sh
WORKDIR /srv/jekyll
EXPOSE 4000
USER jekyll
RUN \
  cd && \
  
  git clone git://github.com/sstephenson/rbenv.git .rbenv && \
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile && \
  echo 'eval "$(rbenv init -)"' >> ~/.profile && \
  . ~/.profile && \

  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.profile && \
  . ~/.profile && \

  git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash && \

  rbenv install 2.2.3 && \
  rbenv global 2.2.3 && \
  ruby -v && \
  echo "gem: --no-ri --no-rdoc" > ~/.gemrc && \

  gem clean && gem install bundler --no-document && \
  
  sudo rm -rf /usr/lib/ruby/gems/*/cache/*.gem
ENV HOME /home/jekyll
ENV PATH ${PATH}:${HOME}/.rbenv/plugins/ruby-build/bin
ENV PATH ${PATH}:${HOME}/.rbenv/bin
ENV PATH ${PATH}:${HOME}/.rbenv/shims
ENTRYPOINT ["/usr/bin/run-jekyll.sh"]
