FROM ruby:2.4.4-alpine

# Maintainer
MAINTAINER "Matt Critchlow <mcritchlow@ucsd.edu">

RUN apk add --no-cache build-base git openssh-client

# Trick to copy in Gemfile before other files.
# This way bundle install step only runs again if THOSE files change
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install --jobs 4 --retry 3
COPY . /usr/src/app/
