module SlackLibraryBot
  class Server < SlackRubyBot::Server
    on 'channel_created' do |client, data|
      # general_channel = 'C04RMMCGX' general channel
      general_channel = 'C62EZ1LLC' # bot-testing channel

      new_channel_info = <<~CHANNEL_INFO
        Hi! <@#{data['channel']['creator']}> just created a new :slack: channel
        Check it out :point_right: <##{data['channel']['id']}>
      CHANNEL_INFO

      # TODO: this isn't populated. why?
      if data['channel']['purpose']
        new_channel_info << "\n Purpose: #{data['channel']['purpose']}"
      end

      client.say(channel: general_channel, text: new_channel_info)
    end
  end
end
