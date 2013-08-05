require 'spec_helper'

module Api
  describe Playup do

    let(:epl)           { 26 }
    let(:epl_round_one) { 407356 }

    describe '#competition' do

      it 'gets the correct competition', :vcr do
        competition = Playup.new.competition(epl)
        expect(competition.name).to eq 'Premier League'
      end

    end

    describe '#rounds' do

      it 'gets the rounds for a competition', :vcr do
        rounds = Playup.new.rounds(epl).items

        expect(rounds.count).to            eq 34
        expect(rounds.first[':uid']).to    eq 'round-407356'
        expect(rounds.first.name).to       eq '1'
        expect(rounds.first.start_date).to eq '2013-08-17T11:45:00Z'
        expect(rounds.first.end_date).to   eq '2013-08-19T19:00:00Z'
        expect(rounds.first.period).to     eq 'Week'
      end

    end

    describe '#contests' do

      it 'gets the contests for a given round', :vcr do
        contests = Playup.new.contests(epl_round_one).items

        expect(contests.count).to                   eq 10
        expect(contests.first.competition_name).to  eq 'Premier League'
        expect(contests.first.title).to             eq 'Liverpool vs Stoke City'

        home_score = contests.first.scores[0]

        expect(home_score.total).to     eq 0
        expect(home_score.team.name).to eq 'Liverpool'

        away_score = contests.first.scores[1]

        expect(away_score.total).to     eq 0
        expect(away_score.team.name).to eq 'Stoke City'
      end

    end

  end
end