FROM ruby:2.6.2

ENV APP_ROOT /usr/src/drone-exercise

WORKDIR $APP_ROOT
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs \
    zlib1g-dev libxml2-dev libxslt-dev

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \
  gem update --system && \
  gem update bundler && \
  bundle config --global build.nokogiri --use-system-libraries && \
  bundle config --global jobs 4 && \
  bundle install && \
  rm -rf ~/.gem

EXPOSE 3001
CMD bash -c "bundle exec rails s -p 3000 -b 0.0.0.0"
