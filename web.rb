require 'sinatra/base'

module SlackLibraryBot
  # Wrapping bot in a Sinatra app. Primarily for ease of deployment
  class Web < Sinatra::Base
    get '/' do
      'Step right up, get your library automation here!'
    end
  end
end
