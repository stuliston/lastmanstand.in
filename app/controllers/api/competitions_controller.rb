module Api
  class CompetitionsController < ApplicationController

    respond_to :json

    load_and_authorize_resource

    def index
      respond_with @competitions
    end

  end
end
