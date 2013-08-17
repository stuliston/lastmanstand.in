module DataSources
  module Playup
    class RoundBuilder

      def build_from!(playup_round, round)
        round.tap do |r|
          r.number = playup_round.name.to_i
        end
      end

    end
  end
end