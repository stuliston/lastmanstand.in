class AddLostLivesToGameMemberships < ActiveRecord::Migration
  def change
    add_column :game_memberships, :lost_lives, :integer
    GameMembership.all.each(&:update_lives!)
  end
end
