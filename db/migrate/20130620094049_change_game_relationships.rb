class ChangeGameRelationships < ActiveRecord::Migration
  def change
    remove_column :games, :league_id
    add_column :games, :season_id, :integer
  end
end
