module Api

  class ProfilesController < ApplicationController
    respond_to :json
    authorize_resource

    before_filter :load_profile

    def index
      respond_with @profiles
    end

    def show
      respond_with @profile
    end

    def load_profile
      @profile = Profile.includes(#:game_memberships, :game_invitations, :predictions).find(params[:id])
        {game_memberships: [
          {game: [
            {season: [
              :league, 
              {
                rounds: {
                  fixtures: [:home_team, :away_team, :winning_team]
                }
              }
            ]}
          ]}, 
          :profile
        ]}, 
        {game_invitations: [
          {game: [
            {season: [
              :league,
              {
                rounds: {
                  fixtures: [:home_team, :away_team, :winning_team]
                }
              }
            ]}
          ]}, 
          :profile
        ]},
        :predictions
        ).find(params[:id])

    end

  end

end
