class CreateRounds < ActiveRecord::Migration
   def change
    create_table  :rounds do |t|
      t.integer   :season_id
      t.integer   :number
      t.timestamps
    end
  end
end
