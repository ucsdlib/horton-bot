module SlackLibraryBot
  module Commands
    # Respond with a listing of meeting rooms
    # This help folks find their way around the Library buildings
    class Rooms < SlackRubyBot::Commands::Base
      command 'rooms' do |client, data, _match|
        client.say(text: rooms_message,
                   channel: data.channel)
      end

      def self.rooms_message
        rooms_data = SlackLibraryBot::Web.settings.commands['rooms']
        text = "Hi! Here is a list of our meeting rooms and locations:\n"
        text << rooms_data.map do |room|
          "*#{room[:name]}* - #{room[:location]}\n"
        end.join
      end
    end
  end
end
