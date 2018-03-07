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

    on 'team_join' do |client, data|
      im_channel_id = slack_im_open!(data['user']['id'])
      client.say(text: SlackLibraryBot::Web.settings.commands['new-user'],
                 channel: im_channel_id)
    end

    # Get the bot's Slack API client
    def self.slack_client
      @slack_client ||= ::Slack::Web::Client.new(token: ENV['SLACK_API_TOKEN'])
    end

    # returns the channel id of an open IM channel
    def self.slack_im_open!(user_slack_id)
      @im_opens ||= {}
      return @im_opens[user_slack_id] if @im_opens[user_slack_id]

      begin
        im = slack_client.im_open(user: user_slack_id)
        im_channel_id = im && im['channel'] && im['channel']['id']
        return @im_opens[user_slack_id] = im_channel_id
      rescue Slack::Web::Api::Errors::SlackError => err
        STDERR.puts err.to_s
        return nil
      end
    end
  end
end
