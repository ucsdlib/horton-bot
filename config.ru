$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack_library_bot'
require 'web'

SlackRubyBot::Client.logger.level = Logger::WARN

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackLibraryBot::Bot.run
  rescue StandardError => e
    warn "ERROR: #{e}"
    warn e.backtrace
    raise e
  end
end

run SlackLibraryBot::Web
