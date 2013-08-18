require 'spec_helper'

describe GameMembership do

  let(:email) { "rob@monie.com" }
  let!(:invitation) { game.game_invitations.create!(email: email) }
  let!(:user) { FactoryGirl.create(:user, email: email) }
  let!(:game) { FactoryGirl.create(:game) }

  it "creating a game membership deletes the invitation" do
    game_membership = game.game_memberships.create!(user: user)
    expect(GameInvitation.where(user: user)).to be_empty
  end


end
