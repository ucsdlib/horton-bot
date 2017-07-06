require 'sinatra/base'
require 'sinatra/config_file'

module SlackLibraryBot
  # Wrapping bot in a Sinatra app. Primarily for ease of deployment
  class Web < Sinatra::Base
    register Sinatra::ConfigFile

    config_file 'config/settings.yml'

    get '/' do
      'Step right up, get your library automation here!'
    end
  end
end
