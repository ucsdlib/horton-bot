# frozen_string_literal: true

module SlackLibraryBot
  # Server will primarily be responsible for interacting with
  # events from the real-time Slack API
  class Server < SlackRubyBot::Server
    on 'channel_created' do |client, data|
      new_channel_info = <<~CHANNEL_INFO
        Hi! <@#{data['channel']['creator']}> just created a new :slack: channel
        Check it out :point_right: <##{data['channel']['id']}>
      CHANNEL_INFO

      client.say(channel: SlackLibraryBot::Web.settings.channels['general'],
                 text: new_channel_info)
    end
  end
end
