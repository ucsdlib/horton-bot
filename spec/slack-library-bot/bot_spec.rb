require 'spec_helper'

RSpec.describe SlackLibraryBot::Bot do
  def app
    SlackLibraryBot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'
end
