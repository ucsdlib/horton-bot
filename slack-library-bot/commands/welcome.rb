module SlackLibraryBot
  module Commands
    # Print on-demand welcome information
    # This is largely for testing purposes
    # The primary need for this feature is when new ysers join the organization
    class Welcome < SlackRubyBot::Commands::Base
      command 'welcome' do |client, data, _match|
        client.say(text: SlackLibraryBot::Web.settings.commands['new-user'],
                   channel: data.channel)
      end
    end
  end
end
