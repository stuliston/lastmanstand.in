namespace :competitions do

  namespace :update do

    desc "Competitions. Updates the teams in the competition"
    task :competitions do
      CompetitionUpdateService.new.update_all!
    end

    desc "Teams. Updates the teams in the competition"
    task :teams do
      #TeamUpdateService.new.update!
    end

  end
end