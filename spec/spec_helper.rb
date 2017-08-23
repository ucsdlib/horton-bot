ENV['SLACK_API_TOKEN'] = 'token'
ENV['RACK_ENV'] = 'test'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
require 'coveralls'
require 'rack/test'
require 'rspec'
require 'simplecov'
require 'vcr'
require 'slack-ruby-bot/rspec'
require 'slack_library_bot'
require 'timecop'
require 'web'
require 'webmock/rspec'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start
