require 'spec_helper'

RSpec.describe SlackLibraryBot::Commands::Hours do
  let(:daily_hours) do
    JSON.parse(File.read('spec/fixtures/daily_hours.json'),
               symbolize_names: true)
  end

  def app
    SlackLibraryBot::Bot.instance
  end

  it '#hours' do
    response = <<~EXPECTED_RESPONSE
      Hi! Today's Library hours are:\n*Geisel Library Building* - 7:30 AM – 6:00 PM\n*Biomedical Library Buildling* - 8:00 AM – 6:00 PM\n*Audrey's Cafe* - 10:00 AM – 4:00 PM\n*Special Collections & Archives* - 9:00 AM – 5:00 PM\n*East Commons (Overnight Study)* - Closed
    EXPECTED_RESPONSE

    allow(SlackLibraryBot::Helpers::DailyHours).to receive(:hours)
      .and_return(daily_hours[:locations])
    expect(message: "#{SlackRubyBot.config.user} hours", channel: 'channel')
      .to respond_with_slack_message(response)
  end
end
