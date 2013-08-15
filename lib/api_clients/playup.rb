module ApiClients
  class Playup
    include HTTParty
    base_uri 'http://sports.playup.com'

    def competition(id)
      parse_response "/competitions/#{id}"
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