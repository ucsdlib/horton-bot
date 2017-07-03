module SlackLibraryBot
  module Commands
    class Ping < SlackRubyBot::Commands::Base
      command 'ping' do |client, data, _match|
        client.say(text: 'pong', channel: data.channel)
      end
    end
  end
end
