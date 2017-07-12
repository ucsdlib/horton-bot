module SlackLibraryBot
  module Commands
    # We're overriding the default help/about/hi output, as it contains upstream information.
    # This would confuse our local users.
    class About < SlackRubyBot::Commands::Base
      command 'about', 'hi', 'help' do |client, data, _match|
        client.say(channel: data.channel,
                   text: SlackLibraryBot::Web.settings.help['general'])
      end
    end
  end
end
