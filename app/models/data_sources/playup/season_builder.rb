module DataSources
  module Playup
    class SeasonBuilder

      def build_from!(playup_season, season)
        season.tap do |s|
          s.name       = name(playup_season)
          s.start_date = Date.parse(playup_season.rounds.items.first.start_date)
          s.end_date   = Date.parse(playup_season.rounds.items.last.end_date)
        end
      end

      private

      def name(playup_season)
        "#{playup_season.name} 2013/14"
      end

    end
  end
end