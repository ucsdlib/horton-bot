require 'spec_helper'
require 'json'

RSpec.describe SlackLibraryBot::Server do
  def app
    SlackLibraryBot::Bot.instance
  end

  let(:channel_data) { JSON.parse(File.read('spec/fixtures/channel_created.json')) }
  let(:team_join_data) { JSON.parse(File.read('spec/fixtures/team_join.json')) }

  describe 'register custom hooks' do
    it 'has a channel_created hook' do
      expect(app.hooks.handlers).to have_key('channel_created')
    end
    it 'has a team_join hook' do
      expect(app.hooks.handlers).to have_key('team_join')
    end
  end

  describe '#channel_created' do
    it 'client receives #say to notify channel' do
      client = instance_double('SlackRubyBot::Client')
      general_channel = SlackLibraryBot::Web.settings.channels['general']
      channel_message = "Hi! <@U024BE7LH> just created a new :slack: channel\n"\
                        "Check it out :point_right: <#C024BE91L>\n"

      allow(client).to receive(:say)
      app.hook_blocks['channel_created'].first.call(client, channel_data)
      expect(client).to have_received(:say).with(channel: general_channel,
                                                 text: channel_message)
    end
  end

  describe '#team_join' do
    it 'client receives #say to notify new user' do
      client = instance_double('SlackRubyBot::Client')
      user_dm_channel_id = 'D07519J57'

      allow(described_class).to receive(:slack_im_open!).and_return(user_dm_channel_id)
      allow(client).to receive(:say)
      app.hook_blocks['team_join'].first.call(client, team_join_data)
      expect(client).to have_received(:say).with(channel: user_dm_channel_id,
                                                 text: anything)
    end
  end
end
