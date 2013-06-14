module Api

  class LeaguesController < ApplicationController
    respond_to :json
    load_and_authorize_resource

    def index
      respond_with @leagues
    end

  end

end
