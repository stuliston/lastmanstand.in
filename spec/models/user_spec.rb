require 'spec_helper'

describe User do

  context "when there is a game inviation for the email address of a new user" do

    let(:email) { "rob@monie.com" }
    let!(:game) { FactoryGirl.create(:game) }
    let!(:invitation) { game.game_invitations.create!(email: email) }
    let!(:user) { FactoryGirl.create(:user, email: email) }


    it "associates the game invitation with the user" do
      expect(GameInvitation.where(user: user)).to include invitation
    end

  end

end
