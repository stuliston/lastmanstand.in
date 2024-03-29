require 'spec_helper'

module DataSources
  module Playup
    describe SeasonBuilder do

      let(:season_data) {
        <<-JSON
          {
            ":self": "http://sports.playup.com/competitions/26/current_season",
            ":type": "application/vnd.playup.sport.season+json",
            ":uid": "competition-26-season",
            "name": "Premier League",
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
            "rounds": {
              ":self": "http://sports.playup.com/competitions/26/rounds",
              ":type": "application/vnd.playup.collection+json",
              ":uid": "competition-26-rounds",
              "items": [
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
                },
                {
                  ":self": "http://sports.playup.com/rounds/407357",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407357",
                  "period": "Week",
                  "name": "2",
                  "start_date": "2013-08-24T11:45:00Z",
                  "end_date": "2013-08-26T19:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407357/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407357-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407358",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407358",
                  "period": "Week",
                  "name": "3",
                  "start_date": "2013-08-31T11:45:00Z",
                  "end_date": "2013-09-01T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407358/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407358-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407359",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407359",
                  "period": "Week",
                  "name": "4",
                  "start_date": "2013-09-14T11:45:00Z",
                  "end_date": "2013-09-16T19:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407359/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407359-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407360",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407360",
                  "period": "Week",
                  "name": "5",
                  "start_date": "2013-09-21T11:45:00Z",
                  "end_date": "2013-09-22T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407360/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407360-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407361",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407361",
                  "period": "Week",
                  "name": "6",
                  "start_date": "2013-09-28T11:45:00Z",
                  "end_date": "2013-09-30T19:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407361/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407361-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407362",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407362",
                  "period": "Week",
                  "name": "7",
                  "start_date": "2013-10-05T11:45:00Z",
                  "end_date": "2013-10-06T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407362/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407362-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407363",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407363",
                  "period": "Week",
                  "name": "8",
                  "start_date": "2013-10-19T11:45:00Z",
                  "end_date": "2013-10-21T19:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407363/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407363-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407364",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407364",
                  "period": "Week",
                  "name": "9",
                  "start_date": "2013-10-26T11:45:00Z",
                  "end_date": "2013-10-27T16:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407364/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407364-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407365",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407365",
                  "period": "Week",
                  "name": "10",
                  "start_date": "2013-11-02T12:45:00Z",
                  "end_date": "2013-11-03T16:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407365/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407365-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407366",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407366",
                  "period": "Week",
                  "name": "11",
                  "start_date": "2013-11-09T15:00:00Z",
                  "end_date": "2013-11-10T16:10:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407366/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407366-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407367",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407367",
                  "period": "Week",
                  "name": "12",
                  "start_date": "2013-11-23T12:45:00Z",
                  "end_date": "2013-11-25T20:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407367/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407367-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407368",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407368",
                  "period": "Week",
                  "name": "13",
                  "start_date": "2013-11-30T12:45:00Z",
                  "end_date": "2013-12-04T20:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407368/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407368-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407369",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407369",
                  "period": "Week",
                  "name": "14",
                  "start_date": "2013-12-07T15:00:00Z",
                  "end_date": "2013-12-07T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407369/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407369-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407370",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407370",
                  "period": "Week",
                  "name": "15",
                  "start_date": "2013-12-14T15:00:00Z",
                  "end_date": "2013-12-14T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407370/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407370-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407371",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407371",
                  "period": "Week",
                  "name": "16",
                  "start_date": "2013-12-21T15:00:00Z",
                  "end_date": "2013-12-21T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407371/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407371-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407372",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407372",
                  "period": "Week",
                  "name": "17",
                  "start_date": "2013-12-26T15:00:00Z",
                  "end_date": "2014-01-01T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407372/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407372-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407373",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407373",
                  "period": "Week",
                  "name": "18",
                  "start_date": "2014-01-11T15:00:00Z",
                  "end_date": "2014-01-11T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407373/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407373-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407374",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407374",
                  "period": "Week",
                  "name": "19",
                  "start_date": "2014-01-18T15:00:00Z",
                  "end_date": "2014-01-18T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407374/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407374-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407375",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407375",
                  "period": "Week",
                  "name": "20",
                  "start_date": "2014-01-28T19:45:00Z",
                  "end_date": "2014-01-29T19:45:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407375/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407375-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407376",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407376",
                  "period": "Week",
                  "name": "21",
                  "start_date": "2014-02-01T15:00:00Z",
                  "end_date": "2014-02-01T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407376/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407376-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407377",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407377",
                  "period": "Week",
                  "name": "22",
                  "start_date": "2014-02-08T15:00:00Z",
                  "end_date": "2014-02-12T20:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407377/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407377-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407378",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407378",
                  "period": "Week",
                  "name": "23",
                  "start_date": "2014-02-22T15:00:00Z",
                  "end_date": "2014-02-22T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407378/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407378-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407379",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407379",
                  "period": "Week",
                  "name": "24",
                  "start_date": "2014-03-01T15:00:00Z",
                  "end_date": "2014-03-01T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407379/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407379-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407380",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407380",
                  "period": "Week",
                  "name": "25",
                  "start_date": "2014-03-08T15:00:00Z",
                  "end_date": "2014-03-08T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407380/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407380-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407381",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407381",
                  "period": "Week",
                  "name": "26",
                  "start_date": "2014-03-15T15:00:00Z",
                  "end_date": "2014-03-15T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407381/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407381-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407383",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407383",
                  "period": "Week",
                  "name": "27",
                  "start_date": "2014-03-22T15:00:00Z",
                  "end_date": "2014-03-22T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407383/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407383-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407385",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407385",
                  "period": "Week",
                  "name": "28",
                  "start_date": "2014-03-29T15:00:00Z",
                  "end_date": "2014-03-29T15:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407385/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407385-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407387",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407387",
                  "period": "Week",
                  "name": "29",
                  "start_date": "2014-04-05T14:00:00Z",
                  "end_date": "2014-04-05T14:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407387/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407387-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407389",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407389",
                  "period": "Week",
                  "name": "30",
                  "start_date": "2014-04-12T14:00:00Z",
                  "end_date": "2014-04-12T14:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407389/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407389-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407391",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407391",
                  "period": "Week",
                  "name": "31",
                  "start_date": "2014-04-19T14:00:00Z",
                  "end_date": "2014-04-19T14:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407391/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407391-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407393",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407393",
                  "period": "Week",
                  "name": "32",
                  "start_date": "2014-04-26T14:00:00Z",
                  "end_date": "2014-04-26T14:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407393/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407393-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407395",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407395",
                  "period": "Week",
                  "name": "33",
                  "start_date": "2014-05-03T14:00:00Z",
                  "end_date": "2014-05-03T14:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407395/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407395-contests"
                  }
                },
                {
                  ":self": "http://sports.playup.com/rounds/407397",
                  ":type": "application/vnd.playup.sport.round+json",
                  ":uid": "round-407397",
                  "period": "Week",
                  "name": "34",
                  "start_date": "2014-05-11T14:00:00Z",
                  "end_date": "2014-05-11T14:00:00Z",
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
                    ":self": "http://sports.playup.com/rounds/407397/contests",
                    ":type": "application/vnd.playup.collection+json",
                    ":uid": "round-407397-contests"
                  }
                }
              ]
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
          }
        JSON
      }

      let(:playup_season) { Hashie::Mash.new(JSON.parse(season_data)) }

      describe '.build_from!' do

        before do
          season_builder = SeasonBuilder.new
          @season = Season.new
          season_builder.build_from!(playup_season, @season)
        end

        it 'assigns the name' do
          expect(@season.name).to eq "Premier League 2013/14"
        end

        it 'assigns the start date' do
          expect(@season.start_date).to eq Date.parse("2013-08-17T11:45:00Z")
        end

        it 'assigns the end date' do
          expect(@season.end_date).to eq Date.parse("2014-05-11T14:00:00Z")
        end

      end

    end
  end
end