require 'spec_helper'

describe Fixture do

  describe "update_lives" do

    let(:fixture) { Fixture.new }
    let(:game_membership) { double('game_membership') }

    it "updates lives on all game memberships" do
      fixture.stub(:game_memberships).and_return [game_membership]
      game_membership.should_receive(:update_lives!)
      fixture.update_lives!
    end
  end

  context "with predictions" do

    let(:afl) { FactoryGirl.create(:competition) }
    let(:afl_season) { FactoryGirl.create(:season, competition: afl) }
    let(:round_1) { FactoryGirl.create(:round, season: afl_season, number: 1) }
    let(:essendon) { FactoryGirl.create(:team, name: "Essendon", competition: afl) }
    let(:geelong) { FactoryGirl.create(:team, name: "Hawthorn", competition: afl) }
    let(:user) { FactoryGirl.create(:user) }
    let(:game) { FactoryGirl.create(:game, season: afl_season) }
    let(:fixture) { FactoryGirl.create(:fixture, home_team: geelong, away_team: essendon, winning_team: essendon, round: round_1) }

    let!(:incorrect_prediction) do
      fixture.predictions.create!(game: game, user: user, team: geelong)
    end

    describe "game_memberships" do

      let!(:game_membership) { game.game_memberships.create!(user: user) }

      it "returns the correct memberships" do
        memberships = fixture.game_memberships
        expect(memberships.map(&:id)).to eql [game_membership.id]
      end
    end
  end

end
