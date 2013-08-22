module DataSources
  module Playup
    class FixtureBuilder

      def initialize(all_teams, all_rounds)
        @all_teams  = all_teams
        @all_rounds = all_rounds
      end

      def build_from!(contest, fixture)
        fixture.tap do |f|
          f.start_time    = contest.scheduled_start_time
          f.home_team     = home_team(contest)
          f.away_team     = away_team(contest)
          f.home_score    = home_score(contest)
          f.away_score    = away_score(contest)
          f.winning_team  = winning_team(contest)
          f.round         = round(contest)
        end
      end

      private

      attr_reader :all_teams, :all_rounds

      def round(contest)
        all_rounds.find do |r|
          r.number == contest.round_name.to_i
        end
      end

      def home_team(contest)
        all_teams.find do |t|
          t.name == contest.scores.first.team.name
        end
      end

      def away_team(contest)
        all_teams.find do |t|
          t.name == contest.scores.last.team.name
        end
      end

      def home_score(contest)
        contest.scores.first.total
      end

      def away_score(contest)
        contest.scores.last.total
      end

      def winning_team(contest)
        if home_score(contest) > away_score(contest)
          home_team(contest)
        elsif away_score(contest) > home_score(contest)
          away_team(contest)
        end
      end

      def away_data(contest)
        contest.scores.first
      end

    end
  end
end