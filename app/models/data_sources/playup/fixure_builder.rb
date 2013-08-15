module DataSources
  module Playup
    class FixtureBuilder

      # t.integer  "home_team_id"
      # t.integer  "away_team_id"
      # t.integer  "winning_team_id"
      # t.datetime "start_time"
      # t.datetime "created_at"
      # t.datetime "updated_at"
      # t.integer  "round_id"
      # t.integer  "home_score"
      # t.integer  "away_score"

      def build_from!(contest, fixture = Fixture.new)
        fixture.tap do |f|
          f.home_team = Team.find_or_initialize_by(name: home_team_name(contest))
          f.away_team = Team.find_or_initialize_by(name: away_team_name(contest))
          #f.winning_team =
        end
      end

      private

      def home_team_name(contest)
        contest.title.split(' vs ').first
      end

      def away_team_name(contest)
        contest.title.split(' vs ').last
      end

      def winning_team(contest)

      end

    end
  end
end