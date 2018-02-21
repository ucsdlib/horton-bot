module SlackLibraryBot
  module Commands
    # Basic ping/pong command, as an example for adding future commands
    class Welcome < SlackRubyBot::Commands::Base
      command 'welcome'

      # command 'service desk' do |client, data, _match|
      def self.call(client, data, _match)
        client.say(text: SlackLibraryBot::Web.settings.commands['new-user'],
                   channel: data.channel)
      end
    end
  end
end
