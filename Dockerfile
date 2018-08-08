FROM ruby:2.4.4-alpine
# Maintainer
MAINTAINER "Matt Critchlow <mcritchlow@ucsd.edu">

RUN apk add --no-cache build-base git openssh-client

RUN addgroup -g 1000 -S theodor && \
    adduser -u 1000 -S theodor -G theodor
USER theodor

RUN mkdir /home/theodor/app
# Trick to copy in Gemfile before other files.
# This way bundle install step only runs again if THOSE files change
COPY --chown=theodor:theodor Gemfile* /home/theodor/app/

WORKDIR /home/theodor/app
RUN bundle install --jobs 4 --retry 3
COPY --chown=theodor:theodor . /home/theodor/app/

# TODO: enable this once ENV for token is sorted
# CMD ['bundle', 'exec', 'puma']
