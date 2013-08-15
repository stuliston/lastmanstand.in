require 'spec_helper'

describe Prediction do

  describe "correct?" do

    let(:carlton) { Team.new }
    let(:fremantle) { Team.new }
    let(:fixture) { Fixture.new(winning_team: carlton) }

    context "when the prediction has the same team as the fixture winning team" do
      let(:prediction) { Prediction.new(fixture: fixture, team: carlton) }

      it "is correct" do
        expect(prediction.correct?).to be_true
      end
    end

    context "when the prediction has a different team to the fixture winning team" do
      let(:prediction) { Prediction.new(fixture: fixture, team: fremantle) }

      it "is incorrect" do
        expect(prediction.correct?).to be_false
      end
    end
  end
end
