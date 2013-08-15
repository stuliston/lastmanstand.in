module Playup
  class FixtureImportService

    def initialize(*competitions)
      @competitions = competitions
    end

    def import!
      competitions.each do |comp|
        import_fixtures_for(comp)
      end
    end

    private

    attr_reader :competitions

    def import_fixtures_for(comp)
      rounds = playup_client.rounds(playup_id_for(comp)).items

      rounds.each do |round|
        id = round[':uid'].split('-').last
        contests = playup_client.contests(id)
        contests.each do |contest|
          fixture_builder.build_from!(contests, comp)
        end
      end
    end

    def playup_id_for(comp)
      LastManStanding.config.playup_api.competitions.find do |c|
        c.name == comp.name
      end.playup_id
    end

    def playup_client
      @playup_client ||= ApiClients::Playup.new
    end

    def fixture_builder
      @fixture_builder ||= Playup::FixtureBuilder.new
    end

  end
end