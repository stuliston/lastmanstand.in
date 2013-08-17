module ApiClients

  # Sport (Football)
  # /sports/[sport_id]
  #
  # Competition (EPL)
  # /competitions/[comp_id]
  #
  # Teams (returns 23 teams - includes relagated ones from last season)
  # /competitions/[comp_id]/teams
  #
  # Current Round
  # /rounds/[:round_id]
  #
  # Rounds
  # /competitions/[comp_id]/rounds
  #
  # Contests (aka Fixtures)
  # /rounds/[:round_id]/contests


  class Playup
    include HTTParty
    base_uri 'http://sports.playup.com'

    def competition(id)
      parse_response "/competitions/#{id}"
    end

    # Beware, this returns too many teams
    def all_teams(competition_id)
      parse_response "/competitions/#{competition_id}/teams"
    end

    def round(round_id)
      parse_response "http://sports.playup.com/rounds/#{round_id}"
    end

    def rounds(competition_id)
      parse_response "/competitions/#{competition_id}/rounds/"
    end

    def contests(round_id)
      parse_response "/rounds/#{round_id}/contests"
    end

    private

    def parse_response(endpoint)
      response = self.class.get(endpoint)
      Hashie::Mash.new(JSON.parse(response.body))
    end

  end
end