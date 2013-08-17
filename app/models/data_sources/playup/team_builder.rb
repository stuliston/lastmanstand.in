module DataSources
  module Playup
    class TeamBuilder

      def build_from!(playup_team, team)
        team.name = playup_team.name
        team.abbreviated_name = playup_team.short_name
        team
      end

    end
  end
end