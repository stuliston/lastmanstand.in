class CreateGameInvitations < ActiveRecord::Migration
  def change
    create_table :game_invitations do |t|
      t.integer :user_id
      t.integer :game_id
      t.string  :email
      t.timestamps
    end
  end
end
