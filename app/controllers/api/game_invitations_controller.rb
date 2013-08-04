module Api

  class GameInvitationsController < ApplicationController

    respond_to :json

    load_and_authorize_resource

    def create

      invited_user = User.find_by_email(@game_invitation.email)
      if invited_user
        @game_invitation.profile_id = invited_user.profile.id
      end

      if @game_invitation.save!
        render json: @game_invitation, serializer: ShallowGameInvitationSerializer, root: 'game_invitation'
      end
    end

    def destroy
      if @game_invitation.destroy
        head :no_content
      else
        head :bad_request
      end
    end

    private

     def game_invitation_params
      params.require(:game_invitation).permit([:game_id, :email, :invited_by_id])
    end

  end

end
