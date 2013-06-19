class AddRoundToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :round_id, :integer
  end
end
