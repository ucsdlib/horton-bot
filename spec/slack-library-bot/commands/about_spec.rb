require 'spec_helper'
require 'byebug'

RSpec.describe SlackLibraryBot::Commands::About do
  let(:general_help_information) { SlackLibraryBot::Web.settings.help['general'] }

  def app
    SlackLibraryBot::Bot.instance
  end

  it 'responds to help with general information ' do
    expect(message: "#{SlackRubyBot.config.user} help", channel: 'channel')
      .to respond_with_slack_message(general_help_information)
  end
  it 'responds to about with general information ' do
    expect(message: "#{SlackRubyBot.config.user} about", channel: 'channel')
      .to respond_with_slack_message(general_help_information)
  end
  it 'responds to hi with general information ' do
    expect(message: "#{SlackRubyBot.config.user} hi", channel: 'channel')
      .to respond_with_slack_message(general_help_information)
  end
end
