require 'spec_helper'

describe SlackLibraryBot::Bot do
  def app
    SlackLibraryBot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'
end
