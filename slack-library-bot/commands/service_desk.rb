module SlackLibraryBot
  module Commands
    # Basic ping/pong command, as an example for adding future commands
    class ServiceDesk < SlackRubyBot::Commands::Base
      command 'service desk'
      command 'itsd'

      # command 'service desk' do |client, data, _match|
      def self.call(client, data, _match)
        client.say(text: SlackLibraryBot::Web.settings.commands['service-desk'],
                   channel: data.channel)
      end
    end
  end
end
