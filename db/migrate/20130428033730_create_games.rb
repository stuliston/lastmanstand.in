class CreateGames < ActiveRecord::Migration
  def change

    create_table :games do |t|
      t.string :name
      t.timestamps
    end

    create_table :game_memberships do |t|
      t.integer :game_id
      t.integer :user_id
      t.timestamps
    end

  end
end
