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

  end

end
