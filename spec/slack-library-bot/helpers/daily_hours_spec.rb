require 'spec_helper'
RSpec.describe SlackLibraryBot::Helpers::DailyHours do
  def write_cached_file
    FileUtils.cp('spec/fixtures/daily_hours.json', 'daily_hours.json')
  end

  def delete_cached_file
    File.delete('daily_hours.json') if File.exist?('daily_hours.json')
  end

  describe '#hours' do
    let(:daily_hours) do
      JSON.parse(File.read('spec/fixtures/daily_hours.json'),
                 symbolize_names: true)
    end

    before :all do
      delete_cached_file
    end
    after :all do
      Timecop.return
      delete_cached_file
    end

    context 'no cached hours file exists' do
      before do
        Timecop.freeze(Date.new(2017, 7, 13))
      end
      after do
        Timecop.return
      end

      it 'creates a cached hours file' do
        VCR.use_cassette('public_website', record: :none) do
          expect(described_class.hours).to eq(daily_hours[:locations])
        end
      end
    end

    context 'cached hours file exists' do
      before do
        write_cached_file
      end
      after do
        Timecop.return
      end

      it 'loads a cached file if valid' do
        Timecop.freeze(Date.new(2017, 7, 13))
        expect(described_class).to receive(:valid_date?).and_return(true)
        expect(described_class.hours).to eq(daily_hours[:locations])
      end

      it 'creates a new cached file if invalid' do
        Timecop.freeze(Date.new(2017, 7, 14))
        allow(described_class).to receive(:create_hours_file).and_return('called')
        expect(described_class).to receive(:valid_date?).and_return(false)
        expect(described_class).to receive(:create_hours_file)
        expect(described_class.hours).to eq('called')
      end
    end
  end
end
