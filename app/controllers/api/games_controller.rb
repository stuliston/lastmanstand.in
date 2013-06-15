module Api

  class GamesController < ApplicationController
    respond_to :json

    load_and_authorize_resource

    def index
      respond_with @games
    end

    def show
      respond_with @game
    end

    def create
      if @game.save!
        render json: @game #respond_with doesn't work for some reason
      end
    end

    private

    def game_params
      params.require(:game).permit(:name, :league_id)
    end

  end



end
