
User.destroy_all
Profile.destroy_all
stu = User.create!(email: 'stuart.liston@gmail.com', password: 'password', profile: Profile.create!(name: 'Stu'))
rob = User.create!(email: 'robmonie@gmail.com', password: 'password', profile: Profile.create!(name: 'Rob'))
phil = User.create!(email: 'metcalfe.phil@gmail.com', password: 'password', profile: Profile.create!(name: 'Rob'))
ash = User.create!(email: 'ash@ashmckenzie.org', password: 'password', profile: Profile.create!(name: 'Ash'))
dan = User.create!(email: 'locusdelicti@gmail.com', password: 'password', profile: Profile.create!(name: 'Dan'))

users = [ stu, rob, ash, phil, dan ]

League.destroy_all
afl = League.create!(name: 'Australian Football League')
epl = League.create!(name: 'English Premier League')

Team.destroy_all
adelaide          = Team.create!(name: 'Adelaide', league: afl)
brisbane          = Team.create!(name: 'Brisbane', league: afl)
carlton           = Team.create!(name: 'Carlton', league: afl)
collingwood       = Team.create!(name: 'Collingwood', league: afl)
essendon          = Team.create!(name: 'Essendon', league: afl)
fremantle         = Team.create!(name: 'Fremantle', league: afl)
geelong           = Team.create!(name: 'Geelong', league: afl)
gold_coast        = Team.create!(name: 'Gold Coast', league: afl)
gws               = Team.create!(name: 'Greater Western Sydney', league: afl)
hawthorn          = Team.create!(name: 'Hawthorn', league: afl)
melbourne         = Team.create!(name: 'Melbourne', league: afl)
north_melbourne   = Team.create!(name: 'North Melbourne', league: afl)
port_adelaide     = Team.create!(name: 'Port Adelaide', league: afl)
richmond          = Team.create!(name: 'Richmond', league: afl)
st_kilda          = Team.create!(name: 'St Kilda', league: afl)
sydney_swans      = Team.create!(name: 'Sydney Swans', league: afl)
west_coast_eagles = Team.create!(name: 'West Coast Eagles', league: afl)
western_bulldogs  = Team.create!(name: 'Western Bulldogs', league: afl)

#Create a fixture for a single afl season
Season.destroy_all

afl_season_2013 = Season.create!(name: "2013 AFL Premiership Season", start_date: Date.new(2013, 3, 22), end_date: Date.new(2013, 8, 30), league: afl)

Game.destroy_all
Game.create!(name: 'Rob v Stu', profiles: users.collect(&:profile), season: afl_season_2013)
Game.create!(name: 'Stu Solo Style', profiles: [ stu.profile ], season: afl_season_2013)
Game.create!(name: 'Hooroo Invitational', profiles: users.collect(&:profile), season: afl_season_2013)

Round.destroy_all
Fixture.destroy_all
Prediction.destroy_all

round_date = afl_season_2013.start_date
paired_teams = []
round_number = 1
all_afl_teams = Team.where(league: afl)


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
        round.fixtures.create!(home_team: team_a, away_team: team_b, start_time: round_date)
        paired_teams << pair
        played_this_round << team_a
        played_this_round << team_b
      end

    end
  end

  round_date = round_date + 1.week
  round_number += 1
end

