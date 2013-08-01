class AddCompetitionToGames < ActiveRecord::Migration
  def change
    add_column :games, :competition_id, :integer
  end
end
