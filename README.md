# Dewey
[![Coverage
Status](https://coveralls.io/repos/github/ucsdlib/dewey/badge.svg?branch=develop)](https://coveralls.io/github/ucsdlib/dewey?branch=develop) [![CircleCI](https://circleci.com/gh/ucsdlib/dewey/tree/develop.svg?style=svg)](https://circleci.com/gh/ucsdlib/dewey/tree/develop) [![Dependency Status](https://gemnasium.com/badges/github.com/ucsdlib/dewey.svg)](https://gemnasium.com/github.com/ucsdlib/dewey)

A happy and wise Slack-bot for the UCSD Library

<img title="Dewey the wise owl" src="assets/dewey.png" width="200">

## What can it do?

1. For now, the bot will post to the `#general` channel when a new channel is created.
2. `hours` - responds with Library building(s) hours for the day
3. `service desk` - responds with options for contacting the service desk

In time, assuming interest, additional bot-like features will be added.

## Installing

1. Clone the repo: `git clone https://github.com/ucsdlib/dewey.git`
2. Install dependencies: `bundle install`
3. Install [phantomjs](http://phantomjs.org/). Used for `hours` command
4. Run test suite `rake`. This will also run `rubocop` in addition to `rspec`
5. Run application `SLACK_API_TOKEN=<your-token> bundle exec puma`
