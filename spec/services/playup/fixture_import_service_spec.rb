require 'spec_helper'

module Playup
  describe FixtureImportService do

    describe '#import!' do

      it 'populates the database with the current known fixutres' do
        current_season = Season.new(name: '2013-14')
        epl = Competition.new(name: 'Premier League', season: season)

        importer = FixtureImportService.new(epl)
        importer.import!

        binding.pry
        expect(epl.rounds.count).to eq 34
      end
    end

  end
end