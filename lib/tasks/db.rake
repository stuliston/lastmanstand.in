namespace :db do

  desc "Random Seed. Clears DB and creates random seed data for local testing"
  task random_seed: :environment do

    Rake::Task["db:seed"].invoke

    stu   = User.find_by(email: 'stuart.liston@gmail.com')
    rob   = User.find_by(email: 'robmonie@gmail.com')
    phil  = User.find_by(email: 'metcalfe.phil@gmail.com')
    ash   = User.find_by(email: 'ash@ashmckenzie.org')
    dan   = User.find_by(email: 'locusdelicti@gmail.com')

    all_users = [ stu, rob, ash, phil, dan ]

    afl = Competition.find_by(name: 'AFL')
    epl = Competition.find_by(name: 'Premier League')

    Team.destroy_all
    adelaide          = Team.create!(name: 'Adelaide', competition: afl)
    brisbane          = Team.create!(name: 'Brisbane', competition: afl)
    carlton           = Team.create!(name: 'Carlton', competition: afl)
    collingwood       = Team.create!(name: 'Collingwood', competition: afl)
    essendon          = Team.create!(name: 'Essendon', competition: afl)
    fremantle         = Team.create!(name: 'Fremantle', competition: afl)
    geelong           = Team.create!(name: 'Geelong', competition: afl)
    gold_coast        = Team.create!(name: 'Gold Coast', competition: afl)
    gws               = Team.create!(name: 'Greater Western Sydney', competition: afl)
    hawthorn          = Team.create!(name: 'Hawthorn', competition: afl)
    melbourne         = Team.create!(name: 'Melbourne', competition: afl)
    north_melbourne   = Team.create!(name: 'North Melbourne', competition: afl)
    port_adelaide     = Team.create!(name: 'Port Adelaide', competition: afl)
    richmond          = Team.create!(name: 'Richmond', competition: afl)
    st_kilda          = Team.create!(name: 'St Kilda', competition: afl)
    sydney_swans      = Team.create!(name: 'Sydney Swans', competition: afl)
    west_coast_eagles = Team.create!(name: 'West Coast Eagles', competition: afl)
    western_bulldogs  = Team.create!(name: 'Western Bulldogs', competition: afl)

    # Create a fixture for a single afl season
    Season.destroy_all

    afl_season_2013 = Season.create!(name: "2013 AFL Premiership Season", start_date: Date.new(2013, 6, 22), end_date: Date.new(2013, 11, 30), competition: afl)
    epl_season_2013 = Season.create!(name: "2013 English Premiership League", start_date: Date.new(2013, 6, 22), end_date: Date.new(2013, 11, 30), competition: epl)

    Game.destroy_all
    Game.create!(name: 'Rob v Stu', profiles: [rob, stu].collect(&:profile), season: afl_season_2013)
    Game.create!(name: 'Rob v Phil', profiles: [rob, phil].collect(&:profile), season: afl_season_2013)
    Game.create!(name: 'Stu v Phil', profiles: [stu, phil].collect(&:profile), season: afl_season_2013)
    Game.create!(name: 'Phil v Ash', profiles: [phil, ash].collect(&:profile), season: afl_season_2013)
    Game.create!(name: 'Ash v Dan', profiles: [ash, dan].collect(&:profile), season: afl_season_2013)
    Game.create!(name: 'Stu Solo Style', profiles: [ stu.profile ], season: afl_season_2013)
    Game.create!(name: 'Hooroo Invitational', profiles: all_users.collect(&:profile), season: afl_season_2013)

    Round.destroy_all
    Fixture.destroy_all

    round_date = afl_season_2013.start_date
    paired_teams = []
    round_number = 1
    all_afl_teams = Team.where(competition: afl)

    #This is pretty messy but it kinda works (I think)
    while round_date <= afl_season_2013.end_date

      round = afl_season_2013.rounds.create(number: round_number)
      played_this_round = []
      # puts paired_teams

      all_afl_teams.each do |team_a|
        next if played_this_round.include?(team_a)

        all_afl_teams.each do |team_b|

          pair = {a: team_a, b: team_b}

          if played_this_round.include?(team_a)
            break
          elsif played_this_round.include?(team_b) || team_a == team_b || paired_teams.include?(pair)
            next
          else
            if round_date < Time.now
              team_a_score = rand(30..150)
              team_b_score = rand(30..150)
              winning_team = team_a_score < team_b_score ? team_b : team_a
            end
            round.fixtures.create!(
              home_team: team_a,
              home_score: team_a_score,
              away_team: team_b,
              away_score: team_b_score,
              start_time: round_date,
              winning_team: winning_team)
            paired_teams << pair
            played_this_round << team_a
            played_this_round << team_b
          end

        end
      end

      round_date = round_date + 1.week
      round_number += 1
    end

    Prediction.destroy_all

    Profile.all.each do |profile|
      Game.all.each do |game|
        if game.profiles.include? profile
          lost_games = 0
          game.season.rounds.each do |round|
            fixture_index = rand(0..round.fixtures.size - 1)
            fixture = round.fixtures[fixture_index]
            selected_team = [fixture.home_team, fixture.away_team][rand(0..1)]
            if selected_team != fixture.winning_team
              lost_games = lost_games + 1
            end
            if fixture.start_time < Time.now && lost_games <= game.number_of_lives
              Prediction.create!(profile: profile, team: selected_team, game: game, fixture: fixture)
            end
          end
        end
      end
    end

  end

end