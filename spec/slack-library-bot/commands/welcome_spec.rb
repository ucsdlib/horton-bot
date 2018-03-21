require 'spec_helper'

RSpec.describe SlackLibraryBot::Commands::ServiceDesk do
  let(:welcome_info) { SlackLibraryBot::Web.settings.commands['new-user'] }

  it 'responds to -> welcome' do
    expect(message: "#{SlackRubyBot.config.user} welcome", channel: 'channel')
      .to respond_with_slack_message(welcome_info)
  end
end
