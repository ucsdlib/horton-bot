require 'json'
require 'nokogiri'
require 'open-uri'

module SlackLibraryBot
  module Helpers
    # Load static html page for today's hours.
    # Only requirement is to pass in the year:
    # Example: https://library.ucsd.edu/hours/bot/2018.html
    class DailyHours
      LOCATIONS = { 'loc-glb' => 'Geisel Library Building',
                    'loc-blb' => 'Biomedical Library Buildling',
                    'loc-ac' => 'Audrey\'s Cafe',
                    'loc-sc' => 'Special Collections & Archives',
                    'loc-gsfe' => 'East Commons (Overnight Study)' }.freeze
      LIBRARY_HOURS_BASE = 'https://library.ucsd.edu/hours/bot/'.freeze

      def self.hours
        scrape_hours_page
      end

      class << self
        private

        def scrape_hours_page
          doc = hours_page_data
          data = LOCATIONS.map do |id, name|
            { name: name, hours: doc.css("li##{id} div.hours").text }
          end
          data
        end

        def hours_page_data
          Nokogiri::HTML(open(hours_static_page))
        end

        def hours_static_page
          LIBRARY_HOURS_BASE + String(Date.today.year) + '.html'
        end
      end
    end
  end
end
