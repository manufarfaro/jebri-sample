FROM ruby:2.3.0-alpine

# Update and install base packages
RUN apk update && apk upgrade && apk add curl wget bash

RUN apk add --no-cache libgcc \
                       libpq \
                       libffi-dev \
                       postgresql-dev \
                       g++ \
                       libstdc++ \
                       paxctl \
                       python \
                       nodejs \
                       vim \
                       postgresql-client


RUN echo '{ "allow_root": true }' > /root/.bowerrc

RUN npm install -g bower bcrypt

RUN mkdir -p /usr/src/jebri-sample
WORKDIR /usr/src/jebri-sample

COPY . ./

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5 --without development test

RUN bower install --allow-root

RUN bundle exec rake assets:precompile

VOLUME /usr/src/jebri-sample/public

# Start puma
CMD bundle exec puma -C config/puma.rb

