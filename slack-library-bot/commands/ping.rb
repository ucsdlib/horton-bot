module SlackLibraryBot
  module Commands
    # Basic ping/pong command, as an example for adding future commands
    class Ping < SlackRubyBot::Commands::Base
      command 'ping' do |client, data, _match|
        client.say(text: 'pong', channel: data.channel)
      end
    end
  end
end
