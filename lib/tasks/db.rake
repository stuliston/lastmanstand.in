namespace :db do

  desc "Pull down the production database from Heroku"
  task pull: :environment do
    config = ActiveRecord::Base.configurations[Rails.env].symbolize_keys
    username, password, host = config[:username], config[:password], config[:host]
    database             = config[:database]  || config[:path].sub(/\//, "")
    charset              = config[:charset]   || ENV['CHARSET']   || 'UTF-8'
    collation            = config[:collation] || ENV['COLLATION'] || 'utf8_unicode_ci'

    puts "=> Capturing a backup..."
    require 'net/ssh'
    Net::SSH.start('54.229.136.99', 'robmonie', keys: '~/.ssh/id_rsa') do |ssh|
      ssh.exec "sudo su postgres -c 'pg_dump -Fc lms > /tmp/lms_backup.dump'"
    end
    puts "<= Done."

    puts "=> Downloading backup..."
    raise 'Unable to download backup' unless system("scp robmonie@54.229.136.99:/tmp/lms_backup.dump ./db/")
    puts "<= Done."

    puts "=> Restoring your dev DB from backup..."
    system("pg_restore --verbose --clean --no-owner -h #{host} -d #{database} ./db/lms_backup.dump")
    system("rm ./db/lms_backup.dump")
    puts "<= Done."

    puts "Stay Frosty!"
  end


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

    afl.teams.destroy_all
    adelaide          = Team.create!(name: 'Adelaide', competition: afl, abbreviated_name: 'ADE')
    brisbane          = Team.create!(name: 'Brisbane', competition: afl, abbreviated_name: 'BRI')
    carlton           = Team.create!(name: 'Carlton', competition: afl, abbreviated_name: 'CAR')
    collingwood       = Team.create!(name: 'Collingwood', competition: afl, abbreviated_name: 'COL')
    essendon          = Team.create!(name: 'Essendon', competition: afl, abbreviated_name: 'ESS')
    fremantle         = Team.create!(name: 'Fremantle', competition: afl, abbreviated_name: 'FRE')
    geelong           = Team.create!(name: 'Geelong', competition: afl, abbreviated_name: 'GEE')
    gold_coast        = Team.create!(name: 'Gold Coast', competition: afl, abbreviated_name: 'GCS')
    gws               = Team.create!(name: 'Greater Western Sydney', competition: afl, abbreviated_name: 'GWS')
    hawthorn          = Team.create!(name: 'Hawthorn', competition: afl, abbreviated_name: 'HAW')
    melbourne         = Team.create!(name: 'Melbourne', competition: afl, abbreviated_name: 'MEL')
    north_melbourne   = Team.create!(name: 'North Melbourne', competition: afl, abbreviated_name: 'NOR')
    port_adelaide     = Team.create!(name: 'Port Adelaide', competition: afl, abbreviated_name: 'POR')
    richmond          = Team.create!(name: 'Richmond', competition: afl, abbreviated_name: 'RIC')
    st_kilda          = Team.create!(name: 'St Kilda', competition: afl, abbreviated_name: 'STK')
    sydney_swans      = Team.create!(name: 'Sydney Swans', competition: afl, abbreviated_name: 'SYD')
    west_coast_eagles = Team.create!(name: 'West Coast Eagles', competition: afl, abbreviated_name: 'WCE')
    western_bulldogs  = Team.create!(name: 'Western Bulldogs', competition: afl, abbreviated_name: 'BUL')

    # Create a fixture for a single afl season
    afl.seasons.destroy_all

    afl_season_2013 = Season.create!(name: "2013 AFL Premiership Season", start_date: Date.today - 8.weeks, end_date: Date.new(2013, 12, 1), competition: afl)

    game = Game.create!(name: 'Rob v Stu', season: afl_season_2013)
    game.game_memberships.create!(user: rob)
    game.game_memberships.create!(user: stu)
    game = Game.create!(name: 'Rob v Phil', season: afl_season_2013)
    game.game_memberships.create!(user: rob)
    game.game_memberships.create!(user: phil)
    game = Game.create!(name: 'Stu v Phil', season: afl_season_2013)
    game.game_memberships.create!(user: stu)
    game.game_memberships.create!(user: phil)
    game = Game.create!(name: 'Phil v Ash', season: afl_season_2013)
    game.game_memberships.create!(user: phil)
    game.game_memberships.create!(user: ash)
    game = Game.create!(name: 'Ash v Dan', season: afl_season_2013)
    game.game_memberships.create!(user: ash)
    game.game_memberships.create!(user: dan)
    game = Game.create!(name: 'Stu Solo Style', season: afl_season_2013)
    game.game_memberships.create!(user: stu)
    game = Game.create!(name: 'Hooroo Invitational', season: afl_season_2013)
    game.game_memberships.create!(user: rob)
    game.game_memberships.create!(user: stu)
    game.game_memberships.create!(user: dan)
    game.game_memberships.create!(user: phil)
    game.game_memberships.create!(user: ash)

    round_date = afl_season_2013.start_date
    paired_teams = []
    round_number = 1
    all_afl_teams = Team.where(competition: afl)

    #This is pretty messy but it kinda works (I think)
    while round_date <= afl_season_2013.end_date

      round = afl_season_2013.rounds.create(number: round_number)
      played_this_round = []

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
              if round_number == 6 #Make round 6 always a draw
                team_b_score = team_a_score
              else
                team_b_score = rand(30..150)
              end

              if team_a_score != team_b_score
                winning_team = team_a_score < team_b_score ? team_b : team_a
              else
                drawn_game = true
              end
            end
            round.fixtures.create!(
              home_team: team_a,
              home_score: team_a_score,
              away_team: team_b,
              away_score: team_b_score,
              start_time: round_date + rand(0..2).days + rand(0..8).hours,
              winning_team: winning_team,
              draw: drawn_game
            )
            paired_teams << pair
            played_this_round << team_a
            played_this_round << team_b
          end

        end
      end

      round_date = round_date + 1.week
      round_number += 1
    end

    User.all.each do |user|
      Game.all.each do |game|
        if game.users.include? user
          lost_lives = 0
          rounds = game.season.rounds.sort_by {|round| round.number}
          game.created_at = rounds[3].start_time.midnight #Fudge the date to just before the first game that get's predictions
          game.save!
          rounds.each do |round|
            if round.number > 5
              fixture_index = rand(0..round.fixtures.size - 1)
              fixture = round.fixtures[fixture_index]
              selected_team = [fixture.home_team, fixture.away_team][rand(0..1)]
              if selected_team != fixture.winning_team
                lost_lives = lost_lives + 1
              end
              if fixture.start_time < Time.now + 3.days && lost_lives <= game.number_of_lives
                Prediction.create!(user: user, team: selected_team, game: game, fixture: fixture)
              end
            end
          end
        end
      end
    end

    GameMembership.all.each {|game_membership| game_membership.update_lives!}
  end
end