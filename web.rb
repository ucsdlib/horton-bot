require 'sinatra/base'

module SlackLibraryBot
  class Web < Sinatra::Base
    get '/' do
      'Step right up, get your library automation here!'
    end
  end
end
