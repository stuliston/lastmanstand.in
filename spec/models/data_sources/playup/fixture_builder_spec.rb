require 'spec_helper'

module DataSources
  module Playup
    describe FixtureBuilder do

      # t.integer  "home_team_id"
      # t.integer  "away_team_id"
      # t.integer  "winning_team_id"
      # t.datetime "start_time"
      # t.datetime "created_at"
      # t.datetime "updated_at"
      # t.integer  "round_id"
      # t.integer  "home_score"
      # t.integer  "away_score"

      describe '.build_from!' do

        it 'builds the home team' do

        end

      end

      def self.build_from!(contest, fixture)
        fixture.home_team = Team.find_or_initialize_by(name: contest.)
      end

    end
  end
end