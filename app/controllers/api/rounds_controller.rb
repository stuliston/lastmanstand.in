module Api
  class RoundsController < ApplicationController

    respond_to :json

    load_and_authorize_resource

    def index
      respond_with @rounds
    end

  end

end
