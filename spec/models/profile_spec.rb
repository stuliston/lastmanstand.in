require 'spec_helper'

describe Profile do

  context "when there is a game inviation for the email address of a new user profile" do

    let(:email) { "rob@monie.com" }
    let!(:invitation) { game.game_invitations.create!(email: email) }
    let!(:user) { FactoryGirl.create(:user, email: email) }
    let!(:game) { FactoryGirl.create(:game) }

    it "associates the game invitation with the profile" do
      profile = user.profile
      expect(GameInvitation.where(profile: profile)).to include invitation
    end

  end

end
