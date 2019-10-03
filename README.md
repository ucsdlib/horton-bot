# Theodor
[![Coverage Status](https://coveralls.io/repos/github/ucsdlib/theodor/badge.svg?branch=master)](https://coveralls.io/github/ucsdlib/theodor?branch=master)
[![CircleCI](https://circleci.com/gh/ucsdlib/theodor/tree/master.svg?style=svg)](https://circleci.com/gh/ucsdlib/theodor/tree/master)
[![Docker Build Status](https://img.shields.io/docker/build/ucsdlib/theodor.svg)](https://hub.docker.com/r/ucsdlib/theodor/builds/)


A happy and wise Slack-bot for the UCSD Library, or so we've been told.

<img title="Theodor the wise owl" src="assets/dewey.png" width="200">

## What can it do?

### Events
1. The bot will post to the `#general` channel when a new channel is created.
1. The bot will welcome a new user to the team with a customized welcome message

### Commands
1. `hours` - responds with Library building(s) hours for the day
1. `service desk` - responds with options for contacting the service desk

In time, assuming interest, additional bot-like features will be added.

## API Token
The Slack bot requires an API token to connect to the Slack API.

We have a production token which should only be used for production. If you need
to test new features locally, you can use the `theodor-test` API token.

Note that this account is invited into the `bot-testing` channel.

This token can be found in Slack directly or in LastPass.

## Installing (docker)
1. Clone the repo: `git clone https://github.com/ucsdlib/theodor.git`
1. Build image: `docker build -t theodor .`
1. Run image: `docker run --rm -e "SLACK_API_TOKEN=<test-token>" theodor`

Run rubocop or tests:
1. `docker run --rm theodor bundle exec rubocop`
1. `docker run --rm theodor bundle exec rake`

## Installing (traditional)
1. Clone the repo: `git clone https://github.com/ucsdlib/theodor.git`
1. Install dependencies: `bundle install`
1. Run test suite `rake`. This will also run `rubocop` in addition to `rspec`
1. Run application `SLACK_API_TOKEN=<test-token> bundle exec puma`

## Kubernetes Deploy
Install Dependencies:
  - [k3d][k3d] (allows running a [k3s][k3s] cluster locally inside Docker containers)
  - Docker, Helm, and kubectl (other required dependencies)

1. Run the `./k3d-theodor.sh <api-token>` script, ensuring to pass the test API token as a
   parameter
1. You can navigate to the `bot-testing` channel to interact w/ the
   `theodor-test` bot instance, or directly via DM

[k3d]:https://github.com/rancher/k3d/
[k3s]:https://github.com/rancher/k3s/
