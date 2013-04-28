class ProfilesController < ApplicationController
  respond_to :json
  load_and_authorize_resource

  def index
    respond_with @profiles
  end

  def show
  end

end
