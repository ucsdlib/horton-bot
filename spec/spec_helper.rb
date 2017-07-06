ENV['SLACK_API_TOKEN'] = 'token'
ENV['RACK_ENV'] = 'test'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
require 'simplecov'
require 'rack/test'
require 'rspec'
require 'slack-ruby-bot/rspec'
require 'slack_library_bot'
require 'web'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start
