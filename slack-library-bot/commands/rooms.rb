module SlackLibraryBot
  module Commands
    # Respond with a listing of meeting rooms
    # This help folks find their way around the Library buildings
    class Rooms < SlackRubyBot::Commands::Base
      command 'rooms' do |client, data, _match|
        client.web_client.chat_postMessage(
          channel: data.channel,
          as_user: true,
          attachments: [
            {
              author_name: 'More information',
              pretext: rooms_message,
              title: 'Meeting Rooms, Conference Rooms, and Classrooms',
              title_link: 'https://lisn.ucsd.edu/pages/viewpage.action?pageId=41914586',
              text: more_info,
              color: 'good'
            }
          ]
        )
      end

      def self.more_info
        ':information_source: This page on LiSN contains additional'\
        ' information about former names, administrative contacts,'\
        ' phone extension, seating capacity, and room technology.'
      end

      def self.rooms_message
        rooms_data = SlackLibraryBot::Web.settings.commands['rooms']
        text = "Hi! Here is a list of our meeting rooms and locations:\n\n"
        text << rooms_data.map do |room|
          "*#{room[:name]}* - #{room[:location]}\n"
        end.join
      end
    end
  end
end
