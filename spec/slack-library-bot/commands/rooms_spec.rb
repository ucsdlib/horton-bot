require 'spec_helper'

RSpec.describe SlackLibraryBot::Commands::Rooms do
  it 'responds to -> rooms' do
    expect(message: "#{SlackRubyBot.config.user} rooms", channel: 'channel')
      .to respond_with_slack_message(anything)
  end
end
