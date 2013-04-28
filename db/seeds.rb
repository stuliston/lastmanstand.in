
User.destroy_all

users = [
  User.create!(email: 'stuart.liston@gmail.com', password: 'password', profile: Profile.create!(name: 'Stu')),
  User.create!(email: 'robmonie@gmail.com', password: 'password', profile: Profile.create!(name: 'Rob'))
]

Game.destroy_all

games = [
  Game.create!(name: 'Rob v Stu', profiles: users.collect(&:profile)),
  Game.create!(name: 'Stu Solo Style', profiles: [ users.first.profile ]),
  Game.create!(name: 'Hooroo Invitational', profiles: users.collect(&:profile))
]