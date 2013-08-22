module DataSources
  module Playup
    class SeasonBuilder

      def initialize(all_teams)
        @all_teams  = all_teams
      end

      def build_from!(playup_season, season)
        season.tap do |s|
          s.name    = name(playup_season)
          s.rounds  = rounds(playup_season)
        end
      end

      private

      def name(playup_season)
        "#{playup_season.name} 2013/14"
      end

      def rounds(playup_season)
        # TODO: check index and create or find?
        playup_season.rounds.collect do |round|
          round_bulder.build_from!(round, Round.new)
        end
      end

      def round_bulder
        @round_bulder ||= RoundBuilder.new
      end

    end
  end
end