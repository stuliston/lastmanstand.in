
User.destroy_all
Profile.destroy_all
User.create!(email: 'stuart.liston@gmail.com', password: 'password', password_confirmation: 'password', profile: Profile.new(name: 'Stu'))
User.create!(email: 'robmonie@gmail.com', password: 'password', password_confirmation: 'password', profile: Profile.new(name: 'Rob'))
User.create!(email: 'metcalfe.phil@gmail.com', password: 'password', password_confirmation: 'password', profile: Profile.new(name: 'Phil'))
User.create!(email: 'ash@ashmckenzie.org', password: 'password', password_confirmation: 'password', profile: Profile.new(name: 'Ash'))
User.create!(email: 'locusdelicti@gmail.com', password: 'password', password_confirmation: 'password', profile: Profile.new(name: 'Dan'))


Competition.destroy_all

LastManStanding.config.playup_api.competitions.each do |comp|
  Competition.create!(name: comp.name)
end
