require 'bundler/setup'
require 'coveralls/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Coveralls::RakeTask.new
RSpec::Core::RakeTask.new(:spec)

desc 'Run Rubocop style linter'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.requires << 'rubocop-rspec'
  task.fail_on_error = true
end
# task default: %w[rubocop spec]

task default: %w[spec]
