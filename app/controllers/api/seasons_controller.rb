module Api

  class SeasonsController < ApplicationController
    respond_to :json

    load_and_authorize_resource

    def index
      respond_with @seasons
    end

    def show
      respond_with @season
    end


  end

end
