module SlackLibraryBot
  class Server < SlackRubyBot::Server
    on 'channel_created' do |client, data|
      GENERAL_CHANNEL = 'C04RMMCGX'
      response =
        "Hi! A new channel was just created: <##{data['channel']['id']}|#{data['channel']['name']}>"
      client.say(channel: GENERAL_CHANNEL, text: response)
      # client.say(channel: 'C62EZ1LLC', text: response)
    end
  end
end
