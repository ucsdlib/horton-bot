require 'spec_helper'
require 'byebug'
require 'json'

RSpec.describe SlackLibraryBot::Server do
  def app
    SlackLibraryBot::Bot.instance
  end

  let(:data) { JSON.parse(File.read('spec/fixtures/channel_created.json')) }

  describe 'register custom hooks' do
    it 'has a channel_created hook' do
      expect(app.hooks.handlers).to have_key('channel_created')
    end
  end

  describe '#channel_created' do
    it 'client receives #say to notify channel' do
      client = instance_double('SlackRubyBot::Client')
      channel_message = "Hi! <@U024BE7LH> just created a new :slack: channel\n"\
                        "Check it out :point_right: <#C024BE91L>\n"
      allow(client).to receive(:say)
      app.hook_blocks['channel_created'].first.call(client, data)
      expect(client).to have_received(:say).with(channel: 'C04RMMCGX',
                                                 text: channel_message)
    end
  end
end
