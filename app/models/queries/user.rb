module Queries
  module User

    def self.deep_load(id)
      ::User.includes(#:game_memberships, :game_invitations, :predictions).find(params[:id])
        {game_memberships: [
          {game: [
            {season: [
              :competition,
              {
                rounds: {
                  fixtures: [:home_team, :away_team, :winning_team]
                }
              }
            ]}
          ]},
          :user
        ]},
        {game_invitations: [
          {game: [
            {season: [
              :competition,
              {
                rounds: {
                  fixtures: [:home_team, :away_team, :winning_team]
                }
              }
            ]}
          ]},
          :user
        ]},
        :predictions
        ).find(id)
    end
  end
end