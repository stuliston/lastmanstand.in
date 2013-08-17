require 'spec_helper'

module DataSources
  module Playup
    describe RoundBuilder do

      let(:round_builder) { RoundBuilder.new }

      let(:round_data) {
        <<-JSON
          {
            ":self": "http://sports.playup.com/rounds/407356",
            ":type": "application/vnd.playup.sport.round+json",
            ":uid": "round-407356",
            "period": "Week",
            "name": "1",
            "start_date": "2013-08-17T11:45:00Z",
            "end_date": "2013-08-21T18:45:00Z",
            "ancestors": [
              {
                ":self": "http://sports.playup.com/competitions/26",
                ":type": "application/vnd.playup.sport.competition+json",
                ":uid": "competition-26"
              },
              {
                ":self": "http://sports.playup.com/sports/3",
                ":type": "application/vnd.playup.sport.sport.football+json",
                ":uid": "sport-3"
              },
              {
                ":self": "http://sports.playup.com/sports",
                ":type": "application/vnd.playup.sport.sports+json",
                ":uid": "sports"
              }
            ],
            "contests": {
              ":self": "http://sports.playup.com/rounds/407356/contests",
              ":type": "application/vnd.playup.collection+json",
              ":uid": "round-407356-contests"
            }
          }
        JSON
      }

      let(:playup_round) { Hashie::Mash.new(JSON.parse(round_data)) }

      it 'assigns the number' do
        round = Round.new
        round_builder.build_from!(playup_round, round)
        expect(round.number).to eq 1
      end

    end
  end
end