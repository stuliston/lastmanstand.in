module DataSources
  module Playup
    class RoundBuilder

      def build_from!(playup_round, round)
        round.number = playup_round.name.to_i
        round
      end

    end
  end
end