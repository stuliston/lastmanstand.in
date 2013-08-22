require 'spec_helper'

module Playup
  describe FixtureImportService do

    describe '#import!' do

      it 'populates the database with the current known fixutres' do
        epl = Competition.create(name: 'Premier League')

        importer = FixtureImportService.new

        # Should be idempotent
        2.times { importer.import_fixtures_for(epl) }

        binding.pry

        expect(epl.teams.count).to eq 23
        expect(epl.seasons.count).to eq 1
        expect(epl.current_season.rounds.count).to eq 34
        expect(epl.current_season.rounds.first.fixtures.count).to eq 11
      end
    end

  end
end