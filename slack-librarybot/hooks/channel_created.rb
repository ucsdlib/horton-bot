module SlackLibraryBot
  module Hooks
    # This class responds to the Slack Real Time API channel_created event
    # We want to let users know about new channels, so we post them to #general
    class ChannelCreated
      # TODO
      # 1. confirm JSON is sent and parsed as expected
      # 2. want to display "Hey, a new channel was created #{name}" should be linked
      # 2.1 Either "Topic is: #{channel.topic}" (need to lookup channel topic by ID?
      def call(client, data)
        # data['channel']['id'] channel ID
        # data['channel']['name'] channel name
        # data['channel']['created'] channel created date?
        # data['channel']['creator'] user id
        # "channel": {
        #         "id": "C024BE91L",
        #               "name": "fun",
        #                     "created": 1360782804,
        #                           "creator": "U024BE7LH"
        # }

        client.say(channel: 'bot-testing', text: channel_information(data))
      end

      private

      def channel_information(data)
        "Hi! A new topic was just created: #{data['channel']['name']}"
      end
    end
  end
end
