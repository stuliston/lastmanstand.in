namespace :update do

  desc "Competitions. Updates the teams in the competition"
  task competitions: :environment do
    CompetitionService.new.update_all!
  end

  desc "Teams. Updates the teams in the competition"
  task :teams do
    puts "Some shit"
    #TeamUpdateService.new.update!
  end

end