class CreatePredictions < ActiveRecord::Migration
  def change
    create_table  :predictions do |t|
      t.integer   :fixture_id
      t.integer   :profile_id
      t.integer   :team_id
      t.timestamps
    end
  end
end
