require 'spec_helper'

module Playup
  describe FixtureImportService do

    describe '#import!' do

      it 'populates the database with the current known fixutres' do
        epl = Competition.new(name: 'Premier League')
        importer = FixtureImportService.new(epl)
        importer.import!
        binding.pry
        expect(epl.rounds.count).to eq 34
      end
    end

  end
end