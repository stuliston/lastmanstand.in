class AddInvitedByToGameInvitations < ActiveRecord::Migration
  def change
    add_column :game_invitations, :invited_by_id, :integer
  end
end
