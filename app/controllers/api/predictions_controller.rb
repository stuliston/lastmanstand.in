module Api

  class PredictionsController < ApplicationController
    respond_to :json

    load_and_authorize_resource

    def index
      respond_with @predictions
    end

    def show
      respond_with @prediction
    end

    def create
      if @prediction.save
        render json: @prediction
      end
    end

    def update
      if @prediction.update_attributes!(params[:prediction])
        render json: @prediction
      end
    end

    def destroy
      if @prediction.destroy
        head :no_content
      else
        head :bad_request
      end
    end

    private

    def prediction_params
      params.require(:prediction).permit(:user_id, :team_id, :fixture_id, :game_id)
    end

  end

end
