require 'spec_helper'

module DataSources
  module Playup
    describe TeamBuilder do

      let(:team_builder) { TeamBuilder.new }

      let(:team_data) {
        <<-JSON
          {
            ":self": "http://sports.playup.com/teams/175",
            ":type": "application/vnd.playup.sport.team+json",
            ":uid": "team-175",
            "display_name": "Liverpool",
            "name": "Liverpool",
            "short_name": "LIV",
            "competitions": [
              {
                ":self": "http://sports.playup.com/competitions/26",
                ":type": "application/vnd.playup.sport.competition+json",
                ":uid": "competition-26",
                "name": "Premier League",
                "short_name": "Premier League",
                "descriptor": "Football - Premier League - England",
                "region": "England",
                "topic": {
                  ":href": "http://injector.graph.playup.com/topics/1",
                  ":type": "application/vnd.playup.topic+json"
                },
                "ancestors": [
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
                "logos": [
                  {
                    "density": "low",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-26_1333435081_70x70.png"
                  },
                  {
                    "density": "medium",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-26_1333435081_105x105.png"
                  },
                  {
                    "density": "high",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-26_1333435081_140x140.png"
                  }
                ],
                "rated_contests": {
                  ":self": "http://sports.playup.com/competitions/26/rated_contests",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-26-rated_contests"
                },
                "standings": {
                  ":self": "http://sports.playup.com/competitions/26/standings",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-26-standings"
                },
                "sport": {
                  ":self": "http://sports.playup.com/sports/3",
                  ":type": "application/vnd.playup.sport.sport.football+json",
                  ":uid": "sport-3"
                },
                "current_stage": {
                  ":self": "http://sports.playup.com/competitions/26/stages/16",
                  ":type": "application/vnd.playup.sport.stage.home_away+json",
                  ":uid": "competition-26-stage-16"
                },
                "stages": {
                  ":self": "http://sports.playup.com/competitions/26/stages",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-26-stages"
                },
                "live_contests": 0,
                "live": {
                  ":self": "http://sports.playup.com/competitions/26/live",
                  ":type": "application/vnd.playup.sport.competition.summary+json",
                  ":uid": "competition-26-live"
                },
                "current_season": {
                  ":self": "http://sports.playup.com/competitions/26/current_season",
                  ":type": "application/vnd.playup.sport.season+json",
                  ":uid": "competition-26-season"
                },
                "rounds": {
                  ":self": "http://sports.playup.com/competitions/26/rounds",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-26-rounds"
                },
                "current_round": {
                  ":self": "http://sports.playup.com/rounds/407356",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407356"
                },
                "teams": {
                  ":self": "http://sports.playup.com/competitions/26/teams",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-26-teams"
                }
              },
              {
                ":self": "http://sports.playup.com/competitions/43",
                ":type": "application/vnd.playup.sport.competition+json",
                ":uid": "competition-43",
                "name": "FA Cup",
                "short_name": "FA Cup",
                "descriptor": "Football - FA Cup - England",
                "region": "England",
                "topic": {
                  ":href": "http://injector.graph.playup.com/topics/161",
                  ":type": "application/vnd.playup.topic+json"
                },
                "ancestors": [
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
                "logos": [
                  {
                    "density": "low",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-43_1333435115_70x70.png"
                  },
                  {
                    "density": "medium",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-43_1333435115_105x105.png"
                  },
                  {
                    "density": "high",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-43_1333435115_140x140.png"
                  }
                ],
                "rated_contests": {
                  ":self": "http://sports.playup.com/competitions/43/rated_contests",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-43-rated_contests"
                },
                "standings": {
                  ":self": "http://sports.playup.com/competitions/43/standings",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-43-standings"
                },
                "sport": {
                  ":self": "http://sports.playup.com/sports/3",
                  ":type": "application/vnd.playup.sport.sport.football+json",
                  ":uid": "sport-3"
                },
                "current_stage": {
                  ":self": "http://sports.playup.com/competitions/43/stages/354",
                  ":type": "application/vnd.playup.sport.stage.knockout+json",
                  ":uid": "competition-43-stage-354"
                },
                "stages": {
                  ":self": "http://sports.playup.com/competitions/43/stages",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-43-stages"
                },
                "live_contests": 0,
                "live": {
                  ":self": "http://sports.playup.com/competitions/43/live",
                  ":type": "application/vnd.playup.sport.competition.summary+json",
                  ":uid": "competition-43-live"
                },
                "current_season": {
                  ":self": "http://sports.playup.com/competitions/43/current_season",
                  ":type": "application/vnd.playup.sport.season+json",
                  ":uid": "competition-43-season"
                },
                "rounds": {
                  ":self": "http://sports.playup.com/competitions/43/rounds",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-43-rounds"
                },
                "current_round": {
                  ":self": "http://sports.playup.com/rounds/17807",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-17807"
                },
                "teams": {
                  ":self": "http://sports.playup.com/competitions/43/teams",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-43-teams"
                }
              },
              {
                ":self": "http://sports.playup.com/competitions/42",
                ":type": "application/vnd.playup.sport.competition+json",
                ":uid": "competition-42",
                "name": "League Cup",
                "short_name": "League Cup",
                "descriptor": "Football - League Cup - England",
                "region": "England",
                "topic": {
                  ":href": "http://injector.graph.playup.com/topics/167",
                  ":type": "application/vnd.playup.topic+json"
                },
                "ancestors": [
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
                "logos": [
                  {
                    "density": "low",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-42_1333435125_70x70.png"
                  },
                  {
                    "density": "medium",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-42_1333435125_105x105.png"
                  },
                  {
                    "density": "high",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-42_1333435125_140x140.png"
                  }
                ],
                "rated_contests": {
                  ":self": "http://sports.playup.com/competitions/42/rated_contests",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-42-rated_contests"
                },
                "standings": {
                  ":self": "http://sports.playup.com/competitions/42/standings",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-42-standings"
                },
                "sport": {
                  ":self": "http://sports.playup.com/sports/3",
                  ":type": "application/vnd.playup.sport.sport.football+json",
                  ":uid": "sport-3"
                },
                "stages": {
                  ":self": "http://sports.playup.com/competitions/42/stages",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-42-stages"
                },
                "live_contests": 0,
                "live": {
                  ":self": "http://sports.playup.com/competitions/42/live",
                  ":type": "application/vnd.playup.sport.competition.summary+json",
                  ":uid": "competition-42-live"
                },
                "current_season": {
                  ":self": "http://sports.playup.com/competitions/42/current_season",
                  ":type": "application/vnd.playup.sport.season+json",
                  ":uid": "competition-42-season"
                },
                "rounds": {
                  ":self": "http://sports.playup.com/competitions/42/rounds",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-42-rounds"
                },
                "current_round": {
                  ":self": "http://sports.playup.com/rounds/408529",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-408529"
                },
                "teams": {
                  ":self": "http://sports.playup.com/competitions/42/teams",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-42-teams"
                }
              },
              {
                ":self": "http://sports.playup.com/competitions/45",
                ":type": "application/vnd.playup.sport.competition+json",
                ":uid": "competition-45",
                "name": "Europa League",
                "short_name": "Europa League",
                "descriptor": "Football - Europa League - Europe",
                "region": "Europe",
                "topic": {
                  ":href": "http://injector.graph.playup.com/topics/240",
                  ":type": "application/vnd.playup.topic+json"
                },
                "ancestors": [
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
                "logos": [
                  {
                    "density": "low",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-45_1333435714_70x70.png"
                  },
                  {
                    "density": "medium",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-45_1333435714_105x105.png"
                  },
                  {
                    "density": "high",
                    "href": "http://sdimages.playup.com/league-logos/football/competition-45_1333435714_140x140.png"
                  }
                ],
                "rated_contests": {
                  ":self": "http://sports.playup.com/competitions/45/rated_contests",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-45-rated_contests"
                },
                "standings": {
                  ":self": "http://sports.playup.com/competitions/45/standings",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-45-standings"
                },
                "sport": {
                  ":self": "http://sports.playup.com/sports/3",
                  ":type": "application/vnd.playup.sport.sport.football+json",
                  ":uid": "sport-3"
                },
                "current_stage": {
                  ":self": "http://sports.playup.com/competitions/45/stages/350",
                  ":type": "application/vnd.playup.sport.stage.knockout+json",
                  ":uid": "competition-45-stage-350"
                },
                "stages": {
                  ":self": "http://sports.playup.com/competitions/45/stages",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-45-stages"
                },
                "live_contests": 0,
                "live": {
                  ":self": "http://sports.playup.com/competitions/45/live",
                  ":type": "application/vnd.playup.sport.competition.summary+json",
                  ":uid": "competition-45-live"
                },
                "current_season": {
                  ":self": "http://sports.playup.com/competitions/45/current_season",
                  ":type": "application/vnd.playup.sport.season+json",
                  ":uid": "competition-45-season"
                },
                "rounds": {
                  ":self": "http://sports.playup.com/competitions/45/rounds",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-45-rounds"
                },
                "current_round": {
                  ":self": "http://sports.playup.com/rounds/407440",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407440"
                },
                "teams": {
                  ":self": "http://sports.playup.com/competitions/45/teams",
                  ":type": "application/vnd.playup.collection+json",
                  ":uid": "competition-45-teams"
                }
              }
            ],
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
            },
            "players": [
              {
                ":self": "http://sports.playup.com/players/50350",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-50350",
                "first_name": "Luis",
                "last_name": "Suarez",
                "updated_at": "2012-10-25T01:43:26Z"
              },
              {
                ":self": "http://sports.playup.com/players/50375",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-50375",
                "first_name": "Steven",
                "last_name": "Gerrard",
                "updated_at": "2012-10-25T01:43:35Z"
              },
              {
                ":self": "http://sports.playup.com/players/50398",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-50398",
                "first_name": "Martin",
                "last_name": "Skrtel",
                "updated_at": "2012-10-25T01:43:45Z"
              },
              {
                ":self": "http://sports.playup.com/players/50426",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-50426",
                "first_name": "Raheem",
                "last_name": "Sterling",
                "updated_at": "2012-10-25T01:44:00Z"
              },
              {
                ":self": "http://sports.playup.com/players/50467",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-50467",
                "first_name": "Daniel",
                "last_name": "Agger",
                "updated_at": "2012-10-25T03:34:27Z"
              },
              {
                ":self": "http://sports.playup.com/players/50473",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-50473",
                "first_name": "Jonjo",
                "last_name": "Shelvey",
                "updated_at": "2012-10-25T03:34:29Z"
              },
              {
                ":self": "http://sports.playup.com/players/50476",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-50476",
                "first_name": "Joe",
                "last_name": "Allen",
                "updated_at": "2012-10-25T03:34:29Z"
              },
              {
                ":self": "http://sports.playup.com/players/50511",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-50511",
                "first_name": "Brad",
                "last_name": "Jones",
                "updated_at": "2012-10-25T03:34:46Z"
              },
              {
                ":self": "http://sports.playup.com/players/50515",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-50515",
                "first_name": "Pepe",
                "last_name": "Reina",
                "updated_at": "2012-10-25T03:34:47Z"
              },
              {
                ":self": "http://sports.playup.com/players/52002",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-52002",
                "first_name": "Andre",
                "last_name": "Wisdom",
                "updated_at": "2012-10-31T05:31:33Z"
              },
              {
                ":self": "http://sports.playup.com/players/52016",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-52016",
                "first_name": "Sebastian",
                "last_name": "Coates",
                "updated_at": "2012-10-31T05:31:39Z"
              },
              {
                ":self": "http://sports.playup.com/players/52023",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-52023",
                "first_name": "Stewart",
                "last_name": "Downing",
                "updated_at": "2012-10-31T05:31:41Z"
              },
              {
                ":self": "http://sports.playup.com/players/52229",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-52229",
                "first_name": "Nuri",
                "last_name": "Sahin",
                "updated_at": "2012-10-31T05:48:36Z"
              },
              {
                ":self": "http://sports.playup.com/players/52444",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-52444",
                "first_name": "Jamie",
                "last_name": "Carragher",
                "updated_at": "2012-11-01T01:07:38Z"
              },
              {
                ":self": "http://sports.playup.com/players/54802",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-54802",
                "first_name": "",
                "last_name": "José Enrique",
                "updated_at": "2012-11-18T05:41:40Z"
              },
              {
                ":self": "http://sports.playup.com/players/58953",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-58953",
                "first_name": "Glen",
                "last_name": "Johnson",
                "updated_at": "2013-01-19T23:37:42Z"
              },
              {
                ":self": "http://sports.playup.com/players/59398",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-59398",
                "first_name": "Daniel",
                "last_name": "Sturridge",
                "updated_at": "2013-02-17T23:51:41Z"
              },
              {
                ":self": "http://sports.playup.com/players/60112",
                ":type": "application/vnd.playup.sport.player+json",
                ":uid": "player-60112",
                "first_name": "Lucas",
                "last_name": "Leiva",
                "updated_at": "2013-04-07T22:31:13Z"
              }
            ]
          }
        JSON
      }

      let(:playup_team) { Hashie::Mash.new(JSON.parse(team_data)) }

      it 'assigns the name' do
        team = Team.new
        team_builder.build_from!(playup_team, team)
        expect(team.name).to eq 'Liverpool'
      end

      it 'assigns the abbreviated_name' do
        team = Team.new
        team_builder.build_from!(playup_team, team)
        expect(team.abbreviated_name).to eq 'LIV'
      end

    end
  end
end