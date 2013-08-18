module Api

  class GamesController < ApplicationController
    respond_to :json

    load_and_authorize_resource

    def index
      respond_with @games
    end

    def show
      render json: @game
    end

    def create
      if @game.save
        render json: @game, serializer: ShallowGameSerializer, root: 'game'
      end
    end

    def update
      if @game.update_attributes!(params[:game])
        render json: @game, serializer: ShallowGameSerializer, root: 'game'
      end
    end

    private

    def game_params
      params.require(:game).permit(:name, :season_id)
    end

  end

end
