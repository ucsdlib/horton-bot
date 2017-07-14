ENV['SLACK_API_TOKEN'] = 'token'
ENV['RACK_ENV'] = 'test'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
require 'coveralls'
require 'rack/test'
require 'rspec'
require 'simplecov'
require 'slack-ruby-bot/rspec'
require 'slack_library_bot'
require 'timecop'
require 'vcr'
require 'web'
require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.ignore_localhost = true
  c.configure_rspec_metadata!
end

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start
