$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
require 'simplecov'
require 'rack/test'
require 'rspec'
require 'slack-ruby-bot/rspec'
require 'slack_library_bot'
require 'coveralls'

ENV['RACK_ENV'] = 'test'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start
