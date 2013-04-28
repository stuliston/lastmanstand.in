
User.destroy_all
stu = User.create!(email: 'stuart.liston@gmail.com', password: 'password', profile: Profile.create!(name: 'Stu'))
rob = User.create!(email: 'robmonie@gmail.com', password: 'password', profile: Profile.create!(name: 'Rob'))

users = [ stu, rob ]

Game.destroy_all
Game.create!(name: 'Rob v Stu', profiles: users.collect(&:profile))
Game.create!(name: 'Stu Solo Style', profiles: [ stu.profile ] )
Game.create!(name: 'Hooroo Invitational', profiles: users.collect(&:profile))