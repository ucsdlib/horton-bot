module SlackLibraryBot
  module Commands
    # Provide hours information for each library building
    # Scope: Current Day
    class Hours < SlackRubyBot::Commands::Base
      command 'hours' do |client, data, _match|
        text = "Hi! Today's Library hours are:\n"
        text << SlackLibraryBot::Helpers::DailyHours.hours.map do |location|
          "*#{location[:name]}* - #{location[:hours]}\n"
        end.join

        client.say(channel: data.channel, text: text)
      end
    end
  end
end
