class CreateGameInvitations < ActiveRecord::Migration
  def change
    create_table :game_invitations do |t|
      t.integer :profile_id
      t.integer :game_id
      t.string  :email
      t.timestamps
    end
  end
end
