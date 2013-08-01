class AddCompetitionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :competition_id, :integer
  end
end
