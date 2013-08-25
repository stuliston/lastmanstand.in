namespace :import do

  desc "Competitions. Pulls in the data for a competition"
  task competitions: :environment do
    epl = Competition.find_or_create_by(name: 'Premier League')
    importer = Playup::FixtureImportService.new
    importer.import_fixtures_for(epl)
  end

end