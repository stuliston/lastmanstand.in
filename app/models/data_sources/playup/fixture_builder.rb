module DataSources
  module Playup
    class FixtureBuilder

      def build_from!(contest, fixture, all_teams)
        fixture.tap do |f|
          f.start_time    = contest.scheduled_start_time
          f.home_team     = home_team(contest, all_teams)
          f.away_team     = away_team(contest, all_teams)
          f.home_score    = home_score(contest)
          f.away_score    = away_score(contest)
          f.winning_team  = winning_team(contest, all_teams)
        end
      end

      private

      def home_team(contest, all_teams)
        all_teams.find do |t|
          t.name == contest.scores.first.team.name
        end
      end

      def away_team(contest, all_teams)
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

      def winning_team(contest, all_teams)
        if home_score(contest) > away_score(contest)
          home_team(contest, all_teams)
        elsif away_score(contest) > home_score(contest)
          away_team(contest, all_teams)
        end
      end

      def away_data(contest)
        contest.scores.first
      end

    end
  end
end