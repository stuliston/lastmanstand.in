module DataSources
  module Playup
    class FixtureBuilder

      def initialize(all_competition_teams)
        @all_competition_teams = all_competition_teams
      end

      def build_from!(playup_contest, fixture)
        fixture.tap do |f|
          f.start_time = playup_contest.scheduled_start_time
          f.home_team  = home_team(playup_contest)
          f.away_team  = away_team(playup_contest)
        end
      end

      private

      attr_reader :all_competition_teams

      def home_team(playup_contest)
        all_competition_teams.find do |t|
          t.name == playup_contest.scores.first.team.name
        end
      end

      def away_team(playup_contest)
        all_competition_teams.find do |t|
          t.name == playup_contest.scores.last.team.name
        end
      end

      def team_builder
        @team_builder ||= TeamBuilder.new
      end

    end
  end
end