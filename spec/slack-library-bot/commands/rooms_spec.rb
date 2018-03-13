require 'spec_helper'

RSpec.describe SlackLibraryBot::Commands::Rooms do
  def app
    SlackRubyBot::App.new
  end

  let(:client) { app.send(:client) }
  let(:web_client) { instance_double(Slack::Web::Client) }
  let(:message_command) { SlackRubyBot::Hooks::Message.new }

  before do
    SlackRubyBot::Config.allow_message_loops = true
  end

  it 'responds to #rooms and invokes the WebClient' do
    allow(client).to receive(:self).and_return(Hashie::Mash.new('id' => 'UDEADBEEF'))
    allow(client).to receive(:web_client).and_return(web_client)
    allow(web_client).to receive(:chat_postMessage)

    message_command.call(client, Hashie::Mash.new(text: "#{SlackRubyBot.config.user} rooms",
                                                  channel: 'channel',
                                                  user: 'UDEADBEEF'))

    expect(web_client).to have_received(:chat_postMessage).with(anything)
  end
end
