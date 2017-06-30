module SlackLibraryBot
  # Main Bot class entry point
  class Bot < SlackRubyBot::Bot
    command 'ping' do |client, data, _match|
      client.say(text: 'pong', channel: data.channel)
    end
  end
end
