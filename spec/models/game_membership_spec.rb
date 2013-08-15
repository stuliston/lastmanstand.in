require 'spec_helper'

describe GameMembership do

  let(:afl) { FactoryGirl.create(:competition) }
  let(:afl_season) { FactoryGirl.create(:season, competition: afl) }
  let(:round_1) { FactoryGirl.create(:round, season: afl_season, number: 1) }
  let(:round_2) { FactoryGirl.create(:round, season: afl_season, number: 2) }
  let(:essendon) { FactoryGirl.create(:team, name: "Essendon", competition: afl) }
  let(:hawthorn) { FactoryGirl.create(:team, name: "Hawthorn", competition: afl) }
  let(:email) { "rob@monie.com" }
  let!(:invitation) { game.game_invitations.create!(email: email) }
  let!(:user) { FactoryGirl.create(:user, email: email) }
  let!(:game) { FactoryGirl.create(:game, season: afl_season) }

  it "creating a game membership deletes the invitation" do
    game_membership = game.game_memberships.create!(profile: user.profile)
    expect(GameInvitation.where(profile: user.profile)).to be_empty
  end

  describe "update_lives" do
    context "with predictions" do

      let(:fixture_a) { FactoryGirl.create(:fixture, home_team: essendon, away_team: hawthorn, winning_team: essendon, round: round_1) }
      let(:fixture_b) { FactoryGirl.create(:fixture, home_team: hawthorn, away_team: essendon, winning_team: essendon, round: round_2) }

      let!(:correct_prediction) do
        FactoryGirl.create(:prediction, game: game, profile: user.profile, fixture: fixture_a, team: essendon)
      end

      let!(:incorrect_prediction) do
        FactoryGirl.create(:prediction, game: game, profile: user.profile, fixture: fixture_b, team: hawthorn)
      end

      it "updates lost lives based on predictions for the game" do
        game_membership = game.game_memberships.create!(profile: user.profile)
        game_membership.update_lives!
        expect(game_membership.lost_lives).to eql 1
      end
    end
  end
end
