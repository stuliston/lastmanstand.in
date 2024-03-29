module Api

  class GameInvitationsController < ApplicationController

    respond_to :json

    load_and_authorize_resource

    def index
      @game_invitations = User.find(params[:user_id]).game_invitations
      render json: @game_invitations, each_serializer: ShallowGameInvitationSerializer, root: 'game_invitations'
    end

    def create
      invited_user = User.find_by_email(@game_invitation.email)
      if invited_user
        @game_invitation.user_id = invited_user.id
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
