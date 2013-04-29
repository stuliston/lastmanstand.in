
User.destroy_all
stu = User.create!(email: 'stuart.liston@gmail.com', password: 'password', profile: Profile.create!(name: 'Stu'))
rob = User.create!(email: 'robmonie@gmail.com', password: 'password', profile: Profile.create!(name: 'Rob'))

users = [ stu, rob ]

Game.destroy_all
Game.create!(name: 'Rob v Stu', profiles: users.collect(&:profile))
Game.create!(name: 'Stu Solo Style', profiles: [ stu.profile ] )
Game.create!(name: 'Hooroo Invitational', profiles: users.collect(&:profile))

Team.destroy_all
adelaide          = Team.create!(name: 'Adelaide')
brisbane          = Team.create!(name: 'Brisbane')
carlton           = Team.create!(name: 'Carlton')
collingwood       = Team.create!(name: 'Collingwood')
essendon          = Team.create!(name: 'Essendon')
fremantle         = Team.create!(name: 'Fremantle')
geelong           = Team.create!(name: 'Geelong')
gold_coast        = Team.create!(name: 'Gold Coast')
gws               = Team.create!(name: 'Greater Western Sydney')
hawthorn          = Team.create!(name: 'Hawthorn')
melbourne         = Team.create!(name: 'Melbourne')
north_melbourne   = Team.create!(name: 'North Melbourne')
port_adelaide     = Team.create!(name: 'Port Adelaide')
richmond          = Team.create!(name: 'Richmond')
st_kilda          = Team.create!(name: 'St Kilda')
sydney_swans      = Team.create!(name: 'Sydney Swans')
west_coast_eagles = Team.create!(name: 'West Coast Eagles')
western_bulldogs  = Team.create!(name: 'Western Bulldogs')
