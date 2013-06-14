
User.destroy_all
Profile.destroy_all
stu = User.create!(email: 'stuart.liston@gmail.com', password: 'password', profile: Profile.create!(name: 'Stu'))
rob = User.create!(email: 'robmonie@gmail.com', password: 'password', profile: Profile.create!(name: 'Rob'))

users = [ stu, rob ]

Game.destroy_all
Game.create!(name: 'Rob v Stu', profiles: users.collect(&:profile))
Game.create!(name: 'Stu Solo Style', profiles: [ stu.profile ] )
Game.create!(name: 'Hooroo Invitational', profiles: users.collect(&:profile))

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
