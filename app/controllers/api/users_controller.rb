module Api

  class UsersController < ApplicationController
    respond_to :json
    authorize_resource

    before_filter :load_user

    def index
      respond_with @users
    end

    def show
      respond_with @user
    end

    def load_user
      @user = User.includes(#:game_memberships, :game_invitations, :predictions).find(params[:id])
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
        ).find(params[:id])

    end

  end

end
