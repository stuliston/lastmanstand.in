
User.destroy_all

users = [
  User.create!(email: 'stuart.liston@gmail.com', password: 'password', profile: Profile.create!(name: 'Stu')),
  User.create!(email: 'robmonie@gmail.com', password: 'password', profile: Profile.create!(name: 'Rob'))
]

