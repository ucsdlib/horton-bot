$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack_library_bot'
require 'web'
require 'syslogger'

# Will send all messages to the local7 facility, adding the process id in the message
SlackRubyBot::Client.logger = Syslogger.new('dewey', Syslog::LOG_PID, Syslog::LOG_LOCAL7)
SlackRubyBot::Client.logger.level = Logger::WARN

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackLibraryBot::Bot.run
  rescue StandardError => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackLibraryBot::Web
