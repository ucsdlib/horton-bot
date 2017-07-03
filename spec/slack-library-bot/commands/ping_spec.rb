require 'spec_helper'

describe SlackLibraryBot::Commands::Ping do
  def app
    SlackLibraryBot::Bot.instance
  end

  it 'returns pong' do
    expect(message: "#{SlackRubyBot.config.user} ping", channel: 'channel')
      .to respond_with_slack_message('pong')
  end
end
