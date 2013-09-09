require 'spec_helper'

module DataSources
  module Playup
    describe FixtureBuilder do

      let(:contest_data) {
        <<-JSON
          {
            ":self": "http://sports.playup.com/contests/20120423871",
            ":type": "application/vnd.playup.sport.contest.football+json",
            ":uid": "contest-20120423871",
            "scheduled_start_time": "2013-08-17T11:45:00Z",
            "last_modified": "2013-08-15T01:33:36Z",
            "has_live_updates": true,
            "title": "Liverpool vs Stoke City",
            "short_title": "LIV vs STO",
            "name": "",
            "round_label": "Week",
            "round_name": "1",
            "competition_name": "Premier League",
            "region": "England",
            "sport_name": "Football",
            "ancestors": [
              {
                ":self": "http://sports.playup.com/rounds/407356",
                ":type": "application/vnd.playup.sport.round+json",
                ":uid": "round-407356"
              },
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
            "associated_contests": {
              ":self": "http://sports.playup.com/contests/20120423871/associated_contests",
              ":type": "application/vnd.playup.collection+json",
              ":uid": "contest-20120423871-associated_contests"
            },
            "scores": [
              {
                "total": 2,
                "summary": "0",
                "team": {
                  ":self": "http://sports.playup.com/teams/175",
                  ":type": "application/vnd.playup.sport.team+json",
                  ":uid": "team-175",
                  "display_name": "Liverpool",
                  "name": "Liverpool",
                  "short_name": "LIV",
                  "rated_contests": {
                    ":self": "http://sports.playup.com/teams/175/rated_contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "team-175-rated_contests"
                  },
                  "contests": {
                    ":self": "http://sports.playup.com/teams/175/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "team-175-contests"
                  },
                  "live": {
                    ":self": "http://sports.playup.com/teams/175/live",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "team-175-live"
                  },
                  "logos": {
                    "header": [
                      {
                        "density": "low",
                        "href": "http://sdimages.playup.com/team-logos/football/football_liverpool_liv_1333421654_70x46.png"
                      },
                      {
                        "density": "medium",
                        "href": "http://sdimages.playup.com/team-logos/football/football_liverpool_liv_1333421654_105x69.png"
                      },
                      {
                        "density": "high",
                        "href": "http://sdimages.playup.com/team-logos/football/football_liverpool_liv_1333421654_140x92.png"
                      }
                    ],
                    "calendar": [
                      {
                        "density": "low",
                        "href": "http://sdimages.playup.com/team-logos/football/football_liverpool_liv_1333421654_35x23.png"
                      },
                      {
                        "density": "medium",
                        "href": "http://sdimages.playup.com/team-logos/football/football_liverpool_liv_1333421654_53x35.png"
                      },
                      {
                        "density": "high",
                        "href": "http://sdimages.playup.com/team-logos/football/football_liverpool_liv_1333421654_70x46.png"
                      }
                    ]
                  }
                }
              },
              {
                "total": 1,
                "summary": "0",
                "team": {
                  ":self": "http://sports.playup.com/teams/193",
                  ":type": "application/vnd.playup.sport.team+json",
                  ":uid": "team-193",
                  "display_name": "Stoke City",
                  "name": "Stoke City",
                  "short_name": "STO",
                  "rated_contests": {
                    ":self": "http://sports.playup.com/teams/193/rated_contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "team-193-rated_contests"
                  },
                  "contests": {
                    ":self": "http://sports.playup.com/teams/193/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "team-193-contests"
                  },
                  "live": {
                    ":self": "http://sports.playup.com/teams/193/live",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "team-193-live"
                  },
                  "logos": {
                    "header": [
                      {
                        "density": "low",
                        "href": "http://sdimages.playup.com/team-logos/football/football_stoke_city_sto_1333421679_70x46.png"
                      },
                      {
                        "density": "medium",
                        "href": "http://sdimages.playup.com/team-logos/football/football_stoke_city_sto_1333421679_105x69.png"
                      },
                      {
                        "density": "high",
                        "href": "http://sdimages.playup.com/team-logos/football/football_stoke_city_sto_1333421679_140x92.png"
                      }
                    ],
                    "calendar": [
                      {
                        "density": "low",
                        "href": "http://sdimages.playup.com/team-logos/football/football_stoke_city_sto_1333421679_35x23.png"
                      },
                      {
                        "density": "medium",
                        "href": "http://sdimages.playup.com/team-logos/football/football_stoke_city_sto_1333421679_53x35.png"
                      },
                      {
                        "density": "high",
                        "href": "http://sdimages.playup.com/team-logos/football/football_stoke_city_sto_1333421679_70x46.png"
                      }
                    ]
                  }
                }
              }
            ],
            "clock": {
              "summary": "",
              "minutes": 0,
              "seconds": 0,
              "period": 0
            },
            "rating": 0
          }
        JSON
      }

      let(:playup_contest) { Hashie::Mash.new(JSON.parse(contest_data)) }

      let(:liverpool)   { Team.new(name: 'Liverpool') }
      let(:stoke_city)  { Team.new(name: 'Stoke City') }
      let(:sunderland)  { Team.new(name: 'Sunderland') }

      describe '.build_from!' do

        before do
          all_teams   = [ sunderland, stoke_city, liverpool ]
          fixture_builder = FixtureBuilder.new

          @fixture = Fixture.new
          fixture_builder.build_from!(playup_contest, @fixture, all_teams)
        end

        it 'assigns the start time' do
          expect(@fixture.start_time).to eq DateTime.parse("2013-08-17T11:45:00Z")
        end

        it 'assigns the home team' do
          expect(@fixture.home_team).to eq liverpool
        end

        it 'assigns the away team' do
          expect(@fixture.away_team).to eq stoke_city
        end

        it 'assigns the winning team' do
          expect(@fixture.winning_team).to eq liverpool
        end

        it 'assigns the home score' do
          expect(@fixture.home_score).to be 2
        end

        it 'assigns the away score' do
          expect(@fixture.away_score).to be 1
        end

      end

    end
  end
end