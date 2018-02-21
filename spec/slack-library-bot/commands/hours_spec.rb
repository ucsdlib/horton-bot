require 'spec_helper'

RSpec.describe SlackLibraryBot::Commands::Hours do
  let(:daily_hours) do
    Nokogiri::HTML(File.read('spec/fixtures/daily_hours.html'))
  end

  it '#hours' do
    response = "Hi! Today's Library hours are:\n*Geisel Library Building* - 7:30 AM–Midnight\n*Biomedical Library Buildling* - 8:00 AM–Midnight\n*Audrey's Cafe* - 8:00 AM–11:00 PM\n*Special Collections & Archives* - 9:00 AM–7:00 PM\n*East Commons (Overnight Study)* - Open 24 Hours\n"

    allow(SlackLibraryBot::Helpers::DailyHours).to receive(:hours_page_data)
      .and_return(daily_hours)
    expect(message: "#{SlackRubyBot.config.user} hours", channel: 'channel')
      .to respond_with_slack_message(response)
  end
end
