module DataSources
  module Playup
    class TeamBuilder

      def build_from!(playup_team, team)
        team.tap do |t|
          t.name = playup_team.name
          t.abbreviated_name = playup_team.short_name
        end
      end

    end
  end
end