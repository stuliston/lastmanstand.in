require 'spec_helper'

describe User do

  context "when there is a game inviation for the email address of a new user" do

    let(:email) { "rob@monie.com" }
    let!(:invitation) { game.game_invitations.create!(email: email) }
    let!(:user) { FactoryGirl.create(email: email) }
    let!(:game) { FactoryGirl.create(:game) }

    it "associates the game invitation with the user" do
      expect(GameInvitation.where(user: user)).to include invitation
    end

  end

end
