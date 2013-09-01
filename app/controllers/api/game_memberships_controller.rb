module Api

  class GameMembershipsController < ApplicationController

    respond_to :json

    load_and_authorize_resource

    def create
      if @game_membership.save!
        render json: @game_membership, serializer: GameMembershipSerializer, root: 'game_membership'
      end
    end

    private

     def game_membership_params
      params.require(:game_membership).permit([:game_id, :user_id])
    end

  end

end
