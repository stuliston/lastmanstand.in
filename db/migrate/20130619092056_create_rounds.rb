class CreateRounds < ActiveRecord::Migration
   def change
    create_table  :rounds do |t|
      t.integer   :season_id
      t.string    :number
      t.timestamps
    end
  end
end
