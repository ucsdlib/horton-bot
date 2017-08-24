require 'spec_helper'
require 'byebug'

RSpec.describe SlackLibraryBot::Commands::ServiceDesk do
  let(:sd_info) { SlackLibraryBot::Web.settings.commands['service-desk'] }

  it 'responds to -> service desk' do
    expect(message: "#{SlackRubyBot.config.user} service desk", channel: 'channel')
      .to respond_with_slack_message(sd_info)
  end

  it 'responds to -> itsd' do
    expect(message: "#{SlackRubyBot.config.user} itsd", channel: 'channel')
      .to respond_with_slack_message(sd_info)
  end
end
