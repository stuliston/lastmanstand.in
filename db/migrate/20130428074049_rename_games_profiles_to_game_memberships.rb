class RenameGamesProfilesToGameMemberships < ActiveRecord::Migration
  def change
    rename_table :games_profiles, :game_memberships
  end
end
