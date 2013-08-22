
User.destroy_all
User.create!(email: 'stuart.liston@gmail.com', password: 'password', password_confirmation: 'password', name: 'Stu')
User.create!(email: 'robmonie@gmail.com', password: 'password', password_confirmation: 'password', name: 'Rob')
User.create!(email: 'metcalfe.phil@gmail.com', password: 'password', password_confirmation: 'password', name: 'Phil')
User.create!(email: 'ash@ashmckenzie.org', password: 'password', password_confirmation: 'password', name: 'Ash')
User.create!(email: 'locusdelicti@gmail.com', password: 'password', password_confirmation: 'password', name: 'Dan')


Competition.destroy_all

LastManStanding.config.playup_api.competitions.each do |comp|
  Competition.create!(name: comp.name)
end
