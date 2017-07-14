require 'json'
require 'nokogiri'
require 'open-uri'
require 'watir'

module SlackLibraryBot
  module Helpers
    # Pulls Hours data from the public website directly
    # This was done because:
    # 1. there is no daily hours json feed
    # 2. recreating this data would be duplicating much effort
    #
    # Since this is slower, we're caching the data for each day
    class DailyHours
      LOCATIONS = { 'lpw-hours-glb' => 'Geisel Library Building',
                    'lpw-hours-blb' => 'Biomedical Library Buildling',
                    'lpw-hours-aud' => 'Audrey\'s Cafe',
                    'lpw-hours-sca' => 'Special Collections & Archives',
                    'lpw-hours-gsc' => 'East Commons (Overnight Study)' }.freeze
      LOCAL_HOURS_FILE = 'daily_hours.json'.freeze
      LIBRARY_WEBSITE = 'https://library.ucsd.edu'.freeze

      # TODO: figure out how to test this.. vcr? mocks?
      # TODO: add phantomjs to circle config (see horton/dmr)
      def self.hours
        today = Date.today
        return create_hours_file(today) unless File.exist? LOCAL_HOURS_FILE

        file = JSON.parse(File.read(LOCAL_HOURS_FILE), symbolize_names: true)
        return file[:locations] if valid_date?(today, file)

        create_hours_file(today)
      end

      class << self
        private

        def valid_date?(today, file)
          String(today).eql?(String(file[:today]))
        end

        def create_hours_file(today)
          hours = scrape_website(today)
          File.open(LOCAL_HOURS_FILE, 'w') do |file|
            file.write(JSON.generate(hours))
          end
          hours[:locations]
        end

        def scrape_website(today)
          data = { today: String(today) }
          doc = Nokogiri::HTML(public_website_html)
          data[:locations] = LOCATIONS.map do |id, name|
            { name: name, hours: doc.css("li##{id} div").text }
          end
          data
        end

        def public_website_html
          browser = Watir::Browser.new :phantomjs
          browser.goto LIBRARY_WEBSITE
          browser.html
        end
      end
    end
  end
end
