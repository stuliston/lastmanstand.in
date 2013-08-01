class ChangeGameRelationships < ActiveRecord::Migration
  def change
    remove_column :games, :competition_id
    add_column :games, :season_id, :integer
  end
end
