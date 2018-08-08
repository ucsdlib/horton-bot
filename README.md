# Theodor
[![Coverage
Status](https://coveralls.io/repos/github/ucsdlib/theodor/badge.svg?branch=develop)](https://coveralls.io/github/ucsdlib/theodor?branch=develop) [![CircleCI](https://circleci.com/gh/ucsdlib/theodor/tree/develop.svg?style=svg)](https://circleci.com/gh/ucsdlib/theodor/tree/develop)

A happy and wise Slack-bot for the UCSD Library

<img title="Theodor the wise owl" src="assets/dewey.png" width="200">

## What can it do?

### Events
1. The bot will post to the `#general` channel when a new channel is created.
1. The bot will welcome a new user to the team with a customized welcome message

### Commands
1. `hours` - responds with Library building(s) hours for the day
1. `service desk` - responds with options for contacting the service desk

In time, assuming interest, additional bot-like features will be added.

## Installing (docker)
1. Clone the repo: `git clone https://github.com/ucsdlib/theodor.git`
1. Build image: `docker build -t theodor .`

Run rubocop or tests:
1. `docker run --rm theodor bundle exec rubocop`
1. `docker run --rm theodor bundle exec rake`

## Installing (traditional)
1. Clone the repo: `git clone https://github.com/ucsdlib/theodor.git`
1. Install dependencies: `bundle install`
1. Run test suite `rake`. This will also run `rubocop` in addition to `rspec`
1. Run application `SLACK_API_TOKEN=<your-token> bundle exec puma`
