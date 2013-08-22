module Playup
  class FixtureImportService

    def import_fixtures_for(comp)
      playup_comp_id   = playup_id_for(comp)

      # build teams
      our_teams = comp.teams.order('name')
      playup_teams = playup_client.all_teams(playup_comp_id).items
      playup_teams.each do |playup_team|
        team = comp.teams.find_or_initialize_by(name: playup_team.name)
        team_builder.build_from!(playup_team, team)
        team.save!
      end

      # build season
      playup_season = playup_client.current_season(playup_comp_id)
      season = comp.current_season || Season.new(competition: comp)
      season_builder.build_from!(playup_season, season)
      season.save!

      # build rounds
      playup_rounds = playup_client.rounds(playup_id_for(comp)).items

      playup_rounds.each_with_index do |playup_round, round_index|
        round = season.rounds[round_index] || Round.new(season: season)
        round_builder.build_from!(playup_round, round)
        round.save!

        # build fixtures
        playup_round_id = playup_round[':uid'].split('-').last
        contests = playup_client.contests(playup_round_id).items
        contests.each_with_index do |contest, contest_index|
          fixture = round.fixtures[contest_index] || Fixture.new(round: round)
          fixture_builder.build_from!(contest, fixture, our_teams)
          fixture.save!
        end
      end

      comp.save!
    end

    private

      def playup_id_for(comp)
        LastManStanding.config.playup_api.competitions.find do |c|
          c.name == comp.name
        end.playup_id
      end

      def playup_client
        @playup_client ||= ApiClients::Playup.new
      end

      def team_builder
        @team_builder ||= DataSources::Playup::TeamBuilder.new
      end

      def season_builder
        @season_builder ||= DataSources::Playup::SeasonBuilder.new
      end

      def round_builder
        @round_builder ||= DataSources::Playup::RoundBuilder.new
      end

      def fixture_builder
        @fixture_builder ||= DataSources::Playup::FixtureBuilder.new
      end

  end
end